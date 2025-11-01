#!/usr/bin/env python3

import os
import pathlib
import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt

from tensorflow.keras import layers
from tensorflow.keras import models

# --- SOTTOSTEP 1: IMPOSTAZIONE, DOWNLOAD E RILEVAMENTO AUTOMATICO ---
# (Questa sezione è corretta, la lascio invariata)
print("--- Inizio Step 1: Download e Setup del Dataset ---")
seed = 42
tf.random.set_seed(seed)
np.random.seed(seed)
base_data_dir = pathlib.Path('data')
base_data_dir.mkdir(exist_ok=True)
zip_path = base_data_dir / 'speech_commands_v0.02.tar.gz'
if not zip_path.exists():
  print("Download del dataset in corso...")
  tf.keras.utils.get_file('speech_commands_v0.02.tar.gz', origin="http://storage.googleapis.com/download.tensorflow.org/data/speech_commands_v0.02.tar.gz", extract=True, cache_dir='.', cache_subdir=base_data_dir)
  print("Download ed estrazione completati.")
else:
  print("Archivio del dataset già presente.")
data_dir = None
for item in base_data_dir.iterdir():
    if item.is_dir() and (item / 'yes').exists():
        data_dir = item
        break
if not data_dir:
    raise FileNotFoundError(f"Impossibile trovare la cartella del dataset estratto all'interno di '{base_data_dir}'.")
print(f"Dataset rilevato correttamente nella cartella: '{data_dir}'")

# --- SOTTOSTEP 2: PREPARAZIONE E CARICAMENTO DATI ---
# (Questa sezione è corretta, la lascio invariata)
print("\n--- Inizio Step 2: Preparazione dei Dati ---")
keywords = ['yes', 'no', 'up', 'down', 'left', 'right', 'on', 'off', 'stop', 'go', 'zero', 'one']
all_files, all_labels = [], []
commands = np.concatenate([keywords, ['unknown', 'silence']])
label_to_index = {label: i for i, label in enumerate(commands)}
all_word_dirs = [d for d in data_dir.glob('*') if d.is_dir() and d.name != '_background_noise_']
unknown_words = [d.name for d in all_word_dirs if d.name not in keywords]
for word_dir in all_word_dirs:
    word, wav_files = word_dir.name, list(word_dir.glob('*.wav'))
    label = "unknown" if word in unknown_words else word
    label_id = label_to_index[label]
    for file in wav_files:
        all_files.append(str(file))
        all_labels.append(label_id)
silence_dir = data_dir / '_background_noise_'
temp_silence_dir = pathlib.Path('./_temp_silence')
temp_silence_dir.mkdir(exist_ok=True)
silence_label_id = label_to_index['silence']
for noise_file in silence_dir.glob('*.wav'):
    audio_binary = tf.io.read_file(str(noise_file))
    waveform, _ = tf.audio.decode_wav(audio_binary)
    waveform = tf.squeeze(waveform, axis=-1)
    for i in range(0, len(waveform) - 16000, 16000):
        clip = waveform[i:i+16000]
        silence_filename = temp_silence_dir / f"{noise_file.stem}_{i}.wav"
        tf.io.write_file(str(silence_filename), tf.audio.encode_wav(tf.expand_dims(clip, axis=-1), 16000))
        all_files.append(str(silence_filename))
        all_labels.append(silence_label_id)
combined = list(zip(all_files, all_labels))
np.random.shuffle(combined)
all_files, all_labels = zip(*combined)
path_ds = tf.data.Dataset.from_tensor_slices((list(all_files), list(all_labels)))
print(f"Preparazione dati completata. Campioni totali: {len(all_files)}")


# --- SOTTOSTEP 3: PREPROCESSING AUDIO E CREAZIONE DELLA PIPELINE DATI ---
# (Questa sezione è corretta, la lascio invariata)
print("\n--- Inizio Step 3: Creazione Pipeline Dati ---")
def decode_audio(audio_binary):
    audio, _ = tf.audio.decode_wav(audio_binary, desired_channels=1)
    return tf.squeeze(audio, axis=-1)
def get_spectrogram(waveform):
    waveform = waveform[:16000]
    zero_padding = tf.zeros([16000] - tf.shape(waveform), dtype=tf.float32)
    equal_length = tf.concat([waveform, zero_padding], 0)
    spectrogram = tf.signal.stft(equal_length, frame_length=255, frame_step=128)
    spectrogram = tf.abs(spectrogram)
    spectrogram = tf.expand_dims(spectrogram, -1)
    return spectrogram
def preprocess_dataset(file_path, label):
    audio_binary = tf.io.read_file(file_path)
    waveform = decode_audio(audio_binary)
    spectrogram = get_spectrogram(waveform)
    return spectrogram, label
AUTOTUNE = tf.data.AUTOTUNE
spectrogram_ds = path_ds.map(preprocess_dataset, num_parallel_calls=AUTOTUNE)
spectrogram_ds = spectrogram_ds.shuffle(buffer_size=10000, seed=seed)
dataset_size = len(all_files)
train_size, val_size = int(0.8 * dataset_size), int(0.1 * dataset_size)
train_ds = spectrogram_ds.take(train_size)
val_ds = spectrogram_ds.skip(train_size).take(val_size)
test_ds = spectrogram_ds.skip(train_size + val_size)
batch_size = 64
train_ds = train_ds.batch(batch_size).cache().prefetch(AUTOTUNE)
val_ds = val_ds.batch(batch_size).cache().prefetch(AUTOTUNE)
test_ds = test_ds.batch(batch_size).cache().prefetch(AUTOTUNE)
print("Pipeline dati creata e ottimizzata.")


# ############################################################################# #
# ########## INIZIA LA SEZIONE CHE ABBIAMO CORRETTO E UNIFICATO ########## #
# ############################################################################# #

# --- SOTTOSTEP 4 (UNIFICATO): GESTIONE, ADDESTRAMENTO E CARICAMENTO MODELLO ---

print("\n--- Inizio Step 4: Gestione del Modello ---")

final_model_path = pathlib.Path("kws_model_final.keras")

if final_model_path.exists():
    print(f"✅ Modello finale trovato in '{final_model_path}'. Caricamento...")
    model = models.load_model(final_model_path)
    model.summary()
    history = None # Non c'è cronologia di addestramento da analizzare in questo caso
else:
    print(f"❌ Modello finale non trovato. Preparazione per l'addestramento.")
    
    # Costruzione del Modello
    for spectrogram, _ in train_ds.take(1):
        input_shape = spectrogram.shape[1:]
    num_labels = len(commands)

    norm_layer = layers.Normalization()
    norm_layer.adapt(data=train_ds.map(map_func=lambda spec, label: spec))

    # --- NUOVA ARCHITETTURA "ULTRA-MICRO" GARANTITA PER ESSERE PICCOLA ---
    # Sostituisci completamente la vecchia definizione del modello con questa

    # ... (il codice prima della costruzione del modello rimane uguale)

    model = models.Sequential([
        layers.Input(shape=input_shape),

        # Layer chiave: ridimensiona lo spettrogramma a un'immagine molto più piccola (32x32).
        # Questo riduce drasticamente i calcoli e il numero di parametri nei layer successivi.
        layers.Resizing(32, 32),
        norm_layer, # Applichiamo la normalizzazione dopo il resizing
        
        # Primo blocco convoluzionale: 8 filtri
        layers.Conv2D(8, 3, activation='relu'),
        layers.MaxPooling2D(),
        
        # Secondo blocco convoluzionale: 16 filtri
        layers.Conv2D(16, 3, activation='relu'),
        layers.MaxPooling2D(),
        
        layers.Dropout(0.25),
        layers.Flatten(),
        
        # Layer denso molto piccolo: da 128 a 32 neuroni
        layers.Dense(32, activation='relu'),
        layers.Dropout(0.5),
        
        layers.Dense(num_labels),
    ])

    model.summary() # Ora il summary mostrerà un numero di parametri bassissimo!
    
    # ... (il resto del codice per compilare e addestrare rimane uguale)

    # Compilazione del Modello
    model.compile(
        optimizer=tf.keras.optimizers.Adam(),
        loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
        metrics=['accuracy'],
    )

    # Setup dei Checkpoint
    checkpoint_dir = pathlib.Path("training_checkpoints")
    checkpoint_dir.mkdir(exist_ok=True)
    
    best_model_callback = tf.keras.callbacks.ModelCheckpoint(
        filepath=checkpoint_dir / "best_model.keras", save_weights_only=False,
        monitor='val_accuracy', mode='max', save_best_only=True, verbose=1)
    
    periodic_save_callback = tf.keras.callbacks.ModelCheckpoint(
        filepath=checkpoint_dir / "cp-{epoch:04d}.weights.h5", save_weights_only=True,
        save_freq=5 * len(train_ds))

    # Ripresa dal Checkpoint
    latest_checkpoint = tf.train.latest_checkpoint(checkpoint_dir)
    if latest_checkpoint:
        print(f"\n↩️ Ripresa dell'addestramento dal checkpoint: {latest_checkpoint}")
        model.load_weights(latest_checkpoint)
    else:
        print("\n🎬 Inizio di un nuovo addestramento da zero.")

    # Addestramento
    EPOCHS = 20
    print(f"Inizio addestramento per {EPOCHS} epoche...")
    history = model.fit(
        train_ds, validation_data=val_ds, epochs=EPOCHS,
        callbacks=[best_model_callback, periodic_save_callback])

    print(f"\n✅ Addestramento completato. Salvataggio del modello finale...")
    model.save(final_model_path)

# --- SOTTOSTEP 5: VALUTAZIONE FINALE E VISUALIZZAZIONE ---

print("\n--- Inizio Step 5: Valutazione Finale ---")

test_loss, test_acc = model.evaluate(test_ds, verbose=2)
print("\n--------------------------------------------------")
print(f"Accuratezza finale sul set di test: {test_acc*100:.2f}%")
print(f"Loss finale sul set di test: {test_loss:.4f}")
print("--------------------------------------------------")

# Se abbiamo appena addestrato, 'history' non è None e possiamo plottare i risultati
if history:
    print("Visualizzazione delle curve di training e validation...")
    acc = history.history['accuracy']
    val_acc = history.history['val_accuracy']
    loss = history.history['loss']
    val_loss = history.history['val_loss']
    epochs_range = range(len(acc))

    plt.figure(figsize=(12, 5))
    plt.subplot(1, 2, 1)
    plt.plot(epochs_range, acc, label='Training Accuracy')
    plt.plot(epochs_range, val_acc, label='Validation Accuracy')
    plt.legend(loc='lower right')
    plt.title('Training and Validation Accuracy')
    plt.subplot(1, 2, 2)
    plt.plot(epochs_range, loss, label='Training Loss')
    plt.plot(epochs_range, val_loss, label='Validation Loss')
    plt.legend(loc='upper right')
    plt.title('Training and Validation Loss')
    plt.show()
else:
    print("Nessuna cronologia di addestramento da visualizzare (modello pre-esistente caricato).")
