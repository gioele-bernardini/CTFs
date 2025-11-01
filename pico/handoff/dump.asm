
./handoff:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64
  401004:	48 83 ec 08          	sub    rsp,0x8
  401008:	48 8b 05 e9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fe9]        # 403ff8 <__gmon_start__>
  40100f:	48 85 c0             	test   rax,rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	call   rax
  401016:	48 83 c4 08          	add    rsp,0x8
  40101a:	c3                   	ret

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 2f 00 00    	push   QWORD PTR [rip+0x2fe2]        # 404008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	f2 ff 25 e3 2f 00 00 	bnd jmp QWORD PTR [rip+0x2fe3]        # 404010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102d:	0f 1f 00             	nop    DWORD PTR [rax]
  401030:	f3 0f 1e fa          	endbr64
  401034:	68 00 00 00 00       	push   0x0
  401039:	f2 e9 e1 ff ff ff    	bnd jmp 401020 <.plt>
  40103f:	90                   	nop
  401040:	f3 0f 1e fa          	endbr64
  401044:	68 01 00 00 00       	push   0x1
  401049:	f2 e9 d1 ff ff ff    	bnd jmp 401020 <.plt>
  40104f:	90                   	nop
  401050:	f3 0f 1e fa          	endbr64
  401054:	68 02 00 00 00       	push   0x2
  401059:	f2 e9 c1 ff ff ff    	bnd jmp 401020 <.plt>
  40105f:	90                   	nop
  401060:	f3 0f 1e fa          	endbr64
  401064:	68 03 00 00 00       	push   0x3
  401069:	f2 e9 b1 ff ff ff    	bnd jmp 401020 <.plt>
  40106f:	90                   	nop
  401070:	f3 0f 1e fa          	endbr64
  401074:	68 04 00 00 00       	push   0x4
  401079:	f2 e9 a1 ff ff ff    	bnd jmp 401020 <.plt>
  40107f:	90                   	nop
  401080:	f3 0f 1e fa          	endbr64
  401084:	68 05 00 00 00       	push   0x5
  401089:	f2 e9 91 ff ff ff    	bnd jmp 401020 <.plt>
  40108f:	90                   	nop
  401090:	f3 0f 1e fa          	endbr64
  401094:	68 06 00 00 00       	push   0x6
  401099:	f2 e9 81 ff ff ff    	bnd jmp 401020 <.plt>
  40109f:	90                   	nop

Disassembly of section .plt.sec:

00000000004010a0 <puts@plt>:
  4010a0:	f3 0f 1e fa          	endbr64
  4010a4:	f2 ff 25 6d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f6d]        # 404018 <puts@GLIBC_2.2.5>
  4010ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010b0 <fgets@plt>:
  4010b0:	f3 0f 1e fa          	endbr64
  4010b4:	f2 ff 25 65 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f65]        # 404020 <fgets@GLIBC_2.2.5>
  4010bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010c0 <getchar@plt>:
  4010c0:	f3 0f 1e fa          	endbr64
  4010c4:	f2 ff 25 5d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f5d]        # 404028 <getchar@GLIBC_2.2.5>
  4010cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010d0 <fflush@plt>:
  4010d0:	f3 0f 1e fa          	endbr64
  4010d4:	f2 ff 25 55 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f55]        # 404030 <fflush@GLIBC_2.2.5>
  4010db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010e0 <setvbuf@plt>:
  4010e0:	f3 0f 1e fa          	endbr64
  4010e4:	f2 ff 25 4d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f4d]        # 404038 <setvbuf@GLIBC_2.2.5>
  4010eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010f0 <__isoc99_scanf@plt>:
  4010f0:	f3 0f 1e fa          	endbr64
  4010f4:	f2 ff 25 45 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f45]        # 404040 <__isoc99_scanf@GLIBC_2.7>
  4010fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000401100 <exit@plt>:
  401100:	f3 0f 1e fa          	endbr64
  401104:	f2 ff 25 3d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f3d]        # 404048 <exit@GLIBC_2.2.5>
  40110b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000401110 <_start>:
  401110:	f3 0f 1e fa          	endbr64
  401114:	31 ed                	xor    ebp,ebp
  401116:	49 89 d1             	mov    r9,rdx
  401119:	5e                   	pop    rsi
  40111a:	48 89 e2             	mov    rdx,rsp
  40111d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  401121:	50                   	push   rax
  401122:	54                   	push   rsp
  401123:	49 c7 c0 c0 14 40 00 	mov    r8,0x4014c0
  40112a:	48 c7 c1 50 14 40 00 	mov    rcx,0x401450
  401131:	48 c7 c7 0f 14 40 00 	mov    rdi,0x40140f
  401138:	ff 15 b2 2e 00 00    	call   QWORD PTR [rip+0x2eb2]        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  40113e:	f4                   	hlt
  40113f:	90                   	nop

0000000000401140 <_dl_relocate_static_pie>:
  401140:	f3 0f 1e fa          	endbr64
  401144:	c3                   	ret
  401145:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40114c:	00 00 00 
  40114f:	90                   	nop

0000000000401150 <deregister_tm_clones>:
  401150:	b8 60 40 40 00       	mov    eax,0x404060
  401155:	48 3d 60 40 40 00    	cmp    rax,0x404060
  40115b:	74 13                	je     401170 <deregister_tm_clones+0x20>
  40115d:	b8 00 00 00 00       	mov    eax,0x0
  401162:	48 85 c0             	test   rax,rax
  401165:	74 09                	je     401170 <deregister_tm_clones+0x20>
  401167:	bf 60 40 40 00       	mov    edi,0x404060
  40116c:	ff e0                	jmp    rax
  40116e:	66 90                	xchg   ax,ax
  401170:	c3                   	ret
  401171:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  401178:	00 00 00 00 
  40117c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401180 <register_tm_clones>:
  401180:	be 60 40 40 00       	mov    esi,0x404060
  401185:	48 81 ee 60 40 40 00 	sub    rsi,0x404060
  40118c:	48 89 f0             	mov    rax,rsi
  40118f:	48 c1 ee 3f          	shr    rsi,0x3f
  401193:	48 c1 f8 03          	sar    rax,0x3
  401197:	48 01 c6             	add    rsi,rax
  40119a:	48 d1 fe             	sar    rsi,1
  40119d:	74 11                	je     4011b0 <register_tm_clones+0x30>
  40119f:	b8 00 00 00 00       	mov    eax,0x0
  4011a4:	48 85 c0             	test   rax,rax
  4011a7:	74 07                	je     4011b0 <register_tm_clones+0x30>
  4011a9:	bf 60 40 40 00       	mov    edi,0x404060
  4011ae:	ff e0                	jmp    rax
  4011b0:	c3                   	ret
  4011b1:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4011b8:	00 00 00 00 
  4011bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000004011c0 <__do_global_dtors_aux>:
  4011c0:	f3 0f 1e fa          	endbr64
  4011c4:	80 3d ad 2e 00 00 00 	cmp    BYTE PTR [rip+0x2ead],0x0        # 404078 <completed.8061>
  4011cb:	75 13                	jne    4011e0 <__do_global_dtors_aux+0x20>
  4011cd:	55                   	push   rbp
  4011ce:	48 89 e5             	mov    rbp,rsp
  4011d1:	e8 7a ff ff ff       	call   401150 <deregister_tm_clones>
  4011d6:	c6 05 9b 2e 00 00 01 	mov    BYTE PTR [rip+0x2e9b],0x1        # 404078 <completed.8061>
  4011dd:	5d                   	pop    rbp
  4011de:	c3                   	ret
  4011df:	90                   	nop
  4011e0:	c3                   	ret
  4011e1:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4011e8:	00 00 00 00 
  4011ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000004011f0 <frame_dummy>:
  4011f0:	f3 0f 1e fa          	endbr64
  4011f4:	eb 8a                	jmp    401180 <register_tm_clones>

00000000004011f6 <print_menu>:
  4011f6:	f3 0f 1e fa          	endbr64
  4011fa:	55                   	push   rbp
  4011fb:	48 89 e5             	mov    rbp,rsp
  4011fe:	bf 08 20 40 00       	mov    edi,0x402008
  401203:	e8 98 fe ff ff       	call   4010a0 <puts@plt>
  401208:	bf 2a 20 40 00       	mov    edi,0x40202a
  40120d:	e8 8e fe ff ff       	call   4010a0 <puts@plt>
  401212:	bf 48 20 40 00       	mov    edi,0x402048
  401217:	e8 84 fe ff ff       	call   4010a0 <puts@plt>
  40121c:	bf 69 20 40 00       	mov    edi,0x402069
  401221:	e8 7a fe ff ff       	call   4010a0 <puts@plt>
  401226:	90                   	nop
  401227:	5d                   	pop    rbp
  401228:	c3                   	ret

0000000000401229 <vuln>:
  401229:	f3 0f 1e fa          	endbr64
  40122d:	55                   	push   rbp
  40122e:	48 89 e5             	mov    rbp,rsp
  401231:	48 81 ec f0 02 00 00 	sub    rsp,0x2f0
  401238:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  40123f:	c7 85 1c fd ff ff ff 	mov    DWORD PTR [rbp-0x2e4],0xffffffff
  401246:	ff ff ff 
  401249:	b8 00 00 00 00       	mov    eax,0x0
  40124e:	e8 a3 ff ff ff       	call   4011f6 <print_menu>
  401253:	48 8d 85 1c fd ff ff 	lea    rax,[rbp-0x2e4]
  40125a:	48 89 c6             	mov    rsi,rax
  40125d:	bf 79 20 40 00       	mov    edi,0x402079
  401262:	b8 00 00 00 00       	mov    eax,0x0
  401267:	e8 84 fe ff ff       	call   4010f0 <__isoc99_scanf@plt>
  40126c:	83 f8 01             	cmp    eax,0x1
  40126f:	74 0a                	je     40127b <vuln+0x52>
  401271:	bf 00 00 00 00       	mov    edi,0x0
  401276:	e8 85 fe ff ff       	call   401100 <exit@plt>
  40127b:	e8 40 fe ff ff       	call   4010c0 <getchar@plt>
  401280:	8b 85 1c fd ff ff    	mov    eax,DWORD PTR [rbp-0x2e4]
  401286:	83 f8 01             	cmp    eax,0x1
  401289:	75 76                	jne    401301 <vuln+0xd8>
  40128b:	c7 85 1c fd ff ff ff 	mov    DWORD PTR [rbp-0x2e4],0xffffffff
  401292:	ff ff ff 
  401295:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  401299:	7e 0f                	jle    4012aa <vuln+0x81>
  40129b:	bf 7c 20 40 00       	mov    edi,0x40207c
  4012a0:	e8 fb fd ff ff       	call   4010a0 <puts@plt>
  4012a5:	e9 5d 01 00 00       	jmp    401407 <vuln+0x1de>
  4012aa:	bf 98 20 40 00       	mov    edi,0x402098
  4012af:	e8 ec fd ff ff       	call   4010a0 <puts@plt>
  4012b4:	48 8b 05 b5 2d 00 00 	mov    rax,QWORD PTR [rip+0x2db5]        # 404070 <stdin@GLIBC_2.2.5>
  4012bb:	48 89 c7             	mov    rdi,rax
  4012be:	e8 0d fe ff ff       	call   4010d0 <fflush@plt>
  4012c3:	48 8b 0d a6 2d 00 00 	mov    rcx,QWORD PTR [rip+0x2da6]        # 404070 <stdin@GLIBC_2.2.5>
  4012ca:	48 8d b5 20 fd ff ff 	lea    rsi,[rbp-0x2e0]
  4012d1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  4012d4:	48 63 d0             	movsxd rdx,eax
  4012d7:	48 89 d0             	mov    rax,rdx
  4012da:	48 c1 e0 03          	shl    rax,0x3
  4012de:	48 01 d0             	add    rax,rdx
  4012e1:	48 c1 e0 03          	shl    rax,0x3
  4012e5:	48 01 f0             	add    rax,rsi
  4012e8:	48 89 ca             	mov    rdx,rcx
  4012eb:	be 20 00 00 00       	mov    esi,0x20
  4012f0:	48 89 c7             	mov    rdi,rax
  4012f3:	e8 b8 fd ff ff       	call   4010b0 <fgets@plt>
  4012f8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  4012fc:	e9 48 ff ff ff       	jmp    401249 <vuln+0x20>
  401301:	8b 85 1c fd ff ff    	mov    eax,DWORD PTR [rbp-0x2e4]
  401307:	83 f8 02             	cmp    eax,0x2
  40130a:	0f 85 a6 00 00 00    	jne    4013b6 <vuln+0x18d>
  401310:	c7 85 1c fd ff ff ff 	mov    DWORD PTR [rbp-0x2e4],0xffffffff
  401317:	ff ff ff 
  40131a:	bf c0 20 40 00       	mov    edi,0x4020c0
  40131f:	e8 7c fd ff ff       	call   4010a0 <puts@plt>
  401324:	48 8d 85 1c fd ff ff 	lea    rax,[rbp-0x2e4]
  40132b:	48 89 c6             	mov    rsi,rax
  40132e:	bf 79 20 40 00       	mov    edi,0x402079
  401333:	b8 00 00 00 00       	mov    eax,0x0
  401338:	e8 b3 fd ff ff       	call   4010f0 <__isoc99_scanf@plt>
  40133d:	83 f8 01             	cmp    eax,0x1
  401340:	74 0a                	je     40134c <vuln+0x123>
  401342:	bf 00 00 00 00       	mov    edi,0x0
  401347:	e8 b4 fd ff ff       	call   401100 <exit@plt>
  40134c:	e8 6f fd ff ff       	call   4010c0 <getchar@plt>
  401351:	8b 85 1c fd ff ff    	mov    eax,DWORD PTR [rbp-0x2e4]
  401357:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  40135a:	7f 0f                	jg     40136b <vuln+0x142>
  40135c:	bf f5 20 40 00       	mov    edi,0x4020f5
  401361:	e8 3a fd ff ff       	call   4010a0 <puts@plt>
  401366:	e9 9c 00 00 00       	jmp    401407 <vuln+0x1de>
  40136b:	bf 10 21 40 00       	mov    edi,0x402110
  401370:	e8 2b fd ff ff       	call   4010a0 <puts@plt>
  401375:	48 8b 0d f4 2c 00 00 	mov    rcx,QWORD PTR [rip+0x2cf4]        # 404070 <stdin@GLIBC_2.2.5>
  40137c:	8b 85 1c fd ff ff    	mov    eax,DWORD PTR [rbp-0x2e4]
  401382:	48 8d b5 20 fd ff ff 	lea    rsi,[rbp-0x2e0]
  401389:	48 63 d0             	movsxd rdx,eax
  40138c:	48 89 d0             	mov    rax,rdx
  40138f:	48 c1 e0 03          	shl    rax,0x3
  401393:	48 01 d0             	add    rax,rdx
  401396:	48 c1 e0 03          	shl    rax,0x3
  40139a:	48 01 f0             	add    rax,rsi
  40139d:	48 83 c0 08          	add    rax,0x8
  4013a1:	48 89 ca             	mov    rdx,rcx
  4013a4:	be 40 00 00 00       	mov    esi,0x40
  4013a9:	48 89 c7             	mov    rdi,rax
  4013ac:	e8 ff fc ff ff       	call   4010b0 <fgets@plt>
  4013b1:	e9 93 fe ff ff       	jmp    401249 <vuln+0x20>
  4013b6:	8b 85 1c fd ff ff    	mov    eax,DWORD PTR [rbp-0x2e4]
  4013bc:	83 f8 03             	cmp    eax,0x3
  4013bf:	75 32                	jne    4013f3 <vuln+0x1ca>
  4013c1:	c7 85 1c fd ff ff ff 	mov    DWORD PTR [rbp-0x2e4],0xffffffff
  4013c8:	ff ff ff 
  4013cb:	bf 40 21 40 00       	mov    edi,0x402140
  4013d0:	e8 cb fc ff ff       	call   4010a0 <puts@plt>
  4013d5:	48 8b 15 94 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2c94]        # 404070 <stdin@GLIBC_2.2.5>
  4013dc:	48 8d 45 f4          	lea    rax,[rbp-0xc]
  4013e0:	be 20 00 00 00       	mov    esi,0x20
  4013e5:	48 89 c7             	mov    rdi,rax
  4013e8:	e8 c3 fc ff ff       	call   4010b0 <fgets@plt>
  4013ed:	c6 45 fb 00          	mov    BYTE PTR [rbp-0x5],0x0
  4013f1:	eb 19                	jmp    40140c <vuln+0x1e3>
  4013f3:	c7 85 1c fd ff ff ff 	mov    DWORD PTR [rbp-0x2e4],0xffffffff
  4013fa:	ff ff ff 
  4013fd:	bf b6 21 40 00       	mov    edi,0x4021b6
  401402:	e8 99 fc ff ff       	call   4010a0 <puts@plt>
  401407:	e9 3d fe ff ff       	jmp    401249 <vuln+0x20>
  40140c:	90                   	nop
  40140d:	c9                   	leave
  40140e:	c3                   	ret

000000000040140f <main>:
  40140f:	f3 0f 1e fa          	endbr64
  401413:	55                   	push   rbp
  401414:	48 89 e5             	mov    rbp,rsp
  401417:	48 8b 05 42 2c 00 00 	mov    rax,QWORD PTR [rip+0x2c42]        # 404060 <stdout@GLIBC_2.2.5>
  40141e:	b9 00 00 00 00       	mov    ecx,0x0
  401423:	ba 02 00 00 00       	mov    edx,0x2
  401428:	be 00 00 00 00       	mov    esi,0x0
  40142d:	48 89 c7             	mov    rdi,rax
  401430:	e8 ab fc ff ff       	call   4010e0 <setvbuf@plt>
  401435:	b8 00 00 00 00       	mov    eax,0x0
  40143a:	e8 ea fd ff ff       	call   401229 <vuln>
  40143f:	b8 00 00 00 00       	mov    eax,0x0
  401444:	5d                   	pop    rbp
  401445:	c3                   	ret
  401446:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40144d:	00 00 00 

0000000000401450 <__libc_csu_init>:
  401450:	f3 0f 1e fa          	endbr64
  401454:	41 57                	push   r15
  401456:	4c 8d 3d b3 29 00 00 	lea    r15,[rip+0x29b3]        # 403e10 <__frame_dummy_init_array_entry>
  40145d:	41 56                	push   r14
  40145f:	49 89 d6             	mov    r14,rdx
  401462:	41 55                	push   r13
  401464:	49 89 f5             	mov    r13,rsi
  401467:	41 54                	push   r12
  401469:	41 89 fc             	mov    r12d,edi
  40146c:	55                   	push   rbp
  40146d:	48 8d 2d a4 29 00 00 	lea    rbp,[rip+0x29a4]        # 403e18 <__do_global_dtors_aux_fini_array_entry>
  401474:	53                   	push   rbx
  401475:	4c 29 fd             	sub    rbp,r15
  401478:	48 83 ec 08          	sub    rsp,0x8
  40147c:	e8 7f fb ff ff       	call   401000 <_init>
  401481:	48 c1 fd 03          	sar    rbp,0x3
  401485:	74 1f                	je     4014a6 <__libc_csu_init+0x56>
  401487:	31 db                	xor    ebx,ebx
  401489:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401490:	4c 89 f2             	mov    rdx,r14
  401493:	4c 89 ee             	mov    rsi,r13
  401496:	44 89 e7             	mov    edi,r12d
  401499:	41 ff 14 df          	call   QWORD PTR [r15+rbx*8]
  40149d:	48 83 c3 01          	add    rbx,0x1
  4014a1:	48 39 dd             	cmp    rbp,rbx
  4014a4:	75 ea                	jne    401490 <__libc_csu_init+0x40>
  4014a6:	48 83 c4 08          	add    rsp,0x8
  4014aa:	5b                   	pop    rbx
  4014ab:	5d                   	pop    rbp
  4014ac:	41 5c                	pop    r12
  4014ae:	41 5d                	pop    r13
  4014b0:	41 5e                	pop    r14
  4014b2:	41 5f                	pop    r15
  4014b4:	c3                   	ret
  4014b5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4014bc:	00 00 00 00 

00000000004014c0 <__libc_csu_fini>:
  4014c0:	f3 0f 1e fa          	endbr64
  4014c4:	c3                   	ret

Disassembly of section .fini:

00000000004014c8 <_fini>:
  4014c8:	f3 0f 1e fa          	endbr64
  4014cc:	48 83 ec 08          	sub    rsp,0x8
  4014d0:	48 83 c4 08          	add    rsp,0x8
  4014d4:	c3                   	ret
