
obj/kernel.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000040000 <_kernel_start>:
   40000:	48 c7 c4 00 00 08 00 	mov    $0x80000,%rsp
   40007:	48 89 e5             	mov    %rsp,%rbp
   4000a:	6a 00                	push   $0x0
   4000c:	9d                   	popf   
   4000d:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
   40012:	75 0d                	jne    40021 <_kernel_start+0x21>
   40014:	f7 03 04 00 00 00    	testl  $0x4,(%rbx)
   4001a:	74 05                	je     40021 <_kernel_start+0x21>
   4001c:	8b 7b 10             	mov    0x10(%rbx),%edi
   4001f:	eb 07                	jmp    40028 <_kernel_start+0x28>
   40021:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
   40028:	e9 b3 18 00 00       	jmp    418e0 <kernel_start(char const*)>

000000000004002d <exception_entry_0>:
   4002d:	6a 00                	push   $0x0
   4002f:	6a 00                	push   $0x0
   40031:	e9 3c 0a 00 00       	jmp    40a72 <exception_entry()>

0000000000040036 <exception_entry_1>:
   40036:	6a 00                	push   $0x0
   40038:	6a 01                	push   $0x1
   4003a:	e9 33 0a 00 00       	jmp    40a72 <exception_entry()>

000000000004003f <exception_entry_2>:
   4003f:	6a 00                	push   $0x0
   40041:	6a 02                	push   $0x2
   40043:	e9 2a 0a 00 00       	jmp    40a72 <exception_entry()>

0000000000040048 <exception_entry_3>:
   40048:	6a 00                	push   $0x0
   4004a:	6a 03                	push   $0x3
   4004c:	e9 21 0a 00 00       	jmp    40a72 <exception_entry()>

0000000000040051 <exception_entry_4>:
   40051:	6a 00                	push   $0x0
   40053:	6a 04                	push   $0x4
   40055:	e9 18 0a 00 00       	jmp    40a72 <exception_entry()>

000000000004005a <exception_entry_5>:
   4005a:	6a 00                	push   $0x0
   4005c:	6a 05                	push   $0x5
   4005e:	e9 0f 0a 00 00       	jmp    40a72 <exception_entry()>

0000000000040063 <exception_entry_6>:
   40063:	6a 00                	push   $0x0
   40065:	6a 06                	push   $0x6
   40067:	e9 06 0a 00 00       	jmp    40a72 <exception_entry()>

000000000004006c <exception_entry_7>:
   4006c:	6a 00                	push   $0x0
   4006e:	6a 07                	push   $0x7
   40070:	e9 fd 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040075 <exception_entry_8>:
   40075:	6a 08                	push   $0x8
   40077:	e9 f6 09 00 00       	jmp    40a72 <exception_entry()>

000000000004007c <exception_entry_9>:
   4007c:	6a 00                	push   $0x0
   4007e:	6a 09                	push   $0x9
   40080:	e9 ed 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040085 <exception_entry_10>:
   40085:	6a 0a                	push   $0xa
   40087:	e9 e6 09 00 00       	jmp    40a72 <exception_entry()>

000000000004008c <exception_entry_11>:
   4008c:	6a 0b                	push   $0xb
   4008e:	e9 df 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040093 <exception_entry_12>:
   40093:	6a 0c                	push   $0xc
   40095:	e9 d8 09 00 00       	jmp    40a72 <exception_entry()>

000000000004009a <exception_entry_13>:
   4009a:	6a 0d                	push   $0xd
   4009c:	e9 d1 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400a1 <exception_entry_14>:
   400a1:	6a 0e                	push   $0xe
   400a3:	e9 ca 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400a8 <exception_entry_15>:
   400a8:	6a 00                	push   $0x0
   400aa:	6a 0f                	push   $0xf
   400ac:	e9 c1 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400b1 <exception_entry_16>:
   400b1:	6a 00                	push   $0x0
   400b3:	6a 10                	push   $0x10
   400b5:	e9 b8 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400ba <exception_entry_17>:
   400ba:	6a 11                	push   $0x11
   400bc:	e9 b1 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400c1 <exception_entry_18>:
   400c1:	6a 00                	push   $0x0
   400c3:	6a 12                	push   $0x12
   400c5:	e9 a8 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400ca <exception_entry_19>:
   400ca:	6a 00                	push   $0x0
   400cc:	6a 13                	push   $0x13
   400ce:	e9 9f 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400d3 <exception_entry_20>:
   400d3:	6a 00                	push   $0x0
   400d5:	6a 14                	push   $0x14
   400d7:	e9 96 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400dc <exception_entry_21>:
   400dc:	6a 00                	push   $0x0
   400de:	6a 15                	push   $0x15
   400e0:	e9 8d 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400e5 <exception_entry_22>:
   400e5:	6a 00                	push   $0x0
   400e7:	6a 16                	push   $0x16
   400e9:	e9 84 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400ee <exception_entry_23>:
   400ee:	6a 00                	push   $0x0
   400f0:	6a 17                	push   $0x17
   400f2:	e9 7b 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400f7 <exception_entry_24>:
   400f7:	6a 00                	push   $0x0
   400f9:	6a 18                	push   $0x18
   400fb:	e9 72 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040100 <exception_entry_25>:
   40100:	6a 00                	push   $0x0
   40102:	6a 19                	push   $0x19
   40104:	e9 69 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040109 <exception_entry_26>:
   40109:	6a 00                	push   $0x0
   4010b:	6a 1a                	push   $0x1a
   4010d:	e9 60 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040112 <exception_entry_27>:
   40112:	6a 00                	push   $0x0
   40114:	6a 1b                	push   $0x1b
   40116:	e9 57 09 00 00       	jmp    40a72 <exception_entry()>

000000000004011b <exception_entry_28>:
   4011b:	6a 00                	push   $0x0
   4011d:	6a 1c                	push   $0x1c
   4011f:	e9 4e 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040124 <exception_entry_29>:
   40124:	6a 00                	push   $0x0
   40126:	6a 1d                	push   $0x1d
   40128:	e9 45 09 00 00       	jmp    40a72 <exception_entry()>

000000000004012d <exception_entry_30>:
   4012d:	6a 00                	push   $0x0
   4012f:	6a 1e                	push   $0x1e
   40131:	e9 3c 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040136 <exception_entry_31>:
   40136:	6a 00                	push   $0x0
   40138:	6a 1f                	push   $0x1f
   4013a:	e9 33 09 00 00       	jmp    40a72 <exception_entry()>

000000000004013f <exception_entry_32>:
   4013f:	6a 00                	push   $0x0
   40141:	6a 20                	push   $0x20
   40143:	e9 2a 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040148 <exception_entry_33>:
   40148:	6a 00                	push   $0x0
   4014a:	6a 21                	push   $0x21
   4014c:	e9 21 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040151 <exception_entry_34>:
   40151:	6a 00                	push   $0x0
   40153:	6a 22                	push   $0x22
   40155:	e9 18 09 00 00       	jmp    40a72 <exception_entry()>

000000000004015a <exception_entry_35>:
   4015a:	6a 00                	push   $0x0
   4015c:	6a 23                	push   $0x23
   4015e:	e9 0f 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040163 <exception_entry_36>:
   40163:	6a 00                	push   $0x0
   40165:	6a 24                	push   $0x24
   40167:	e9 06 09 00 00       	jmp    40a72 <exception_entry()>

000000000004016c <exception_entry_37>:
   4016c:	6a 00                	push   $0x0
   4016e:	6a 25                	push   $0x25
   40170:	e9 fd 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040175 <exception_entry_38>:
   40175:	6a 00                	push   $0x0
   40177:	6a 26                	push   $0x26
   40179:	e9 f4 08 00 00       	jmp    40a72 <exception_entry()>

000000000004017e <exception_entry_39>:
   4017e:	6a 00                	push   $0x0
   40180:	6a 27                	push   $0x27
   40182:	e9 eb 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040187 <exception_entry_40>:
   40187:	6a 00                	push   $0x0
   40189:	6a 28                	push   $0x28
   4018b:	e9 e2 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040190 <exception_entry_41>:
   40190:	6a 00                	push   $0x0
   40192:	6a 29                	push   $0x29
   40194:	e9 d9 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040199 <exception_entry_42>:
   40199:	6a 00                	push   $0x0
   4019b:	6a 2a                	push   $0x2a
   4019d:	e9 d0 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401a2 <exception_entry_43>:
   401a2:	6a 00                	push   $0x0
   401a4:	6a 2b                	push   $0x2b
   401a6:	e9 c7 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401ab <exception_entry_44>:
   401ab:	6a 00                	push   $0x0
   401ad:	6a 2c                	push   $0x2c
   401af:	e9 be 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401b4 <exception_entry_45>:
   401b4:	6a 00                	push   $0x0
   401b6:	6a 2d                	push   $0x2d
   401b8:	e9 b5 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401bd <exception_entry_46>:
   401bd:	6a 00                	push   $0x0
   401bf:	6a 2e                	push   $0x2e
   401c1:	e9 ac 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401c6 <exception_entry_47>:
   401c6:	6a 00                	push   $0x0
   401c8:	6a 2f                	push   $0x2f
   401ca:	e9 a3 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401cf <exception_entry_48>:
   401cf:	6a 00                	push   $0x0
   401d1:	6a 30                	push   $0x30
   401d3:	e9 9a 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401d8 <exception_entry_49>:
   401d8:	6a 00                	push   $0x0
   401da:	6a 31                	push   $0x31
   401dc:	e9 91 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401e1 <exception_entry_50>:
   401e1:	6a 00                	push   $0x0
   401e3:	6a 32                	push   $0x32
   401e5:	e9 88 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401ea <exception_entry_51>:
   401ea:	6a 00                	push   $0x0
   401ec:	6a 33                	push   $0x33
   401ee:	e9 7f 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401f3 <exception_entry_52>:
   401f3:	6a 00                	push   $0x0
   401f5:	6a 34                	push   $0x34
   401f7:	e9 76 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401fc <exception_entry_53>:
   401fc:	6a 00                	push   $0x0
   401fe:	6a 35                	push   $0x35
   40200:	e9 6d 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040205 <exception_entry_54>:
   40205:	6a 00                	push   $0x0
   40207:	6a 36                	push   $0x36
   40209:	e9 64 08 00 00       	jmp    40a72 <exception_entry()>

000000000004020e <exception_entry_55>:
   4020e:	6a 00                	push   $0x0
   40210:	6a 37                	push   $0x37
   40212:	e9 5b 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040217 <exception_entry_56>:
   40217:	6a 00                	push   $0x0
   40219:	6a 38                	push   $0x38
   4021b:	e9 52 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040220 <exception_entry_57>:
   40220:	6a 00                	push   $0x0
   40222:	6a 39                	push   $0x39
   40224:	e9 49 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040229 <exception_entry_58>:
   40229:	6a 00                	push   $0x0
   4022b:	6a 3a                	push   $0x3a
   4022d:	e9 40 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040232 <exception_entry_59>:
   40232:	6a 00                	push   $0x0
   40234:	6a 3b                	push   $0x3b
   40236:	e9 37 08 00 00       	jmp    40a72 <exception_entry()>

000000000004023b <exception_entry_60>:
   4023b:	6a 00                	push   $0x0
   4023d:	6a 3c                	push   $0x3c
   4023f:	e9 2e 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040244 <exception_entry_61>:
   40244:	6a 00                	push   $0x0
   40246:	6a 3d                	push   $0x3d
   40248:	e9 25 08 00 00       	jmp    40a72 <exception_entry()>

000000000004024d <exception_entry_62>:
   4024d:	6a 00                	push   $0x0
   4024f:	6a 3e                	push   $0x3e
   40251:	e9 1c 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040256 <exception_entry_63>:
   40256:	6a 00                	push   $0x0
   40258:	6a 3f                	push   $0x3f
   4025a:	e9 13 08 00 00       	jmp    40a72 <exception_entry()>

000000000004025f <exception_entry_64>:
   4025f:	6a 00                	push   $0x0
   40261:	6a 40                	push   $0x40
   40263:	e9 0a 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040268 <exception_entry_65>:
   40268:	6a 00                	push   $0x0
   4026a:	6a 41                	push   $0x41
   4026c:	e9 01 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040271 <exception_entry_66>:
   40271:	6a 00                	push   $0x0
   40273:	6a 42                	push   $0x42
   40275:	e9 f8 07 00 00       	jmp    40a72 <exception_entry()>

000000000004027a <exception_entry_67>:
   4027a:	6a 00                	push   $0x0
   4027c:	6a 43                	push   $0x43
   4027e:	e9 ef 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040283 <exception_entry_68>:
   40283:	6a 00                	push   $0x0
   40285:	6a 44                	push   $0x44
   40287:	e9 e6 07 00 00       	jmp    40a72 <exception_entry()>

000000000004028c <exception_entry_69>:
   4028c:	6a 00                	push   $0x0
   4028e:	6a 45                	push   $0x45
   40290:	e9 dd 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040295 <exception_entry_70>:
   40295:	6a 00                	push   $0x0
   40297:	6a 46                	push   $0x46
   40299:	e9 d4 07 00 00       	jmp    40a72 <exception_entry()>

000000000004029e <exception_entry_71>:
   4029e:	6a 00                	push   $0x0
   402a0:	6a 47                	push   $0x47
   402a2:	e9 cb 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402a7 <exception_entry_72>:
   402a7:	6a 00                	push   $0x0
   402a9:	6a 48                	push   $0x48
   402ab:	e9 c2 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402b0 <exception_entry_73>:
   402b0:	6a 00                	push   $0x0
   402b2:	6a 49                	push   $0x49
   402b4:	e9 b9 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402b9 <exception_entry_74>:
   402b9:	6a 00                	push   $0x0
   402bb:	6a 4a                	push   $0x4a
   402bd:	e9 b0 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402c2 <exception_entry_75>:
   402c2:	6a 00                	push   $0x0
   402c4:	6a 4b                	push   $0x4b
   402c6:	e9 a7 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402cb <exception_entry_76>:
   402cb:	6a 00                	push   $0x0
   402cd:	6a 4c                	push   $0x4c
   402cf:	e9 9e 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402d4 <exception_entry_77>:
   402d4:	6a 00                	push   $0x0
   402d6:	6a 4d                	push   $0x4d
   402d8:	e9 95 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402dd <exception_entry_78>:
   402dd:	6a 00                	push   $0x0
   402df:	6a 4e                	push   $0x4e
   402e1:	e9 8c 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402e6 <exception_entry_79>:
   402e6:	6a 00                	push   $0x0
   402e8:	6a 4f                	push   $0x4f
   402ea:	e9 83 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402ef <exception_entry_80>:
   402ef:	6a 00                	push   $0x0
   402f1:	6a 50                	push   $0x50
   402f3:	e9 7a 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402f8 <exception_entry_81>:
   402f8:	6a 00                	push   $0x0
   402fa:	6a 51                	push   $0x51
   402fc:	e9 71 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040301 <exception_entry_82>:
   40301:	6a 00                	push   $0x0
   40303:	6a 52                	push   $0x52
   40305:	e9 68 07 00 00       	jmp    40a72 <exception_entry()>

000000000004030a <exception_entry_83>:
   4030a:	6a 00                	push   $0x0
   4030c:	6a 53                	push   $0x53
   4030e:	e9 5f 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040313 <exception_entry_84>:
   40313:	6a 00                	push   $0x0
   40315:	6a 54                	push   $0x54
   40317:	e9 56 07 00 00       	jmp    40a72 <exception_entry()>

000000000004031c <exception_entry_85>:
   4031c:	6a 00                	push   $0x0
   4031e:	6a 55                	push   $0x55
   40320:	e9 4d 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040325 <exception_entry_86>:
   40325:	6a 00                	push   $0x0
   40327:	6a 56                	push   $0x56
   40329:	e9 44 07 00 00       	jmp    40a72 <exception_entry()>

000000000004032e <exception_entry_87>:
   4032e:	6a 00                	push   $0x0
   40330:	6a 57                	push   $0x57
   40332:	e9 3b 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040337 <exception_entry_88>:
   40337:	6a 00                	push   $0x0
   40339:	6a 58                	push   $0x58
   4033b:	e9 32 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040340 <exception_entry_89>:
   40340:	6a 00                	push   $0x0
   40342:	6a 59                	push   $0x59
   40344:	e9 29 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040349 <exception_entry_90>:
   40349:	6a 00                	push   $0x0
   4034b:	6a 5a                	push   $0x5a
   4034d:	e9 20 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040352 <exception_entry_91>:
   40352:	6a 00                	push   $0x0
   40354:	6a 5b                	push   $0x5b
   40356:	e9 17 07 00 00       	jmp    40a72 <exception_entry()>

000000000004035b <exception_entry_92>:
   4035b:	6a 00                	push   $0x0
   4035d:	6a 5c                	push   $0x5c
   4035f:	e9 0e 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040364 <exception_entry_93>:
   40364:	6a 00                	push   $0x0
   40366:	6a 5d                	push   $0x5d
   40368:	e9 05 07 00 00       	jmp    40a72 <exception_entry()>

000000000004036d <exception_entry_94>:
   4036d:	6a 00                	push   $0x0
   4036f:	6a 5e                	push   $0x5e
   40371:	e9 fc 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040376 <exception_entry_95>:
   40376:	6a 00                	push   $0x0
   40378:	6a 5f                	push   $0x5f
   4037a:	e9 f3 06 00 00       	jmp    40a72 <exception_entry()>

000000000004037f <exception_entry_96>:
   4037f:	6a 00                	push   $0x0
   40381:	6a 60                	push   $0x60
   40383:	e9 ea 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040388 <exception_entry_97>:
   40388:	6a 00                	push   $0x0
   4038a:	6a 61                	push   $0x61
   4038c:	e9 e1 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040391 <exception_entry_98>:
   40391:	6a 00                	push   $0x0
   40393:	6a 62                	push   $0x62
   40395:	e9 d8 06 00 00       	jmp    40a72 <exception_entry()>

000000000004039a <exception_entry_99>:
   4039a:	6a 00                	push   $0x0
   4039c:	6a 63                	push   $0x63
   4039e:	e9 cf 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403a3 <exception_entry_100>:
   403a3:	6a 00                	push   $0x0
   403a5:	6a 64                	push   $0x64
   403a7:	e9 c6 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403ac <exception_entry_101>:
   403ac:	6a 00                	push   $0x0
   403ae:	6a 65                	push   $0x65
   403b0:	e9 bd 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403b5 <exception_entry_102>:
   403b5:	6a 00                	push   $0x0
   403b7:	6a 66                	push   $0x66
   403b9:	e9 b4 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403be <exception_entry_103>:
   403be:	6a 00                	push   $0x0
   403c0:	6a 67                	push   $0x67
   403c2:	e9 ab 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403c7 <exception_entry_104>:
   403c7:	6a 00                	push   $0x0
   403c9:	6a 68                	push   $0x68
   403cb:	e9 a2 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403d0 <exception_entry_105>:
   403d0:	6a 00                	push   $0x0
   403d2:	6a 69                	push   $0x69
   403d4:	e9 99 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403d9 <exception_entry_106>:
   403d9:	6a 00                	push   $0x0
   403db:	6a 6a                	push   $0x6a
   403dd:	e9 90 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403e2 <exception_entry_107>:
   403e2:	6a 00                	push   $0x0
   403e4:	6a 6b                	push   $0x6b
   403e6:	e9 87 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403eb <exception_entry_108>:
   403eb:	6a 00                	push   $0x0
   403ed:	6a 6c                	push   $0x6c
   403ef:	e9 7e 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403f4 <exception_entry_109>:
   403f4:	6a 00                	push   $0x0
   403f6:	6a 6d                	push   $0x6d
   403f8:	e9 75 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403fd <exception_entry_110>:
   403fd:	6a 00                	push   $0x0
   403ff:	6a 6e                	push   $0x6e
   40401:	e9 6c 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040406 <exception_entry_111>:
   40406:	6a 00                	push   $0x0
   40408:	6a 6f                	push   $0x6f
   4040a:	e9 63 06 00 00       	jmp    40a72 <exception_entry()>

000000000004040f <exception_entry_112>:
   4040f:	6a 00                	push   $0x0
   40411:	6a 70                	push   $0x70
   40413:	e9 5a 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040418 <exception_entry_113>:
   40418:	6a 00                	push   $0x0
   4041a:	6a 71                	push   $0x71
   4041c:	e9 51 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040421 <exception_entry_114>:
   40421:	6a 00                	push   $0x0
   40423:	6a 72                	push   $0x72
   40425:	e9 48 06 00 00       	jmp    40a72 <exception_entry()>

000000000004042a <exception_entry_115>:
   4042a:	6a 00                	push   $0x0
   4042c:	6a 73                	push   $0x73
   4042e:	e9 3f 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040433 <exception_entry_116>:
   40433:	6a 00                	push   $0x0
   40435:	6a 74                	push   $0x74
   40437:	e9 36 06 00 00       	jmp    40a72 <exception_entry()>

000000000004043c <exception_entry_117>:
   4043c:	6a 00                	push   $0x0
   4043e:	6a 75                	push   $0x75
   40440:	e9 2d 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040445 <exception_entry_118>:
   40445:	6a 00                	push   $0x0
   40447:	6a 76                	push   $0x76
   40449:	e9 24 06 00 00       	jmp    40a72 <exception_entry()>

000000000004044e <exception_entry_119>:
   4044e:	6a 00                	push   $0x0
   40450:	6a 77                	push   $0x77
   40452:	e9 1b 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040457 <exception_entry_120>:
   40457:	6a 00                	push   $0x0
   40459:	6a 78                	push   $0x78
   4045b:	e9 12 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040460 <exception_entry_121>:
   40460:	6a 00                	push   $0x0
   40462:	6a 79                	push   $0x79
   40464:	e9 09 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040469 <exception_entry_122>:
   40469:	6a 00                	push   $0x0
   4046b:	6a 7a                	push   $0x7a
   4046d:	e9 00 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040472 <exception_entry_123>:
   40472:	6a 00                	push   $0x0
   40474:	6a 7b                	push   $0x7b
   40476:	e9 f7 05 00 00       	jmp    40a72 <exception_entry()>

000000000004047b <exception_entry_124>:
   4047b:	6a 00                	push   $0x0
   4047d:	6a 7c                	push   $0x7c
   4047f:	e9 ee 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040484 <exception_entry_125>:
   40484:	6a 00                	push   $0x0
   40486:	6a 7d                	push   $0x7d
   40488:	e9 e5 05 00 00       	jmp    40a72 <exception_entry()>

000000000004048d <exception_entry_126>:
   4048d:	6a 00                	push   $0x0
   4048f:	6a 7e                	push   $0x7e
   40491:	e9 dc 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040496 <exception_entry_127>:
   40496:	6a 00                	push   $0x0
   40498:	6a 7f                	push   $0x7f
   4049a:	e9 d3 05 00 00       	jmp    40a72 <exception_entry()>

000000000004049f <exception_entry_128>:
   4049f:	6a 00                	push   $0x0
   404a1:	68 80 00 00 00       	push   $0x80
   404a6:	e9 c7 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404ab <exception_entry_129>:
   404ab:	6a 00                	push   $0x0
   404ad:	68 81 00 00 00       	push   $0x81
   404b2:	e9 bb 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404b7 <exception_entry_130>:
   404b7:	6a 00                	push   $0x0
   404b9:	68 82 00 00 00       	push   $0x82
   404be:	e9 af 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404c3 <exception_entry_131>:
   404c3:	6a 00                	push   $0x0
   404c5:	68 83 00 00 00       	push   $0x83
   404ca:	e9 a3 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404cf <exception_entry_132>:
   404cf:	6a 00                	push   $0x0
   404d1:	68 84 00 00 00       	push   $0x84
   404d6:	e9 97 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404db <exception_entry_133>:
   404db:	6a 00                	push   $0x0
   404dd:	68 85 00 00 00       	push   $0x85
   404e2:	e9 8b 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404e7 <exception_entry_134>:
   404e7:	6a 00                	push   $0x0
   404e9:	68 86 00 00 00       	push   $0x86
   404ee:	e9 7f 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404f3 <exception_entry_135>:
   404f3:	6a 00                	push   $0x0
   404f5:	68 87 00 00 00       	push   $0x87
   404fa:	e9 73 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404ff <exception_entry_136>:
   404ff:	6a 00                	push   $0x0
   40501:	68 88 00 00 00       	push   $0x88
   40506:	e9 67 05 00 00       	jmp    40a72 <exception_entry()>

000000000004050b <exception_entry_137>:
   4050b:	6a 00                	push   $0x0
   4050d:	68 89 00 00 00       	push   $0x89
   40512:	e9 5b 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040517 <exception_entry_138>:
   40517:	6a 00                	push   $0x0
   40519:	68 8a 00 00 00       	push   $0x8a
   4051e:	e9 4f 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040523 <exception_entry_139>:
   40523:	6a 00                	push   $0x0
   40525:	68 8b 00 00 00       	push   $0x8b
   4052a:	e9 43 05 00 00       	jmp    40a72 <exception_entry()>

000000000004052f <exception_entry_140>:
   4052f:	6a 00                	push   $0x0
   40531:	68 8c 00 00 00       	push   $0x8c
   40536:	e9 37 05 00 00       	jmp    40a72 <exception_entry()>

000000000004053b <exception_entry_141>:
   4053b:	6a 00                	push   $0x0
   4053d:	68 8d 00 00 00       	push   $0x8d
   40542:	e9 2b 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040547 <exception_entry_142>:
   40547:	6a 00                	push   $0x0
   40549:	68 8e 00 00 00       	push   $0x8e
   4054e:	e9 1f 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040553 <exception_entry_143>:
   40553:	6a 00                	push   $0x0
   40555:	68 8f 00 00 00       	push   $0x8f
   4055a:	e9 13 05 00 00       	jmp    40a72 <exception_entry()>

000000000004055f <exception_entry_144>:
   4055f:	6a 00                	push   $0x0
   40561:	68 90 00 00 00       	push   $0x90
   40566:	e9 07 05 00 00       	jmp    40a72 <exception_entry()>

000000000004056b <exception_entry_145>:
   4056b:	6a 00                	push   $0x0
   4056d:	68 91 00 00 00       	push   $0x91
   40572:	e9 fb 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040577 <exception_entry_146>:
   40577:	6a 00                	push   $0x0
   40579:	68 92 00 00 00       	push   $0x92
   4057e:	e9 ef 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040583 <exception_entry_147>:
   40583:	6a 00                	push   $0x0
   40585:	68 93 00 00 00       	push   $0x93
   4058a:	e9 e3 04 00 00       	jmp    40a72 <exception_entry()>

000000000004058f <exception_entry_148>:
   4058f:	6a 00                	push   $0x0
   40591:	68 94 00 00 00       	push   $0x94
   40596:	e9 d7 04 00 00       	jmp    40a72 <exception_entry()>

000000000004059b <exception_entry_149>:
   4059b:	6a 00                	push   $0x0
   4059d:	68 95 00 00 00       	push   $0x95
   405a2:	e9 cb 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405a7 <exception_entry_150>:
   405a7:	6a 00                	push   $0x0
   405a9:	68 96 00 00 00       	push   $0x96
   405ae:	e9 bf 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405b3 <exception_entry_151>:
   405b3:	6a 00                	push   $0x0
   405b5:	68 97 00 00 00       	push   $0x97
   405ba:	e9 b3 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405bf <exception_entry_152>:
   405bf:	6a 00                	push   $0x0
   405c1:	68 98 00 00 00       	push   $0x98
   405c6:	e9 a7 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405cb <exception_entry_153>:
   405cb:	6a 00                	push   $0x0
   405cd:	68 99 00 00 00       	push   $0x99
   405d2:	e9 9b 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405d7 <exception_entry_154>:
   405d7:	6a 00                	push   $0x0
   405d9:	68 9a 00 00 00       	push   $0x9a
   405de:	e9 8f 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405e3 <exception_entry_155>:
   405e3:	6a 00                	push   $0x0
   405e5:	68 9b 00 00 00       	push   $0x9b
   405ea:	e9 83 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405ef <exception_entry_156>:
   405ef:	6a 00                	push   $0x0
   405f1:	68 9c 00 00 00       	push   $0x9c
   405f6:	e9 77 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405fb <exception_entry_157>:
   405fb:	6a 00                	push   $0x0
   405fd:	68 9d 00 00 00       	push   $0x9d
   40602:	e9 6b 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040607 <exception_entry_158>:
   40607:	6a 00                	push   $0x0
   40609:	68 9e 00 00 00       	push   $0x9e
   4060e:	e9 5f 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040613 <exception_entry_159>:
   40613:	6a 00                	push   $0x0
   40615:	68 9f 00 00 00       	push   $0x9f
   4061a:	e9 53 04 00 00       	jmp    40a72 <exception_entry()>

000000000004061f <exception_entry_160>:
   4061f:	6a 00                	push   $0x0
   40621:	68 a0 00 00 00       	push   $0xa0
   40626:	e9 47 04 00 00       	jmp    40a72 <exception_entry()>

000000000004062b <exception_entry_161>:
   4062b:	6a 00                	push   $0x0
   4062d:	68 a1 00 00 00       	push   $0xa1
   40632:	e9 3b 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040637 <exception_entry_162>:
   40637:	6a 00                	push   $0x0
   40639:	68 a2 00 00 00       	push   $0xa2
   4063e:	e9 2f 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040643 <exception_entry_163>:
   40643:	6a 00                	push   $0x0
   40645:	68 a3 00 00 00       	push   $0xa3
   4064a:	e9 23 04 00 00       	jmp    40a72 <exception_entry()>

000000000004064f <exception_entry_164>:
   4064f:	6a 00                	push   $0x0
   40651:	68 a4 00 00 00       	push   $0xa4
   40656:	e9 17 04 00 00       	jmp    40a72 <exception_entry()>

000000000004065b <exception_entry_165>:
   4065b:	6a 00                	push   $0x0
   4065d:	68 a5 00 00 00       	push   $0xa5
   40662:	e9 0b 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040667 <exception_entry_166>:
   40667:	6a 00                	push   $0x0
   40669:	68 a6 00 00 00       	push   $0xa6
   4066e:	e9 ff 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040673 <exception_entry_167>:
   40673:	6a 00                	push   $0x0
   40675:	68 a7 00 00 00       	push   $0xa7
   4067a:	e9 f3 03 00 00       	jmp    40a72 <exception_entry()>

000000000004067f <exception_entry_168>:
   4067f:	6a 00                	push   $0x0
   40681:	68 a8 00 00 00       	push   $0xa8
   40686:	e9 e7 03 00 00       	jmp    40a72 <exception_entry()>

000000000004068b <exception_entry_169>:
   4068b:	6a 00                	push   $0x0
   4068d:	68 a9 00 00 00       	push   $0xa9
   40692:	e9 db 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040697 <exception_entry_170>:
   40697:	6a 00                	push   $0x0
   40699:	68 aa 00 00 00       	push   $0xaa
   4069e:	e9 cf 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406a3 <exception_entry_171>:
   406a3:	6a 00                	push   $0x0
   406a5:	68 ab 00 00 00       	push   $0xab
   406aa:	e9 c3 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406af <exception_entry_172>:
   406af:	6a 00                	push   $0x0
   406b1:	68 ac 00 00 00       	push   $0xac
   406b6:	e9 b7 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406bb <exception_entry_173>:
   406bb:	6a 00                	push   $0x0
   406bd:	68 ad 00 00 00       	push   $0xad
   406c2:	e9 ab 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406c7 <exception_entry_174>:
   406c7:	6a 00                	push   $0x0
   406c9:	68 ae 00 00 00       	push   $0xae
   406ce:	e9 9f 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406d3 <exception_entry_175>:
   406d3:	6a 00                	push   $0x0
   406d5:	68 af 00 00 00       	push   $0xaf
   406da:	e9 93 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406df <exception_entry_176>:
   406df:	6a 00                	push   $0x0
   406e1:	68 b0 00 00 00       	push   $0xb0
   406e6:	e9 87 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406eb <exception_entry_177>:
   406eb:	6a 00                	push   $0x0
   406ed:	68 b1 00 00 00       	push   $0xb1
   406f2:	e9 7b 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406f7 <exception_entry_178>:
   406f7:	6a 00                	push   $0x0
   406f9:	68 b2 00 00 00       	push   $0xb2
   406fe:	e9 6f 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040703 <exception_entry_179>:
   40703:	6a 00                	push   $0x0
   40705:	68 b3 00 00 00       	push   $0xb3
   4070a:	e9 63 03 00 00       	jmp    40a72 <exception_entry()>

000000000004070f <exception_entry_180>:
   4070f:	6a 00                	push   $0x0
   40711:	68 b4 00 00 00       	push   $0xb4
   40716:	e9 57 03 00 00       	jmp    40a72 <exception_entry()>

000000000004071b <exception_entry_181>:
   4071b:	6a 00                	push   $0x0
   4071d:	68 b5 00 00 00       	push   $0xb5
   40722:	e9 4b 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040727 <exception_entry_182>:
   40727:	6a 00                	push   $0x0
   40729:	68 b6 00 00 00       	push   $0xb6
   4072e:	e9 3f 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040733 <exception_entry_183>:
   40733:	6a 00                	push   $0x0
   40735:	68 b7 00 00 00       	push   $0xb7
   4073a:	e9 33 03 00 00       	jmp    40a72 <exception_entry()>

000000000004073f <exception_entry_184>:
   4073f:	6a 00                	push   $0x0
   40741:	68 b8 00 00 00       	push   $0xb8
   40746:	e9 27 03 00 00       	jmp    40a72 <exception_entry()>

000000000004074b <exception_entry_185>:
   4074b:	6a 00                	push   $0x0
   4074d:	68 b9 00 00 00       	push   $0xb9
   40752:	e9 1b 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040757 <exception_entry_186>:
   40757:	6a 00                	push   $0x0
   40759:	68 ba 00 00 00       	push   $0xba
   4075e:	e9 0f 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040763 <exception_entry_187>:
   40763:	6a 00                	push   $0x0
   40765:	68 bb 00 00 00       	push   $0xbb
   4076a:	e9 03 03 00 00       	jmp    40a72 <exception_entry()>

000000000004076f <exception_entry_188>:
   4076f:	6a 00                	push   $0x0
   40771:	68 bc 00 00 00       	push   $0xbc
   40776:	e9 f7 02 00 00       	jmp    40a72 <exception_entry()>

000000000004077b <exception_entry_189>:
   4077b:	6a 00                	push   $0x0
   4077d:	68 bd 00 00 00       	push   $0xbd
   40782:	e9 eb 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040787 <exception_entry_190>:
   40787:	6a 00                	push   $0x0
   40789:	68 be 00 00 00       	push   $0xbe
   4078e:	e9 df 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040793 <exception_entry_191>:
   40793:	6a 00                	push   $0x0
   40795:	68 bf 00 00 00       	push   $0xbf
   4079a:	e9 d3 02 00 00       	jmp    40a72 <exception_entry()>

000000000004079f <exception_entry_192>:
   4079f:	6a 00                	push   $0x0
   407a1:	68 c0 00 00 00       	push   $0xc0
   407a6:	e9 c7 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407ab <exception_entry_193>:
   407ab:	6a 00                	push   $0x0
   407ad:	68 c1 00 00 00       	push   $0xc1
   407b2:	e9 bb 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407b7 <exception_entry_194>:
   407b7:	6a 00                	push   $0x0
   407b9:	68 c2 00 00 00       	push   $0xc2
   407be:	e9 af 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407c3 <exception_entry_195>:
   407c3:	6a 00                	push   $0x0
   407c5:	68 c3 00 00 00       	push   $0xc3
   407ca:	e9 a3 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407cf <exception_entry_196>:
   407cf:	6a 00                	push   $0x0
   407d1:	68 c4 00 00 00       	push   $0xc4
   407d6:	e9 97 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407db <exception_entry_197>:
   407db:	6a 00                	push   $0x0
   407dd:	68 c5 00 00 00       	push   $0xc5
   407e2:	e9 8b 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407e7 <exception_entry_198>:
   407e7:	6a 00                	push   $0x0
   407e9:	68 c6 00 00 00       	push   $0xc6
   407ee:	e9 7f 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407f3 <exception_entry_199>:
   407f3:	6a 00                	push   $0x0
   407f5:	68 c7 00 00 00       	push   $0xc7
   407fa:	e9 73 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407ff <exception_entry_200>:
   407ff:	6a 00                	push   $0x0
   40801:	68 c8 00 00 00       	push   $0xc8
   40806:	e9 67 02 00 00       	jmp    40a72 <exception_entry()>

000000000004080b <exception_entry_201>:
   4080b:	6a 00                	push   $0x0
   4080d:	68 c9 00 00 00       	push   $0xc9
   40812:	e9 5b 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040817 <exception_entry_202>:
   40817:	6a 00                	push   $0x0
   40819:	68 ca 00 00 00       	push   $0xca
   4081e:	e9 4f 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040823 <exception_entry_203>:
   40823:	6a 00                	push   $0x0
   40825:	68 cb 00 00 00       	push   $0xcb
   4082a:	e9 43 02 00 00       	jmp    40a72 <exception_entry()>

000000000004082f <exception_entry_204>:
   4082f:	6a 00                	push   $0x0
   40831:	68 cc 00 00 00       	push   $0xcc
   40836:	e9 37 02 00 00       	jmp    40a72 <exception_entry()>

000000000004083b <exception_entry_205>:
   4083b:	6a 00                	push   $0x0
   4083d:	68 cd 00 00 00       	push   $0xcd
   40842:	e9 2b 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040847 <exception_entry_206>:
   40847:	6a 00                	push   $0x0
   40849:	68 ce 00 00 00       	push   $0xce
   4084e:	e9 1f 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040853 <exception_entry_207>:
   40853:	6a 00                	push   $0x0
   40855:	68 cf 00 00 00       	push   $0xcf
   4085a:	e9 13 02 00 00       	jmp    40a72 <exception_entry()>

000000000004085f <exception_entry_208>:
   4085f:	6a 00                	push   $0x0
   40861:	68 d0 00 00 00       	push   $0xd0
   40866:	e9 07 02 00 00       	jmp    40a72 <exception_entry()>

000000000004086b <exception_entry_209>:
   4086b:	6a 00                	push   $0x0
   4086d:	68 d1 00 00 00       	push   $0xd1
   40872:	e9 fb 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040877 <exception_entry_210>:
   40877:	6a 00                	push   $0x0
   40879:	68 d2 00 00 00       	push   $0xd2
   4087e:	e9 ef 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040883 <exception_entry_211>:
   40883:	6a 00                	push   $0x0
   40885:	68 d3 00 00 00       	push   $0xd3
   4088a:	e9 e3 01 00 00       	jmp    40a72 <exception_entry()>

000000000004088f <exception_entry_212>:
   4088f:	6a 00                	push   $0x0
   40891:	68 d4 00 00 00       	push   $0xd4
   40896:	e9 d7 01 00 00       	jmp    40a72 <exception_entry()>

000000000004089b <exception_entry_213>:
   4089b:	6a 00                	push   $0x0
   4089d:	68 d5 00 00 00       	push   $0xd5
   408a2:	e9 cb 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408a7 <exception_entry_214>:
   408a7:	6a 00                	push   $0x0
   408a9:	68 d6 00 00 00       	push   $0xd6
   408ae:	e9 bf 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408b3 <exception_entry_215>:
   408b3:	6a 00                	push   $0x0
   408b5:	68 d7 00 00 00       	push   $0xd7
   408ba:	e9 b3 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408bf <exception_entry_216>:
   408bf:	6a 00                	push   $0x0
   408c1:	68 d8 00 00 00       	push   $0xd8
   408c6:	e9 a7 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408cb <exception_entry_217>:
   408cb:	6a 00                	push   $0x0
   408cd:	68 d9 00 00 00       	push   $0xd9
   408d2:	e9 9b 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408d7 <exception_entry_218>:
   408d7:	6a 00                	push   $0x0
   408d9:	68 da 00 00 00       	push   $0xda
   408de:	e9 8f 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408e3 <exception_entry_219>:
   408e3:	6a 00                	push   $0x0
   408e5:	68 db 00 00 00       	push   $0xdb
   408ea:	e9 83 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408ef <exception_entry_220>:
   408ef:	6a 00                	push   $0x0
   408f1:	68 dc 00 00 00       	push   $0xdc
   408f6:	e9 77 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408fb <exception_entry_221>:
   408fb:	6a 00                	push   $0x0
   408fd:	68 dd 00 00 00       	push   $0xdd
   40902:	e9 6b 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040907 <exception_entry_222>:
   40907:	6a 00                	push   $0x0
   40909:	68 de 00 00 00       	push   $0xde
   4090e:	e9 5f 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040913 <exception_entry_223>:
   40913:	6a 00                	push   $0x0
   40915:	68 df 00 00 00       	push   $0xdf
   4091a:	e9 53 01 00 00       	jmp    40a72 <exception_entry()>

000000000004091f <exception_entry_224>:
   4091f:	6a 00                	push   $0x0
   40921:	68 e0 00 00 00       	push   $0xe0
   40926:	e9 47 01 00 00       	jmp    40a72 <exception_entry()>

000000000004092b <exception_entry_225>:
   4092b:	6a 00                	push   $0x0
   4092d:	68 e1 00 00 00       	push   $0xe1
   40932:	e9 3b 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040937 <exception_entry_226>:
   40937:	6a 00                	push   $0x0
   40939:	68 e2 00 00 00       	push   $0xe2
   4093e:	e9 2f 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040943 <exception_entry_227>:
   40943:	6a 00                	push   $0x0
   40945:	68 e3 00 00 00       	push   $0xe3
   4094a:	e9 23 01 00 00       	jmp    40a72 <exception_entry()>

000000000004094f <exception_entry_228>:
   4094f:	6a 00                	push   $0x0
   40951:	68 e4 00 00 00       	push   $0xe4
   40956:	e9 17 01 00 00       	jmp    40a72 <exception_entry()>

000000000004095b <exception_entry_229>:
   4095b:	6a 00                	push   $0x0
   4095d:	68 e5 00 00 00       	push   $0xe5
   40962:	e9 0b 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040967 <exception_entry_230>:
   40967:	6a 00                	push   $0x0
   40969:	68 e6 00 00 00       	push   $0xe6
   4096e:	e9 ff 00 00 00       	jmp    40a72 <exception_entry()>

0000000000040973 <exception_entry_231>:
   40973:	6a 00                	push   $0x0
   40975:	68 e7 00 00 00       	push   $0xe7
   4097a:	e9 f3 00 00 00       	jmp    40a72 <exception_entry()>

000000000004097f <exception_entry_232>:
   4097f:	6a 00                	push   $0x0
   40981:	68 e8 00 00 00       	push   $0xe8
   40986:	e9 e7 00 00 00       	jmp    40a72 <exception_entry()>

000000000004098b <exception_entry_233>:
   4098b:	6a 00                	push   $0x0
   4098d:	68 e9 00 00 00       	push   $0xe9
   40992:	e9 db 00 00 00       	jmp    40a72 <exception_entry()>

0000000000040997 <exception_entry_234>:
   40997:	6a 00                	push   $0x0
   40999:	68 ea 00 00 00       	push   $0xea
   4099e:	e9 cf 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409a3 <exception_entry_235>:
   409a3:	6a 00                	push   $0x0
   409a5:	68 eb 00 00 00       	push   $0xeb
   409aa:	e9 c3 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409af <exception_entry_236>:
   409af:	6a 00                	push   $0x0
   409b1:	68 ec 00 00 00       	push   $0xec
   409b6:	e9 b7 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409bb <exception_entry_237>:
   409bb:	6a 00                	push   $0x0
   409bd:	68 ed 00 00 00       	push   $0xed
   409c2:	e9 ab 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409c7 <exception_entry_238>:
   409c7:	6a 00                	push   $0x0
   409c9:	68 ee 00 00 00       	push   $0xee
   409ce:	e9 9f 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409d3 <exception_entry_239>:
   409d3:	6a 00                	push   $0x0
   409d5:	68 ef 00 00 00       	push   $0xef
   409da:	e9 93 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409df <exception_entry_240>:
   409df:	6a 00                	push   $0x0
   409e1:	68 f0 00 00 00       	push   $0xf0
   409e6:	e9 87 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409eb <exception_entry_241>:
   409eb:	6a 00                	push   $0x0
   409ed:	68 f1 00 00 00       	push   $0xf1
   409f2:	eb 7e                	jmp    40a72 <exception_entry()>

00000000000409f4 <exception_entry_242>:
   409f4:	6a 00                	push   $0x0
   409f6:	68 f2 00 00 00       	push   $0xf2
   409fb:	eb 75                	jmp    40a72 <exception_entry()>

00000000000409fd <exception_entry_243>:
   409fd:	6a 00                	push   $0x0
   409ff:	68 f3 00 00 00       	push   $0xf3
   40a04:	eb 6c                	jmp    40a72 <exception_entry()>

0000000000040a06 <exception_entry_244>:
   40a06:	6a 00                	push   $0x0
   40a08:	68 f4 00 00 00       	push   $0xf4
   40a0d:	eb 63                	jmp    40a72 <exception_entry()>

0000000000040a0f <exception_entry_245>:
   40a0f:	6a 00                	push   $0x0
   40a11:	68 f5 00 00 00       	push   $0xf5
   40a16:	eb 5a                	jmp    40a72 <exception_entry()>

0000000000040a18 <exception_entry_246>:
   40a18:	6a 00                	push   $0x0
   40a1a:	68 f6 00 00 00       	push   $0xf6
   40a1f:	eb 51                	jmp    40a72 <exception_entry()>

0000000000040a21 <exception_entry_247>:
   40a21:	6a 00                	push   $0x0
   40a23:	68 f7 00 00 00       	push   $0xf7
   40a28:	eb 48                	jmp    40a72 <exception_entry()>

0000000000040a2a <exception_entry_248>:
   40a2a:	6a 00                	push   $0x0
   40a2c:	68 f8 00 00 00       	push   $0xf8
   40a31:	eb 3f                	jmp    40a72 <exception_entry()>

0000000000040a33 <exception_entry_249>:
   40a33:	6a 00                	push   $0x0
   40a35:	68 f9 00 00 00       	push   $0xf9
   40a3a:	eb 36                	jmp    40a72 <exception_entry()>

0000000000040a3c <exception_entry_250>:
   40a3c:	6a 00                	push   $0x0
   40a3e:	68 fa 00 00 00       	push   $0xfa
   40a43:	eb 2d                	jmp    40a72 <exception_entry()>

0000000000040a45 <exception_entry_251>:
   40a45:	6a 00                	push   $0x0
   40a47:	68 fb 00 00 00       	push   $0xfb
   40a4c:	eb 24                	jmp    40a72 <exception_entry()>

0000000000040a4e <exception_entry_252>:
   40a4e:	6a 00                	push   $0x0
   40a50:	68 fc 00 00 00       	push   $0xfc
   40a55:	eb 1b                	jmp    40a72 <exception_entry()>

0000000000040a57 <exception_entry_253>:
   40a57:	6a 00                	push   $0x0
   40a59:	68 fd 00 00 00       	push   $0xfd
   40a5e:	eb 12                	jmp    40a72 <exception_entry()>

0000000000040a60 <exception_entry_254>:
   40a60:	6a 00                	push   $0x0
   40a62:	68 fe 00 00 00       	push   $0xfe
   40a67:	eb 09                	jmp    40a72 <exception_entry()>

0000000000040a69 <exception_entry_255>:
   40a69:	6a 00                	push   $0x0
   40a6b:	68 ff 00 00 00       	push   $0xff
   40a70:	eb 00                	jmp    40a72 <exception_entry()>

0000000000040a72 <exception_entry()>:
   40a72:	0f a8                	push   %gs
   40a74:	0f a0                	push   %fs
   40a76:	41 57                	push   %r15
   40a78:	41 56                	push   %r14
   40a7a:	41 55                	push   %r13
   40a7c:	41 54                	push   %r12
   40a7e:	41 53                	push   %r11
   40a80:	41 52                	push   %r10
   40a82:	41 51                	push   %r9
   40a84:	41 50                	push   %r8
   40a86:	57                   	push   %rdi
   40a87:	56                   	push   %rsi
   40a88:	55                   	push   %rbp
   40a89:	53                   	push   %rbx
   40a8a:	52                   	push   %rdx
   40a8b:	51                   	push   %rcx
   40a8c:	50                   	push   %rax
   40a8d:	48 89 e7             	mov    %rsp,%rdi
   40a90:	48 c7 c0 00 b0 05 00 	mov    $0x5b000,%rax
   40a97:	0f 22 d8             	mov    %rax,%cr3
   40a9a:	e8 ca 11 00 00       	call   41c69 <exception(regstate*)>

0000000000040a9f <exception_return(proc*)>:
   40a9f:	8b 47 0c             	mov    0xc(%rdi),%eax
   40aa2:	83 f8 01             	cmp    $0x1,%eax
   40aa5:	0f 85 a4 00 00 00    	jne    40b4f <proc_runnable_fail>
   40aab:	48 8b 07             	mov    (%rdi),%rax
   40aae:	0f 22 d8             	mov    %rax,%cr3
   40ab1:	48 8d 67 10          	lea    0x10(%rdi),%rsp
   40ab5:	58                   	pop    %rax
   40ab6:	59                   	pop    %rcx
   40ab7:	5a                   	pop    %rdx
   40ab8:	5b                   	pop    %rbx
   40ab9:	5d                   	pop    %rbp
   40aba:	5e                   	pop    %rsi
   40abb:	5f                   	pop    %rdi
   40abc:	41 58                	pop    %r8
   40abe:	41 59                	pop    %r9
   40ac0:	41 5a                	pop    %r10
   40ac2:	41 5b                	pop    %r11
   40ac4:	41 5c                	pop    %r12
   40ac6:	41 5d                	pop    %r13
   40ac8:	41 5e                	pop    %r14
   40aca:	41 5f                	pop    %r15
   40acc:	0f a1                	pop    %fs
   40ace:	0f a9                	pop    %gs
   40ad0:	48 83 c4 10          	add    $0x10,%rsp
   40ad4:	48 cf                	iretq  

0000000000040ad6 <syscall_entry()>:
   40ad6:	48 89 24 25 f0 ff 07 	mov    %rsp,0x7fff0
   40add:	00 
   40ade:	48 c7 c4 00 00 08 00 	mov    $0x80000,%rsp
   40ae5:	6a 23                	push   $0x23
   40ae7:	48 83 ec 08          	sub    $0x8,%rsp
   40aeb:	41 53                	push   %r11
   40aed:	6a 1b                	push   $0x1b
   40aef:	51                   	push   %rcx
   40af0:	48 83 ec 08          	sub    $0x8,%rsp
   40af4:	6a ff                	push   $0xffffffffffffffff
   40af6:	0f a8                	push   %gs
   40af8:	0f a0                	push   %fs
   40afa:	41 57                	push   %r15
   40afc:	41 56                	push   %r14
   40afe:	41 55                	push   %r13
   40b00:	41 54                	push   %r12
   40b02:	48 83 ec 08          	sub    $0x8,%rsp
   40b06:	41 52                	push   %r10
   40b08:	41 51                	push   %r9
   40b0a:	41 50                	push   %r8
   40b0c:	57                   	push   %rdi
   40b0d:	56                   	push   %rsi
   40b0e:	55                   	push   %rbp
   40b0f:	53                   	push   %rbx
   40b10:	52                   	push   %rdx
   40b11:	48 83 ec 08          	sub    $0x8,%rsp
   40b15:	50                   	push   %rax
   40b16:	48 c7 c0 00 b0 05 00 	mov    $0x5b000,%rax
   40b1d:	0f 22 d8             	mov    %rax,%cr3
   40b20:	48 89 e7             	mov    %rsp,%rdi
   40b23:	e8 67 12 00 00       	call   41d8f <syscall(regstate*)>
   40b28:	48 8b 0c 25 00 92 05 	mov    0x59200,%rcx
   40b2f:	00 
   40b30:	8b 49 0c             	mov    0xc(%rcx),%ecx
   40b33:	83 f9 01             	cmp    $0x1,%ecx
   40b36:	75 17                	jne    40b4f <proc_runnable_fail>
   40b38:	48 8b 0c 25 00 92 05 	mov    0x59200,%rcx
   40b3f:	00 
   40b40:	48 8b 09             	mov    (%rcx),%rcx
   40b43:	0f 22 d9             	mov    %rcx,%cr3
   40b46:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   40b4d:	48 cf                	iretq  

0000000000040b4f <proc_runnable_fail>:
   40b4f:	31 c9                	xor    %ecx,%ecx
   40b51:	48 c7 c2 ee 53 04 00 	mov    $0x453ee,%rdx
   40b58:	31 f6                	xor    %esi,%esi
   40b5a:	48 c7 c7 e0 53 04 00 	mov    $0x453e0,%rdi
   40b61:	e8 8c 21 00 00       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>

0000000000040b66 <kalloc(unsigned long)>:
//
//    The returned memory is initially filled with 0xCC, which corresponds to
//    the `int3` instruction. Executing that instruction will cause a `PANIC:
//    Unhandled exception 3!` This may help you debug.

void* kalloc(size_t sz) {
   40b66:	f3 0f 1e fa          	endbr64 
   40b6a:	55                   	push   %rbp
   40b6b:	48 89 e5             	mov    %rsp,%rbp
   40b6e:	41 54                	push   %r12
   40b70:	53                   	push   %rbx
    if (sz > PAGESIZE) {
   40b71:	48 81 ff 00 10 00 00 	cmp    $0x1000,%rdi
   40b78:	77 5f                	ja     40bd9 <kalloc(unsigned long)+0x73>
        return nullptr;
    }

    for (uintptr_t pa = 0; pa != MEMSIZE_PHYSICAL; pa += PAGESIZE) {
   40b7a:	bb 00 00 00 00       	mov    $0x0,%ebx
   40b7f:	eb 10                	jmp    40b91 <kalloc(unsigned long)+0x2b>
   40b81:	48 81 c3 00 10 00 00 	add    $0x1000,%rbx
   40b88:	48 81 fb 00 00 20 00 	cmp    $0x200000,%rbx
   40b8f:	74 40                	je     40bd1 <kalloc(unsigned long)+0x6b>
        if (allocatable_physical_address(pa)
   40b91:	48 89 df             	mov    %rbx,%rdi
   40b94:	e8 95 19 00 00       	call   4252e <allocatable_physical_address(unsigned long)>
            && physpages[pa / PAGESIZE].refcount == 0) {
   40b99:	84 c0                	test   %al,%al
   40b9b:	74 e4                	je     40b81 <kalloc(unsigned long)+0x1b>
   40b9d:	48 89 d8             	mov    %rbx,%rax
   40ba0:	48 c1 e8 0c          	shr    $0xc,%rax
   40ba4:	80 b8 00 90 05 00 00 	cmpb   $0x0,0x59000(%rax)
   40bab:	75 d4                	jne    40b81 <kalloc(unsigned long)+0x1b>
            ++physpages[pa / PAGESIZE].refcount;
   40bad:	c6 80 00 90 05 00 01 	movb   $0x1,0x59000(%rax)
            memset((void*) pa, 0xCC, PAGESIZE);
   40bb4:	49 89 dc             	mov    %rbx,%r12
   40bb7:	ba 00 10 00 00       	mov    $0x1000,%edx
   40bbc:	be cc 00 00 00       	mov    $0xcc,%esi
   40bc1:	48 89 df             	mov    %rbx,%rdi
   40bc4:	e8 4a 3b 00 00       	call   44713 <memset>
            return (void*) pa;
        }
    }
    return nullptr;
}
   40bc9:	4c 89 e0             	mov    %r12,%rax
   40bcc:	5b                   	pop    %rbx
   40bcd:	41 5c                	pop    %r12
   40bcf:	5d                   	pop    %rbp
   40bd0:	c3                   	ret    
    return nullptr;
   40bd1:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   40bd7:	eb f0                	jmp    40bc9 <kalloc(unsigned long)+0x63>
        return nullptr;
   40bd9:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   40bdf:	eb e8                	jmp    40bc9 <kalloc(unsigned long)+0x63>

0000000000040be1 <process_setup(int, char const*)>:
// process_setup(pid, program_name)
//    Load application program `program_name` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, const char* program_name) {
   40be1:	55                   	push   %rbp
   40be2:	48 89 e5             	mov    %rsp,%rbp
   40be5:	41 57                	push   %r15
   40be7:	41 56                	push   %r14
   40be9:	41 55                	push   %r13
   40beb:	41 54                	push   %r12
   40bed:	53                   	push   %rbx
   40bee:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   40bf5:	41 89 ff             	mov    %edi,%r15d
   40bf8:	49 89 f6             	mov    %rsi,%r14
    init_process(&ptable[pid], 0);
   40bfb:	4c 63 e7             	movslq %edi,%r12
   40bfe:	4b 8d 1c 64          	lea    (%r12,%r12,2),%rbx
   40c02:	48 c1 e3 02          	shl    $0x2,%rbx
   40c06:	4a 8d 3c 23          	lea    (%rbx,%r12,1),%rdi
   40c0a:	48 c1 e7 04          	shl    $0x4,%rdi
   40c0e:	48 81 c7 20 92 05 00 	add    $0x59220,%rdi
   40c15:	be 00 00 00 00       	mov    $0x0,%esi
   40c1a:	e8 6b 19 00 00       	call   4258a <init_process(proc*, int)>

    // initialize a new and empty page table
    ptable[pid].pagetable = kalloc_pagetable();
   40c1f:	e8 af 18 00 00       	call   424d3 <kalloc_pagetable()>
   40c24:	4c 01 e3             	add    %r12,%rbx
   40c27:	48 c1 e3 04          	shl    $0x4,%rbx
   40c2b:	48 89 83 20 92 05 00 	mov    %rax,0x59220(%rbx)
    void down(bool skip);
};


inline vmiter::vmiter(x86_64_pagetable* pt, uintptr_t va)
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   40c32:	48 89 45 90          	mov    %rax,-0x70(%rbp)
   40c36:	48 89 45 98          	mov    %rax,-0x68(%rbp)
   40c3a:	c7 45 a0 03 00 00 00 	movl   $0x3,-0x60(%rbp)
   40c41:	c7 45 a4 ff 0f 00 00 	movl   $0xfff,-0x5c(%rbp)
   40c48:	48 c7 45 a8 00 00 00 	movq   $0x0,-0x58(%rbp)
   40c4f:	00 
    real_find(va);
   40c50:	be 00 00 00 00       	mov    $0x0,%esi
   40c55:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   40c59:	e8 96 12 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   40c5e:	48 c7 85 68 ff ff ff 	movq   $0x5b000,-0x98(%rbp)
   40c65:	00 b0 05 00 
   40c69:	48 c7 85 70 ff ff ff 	movq   $0x5b000,-0x90(%rbp)
   40c70:	00 b0 05 00 
   40c74:	c7 85 78 ff ff ff 03 	movl   $0x3,-0x88(%rbp)
   40c7b:	00 00 00 
   40c7e:	c7 85 7c ff ff ff ff 	movl   $0xfff,-0x84(%rbp)
   40c85:	0f 00 00 
   40c88:	48 c7 45 80 00 00 00 	movq   $0x0,-0x80(%rbp)
   40c8f:	00 
    real_find(va);
   40c90:	be 00 00 00 00       	mov    $0x0,%esi
   40c95:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40c9c:	e8 53 12 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
}
inline x86_64_pagetable* vmiter::pagetable() const {
    return pt_;
}
inline uintptr_t vmiter::va() const {
    return va_;
   40ca1:	48 8b 7d 80          	mov    -0x80(%rbp),%rdi

    vmiter p_it(ptable[pid].pagetable, 0);

    // copy the mappings from the kernel page table into the process page table
    for (vmiter k_it = vmiter(kernel_pagetable, 0); k_it.va() < PROC_START_ADDR; k_it += PAGESIZE) {
   40ca5:	48 81 ff ff ff 0f 00 	cmp    $0xfffff,%rdi
   40cac:	0f 87 d5 00 00 00    	ja     40d87 <process_setup(int, char const*)+0x1a6>
        if (level_ > 0) {
            pa &= ~0x1000UL;
        }
        return pa + (va_ & pageoffmask(level_));
    } else {
        return -1;
   40cb2:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
            pa &= ~0x1000UL;
   40cb9:	49 bc 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r12
   40cc0:	ff 0f 00 
        uintptr_t pa = *pep_ & PTE_PAMASK;
   40cc3:	49 bd 00 f0 ff ff ff 	movabs $0xffffffffff000,%r13
   40cca:	ff 0f 00 
   40ccd:	eb 49                	jmp    40d18 <process_setup(int, char const*)+0x137>
        int r = p_it.try_map(k_it.pa(), k_it.perm());
   40ccf:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   40cd3:	e8 34 14 00 00       	call   4210c <vmiter::try_map(unsigned long, int)>
        assert(r == 0);
   40cd8:	85 c0                	test   %eax,%eax
   40cda:	0f 85 8e 00 00 00    	jne    40d6e <process_setup(int, char const*)+0x18d>
        real_find(va);
    }
    return *this;
}
inline vmiter& vmiter::operator+=(intptr_t delta) {
    return find(va_ + delta);
   40ce0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   40ce4:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va);
   40ceb:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   40cef:	e8 00 12 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
    return find(va_ + delta);
   40cf4:	48 8b 45 80          	mov    -0x80(%rbp),%rax
   40cf8:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va);
   40cff:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40d06:	e8 e9 11 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
    return va_;
   40d0b:	48 8b 7d 80          	mov    -0x80(%rbp),%rdi
    for (vmiter k_it = vmiter(kernel_pagetable, 0); k_it.va() < PROC_START_ADDR; k_it += PAGESIZE) {
   40d0f:	48 81 ff ff ff 0f 00 	cmp    $0xfffff,%rdi
   40d16:	77 6f                	ja     40d87 <process_setup(int, char const*)+0x1a6>
    uint64_t ph = *pep_ & perm_;
   40d18:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
   40d1f:	48 8b 00             	mov    (%rax),%rax
   40d22:	48 63 8d 7c ff ff ff 	movslq -0x84(%rbp),%rcx
   40d29:	48 21 c1             	and    %rax,%rcx
    return ph & -(ph & PTE_P);
   40d2c:	48 89 ca             	mov    %rcx,%rdx
   40d2f:	83 e2 01             	and    $0x1,%edx
   40d32:	48 f7 da             	neg    %rdx
        int r = p_it.try_map(k_it.pa(), k_it.perm());
   40d35:	21 ca                	and    %ecx,%edx
        return -1;
   40d37:	48 89 de             	mov    %rbx,%rsi
    if (*pep_ & PTE_P) {
   40d3a:	a8 01                	test   $0x1,%al
   40d3c:	74 91                	je     40ccf <process_setup(int, char const*)+0xee>
        if (level_ > 0) {
   40d3e:	8b 8d 78 ff ff ff    	mov    -0x88(%rbp),%ecx
            pa &= ~0x1000UL;
   40d44:	48 89 c6             	mov    %rax,%rsi
   40d47:	4c 21 e6             	and    %r12,%rsi
        uintptr_t pa = *pep_ & PTE_PAMASK;
   40d4a:	49 89 c0             	mov    %rax,%r8
   40d4d:	4d 21 e8             	and    %r13,%r8
   40d50:	85 c9                	test   %ecx,%ecx
   40d52:	4c 0f 4f c6          	cmovg  %rsi,%r8
// Parts of a paged address: page index, page offset
static inline int pageindex(uintptr_t addr, int level) {
    return (int) (addr >> (PAGEOFFBITS + level * PAGEINDEXBITS)) & 0x1FF;
}
static inline uintptr_t pageoffmask(int level) {
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   40d56:	8d 4c c9 0c          	lea    0xc(%rcx,%rcx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   40d5a:	48 89 de             	mov    %rbx,%rsi
   40d5d:	48 d3 e6             	shl    %cl,%rsi
   40d60:	48 f7 d6             	not    %rsi
   40d63:	48 21 fe             	and    %rdi,%rsi
   40d66:	4c 01 c6             	add    %r8,%rsi
   40d69:	e9 61 ff ff ff       	jmp    40ccf <process_setup(int, char const*)+0xee>
        assert(r == 0);
   40d6e:	b9 00 00 00 00       	mov    $0x0,%ecx
   40d73:	ba 0b 54 04 00       	mov    $0x4540b,%edx
   40d78:	be ab 00 00 00       	mov    $0xab,%esi
   40d7d:	bf 12 54 04 00       	mov    $0x45412,%edi
   40d82:	e8 6b 1f 00 00       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
        p_it += PAGESIZE;
    }

    // obtain reference to program image
    // (The program image models the process executable.)
    program_image pgm(program_name);
   40d87:	4c 89 f6             	mov    %r14,%rsi
   40d8a:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   40d8e:	e8 8f 2c 00 00       	call   43a22 <program_image::program_image(char const*)>

    // allocate and map process memory as specified in program image
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40d93:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   40d97:	e8 20 2d 00 00       	call   43abc <program_image::begin() const>
   40d9c:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
   40da3:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)

            // if segment is writable use writable memory, otherwise use read-only memory
            if (seg.writable()) {
                vmiter(ptable[pid].pagetable, a).map((uintptr_t) kalloc(PAGESIZE), PTE_PWU);
            } else {
                vmiter(ptable[pid].pagetable, a).map((uintptr_t) kalloc(PAGESIZE), PTE_P | PTE_U);
   40daa:	4d 63 f7             	movslq %r15d,%r14
   40dad:	4f 8d 2c 76          	lea    (%r14,%r14,2),%r13
   40db1:	49 c1 e5 02          	shl    $0x2,%r13
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40db5:	e9 5e 01 00 00       	jmp    40f18 <process_setup(int, char const*)+0x337>
                vmiter(ptable[pid].pagetable, a).map((uintptr_t) kalloc(PAGESIZE), PTE_P | PTE_U);
   40dba:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
   40dbf:	48 c1 e0 04          	shl    $0x4,%rax
   40dc3:	48 8b 80 20 92 05 00 	mov    0x59220(%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   40dca:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
   40dd1:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
   40dd8:	c7 85 78 ff ff ff 03 	movl   $0x3,-0x88(%rbp)
   40ddf:	00 00 00 
   40de2:	c7 85 7c ff ff ff ff 	movl   $0xfff,-0x84(%rbp)
   40de9:	0f 00 00 
   40dec:	48 c7 45 80 00 00 00 	movq   $0x0,-0x80(%rbp)
   40df3:	00 
    real_find(va);
   40df4:	4c 89 e6             	mov    %r12,%rsi
   40df7:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40dfe:	e8 f1 10 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
   40e03:	bf 00 10 00 00       	mov    $0x1000,%edi
   40e08:	e8 59 fd ff ff       	call   40b66 <kalloc(unsigned long)>
   40e0d:	48 89 c6             	mov    %rax,%rsi
}
inline void vmiter::next_range() {
    real_find(last_va());
}
inline void vmiter::map(uintptr_t pa, int perm) {
    int r = try_map(pa, perm);
   40e10:	ba 05 00 00 00       	mov    $0x5,%edx
   40e15:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40e1c:	e8 eb 12 00 00       	call   4210c <vmiter::try_map(unsigned long, int)>
    assert(r == 0, "vmiter::map failed");
   40e21:	85 c0                	test   %eax,%eax
   40e23:	0f 85 ca 00 00 00    	jne    40ef3 <process_setup(int, char const*)+0x312>
             a += PAGESIZE) {
   40e29:	49 81 c4 00 10 00 00 	add    $0x1000,%r12
             a < seg.va() + seg.size();
   40e30:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40e37:	e8 f8 2c 00 00       	call   43b34 <program_image_segment::va() const>
   40e3c:	48 89 c3             	mov    %rax,%rbx
   40e3f:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40e46:	e8 f5 2c 00 00       	call   43b40 <program_image_segment::size() const>
   40e4b:	48 01 c3             	add    %rax,%rbx
   40e4e:	4c 39 e3             	cmp    %r12,%rbx
   40e51:	0f 86 b5 00 00 00    	jbe    40f0c <process_setup(int, char const*)+0x32b>
            if (seg.writable()) {
   40e57:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40e5e:	e8 05 2d 00 00       	call   43b68 <program_image_segment::writable() const>
   40e63:	84 c0                	test   %al,%al
   40e65:	0f 84 4f ff ff ff    	je     40dba <process_setup(int, char const*)+0x1d9>
                vmiter(ptable[pid].pagetable, a).map((uintptr_t) kalloc(PAGESIZE), PTE_PWU);
   40e6b:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
   40e70:	48 c1 e0 04          	shl    $0x4,%rax
   40e74:	48 8b 80 20 92 05 00 	mov    0x59220(%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   40e7b:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
   40e82:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
   40e89:	c7 85 78 ff ff ff 03 	movl   $0x3,-0x88(%rbp)
   40e90:	00 00 00 
   40e93:	c7 85 7c ff ff ff ff 	movl   $0xfff,-0x84(%rbp)
   40e9a:	0f 00 00 
   40e9d:	48 c7 45 80 00 00 00 	movq   $0x0,-0x80(%rbp)
   40ea4:	00 
    real_find(va);
   40ea5:	4c 89 e6             	mov    %r12,%rsi
   40ea8:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40eaf:	e8 40 10 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
   40eb4:	bf 00 10 00 00       	mov    $0x1000,%edi
   40eb9:	e8 a8 fc ff ff       	call   40b66 <kalloc(unsigned long)>
   40ebe:	48 89 c6             	mov    %rax,%rsi
    int r = try_map(pa, perm);
   40ec1:	ba 07 00 00 00       	mov    $0x7,%edx
   40ec6:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40ecd:	e8 3a 12 00 00       	call   4210c <vmiter::try_map(unsigned long, int)>
    assert(r == 0, "vmiter::map failed");
   40ed2:	85 c0                	test   %eax,%eax
   40ed4:	0f 84 4f ff ff ff    	je     40e29 <process_setup(int, char const*)+0x248>
   40eda:	b9 1c 54 04 00       	mov    $0x4541c,%ecx
   40edf:	ba 0b 54 04 00       	mov    $0x4540b,%edx
   40ee4:	be f4 00 00 00       	mov    $0xf4,%esi
   40ee9:	bf 2f 54 04 00       	mov    $0x4542f,%edi
   40eee:	e8 ff 1d 00 00       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
   40ef3:	b9 1c 54 04 00       	mov    $0x4541c,%ecx
   40ef8:	ba 0b 54 04 00       	mov    $0x4540b,%edx
   40efd:	be f4 00 00 00       	mov    $0xf4,%esi
   40f02:	bf 2f 54 04 00       	mov    $0x4542f,%edi
   40f07:	e8 e6 1d 00 00       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40f0c:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40f13:	e8 6e 2c 00 00       	call   43b86 <program_image_segment::operator++()>
   40f18:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   40f1c:	e8 cf 2b 00 00       	call   43af0 <program_image::end() const>
   40f21:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   40f25:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   40f29:	48 8d 75 b0          	lea    -0x50(%rbp),%rsi
   40f2d:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40f34:	e8 3f 2c 00 00       	call   43b78 <program_image_segment::operator!=(program_image_segment const&) const>
   40f39:	84 c0                	test   %al,%al
   40f3b:	74 1a                	je     40f57 <process_setup(int, char const*)+0x376>
        for (uintptr_t a = round_down(seg.va(), PAGESIZE);
   40f3d:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40f44:	e8 eb 2b 00 00       	call   43b34 <program_image_segment::va() const>
   40f49:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   40f4f:	49 89 c4             	mov    %rax,%r12
   40f52:	e9 d9 fe ff ff       	jmp    40e30 <process_setup(int, char const*)+0x24f>
            }
        }
    }

    // copy instructions and data from program image into process memory
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40f57:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   40f5b:	e8 5c 2b 00 00       	call   43abc <program_image::begin() const>
   40f60:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
   40f67:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
        memset(vmiter(ptable[pid].pagetable, seg.va()).kptr(), 0, seg.size());
   40f6e:	4d 63 f7             	movslq %r15d,%r14
   40f71:	4f 8d 2c 76          	lea    (%r14,%r14,2),%r13
   40f75:	49 c1 e5 02          	shl    $0x2,%r13
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40f79:	eb 4b                	jmp    40fc6 <process_setup(int, char const*)+0x3e5>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   40f7b:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   40f82:	ff 0f 00 
   40f85:	48 21 c8             	and    %rcx,%rax
   40f88:	e9 f4 00 00 00       	jmp    41081 <process_setup(int, char const*)+0x4a0>
        return nullptr;
   40f8d:	bf 00 00 00 00       	mov    $0x0,%edi
   40f92:	e9 02 01 00 00       	jmp    41099 <process_setup(int, char const*)+0x4b8>
   40f97:	8d 4c d2 0c          	lea    0xc(%rdx,%rdx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   40f9b:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   40fa2:	48 d3 e7             	shl    %cl,%rdi
   40fa5:	48 f7 d7             	not    %rdi
   40fa8:	48 23 7d 80          	and    -0x80(%rbp),%rdi
   40fac:	48 01 c7             	add    %rax,%rdi
        memcpy(vmiter(ptable[pid].pagetable, seg.va()).kptr(), seg.data(), seg.data_size());
   40faf:	4c 89 e2             	mov    %r12,%rdx
   40fb2:	48 89 de             	mov    %rbx,%rsi
   40fb5:	e8 35 37 00 00       	call   446ef <memcpy>
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40fba:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40fc1:	e8 c0 2b 00 00       	call   43b86 <program_image_segment::operator++()>
   40fc6:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   40fca:	e8 21 2b 00 00       	call   43af0 <program_image::end() const>
   40fcf:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   40fd3:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   40fd7:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
   40fdb:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40fe2:	e8 91 2b 00 00       	call   43b78 <program_image_segment::operator!=(program_image_segment const&) const>
   40fe7:	84 c0                	test   %al,%al
   40fe9:	0f 84 70 01 00 00    	je     4115f <process_setup(int, char const*)+0x57e>
        memset(vmiter(ptable[pid].pagetable, seg.va()).kptr(), 0, seg.size());
   40fef:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40ff6:	e8 45 2b 00 00       	call   43b40 <program_image_segment::size() const>
   40ffb:	48 89 c3             	mov    %rax,%rbx
   40ffe:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   41005:	e8 2a 2b 00 00       	call   43b34 <program_image_segment::va() const>
   4100a:	48 89 c6             	mov    %rax,%rsi
   4100d:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
   41012:	48 c1 e0 04          	shl    $0x4,%rax
   41016:	48 8b 80 20 92 05 00 	mov    0x59220(%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4101d:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
   41024:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
   4102b:	c7 85 78 ff ff ff 03 	movl   $0x3,-0x88(%rbp)
   41032:	00 00 00 
   41035:	c7 85 7c ff ff ff ff 	movl   $0xfff,-0x84(%rbp)
   4103c:	0f 00 00 
   4103f:	48 c7 45 80 00 00 00 	movq   $0x0,-0x80(%rbp)
   41046:	00 
    real_find(va);
   41047:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   4104e:	e8 a1 0e 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   41053:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
   4105a:	48 8b 08             	mov    (%rax),%rcx
   4105d:	f6 c1 01             	test   $0x1,%cl
   41060:	0f 84 27 ff ff ff    	je     40f8d <process_setup(int, char const*)+0x3ac>
        if (level_ > 0) {
   41066:	8b 95 78 ff ff ff    	mov    -0x88(%rbp),%edx
            pa &= ~0x1000UL;
   4106c:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   41073:	ff 0f 00 
   41076:	48 21 c8             	and    %rcx,%rax
        if (level_ > 0) {
   41079:	85 d2                	test   %edx,%edx
   4107b:	0f 8e fa fe ff ff    	jle    40f7b <process_setup(int, char const*)+0x39a>
   41081:	8d 4c d2 0c          	lea    0xc(%rdx,%rdx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   41085:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   4108c:	48 d3 e7             	shl    %cl,%rdi
   4108f:	48 f7 d7             	not    %rdi
   41092:	48 23 7d 80          	and    -0x80(%rbp),%rdi
   41096:	48 01 c7             	add    %rax,%rdi
   41099:	48 89 da             	mov    %rbx,%rdx
   4109c:	be 00 00 00 00       	mov    $0x0,%esi
   410a1:	e8 6d 36 00 00       	call   44713 <memset>
        memcpy(vmiter(ptable[pid].pagetable, seg.va()).kptr(), seg.data(), seg.data_size());
   410a6:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   410ad:	e8 aa 2a 00 00       	call   43b5c <program_image_segment::data_size() const>
   410b2:	49 89 c4             	mov    %rax,%r12
   410b5:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   410bc:	e8 8b 2a 00 00       	call   43b4c <program_image_segment::data() const>
   410c1:	48 89 c3             	mov    %rax,%rbx
   410c4:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   410cb:	e8 64 2a 00 00       	call   43b34 <program_image_segment::va() const>
   410d0:	48 89 c6             	mov    %rax,%rsi
   410d3:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
   410d8:	48 c1 e0 04          	shl    $0x4,%rax
   410dc:	48 8b 80 20 92 05 00 	mov    0x59220(%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   410e3:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
   410ea:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
   410f1:	c7 85 78 ff ff ff 03 	movl   $0x3,-0x88(%rbp)
   410f8:	00 00 00 
   410fb:	c7 85 7c ff ff ff ff 	movl   $0xfff,-0x84(%rbp)
   41102:	0f 00 00 
   41105:	48 c7 45 80 00 00 00 	movq   $0x0,-0x80(%rbp)
   4110c:	00 
    real_find(va);
   4110d:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   41114:	e8 db 0d 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   41119:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
   41120:	48 8b 08             	mov    (%rax),%rcx
   41123:	f6 c1 01             	test   $0x1,%cl
   41126:	74 2d                	je     41155 <process_setup(int, char const*)+0x574>
        if (level_ > 0) {
   41128:	8b 95 78 ff ff ff    	mov    -0x88(%rbp),%edx
            pa &= ~0x1000UL;
   4112e:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   41135:	ff 0f 00 
   41138:	48 21 c8             	and    %rcx,%rax
        if (level_ > 0) {
   4113b:	85 d2                	test   %edx,%edx
   4113d:	0f 8f 54 fe ff ff    	jg     40f97 <process_setup(int, char const*)+0x3b6>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41143:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   4114a:	ff 0f 00 
   4114d:	48 21 c8             	and    %rcx,%rax
   41150:	e9 42 fe ff ff       	jmp    40f97 <process_setup(int, char const*)+0x3b6>
        return nullptr;
   41155:	bf 00 00 00 00       	mov    $0x0,%edi
   4115a:	e9 50 fe ff ff       	jmp    40faf <process_setup(int, char const*)+0x3ce>

    }

    // mark entry point
    ptable[pid].regs.reg_rip = pgm.entry();
   4115f:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   41163:	e8 e2 28 00 00       	call   43a4a <program_image::entry() const>
   41168:	48 89 c6             	mov    %rax,%rsi
   4116b:	49 63 d7             	movslq %r15d,%rdx
   4116e:	48 8d 04 52          	lea    (%rdx,%rdx,2),%rax
   41172:	48 c1 e0 02          	shl    $0x2,%rax
   41176:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
   4117a:	48 c1 e1 04          	shl    $0x4,%rcx
   4117e:	48 89 b1 c8 92 05 00 	mov    %rsi,0x592c8(%rcx)
    // allocate and map stack segment
    // Compute process virtual address for stack page
    uintptr_t stack_addr = MEMSIZE_VIRTUAL - PAGESIZE;

    // allocate memory for the stack
    vmiter(ptable[pid].pagetable, stack_addr).map(kalloc(PAGESIZE), PTE_PWU);
   41185:	48 8b 81 20 92 05 00 	mov    0x59220(%rcx),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4118c:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
   41193:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
   4119a:	c7 85 78 ff ff ff 03 	movl   $0x3,-0x88(%rbp)
   411a1:	00 00 00 
   411a4:	c7 85 7c ff ff ff ff 	movl   $0xfff,-0x84(%rbp)
   411ab:	0f 00 00 
   411ae:	48 c7 45 80 00 00 00 	movq   $0x0,-0x80(%rbp)
   411b5:	00 
    real_find(va);
   411b6:	be 00 f0 2f 00       	mov    $0x2ff000,%esi
   411bb:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   411c2:	e8 2d 0d 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
   411c7:	bf 00 10 00 00       	mov    $0x1000,%edi
   411cc:	e8 95 f9 ff ff       	call   40b66 <kalloc(unsigned long)>
   411d1:	48 89 c6             	mov    %rax,%rsi
    int r = try_map(pa, perm);
   411d4:	ba 07 00 00 00       	mov    $0x7,%edx
   411d9:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   411e0:	e8 27 0f 00 00       	call   4210c <vmiter::try_map(unsigned long, int)>
    assert(r == 0, "vmiter::map failed");
   411e5:	85 c0                	test   %eax,%eax
   411e7:	75 3a                	jne    41223 <process_setup(int, char const*)+0x642>

    ptable[pid].regs.reg_rsp = stack_addr + PAGESIZE;
   411e9:	4d 63 ff             	movslq %r15d,%r15
   411ec:	4b 8d 04 7f          	lea    (%r15,%r15,2),%rax
   411f0:	48 c1 e0 02          	shl    $0x2,%rax
   411f4:	4a 8d 14 38          	lea    (%rax,%r15,1),%rdx
   411f8:	48 c1 e2 04          	shl    $0x4,%rdx
   411fc:	48 c7 82 e0 92 05 00 	movq   $0x300000,0x592e0(%rdx)
   41203:	00 00 30 00 

    // mark process as runnable
    ptable[pid].state = P_RUNNABLE;
   41207:	c7 82 2c 92 05 00 01 	movl   $0x1,0x5922c(%rdx)
   4120e:	00 00 00 
}
   41211:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   41218:	5b                   	pop    %rbx
   41219:	41 5c                	pop    %r12
   4121b:	41 5d                	pop    %r13
   4121d:	41 5e                	pop    %r14
   4121f:	41 5f                	pop    %r15
   41221:	5d                   	pop    %rbp
   41222:	c3                   	ret    
   41223:	b9 1c 54 04 00       	mov    $0x4541c,%ecx
   41228:	ba 0b 54 04 00       	mov    $0x4540b,%edx
   4122d:	be f4 00 00 00       	mov    $0xf4,%esi
   41232:	bf 2f 54 04 00       	mov    $0x4542f,%edi
   41237:	e8 b6 1a 00 00       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>

000000000004123c <kfree(void*)>:
void kfree(void* kptr) {
   4123c:	f3 0f 1e fa          	endbr64 
    if (!kptr) {
   41240:	48 85 ff             	test   %rdi,%rdi
   41243:	74 0b                	je     41250 <kfree(void*)+0x14>
    --physpages[(uintptr_t) kptr / PAGESIZE].refcount;
   41245:	48 c1 ef 0c          	shr    $0xc,%rdi
   41249:	80 af 00 90 05 00 01 	subb   $0x1,0x59000(%rdi)
}
   41250:	c3                   	ret    

0000000000041251 <sys_exit(int)>:

// sys_exit(pid)
//    Exit the given process. Marks the process as free and frees all of its memory. This includes the process’s code,
//    data, heap, and stack pages, as well as the pages used for its page directory and page table pages.

void sys_exit(pid_t pid) {
   41251:	f3 0f 1e fa          	endbr64 
   41255:	55                   	push   %rbp
   41256:	48 89 e5             	mov    %rsp,%rbp
   41259:	41 57                	push   %r15
   4125b:	41 56                	push   %r14
   4125d:	41 55                	push   %r13
   4125f:	41 54                	push   %r12
   41261:	53                   	push   %rbx
   41262:	48 83 ec 28          	sub    $0x28,%rsp
   41266:	89 fb                	mov    %edi,%ebx
    // iterate over each page in the process's page table
    for (vmiter it = vmiter(ptable[pid].pagetable, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE) {
   41268:	48 63 c7             	movslq %edi,%rax
   4126b:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   4126f:	48 8d 04 90          	lea    (%rax,%rdx,4),%rax
   41273:	48 c1 e0 04          	shl    $0x4,%rax
   41277:	48 8b 80 20 92 05 00 	mov    0x59220(%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4127e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   41282:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   41286:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   4128d:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   41294:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   4129b:	00 
    real_find(va);
   4129c:	be 00 00 00 00       	mov    $0x0,%esi
   412a1:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   412a5:	e8 4a 0c 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
    return va_;
   412aa:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
   412ae:	48 81 fe ff ff 2f 00 	cmp    $0x2fffff,%rsi
   412b5:	0f 87 a4 00 00 00    	ja     4135f <sys_exit(int)+0x10e>
        return nullptr;
   412bb:	41 bf 00 00 00 00    	mov    $0x0,%r15d
            pa &= ~0x1000UL;
   412c1:	49 bc 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r12
   412c8:	ff 0f 00 
        return pa + (va_ & pageoffmask(level_));
   412cb:	49 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%r14
        uintptr_t pa = *pep_ & PTE_PAMASK;
   412d2:	49 bd 00 f0 ff ff ff 	movabs $0xffffffffff000,%r13
   412d9:	ff 0f 00 
   412dc:	eb 29                	jmp    41307 <sys_exit(int)+0xb6>
        return nullptr;
   412de:	4c 89 ff             	mov    %r15,%rdi
        // free the page if it is a non-console and user-accessible page
        if (it.va() == CONSOLE_ADDR || !it.user()) {
            continue;
        }
        kfree(it.kptr());
   412e1:	e8 56 ff ff ff       	call   4123c <kfree(void*)>
    return find(va_ + delta);
   412e6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   412ea:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va);
   412f1:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   412f5:	e8 fa 0b 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
    return va_;
   412fa:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
    for (vmiter it = vmiter(ptable[pid].pagetable, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE) {
   412fe:	48 81 fe ff ff 2f 00 	cmp    $0x2fffff,%rsi
   41305:	77 58                	ja     4135f <sys_exit(int)+0x10e>
        if (it.va() == CONSOLE_ADDR || !it.user()) {
   41307:	48 81 fe 00 80 0b 00 	cmp    $0xb8000,%rsi
   4130e:	74 d6                	je     412e6 <sys_exit(int)+0x95>
    uint64_t ph = *pep_ & perm_;
   41310:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   41314:	48 8b 08             	mov    (%rax),%rcx
   41317:	48 63 55 c4          	movslq -0x3c(%rbp),%rdx
   4131b:	48 21 ca             	and    %rcx,%rdx
    return ph & -(ph & PTE_P);
   4131e:	48 89 d0             	mov    %rdx,%rax
   41321:	83 e0 01             	and    $0x1,%eax
   41324:	48 f7 d8             	neg    %rax
   41327:	48 21 d0             	and    %rdx,%rax
    return (perm() & desired_perm) == desired_perm;
   4132a:	83 e0 05             	and    $0x5,%eax
   4132d:	48 83 f8 05          	cmp    $0x5,%rax
   41331:	75 b3                	jne    412e6 <sys_exit(int)+0x95>
    if (*pep_ & PTE_P) {
   41333:	f6 c1 01             	test   $0x1,%cl
   41336:	74 a6                	je     412de <sys_exit(int)+0x8d>
        if (level_ > 0) {
   41338:	8b 55 c0             	mov    -0x40(%rbp),%edx
            pa &= ~0x1000UL;
   4133b:	48 89 c8             	mov    %rcx,%rax
        uintptr_t pa = *pep_ & PTE_PAMASK;
   4133e:	4c 21 e8             	and    %r13,%rax
   41341:	4c 21 e1             	and    %r12,%rcx
   41344:	85 d2                	test   %edx,%edx
   41346:	48 0f 4f c1          	cmovg  %rcx,%rax
   4134a:	8d 4c d2 0c          	lea    0xc(%rdx,%rdx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   4134e:	4c 89 f7             	mov    %r14,%rdi
   41351:	48 d3 e7             	shl    %cl,%rdi
   41354:	48 f7 d7             	not    %rdi
   41357:	48 21 f7             	and    %rsi,%rdi
   4135a:	48 01 c7             	add    %rax,%rdi
        return reinterpret_cast<T>(pa());
   4135d:	eb 82                	jmp    412e1 <sys_exit(int)+0x90>
    }

    // free the physical memory used to represent the page table of the process
    for (ptiter it(ptable[pid].pagetable); !it.done(); it.next()) {
   4135f:	48 63 c3             	movslq %ebx,%rax
   41362:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   41366:	48 8d 04 90          	lea    (%rax,%rdx,4),%rax
   4136a:	48 c1 e0 04          	shl    $0x4,%rax
   4136e:	48 8b b0 20 92 05 00 	mov    0x59220(%rax),%rsi
   41375:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41379:	e8 42 10 00 00       	call   423c0 <ptiter::ptiter(x86_64_pagetable*)>
   4137e:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffff,%rax
   41385:	ff 00 00 
   41388:	48 39 45 c8          	cmp    %rax,-0x38(%rbp)
   4138c:	77 30                	ja     413be <sys_exit(int)+0x16d>
}
inline void ptiter::next() {
    down(true);
}
inline uintptr_t ptiter::pa() const {
    return *pep_ & PTE_PAMASK;
   4138e:	49 bd 00 f0 ff ff ff 	movabs $0xffffffffff000,%r13
   41395:	ff 0f 00 
   41398:	49 89 c4             	mov    %rax,%r12
   4139b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4139f:	4c 89 ef             	mov    %r13,%rdi
   413a2:	48 23 38             	and    (%rax),%rdi
        kfree(it.kptr());
   413a5:	e8 92 fe ff ff       	call   4123c <kfree(void*)>
    down(true);
   413aa:	be 01 00 00 00       	mov    $0x1,%esi
   413af:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   413b3:	e8 06 0f 00 00       	call   422be <ptiter::down(bool)>
    for (ptiter it(ptable[pid].pagetable); !it.done(); it.next()) {
   413b8:	4c 39 65 c8          	cmp    %r12,-0x38(%rbp)
   413bc:	76 dd                	jbe    4139b <sys_exit(int)+0x14a>
    }

    // mark process as free
    ptable[pid].state = P_FREE;
   413be:	48 63 db             	movslq %ebx,%rbx
   413c1:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
   413c5:	48 c1 e0 02          	shl    $0x2,%rax
   413c9:	48 8d 14 18          	lea    (%rax,%rbx,1),%rdx
   413cd:	48 c1 e2 04          	shl    $0x4,%rdx
   413d1:	c7 82 2c 92 05 00 00 	movl   $0x0,0x5922c(%rdx)
   413d8:	00 00 00 

    // free the top level (L4) page table page
    kfree(ptable[pid].pagetable);
   413db:	48 8b ba 20 92 05 00 	mov    0x59220(%rdx),%rdi
   413e2:	e8 55 fe ff ff       	call   4123c <kfree(void*)>
}
   413e7:	48 83 c4 28          	add    $0x28,%rsp
   413eb:	5b                   	pop    %rbx
   413ec:	41 5c                	pop    %r12
   413ee:	41 5d                	pop    %r13
   413f0:	41 5e                	pop    %r14
   413f2:	41 5f                	pop    %r15
   413f4:	5d                   	pop    %rbp
   413f5:	c3                   	ret    

00000000000413f6 <syscall_fork()>:
//    Start a new (child) process as a copy of the calling (parent) process. The child and parent processes run in
//    separate memory spaces. At the time of fork() both memory spaces have the same content. On success, the PID of
//    the child process is returned in the parent, and 0 is returned in the child. On failure, -1 is returned in the
//    parent, no child process is created.

pid_t syscall_fork() {
   413f6:	f3 0f 1e fa          	endbr64 
   413fa:	55                   	push   %rbp
   413fb:	48 89 e5             	mov    %rsp,%rbp
   413fe:	41 57                	push   %r15
   41400:	41 56                	push   %r14
   41402:	41 55                	push   %r13
   41404:	41 54                	push   %r12
   41406:	53                   	push   %rbx
   41407:	48 83 ec 48          	sub    $0x48,%rsp
    // pid for the child process
    pid_t c_pid = 0;

    // look for a free process slot for the child
    for (pid_t i = 1; i < NPROC; ++i) {
   4140b:	b8 fc 92 05 00       	mov    $0x592fc,%eax
   41410:	bb 01 00 00 00       	mov    $0x1,%ebx
        if (ptable[i].state == P_FREE) {
   41415:	83 38 00             	cmpl   $0x0,(%rax)
   41418:	74 18                	je     41432 <syscall_fork()+0x3c>
    for (pid_t i = 1; i < NPROC; ++i) {
   4141a:	83 c3 01             	add    $0x1,%ebx
   4141d:	48 05 d0 00 00 00    	add    $0xd0,%rax
   41423:	83 fb 10             	cmp    $0x10,%ebx
   41426:	75 ed                	jne    41415 <syscall_fork()+0x1f>
        }
    }

    // fail if there is no free process slot
    if (!c_pid) {
        return -1;
   41428:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
   4142d:	e9 68 03 00 00       	jmp    4179a <syscall_fork()+0x3a4>
    if (!c_pid) {
   41432:	85 db                	test   %ebx,%ebx
   41434:	0f 84 71 03 00 00    	je     417ab <syscall_fork()+0x3b5>
    }

    // allocate a new and empty page table
    ptable[c_pid].pagetable = kalloc_pagetable();
   4143a:	e8 94 10 00 00       	call   424d3 <kalloc_pagetable()>
   4143f:	48 63 d3             	movslq %ebx,%rdx
   41442:	48 8d 0c 52          	lea    (%rdx,%rdx,2),%rcx
   41446:	48 8d 14 8a          	lea    (%rdx,%rcx,4),%rdx
   4144a:	48 c1 e2 04          	shl    $0x4,%rdx
   4144e:	48 89 82 20 92 05 00 	mov    %rax,0x59220(%rdx)

    // fail if allocation is unsuccessful
    if (ptable[c_pid].pagetable == nullptr) {
   41455:	48 85 c0             	test   %rax,%rax
   41458:	0f 84 54 03 00 00    	je     417b2 <syscall_fork()+0x3bc>
        return -1;
    }

    // create iterators for the parent and child processes
    vmiter p_it(ptable[current->pid].pagetable, 0);
   4145e:	48 8b 05 9b 7d 01 00 	mov    0x17d9b(%rip),%rax        # 59200 <current>
   41465:	48 63 40 08          	movslq 0x8(%rax),%rax
   41469:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   4146d:	48 8d 04 90          	lea    (%rax,%rdx,4),%rax
   41471:	48 c1 e0 04          	shl    $0x4,%rax
   41475:	48 8b 80 20 92 05 00 	mov    0x59220(%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4147c:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   41480:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   41484:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   4148b:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   41492:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   41499:	00 
    real_find(va);
   4149a:	be 00 00 00 00       	mov    $0x0,%esi
   4149f:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   414a3:	e8 4c 0a 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
    vmiter c_it(ptable[c_pid].pagetable, 0);
   414a8:	48 63 c3             	movslq %ebx,%rax
   414ab:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   414af:	48 8d 04 90          	lea    (%rax,%rdx,4),%rax
   414b3:	48 c1 e0 04          	shl    $0x4,%rax
   414b7:	48 8b 80 20 92 05 00 	mov    0x59220(%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   414be:	48 89 45 90          	mov    %rax,-0x70(%rbp)
   414c2:	48 89 45 98          	mov    %rax,-0x68(%rbp)
   414c6:	c7 45 a0 03 00 00 00 	movl   $0x3,-0x60(%rbp)
   414cd:	c7 45 a4 ff 0f 00 00 	movl   $0xfff,-0x5c(%rbp)
   414d4:	48 c7 45 a8 00 00 00 	movq   $0x0,-0x58(%rbp)
   414db:	00 
    real_find(va);
   414dc:	be 00 00 00 00       	mov    $0x0,%esi
   414e1:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   414e5:	e8 0a 0a 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
    return va_;
   414ea:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi

    // iterate over every virtual address
    while (p_it.va() < MEMSIZE_VIRTUAL) {
   414ee:	48 81 ff ff ff 2f 00 	cmp    $0x2fffff,%rdi
   414f5:	0f 87 52 02 00 00    	ja     4174d <syscall_fork()+0x357>
        return -1;
   414fb:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
            pa &= ~0x1000UL;
   41502:	49 bd 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r13
   41509:	ff 0f 00 
        uintptr_t pa = *pep_ & PTE_PAMASK;
   4150c:	49 be 00 f0 ff ff ff 	movabs $0xffffffffff000,%r14
   41513:	ff 0f 00 
   41516:	e9 92 00 00 00       	jmp    415ad <syscall_fork()+0x1b7>
    uint64_t ph = *pep_ & perm_;
   4151b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4151f:	48 8b 00             	mov    (%rax),%rax
   41522:	48 63 4d c4          	movslq -0x3c(%rbp),%rcx
   41526:	48 21 c1             	and    %rax,%rcx
    return ph & -(ph & PTE_P);
   41529:	48 89 ca             	mov    %rcx,%rdx
   4152c:	83 e2 01             	and    $0x1,%edx
   4152f:	48 f7 da             	neg    %rdx
        if (p_it.va() < PROC_START_ADDR) {
            // the parent and child page tables should have identical mappings below PROC_START_ADDR
            int r = c_it.try_map(p_it.pa(), p_it.perm());
   41532:	21 ca                	and    %ecx,%edx
        return -1;
   41534:	4c 89 e6             	mov    %r12,%rsi
    if (*pep_ & PTE_P) {
   41537:	a8 01                	test   $0x1,%al
   41539:	74 28                	je     41563 <syscall_fork()+0x16d>
        if (level_ > 0) {
   4153b:	8b 4d c0             	mov    -0x40(%rbp),%ecx
            pa &= ~0x1000UL;
   4153e:	48 89 c6             	mov    %rax,%rsi
   41541:	4c 21 ee             	and    %r13,%rsi
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41544:	49 89 c0             	mov    %rax,%r8
   41547:	4d 21 f0             	and    %r14,%r8
   4154a:	85 c9                	test   %ecx,%ecx
   4154c:	4c 0f 4f c6          	cmovg  %rsi,%r8
   41550:	8d 4c c9 0c          	lea    0xc(%rcx,%rcx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   41554:	4c 89 e6             	mov    %r12,%rsi
   41557:	48 d3 e6             	shl    %cl,%rsi
   4155a:	48 f7 d6             	not    %rsi
   4155d:	48 21 fe             	and    %rdi,%rsi
   41560:	4c 01 c6             	add    %r8,%rsi
   41563:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   41567:	e8 a0 0b 00 00       	call   4210c <vmiter::try_map(unsigned long, int)>
            if (r < 0) {
   4156c:	85 c0                	test   %eax,%eax
   4156e:	0f 88 04 01 00 00    	js     41678 <syscall_fork()+0x282>
    return find(va_ + delta);
   41574:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41578:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va);
   4157f:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41583:	e8 6c 09 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
    return find(va_ + delta);
   41588:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   4158c:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va);
   41593:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   41597:	e8 58 09 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
    return va_;
   4159c:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
    while (p_it.va() < MEMSIZE_VIRTUAL) {
   415a0:	48 81 ff ff ff 2f 00 	cmp    $0x2fffff,%rdi
   415a7:	0f 87 a0 01 00 00    	ja     4174d <syscall_fork()+0x357>
        if (p_it.va() < PROC_START_ADDR) {
   415ad:	48 81 ff ff ff 0f 00 	cmp    $0xfffff,%rdi
   415b4:	0f 86 61 ff ff ff    	jbe    4151b <syscall_fork()+0x125>
    uint64_t ph = *pep_ & perm_;
   415ba:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   415be:	48 8b 08             	mov    (%rax),%rcx
   415c1:	48 63 55 c4          	movslq -0x3c(%rbp),%rdx
   415c5:	48 21 ca             	and    %rcx,%rdx
    return ph & -(ph & PTE_P);
   415c8:	48 89 d0             	mov    %rdx,%rax
   415cb:	83 e0 01             	and    $0x1,%eax
   415ce:	48 f7 d8             	neg    %rax
   415d1:	48 21 d0             	and    %rdx,%rax
    return (perm() & desired_perm) == desired_perm;
   415d4:	48 89 c2             	mov    %rax,%rdx
   415d7:	83 e2 03             	and    $0x3,%edx
                sys_exit(c_pid);
                return -1;
            }
        } else if (p_it.writable() && p_it.user()) {
   415da:	48 83 fa 03          	cmp    $0x3,%rdx
   415de:	0f 84 a5 00 00 00    	je     41689 <syscall_fork()+0x293>
   415e4:	48 89 c2             	mov    %rax,%rdx
   415e7:	83 e2 05             	and    $0x5,%edx
                kfree(new_addr);
                return -1;
            }
            // copy the data from the parent’s page into the child's page
            memcpy(new_addr, p_it.kptr(), PAGESIZE);
        } else if (!p_it.writable() && p_it.user()) {
   415ea:	48 83 fa 05          	cmp    $0x5,%rdx
   415ee:	75 84                	jne    41574 <syscall_fork()+0x17e>
            // share read-only pages between processes
            int r = c_it.try_map(p_it.pa(), p_it.perm());
   415f0:	89 c2                	mov    %eax,%edx
        return -1;
   415f2:	4c 89 e6             	mov    %r12,%rsi
    if (*pep_ & PTE_P) {
   415f5:	f6 c1 01             	test   $0x1,%cl
   415f8:	74 25                	je     4161f <syscall_fork()+0x229>
        if (level_ > 0) {
   415fa:	8b 75 c0             	mov    -0x40(%rbp),%esi
            pa &= ~0x1000UL;
   415fd:	48 89 c8             	mov    %rcx,%rax
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41600:	4c 21 f0             	and    %r14,%rax
   41603:	4c 21 e9             	and    %r13,%rcx
   41606:	85 f6                	test   %esi,%esi
   41608:	48 0f 4f c1          	cmovg  %rcx,%rax
   4160c:	8d 4c f6 0c          	lea    0xc(%rsi,%rsi,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   41610:	4c 89 e6             	mov    %r12,%rsi
   41613:	48 d3 e6             	shl    %cl,%rsi
   41616:	48 f7 d6             	not    %rsi
   41619:	48 21 fe             	and    %rdi,%rsi
   4161c:	48 01 c6             	add    %rax,%rsi
   4161f:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   41623:	e8 e4 0a 00 00       	call   4210c <vmiter::try_map(unsigned long, int)>
            if (r < 0) {
   41628:	85 c0                	test   %eax,%eax
   4162a:	0f 88 0f 01 00 00    	js     4173f <syscall_fork()+0x349>
    if (*pep_ & PTE_P) {
   41630:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   41634:	48 8b 10             	mov    (%rax),%rdx
        return -1;
   41637:	4c 89 e0             	mov    %r12,%rax
    if (*pep_ & PTE_P) {
   4163a:	f6 c2 01             	test   $0x1,%dl
   4163d:	74 29                	je     41668 <syscall_fork()+0x272>
        if (level_ > 0) {
   4163f:	8b 45 c0             	mov    -0x40(%rbp),%eax
            pa &= ~0x1000UL;
   41642:	48 89 d1             	mov    %rdx,%rcx
   41645:	4c 21 e9             	and    %r13,%rcx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41648:	48 89 d6             	mov    %rdx,%rsi
   4164b:	4c 21 f6             	and    %r14,%rsi
   4164e:	85 c0                	test   %eax,%eax
   41650:	48 0f 4f f1          	cmovg  %rcx,%rsi
   41654:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   41658:	4c 89 e0             	mov    %r12,%rax
   4165b:	48 d3 e0             	shl    %cl,%rax
   4165e:	48 f7 d0             	not    %rax
   41661:	48 23 45 c8          	and    -0x38(%rbp),%rax
   41665:	48 01 f0             	add    %rsi,%rax
                sys_exit(c_pid);
                return -1;
            }
            // increment refcount since the existing physical address will also be used by the child process
            ++physpages[p_it.pa() / PAGESIZE].refcount;
   41668:	48 c1 e8 0c          	shr    $0xc,%rax
   4166c:	80 80 00 90 05 00 01 	addb   $0x1,0x59000(%rax)
   41673:	e9 fc fe ff ff       	jmp    41574 <syscall_fork()+0x17e>
                sys_exit(c_pid);
   41678:	89 df                	mov    %ebx,%edi
   4167a:	e8 d2 fb ff ff       	call   41251 <sys_exit(int)>
                return -1;
   4167f:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
   41684:	e9 11 01 00 00       	jmp    4179a <syscall_fork()+0x3a4>
    return (perm() & desired_perm) == desired_perm;
   41689:	83 e0 05             	and    $0x5,%eax
        } else if (p_it.writable() && p_it.user()) {
   4168c:	48 83 f8 05          	cmp    $0x5,%rax
   41690:	0f 85 de fe ff ff    	jne    41574 <syscall_fork()+0x17e>
            void* new_addr = kalloc(PAGESIZE);
   41696:	bf 00 10 00 00       	mov    $0x1000,%edi
   4169b:	e8 c6 f4 ff ff       	call   40b66 <kalloc(unsigned long)>
   416a0:	49 89 c7             	mov    %rax,%r15
            if (new_addr == nullptr) {
   416a3:	48 85 c0             	test   %rax,%rax
   416a6:	74 6c                	je     41714 <syscall_fork()+0x31e>
    uint64_t ph = *pep_ & perm_;
   416a8:	48 63 45 c4          	movslq -0x3c(%rbp),%rax
   416ac:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   416b0:	48 23 02             	and    (%rdx),%rax
    return ph & -(ph & PTE_P);
   416b3:	48 89 c2             	mov    %rax,%rdx
   416b6:	83 e2 01             	and    $0x1,%edx
   416b9:	48 f7 da             	neg    %rdx
    return try_map((uintptr_t) kp, perm);
   416bc:	21 c2                	and    %eax,%edx
   416be:	4c 89 fe             	mov    %r15,%rsi
   416c1:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   416c5:	e8 42 0a 00 00       	call   4210c <vmiter::try_map(unsigned long, int)>
            if (r < 0) {
   416ca:	85 c0                	test   %eax,%eax
   416cc:	78 54                	js     41722 <syscall_fork()+0x32c>
    if (*pep_ & PTE_P) {
   416ce:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   416d2:	48 8b 00             	mov    (%rax),%rax
   416d5:	a8 01                	test   $0x1,%al
   416d7:	74 5f                	je     41738 <syscall_fork()+0x342>
        if (level_ > 0) {
   416d9:	8b 4d c0             	mov    -0x40(%rbp),%ecx
            pa &= ~0x1000UL;
   416dc:	48 89 c7             	mov    %rax,%rdi
   416df:	4c 21 ef             	and    %r13,%rdi
        uintptr_t pa = *pep_ & PTE_PAMASK;
   416e2:	48 89 c2             	mov    %rax,%rdx
   416e5:	4c 21 f2             	and    %r14,%rdx
   416e8:	85 c9                	test   %ecx,%ecx
   416ea:	48 0f 4f d7          	cmovg  %rdi,%rdx
   416ee:	8d 4c c9 0c          	lea    0xc(%rcx,%rcx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   416f2:	4c 89 e6             	mov    %r12,%rsi
   416f5:	48 d3 e6             	shl    %cl,%rsi
   416f8:	48 f7 d6             	not    %rsi
   416fb:	48 23 75 c8          	and    -0x38(%rbp),%rsi
   416ff:	48 01 d6             	add    %rdx,%rsi
            memcpy(new_addr, p_it.kptr(), PAGESIZE);
   41702:	ba 00 10 00 00       	mov    $0x1000,%edx
   41707:	4c 89 ff             	mov    %r15,%rdi
   4170a:	e8 e0 2f 00 00       	call   446ef <memcpy>
   4170f:	e9 60 fe ff ff       	jmp    41574 <syscall_fork()+0x17e>
                sys_exit(c_pid);
   41714:	89 df                	mov    %ebx,%edi
   41716:	e8 36 fb ff ff       	call   41251 <sys_exit(int)>
                return -1;
   4171b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
   41720:	eb 78                	jmp    4179a <syscall_fork()+0x3a4>
                sys_exit(c_pid);
   41722:	89 df                	mov    %ebx,%edi
   41724:	e8 28 fb ff ff       	call   41251 <sys_exit(int)>
                kfree(new_addr);
   41729:	4c 89 ff             	mov    %r15,%rdi
   4172c:	e8 0b fb ff ff       	call   4123c <kfree(void*)>
                return -1;
   41731:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
   41736:	eb 62                	jmp    4179a <syscall_fork()+0x3a4>
        return nullptr;
   41738:	be 00 00 00 00       	mov    $0x0,%esi
   4173d:	eb c3                	jmp    41702 <syscall_fork()+0x30c>
                sys_exit(c_pid);
   4173f:	89 df                	mov    %ebx,%edi
   41741:	e8 0b fb ff ff       	call   41251 <sys_exit(int)>
                return -1;
   41746:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
   4174b:	eb 4d                	jmp    4179a <syscall_fork()+0x3a4>
        p_it += PAGESIZE;
        c_it += PAGESIZE;
    }

    // initialize the child process's registers as a copy of the parent process's registers, except for reg_rax
    ptable[c_pid].regs = current->regs;
   4174d:	4c 63 c3             	movslq %ebx,%r8
   41750:	4b 8d 04 40          	lea    (%r8,%r8,2),%rax
   41754:	48 c1 e0 02          	shl    $0x2,%rax
   41758:	4a 8d 14 00          	lea    (%rax,%r8,1),%rdx
   4175c:	48 c1 e2 04          	shl    $0x4,%rdx
   41760:	48 81 c2 30 92 05 00 	add    $0x59230,%rdx
   41767:	48 8b 0d 92 7a 01 00 	mov    0x17a92(%rip),%rcx        # 59200 <current>
   4176e:	48 8d 71 10          	lea    0x10(%rcx),%rsi
   41772:	b9 18 00 00 00       	mov    $0x18,%ecx
   41777:	48 89 d7             	mov    %rdx,%rdi
   4177a:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    ptable[c_pid].regs.reg_rax = 0;
   4177d:	4a 8d 14 00          	lea    (%rax,%r8,1),%rdx
   41781:	48 c1 e2 04          	shl    $0x4,%rdx
   41785:	48 c7 82 30 92 05 00 	movq   $0x0,0x59230(%rdx)
   4178c:	00 00 00 00 

    ptable[c_pid].state = P_RUNNABLE;
   41790:	c7 82 2c 92 05 00 01 	movl   $0x1,0x5922c(%rdx)
   41797:	00 00 00 

    return c_pid;
}
   4179a:	89 d8                	mov    %ebx,%eax
   4179c:	48 83 c4 48          	add    $0x48,%rsp
   417a0:	5b                   	pop    %rbx
   417a1:	41 5c                	pop    %r12
   417a3:	41 5d                	pop    %r13
   417a5:	41 5e                	pop    %r14
   417a7:	41 5f                	pop    %r15
   417a9:	5d                   	pop    %rbp
   417aa:	c3                   	ret    
        return -1;
   417ab:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
   417b0:	eb e8                	jmp    4179a <syscall_fork()+0x3a4>
        return -1;
   417b2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
   417b7:	eb e1                	jmp    4179a <syscall_fork()+0x3a4>

00000000000417b9 <syscall_page_alloc(unsigned long)>:

// syscall_page_alloc(addr)
//    Handles the SYSCALL_PAGE_ALLOC system call. This function
//    implements the specification for `sys_page_alloc` in `u-lib.hh`.

int syscall_page_alloc(uintptr_t addr) {
   417b9:	f3 0f 1e fa          	endbr64 
   417bd:	55                   	push   %rbp
   417be:	48 89 e5             	mov    %rsp,%rbp
   417c1:	41 54                	push   %r12
   417c3:	53                   	push   %rbx
   417c4:	48 83 ec 20          	sub    $0x20,%rsp
   417c8:	48 89 fb             	mov    %rdi,%rbx
    void* new_addr = kalloc(PAGESIZE);
   417cb:	bf 00 10 00 00       	mov    $0x1000,%edi
   417d0:	e8 91 f3 ff ff       	call   40b66 <kalloc(unsigned long)>

    if (addr % PAGESIZE != 0 || addr < PROC_START_ADDR || addr >= MEMSIZE_VIRTUAL || new_addr == nullptr) {
   417d5:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
   417db:	0f 85 ab 00 00 00    	jne    4188c <syscall_page_alloc(unsigned long)+0xd3>
   417e1:	49 89 c4             	mov    %rax,%r12
   417e4:	48 8d 83 00 00 f0 ff 	lea    -0x100000(%rbx),%rax
   417eb:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   417f1:	0f 87 9c 00 00 00    	ja     41893 <syscall_page_alloc(unsigned long)+0xda>
   417f7:	4d 85 e4             	test   %r12,%r12
   417fa:	0f 84 93 00 00 00    	je     41893 <syscall_page_alloc(unsigned long)+0xda>
        return -1;
    }

    pid_t pid = current->pid;
    int r = vmiter(ptable[pid].pagetable, addr).try_map(new_addr, PTE_PWU);
   41800:	48 8b 05 f9 79 01 00 	mov    0x179f9(%rip),%rax        # 59200 <current>
   41807:	48 63 40 08          	movslq 0x8(%rax),%rax
   4180b:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   4180f:	48 8d 04 90          	lea    (%rax,%rdx,4),%rax
   41813:	48 c1 e0 04          	shl    $0x4,%rax
   41817:	48 8b 80 20 92 05 00 	mov    0x59220(%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4181e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
   41822:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
   41826:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   4182d:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   41834:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   4183b:	00 
    real_find(va);
   4183c:	48 89 de             	mov    %rbx,%rsi
   4183f:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   41843:	e8 ac 06 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
    return try_map((uintptr_t) kp, perm);
   41848:	ba 07 00 00 00       	mov    $0x7,%edx
   4184d:	4c 89 e6             	mov    %r12,%rsi
   41850:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   41854:	e8 b3 08 00 00       	call   4210c <vmiter::try_map(unsigned long, int)>

    // if mapping was unsuccessful, free the allocated memory and return -1
    if (r < 0) {
   41859:	85 c0                	test   %eax,%eax
   4185b:	78 20                	js     4187d <syscall_page_alloc(unsigned long)+0xc4>
        kfree(new_addr);
        return -1;
    }

    memset(new_addr, 0, PAGESIZE);
   4185d:	ba 00 10 00 00       	mov    $0x1000,%edx
   41862:	be 00 00 00 00       	mov    $0x0,%esi
   41867:	4c 89 e7             	mov    %r12,%rdi
   4186a:	e8 a4 2e 00 00       	call   44713 <memset>
    return 0;
   4186f:	b8 00 00 00 00       	mov    $0x0,%eax
}
   41874:	48 83 c4 20          	add    $0x20,%rsp
   41878:	5b                   	pop    %rbx
   41879:	41 5c                	pop    %r12
   4187b:	5d                   	pop    %rbp
   4187c:	c3                   	ret    
        kfree(new_addr);
   4187d:	4c 89 e7             	mov    %r12,%rdi
   41880:	e8 b7 f9 ff ff       	call   4123c <kfree(void*)>
        return -1;
   41885:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   4188a:	eb e8                	jmp    41874 <syscall_page_alloc(unsigned long)+0xbb>
        return -1;
   4188c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   41891:	eb e1                	jmp    41874 <syscall_page_alloc(unsigned long)+0xbb>
   41893:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   41898:	eb da                	jmp    41874 <syscall_page_alloc(unsigned long)+0xbb>

000000000004189a <run(proc*)>:

// run(p)
//    Run process `p`. This involves setting `current = p` and calling
//    `exception_return` to restore its page table and registers.

void run(proc* p) {
   4189a:	f3 0f 1e fa          	endbr64 
   4189e:	55                   	push   %rbp
   4189f:	48 89 e5             	mov    %rsp,%rbp
   418a2:	53                   	push   %rbx
   418a3:	48 83 ec 08          	sub    $0x8,%rsp
    assert(p->state == P_RUNNABLE);
   418a7:	83 7f 0c 01          	cmpl   $0x1,0xc(%rdi)
   418ab:	75 1a                	jne    418c7 <run(proc*)+0x2d>
   418ad:	48 89 fb             	mov    %rdi,%rbx
    current = p;
   418b0:	48 89 3d 49 79 01 00 	mov    %rdi,0x17949(%rip)        # 59200 <current>
    // Check the process's current pagetable.
    check_pagetable(p->pagetable);
   418b7:	48 8b 3f             	mov    (%rdi),%rdi
   418ba:	e8 7d 19 00 00       	call   4323c <check_pagetable(x86_64_pagetable*)>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(p);
   418bf:	48 89 df             	mov    %rbx,%rdi
   418c2:	e8 d8 f1 ff ff       	call   40a9f <exception_return(proc*)>
    assert(p->state == P_RUNNABLE);
   418c7:	b9 00 00 00 00       	mov    $0x0,%ecx
   418cc:	ba 3b 54 04 00       	mov    $0x4543b,%edx
   418d1:	be 13 02 00 00       	mov    $0x213,%esi
   418d6:	bf 12 54 04 00       	mov    $0x45412,%edi
   418db:	e8 12 14 00 00       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>

00000000000418e0 <kernel_start(char const*)>:
void kernel_start(const char* command) {
   418e0:	f3 0f 1e fa          	endbr64 
   418e4:	55                   	push   %rbp
   418e5:	48 89 e5             	mov    %rsp,%rbp
   418e8:	41 56                	push   %r14
   418ea:	41 55                	push   %r13
   418ec:	41 54                	push   %r12
   418ee:	53                   	push   %rbx
   418ef:	48 83 ec 30          	sub    $0x30,%rsp
   418f3:	49 89 fd             	mov    %rdi,%r13
    init_hardware();
   418f6:	e8 7e 14 00 00       	call   42d79 <init_hardware()>
    log_printf("Starting WeensyOS\n");
   418fb:	bf 57 54 04 00       	mov    $0x45457,%edi
   41900:	b8 00 00 00 00       	mov    $0x0,%eax
   41905:	e8 b6 0e 00 00       	call   427c0 <log_printf(char const*, ...)>
	bool is_lock_free() const noexcept					{ return __atomic_is_lock_free(sizeof(T), reinterpret_cast<void*>(-_alignment)); }
	bool is_lock_free() const volatile noexcept			{ return __atomic_is_lock_free(sizeof(T), reinterpret_cast<void*>(-_alignment)); }

	__always_inline T load(memory_order m = memory_order::seq_cst) const noexcept { return __atomic_load_n(&_value, int(m)); }
	__always_inline T load(memory_order m = memory_order::seq_cst) const volatile noexcept { return __atomic_load_n(&_value, int(m)); }
	__always_inline void store(T i, memory_order m = memory_order::seq_cst) noexcept { __atomic_store_n(&_value, i, int(m)); }
   4190a:	b8 01 00 00 00       	mov    $0x1,%eax
   4190f:	48 87 05 12 86 01 00 	xchg   %rax,0x18612(%rip)        # 59f28 <ticks>
    init_timer(HZ);
   41916:	bf 64 00 00 00       	mov    $0x64,%edi
   4191b:	e8 8d 0b 00 00       	call   424ad <init_timer(int)>
    console_clear();
   41920:	e8 ad 37 00 00       	call   450d2 <console_clear()>
   41925:	41 bc 00 10 00 00    	mov    $0x1000,%r12d
   4192b:	bb 00 00 00 00       	mov    $0x0,%ebx
   41930:	e9 b7 00 00 00       	jmp    419ec <kernel_start(char const*)+0x10c>
        assert(r == 0); // mappings during kernel_start MUST NOT fail
   41935:	b9 00 00 00 00       	mov    $0x0,%ecx
   4193a:	ba 0b 54 04 00       	mov    $0x4540b,%edx
   4193f:	be 4d 00 00 00       	mov    $0x4d,%esi
   41944:	bf 12 54 04 00       	mov    $0x45412,%edi
   41949:	e8 a4 13 00 00       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
        process_setup(1, "allocator");
   4194e:	be 6a 54 04 00       	mov    $0x4546a,%esi
   41953:	bf 01 00 00 00       	mov    $0x1,%edi
   41958:	e8 84 f2 ff ff       	call   40be1 <process_setup(int, char const*)>
        process_setup(2, "allocator2");
   4195d:	be 74 54 04 00       	mov    $0x45474,%esi
   41962:	bf 02 00 00 00       	mov    $0x2,%edi
   41967:	e8 75 f2 ff ff       	call   40be1 <process_setup(int, char const*)>
        process_setup(3, "allocator3");
   4196c:	be 7f 54 04 00       	mov    $0x4547f,%esi
   41971:	bf 03 00 00 00       	mov    $0x3,%edi
   41976:	e8 66 f2 ff ff       	call   40be1 <process_setup(int, char const*)>
        process_setup(4, "allocator4");
   4197b:	be 8a 54 04 00       	mov    $0x4548a,%esi
   41980:	bf 04 00 00 00       	mov    $0x4,%edi
   41985:	e8 57 f2 ff ff       	call   40be1 <process_setup(int, char const*)>
   4198a:	e9 21 01 00 00       	jmp    41ab0 <kernel_start(char const*)+0x1d0>
            perm = 0;
   4198f:	41 be 00 00 00 00    	mov    $0x0,%r14d
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   41995:	48 c7 45 b8 00 b0 05 	movq   $0x5b000,-0x48(%rbp)
   4199c:	00 
   4199d:	48 c7 45 c0 00 b0 05 	movq   $0x5b000,-0x40(%rbp)
   419a4:	00 
   419a5:	c7 45 c8 03 00 00 00 	movl   $0x3,-0x38(%rbp)
   419ac:	c7 45 cc ff 0f 00 00 	movl   $0xfff,-0x34(%rbp)
   419b3:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
   419ba:	00 
    real_find(va);
   419bb:	48 89 de             	mov    %rbx,%rsi
   419be:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   419c2:	e8 2d 05 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
        int r = vmiter(kernel_pagetable, addr).try_map(addr, perm);
   419c7:	44 89 f2             	mov    %r14d,%edx
   419ca:	48 89 de             	mov    %rbx,%rsi
   419cd:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   419d1:	e8 36 07 00 00       	call   4210c <vmiter::try_map(unsigned long, int)>
        assert(r == 0); // mappings during kernel_start MUST NOT fail
   419d6:	85 c0                	test   %eax,%eax
   419d8:	0f 85 57 ff ff ff    	jne    41935 <kernel_start(char const*)+0x55>
   419de:	48 81 c3 00 10 00 00 	add    $0x1000,%rbx
   419e5:	49 81 c4 00 10 00 00 	add    $0x1000,%r12
        if (addr == 0) {
   419ec:	48 85 db             	test   %rbx,%rbx
   419ef:	74 9e                	je     4198f <kernel_start(char const*)+0xaf>
        } else if (addr < PROC_START_ADDR && addr != CONSOLE_ADDR) {
   419f1:	48 81 fb ff ff 0f 00 	cmp    $0xfffff,%rbx
   419f8:	77 0f                	ja     41a09 <kernel_start(char const*)+0x129>
            perm = PTE_P | PTE_W;
   419fa:	41 be 03 00 00 00    	mov    $0x3,%r14d
        } else if (addr < PROC_START_ADDR && addr != CONSOLE_ADDR) {
   41a00:	48 81 fb 00 80 0b 00 	cmp    $0xb8000,%rbx
   41a07:	75 8c                	jne    41995 <kernel_start(char const*)+0xb5>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   41a09:	48 c7 45 b8 00 b0 05 	movq   $0x5b000,-0x48(%rbp)
   41a10:	00 
   41a11:	48 c7 45 c0 00 b0 05 	movq   $0x5b000,-0x40(%rbp)
   41a18:	00 
   41a19:	c7 45 c8 03 00 00 00 	movl   $0x3,-0x38(%rbp)
   41a20:	c7 45 cc ff 0f 00 00 	movl   $0xfff,-0x34(%rbp)
   41a27:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
   41a2e:	00 
    real_find(va);
   41a2f:	48 89 de             	mov    %rbx,%rsi
   41a32:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   41a36:	e8 b9 04 00 00       	call   41ef4 <vmiter::real_find(unsigned long)>
        int r = vmiter(kernel_pagetable, addr).try_map(addr, perm);
   41a3b:	ba 07 00 00 00       	mov    $0x7,%edx
   41a40:	48 89 de             	mov    %rbx,%rsi
   41a43:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   41a47:	e8 c0 06 00 00       	call   4210c <vmiter::try_map(unsigned long, int)>
        assert(r == 0); // mappings during kernel_start MUST NOT fail
   41a4c:	85 c0                	test   %eax,%eax
   41a4e:	0f 85 e1 fe ff ff    	jne    41935 <kernel_start(char const*)+0x55>
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   41a54:	49 81 fc ff ff 1f 00 	cmp    $0x1fffff,%r12
   41a5b:	76 81                	jbe    419de <kernel_start(char const*)+0xfe>
   41a5d:	ba 28 92 05 00       	mov    $0x59228,%edx
        ptable[i].pid = i;
   41a62:	89 02                	mov    %eax,(%rdx)
        ptable[i].state = P_FREE;
   41a64:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%rdx)
    for (pid_t i = 0; i < NPROC; i++) {
   41a6b:	83 c0 01             	add    $0x1,%eax
   41a6e:	48 81 c2 d0 00 00 00 	add    $0xd0,%rdx
   41a75:	83 f8 10             	cmp    $0x10,%eax
   41a78:	75 e8                	jne    41a62 <kernel_start(char const*)+0x182>
        command = WEENSYOS_FIRST_PROCESS;
   41a7a:	4d 85 ed             	test   %r13,%r13
   41a7d:	b8 52 54 04 00       	mov    $0x45452,%eax
   41a82:	4c 0f 44 e8          	cmove  %rax,%r13
    if (!program_image(command).empty()) {
   41a86:	4c 89 ee             	mov    %r13,%rsi
   41a89:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   41a8d:	e8 90 1f 00 00       	call   43a22 <program_image::program_image(char const*)>
   41a92:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   41a96:	e8 c5 1f 00 00       	call   43a60 <program_image::empty() const>
   41a9b:	84 c0                	test   %al,%al
   41a9d:	0f 85 ab fe ff ff    	jne    4194e <kernel_start(char const*)+0x6e>
        process_setup(1, command);
   41aa3:	4c 89 ee             	mov    %r13,%rsi
   41aa6:	bf 01 00 00 00       	mov    $0x1,%edi
   41aab:	e8 31 f1 ff ff       	call   40be1 <process_setup(int, char const*)>
    run(&ptable[1]);
   41ab0:	bf f0 92 05 00       	mov    $0x592f0,%edi
   41ab5:	e8 e0 fd ff ff       	call   4189a <run(proc*)>

0000000000041aba <memshow()>:
// memshow()
//    Draw a picture of memory (physical and virtual) on the CGA console.
//    Switches to a new process's virtual memory map every 0.25 sec.
//    Uses `console_memviewer()`, a function defined in `k-memviewer.cc`.

void memshow() {
   41aba:	f3 0f 1e fa          	endbr64 
   41abe:	55                   	push   %rbp
   41abf:	48 89 e5             	mov    %rsp,%rbp
    static unsigned last_ticks = 0;
    static int showing = 0;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
   41ac2:	83 3d 5b 84 01 00 00 	cmpl   $0x0,0x1845b(%rip)        # 59f24 <memshow()::last_ticks>
   41ac9:	74 16                	je     41ae1 <memshow()+0x27>
	__always_inline T load(memory_order m = memory_order::seq_cst) const noexcept { return __atomic_load_n(&_value, int(m)); }
   41acb:	48 8b 05 56 84 01 00 	mov    0x18456(%rip),%rax        # 59f28 <ticks>
   41ad2:	8b 15 4c 84 01 00    	mov    0x1844c(%rip),%edx        # 59f24 <memshow()::last_ticks>
   41ad8:	48 29 d0             	sub    %rdx,%rax
   41adb:	48 83 f8 31          	cmp    $0x31,%rax
   41adf:	76 27                	jbe    41b08 <memshow()+0x4e>
   41ae1:	48 8b 05 40 84 01 00 	mov    0x18440(%rip),%rax        # 59f28 <ticks>
        last_ticks = ticks;
   41ae8:	89 05 36 84 01 00    	mov    %eax,0x18436(%rip)        # 59f24 <memshow()::last_ticks>
        showing = (showing + 1) % NPROC;
   41aee:	8b 05 2c 84 01 00    	mov    0x1842c(%rip),%eax        # 59f20 <memshow()::showing>
   41af4:	83 c0 01             	add    $0x1,%eax
   41af7:	99                   	cltd   
   41af8:	c1 ea 1c             	shr    $0x1c,%edx
   41afb:	01 d0                	add    %edx,%eax
   41afd:	83 e0 0f             	and    $0xf,%eax
   41b00:	29 d0                	sub    %edx,%eax
   41b02:	89 05 18 84 01 00    	mov    %eax,0x18418(%rip)        # 59f20 <memshow()::showing>
    }

    proc* p = nullptr;
    for (int search = 0; !p && search < NPROC; ++search) {
   41b08:	8b 05 12 84 01 00    	mov    0x18412(%rip),%eax        # 59f20 <memshow()::showing>
void memshow() {
   41b0e:	b9 10 00 00 00       	mov    $0x10,%ecx
   41b13:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   41b19:	be 01 00 00 00       	mov    $0x1,%esi
   41b1e:	eb 16                	jmp    41b36 <memshow()+0x7c>
        if (ptable[showing].state != P_FREE
            && ptable[showing].pagetable) {
            p = &ptable[showing];
        } else {
            showing = (showing + 1) % NPROC;
   41b20:	83 c0 01             	add    $0x1,%eax
   41b23:	99                   	cltd   
   41b24:	c1 ea 1c             	shr    $0x1c,%edx
   41b27:	01 d0                	add    %edx,%eax
   41b29:	83 e0 0f             	and    $0xf,%eax
   41b2c:	29 d0                	sub    %edx,%eax
    for (int search = 0; !p && search < NPROC; ++search) {
   41b2e:	41 89 f0             	mov    %esi,%r8d
   41b31:	83 e9 01             	sub    $0x1,%ecx
   41b34:	74 54                	je     41b8a <memshow()+0xd0>
        if (ptable[showing].state != P_FREE
   41b36:	48 63 d0             	movslq %eax,%rdx
   41b39:	48 8d 3c 52          	lea    (%rdx,%rdx,2),%rdi
   41b3d:	48 8d 14 ba          	lea    (%rdx,%rdi,4),%rdx
   41b41:	48 c1 e2 04          	shl    $0x4,%rdx
   41b45:	83 ba 2c 92 05 00 00 	cmpl   $0x0,0x5922c(%rdx)
   41b4c:	74 d2                	je     41b20 <memshow()+0x66>
            && ptable[showing].pagetable) {
   41b4e:	48 63 d0             	movslq %eax,%rdx
   41b51:	48 8d 14 ba          	lea    (%rdx,%rdi,4),%rdx
   41b55:	48 c1 e2 04          	shl    $0x4,%rdx
   41b59:	48 83 ba 20 92 05 00 	cmpq   $0x0,0x59220(%rdx)
   41b60:	00 
   41b61:	74 bd                	je     41b20 <memshow()+0x66>
   41b63:	45 84 c0             	test   %r8b,%r8b
   41b66:	74 06                	je     41b6e <memshow()+0xb4>
   41b68:	89 05 b2 83 01 00    	mov    %eax,0x183b2(%rip)        # 59f20 <memshow()::showing>
            p = &ptable[showing];
   41b6e:	48 98                	cltq   
   41b70:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   41b74:	48 8d 3c 90          	lea    (%rax,%rdx,4),%rdi
   41b78:	48 c1 e7 04          	shl    $0x4,%rdi
   41b7c:	48 81 c7 20 92 05 00 	add    $0x59220,%rdi
        }
    }

    console_memviewer(p);
   41b83:	e8 56 28 00 00       	call   443de <console_memviewer(proc*)>
    if (!p) {
        console_printf(CPOS(10, 26), 0x0F00, "   VIRTUAL ADDRESS SPACE\n"
            "                          [All processes have exited]\n"
            "\n\n\n\n\n\n\n\n\n\n\n");
    }
}
   41b88:	5d                   	pop    %rbp
   41b89:	c3                   	ret    
   41b8a:	89 05 90 83 01 00    	mov    %eax,0x18390(%rip)        # 59f20 <memshow()::showing>
    console_memviewer(p);
   41b90:	bf 00 00 00 00       	mov    $0x0,%edi
   41b95:	e8 44 28 00 00       	call   443de <console_memviewer(proc*)>
        console_printf(CPOS(10, 26), 0x0F00, "   VIRTUAL ADDRESS SPACE\n"
   41b9a:	ba c8 54 04 00       	mov    $0x454c8,%edx
   41b9f:	be 00 0f 00 00       	mov    $0xf00,%esi
   41ba4:	bf 3a 03 00 00       	mov    $0x33a,%edi
   41ba9:	b8 00 00 00 00       	mov    $0x0,%eax
   41bae:	e8 5c 37 00 00       	call   4530f <console_printf(int, int, char const*, ...)>
}
   41bb3:	eb d3                	jmp    41b88 <memshow()+0xce>

0000000000041bb5 <schedule()>:
void schedule() {
   41bb5:	f3 0f 1e fa          	endbr64 
   41bb9:	55                   	push   %rbp
   41bba:	48 89 e5             	mov    %rsp,%rbp
   41bbd:	41 54                	push   %r12
   41bbf:	53                   	push   %rbx
    pid_t pid = current->pid;
   41bc0:	48 8b 05 39 76 01 00 	mov    0x17639(%rip),%rax        # 59200 <current>
        pid = (pid + 1) % NPROC;
   41bc7:	8b 40 08             	mov    0x8(%rax),%eax
   41bca:	83 c0 01             	add    $0x1,%eax
   41bcd:	99                   	cltd   
   41bce:	c1 ea 1c             	shr    $0x1c,%edx
   41bd1:	01 d0                	add    %edx,%eax
   41bd3:	83 e0 0f             	and    $0xf,%eax
   41bd6:	29 d0                	sub    %edx,%eax
   41bd8:	41 89 c4             	mov    %eax,%r12d
        if (ptable[pid].state == P_RUNNABLE) {
   41bdb:	48 98                	cltq   
   41bdd:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   41be1:	48 8d 04 90          	lea    (%rax,%rdx,4),%rax
   41be5:	48 c1 e0 04          	shl    $0x4,%rax
   41be9:	83 b8 2c 92 05 00 01 	cmpl   $0x1,0x5922c(%rax)
   41bf0:	74 5c                	je     41c4e <schedule()+0x99>
        check_keyboard();
   41bf2:	e8 36 1a 00 00       	call   4362d <check_keyboard()>
    for (unsigned spins = 1; true; ++spins) {
   41bf7:	bb 01 00 00 00       	mov    $0x1,%ebx
   41bfc:	83 c3 01             	add    $0x1,%ebx
        pid = (pid + 1) % NPROC;
   41bff:	41 8d 44 24 01       	lea    0x1(%r12),%eax
   41c04:	99                   	cltd   
   41c05:	c1 ea 1c             	shr    $0x1c,%edx
   41c08:	01 d0                	add    %edx,%eax
   41c0a:	83 e0 0f             	and    $0xf,%eax
   41c0d:	29 d0                	sub    %edx,%eax
   41c0f:	41 89 c4             	mov    %eax,%r12d
        if (ptable[pid].state == P_RUNNABLE) {
   41c12:	48 98                	cltq   
   41c14:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   41c18:	48 8d 04 90          	lea    (%rax,%rdx,4),%rax
   41c1c:	48 c1 e0 04          	shl    $0x4,%rax
   41c20:	83 b8 2c 92 05 00 01 	cmpl   $0x1,0x5922c(%rax)
   41c27:	74 25                	je     41c4e <schedule()+0x99>
        check_keyboard();
   41c29:	e8 ff 19 00 00       	call   4362d <check_keyboard()>
        if (spins % (1 << 12) == 0) {
   41c2e:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
   41c34:	75 c6                	jne    41bfc <schedule()+0x47>
            memshow();
   41c36:	e8 7f fe ff ff       	call   41aba <memshow()>
            log_printf("%u\n", spins);
   41c3b:	89 de                	mov    %ebx,%esi
   41c3d:	bf 95 54 04 00       	mov    $0x45495,%edi
   41c42:	b8 00 00 00 00       	mov    $0x0,%eax
   41c47:	e8 74 0b 00 00       	call   427c0 <log_printf(char const*, ...)>
   41c4c:	eb ae                	jmp    41bfc <schedule()+0x47>
            run(&ptable[pid]);
   41c4e:	4d 63 e4             	movslq %r12d,%r12
   41c51:	4b 8d 04 64          	lea    (%r12,%r12,2),%rax
   41c55:	49 8d 3c 84          	lea    (%r12,%rax,4),%rdi
   41c59:	48 c1 e7 04          	shl    $0x4,%rdi
   41c5d:	48 81 c7 20 92 05 00 	add    $0x59220,%rdi
   41c64:	e8 31 fc ff ff       	call   4189a <run(proc*)>

0000000000041c69 <exception(regstate*)>:
void exception(regstate* regs) {
   41c69:	f3 0f 1e fa          	endbr64 
   41c6d:	55                   	push   %rbp
   41c6e:	48 89 e5             	mov    %rsp,%rbp
   41c71:	53                   	push   %rbx
   41c72:	48 83 ec 08          	sub    $0x8,%rsp
   41c76:	48 89 fe             	mov    %rdi,%rsi
    current->regs = *regs;
   41c79:	48 8b 1d 80 75 01 00 	mov    0x17580(%rip),%rbx        # 59200 <current>
   41c80:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
   41c84:	b9 18 00 00 00       	mov    $0x18,%ecx
   41c89:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    console_show_cursor(cursorpos);
   41c8c:	8b 3d 6a 73 07 00    	mov    0x7736a(%rip),%edi        # b8ffc <cursorpos>
   41c92:	e8 79 09 00 00       	call   42610 <console_show_cursor(int)>
    if (regs->reg_intno != INT_PF || (regs->reg_errcode & PTE_U)) {
   41c97:	83 bb 98 00 00 00 0e 	cmpl   $0xe,0x98(%rbx)
   41c9e:	75 09                	jne    41ca9 <exception(regstate*)+0x40>
   41ca0:	f6 83 a0 00 00 00 04 	testb  $0x4,0xa0(%rbx)
   41ca7:	74 05                	je     41cae <exception(regstate*)+0x45>
        memshow();
   41ca9:	e8 0c fe ff ff       	call   41aba <memshow()>
    check_keyboard();
   41cae:	e8 7a 19 00 00       	call   4362d <check_keyboard()>
    switch (regs->reg_intno) {
   41cb3:	8b 93 98 00 00 00    	mov    0x98(%rbx),%edx
   41cb9:	83 fa 0e             	cmp    $0xe,%edx
   41cbc:	74 22                	je     41ce0 <exception(regstate*)+0x77>
   41cbe:	83 fa 20             	cmp    $0x20,%edx
   41cc1:	0f 85 ab 00 00 00    	jne    41d72 <exception(regstate*)+0x109>
	T operator++() noexcept								{ return __atomic_add_fetch(&_value, 1, int(memory_order::seq_cst)); }
   41cc7:	f0 48 83 05 58 82 01 	lock addq $0x1,0x18258(%rip)        # 59f28 <ticks>
   41cce:	00 01 
}
inline uint32_t lapicstate::read(int reg) const {
    return reg_[reg].v;
}
inline void lapicstate::write(int reg, uint32_t v) {
    reg_[reg].v = v;
   41cd0:	b8 b0 00 e0 fe       	mov    $0xfee000b0,%eax
   41cd5:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
        schedule();
   41cdb:	e8 d5 fe ff ff       	call   41bb5 <schedule()>
    asm volatile("movq %0, %%cr0" : : "r" (x));
}

__always_inline uintptr_t rdcr2() {
    uintptr_t x;
    asm volatile("movq %%cr2, %0" : "=r" (x));
   41ce0:	0f 20 d2             	mov    %cr2,%rdx
        const char* operation = regs->reg_errcode & PTE_W
   41ce3:	48 8b 83 a0 00 00 00 	mov    0xa0(%rbx),%rax
                ? "write" : "read";
   41cea:	a8 02                	test   $0x2,%al
   41cec:	b9 99 54 04 00       	mov    $0x45499,%ecx
   41cf1:	be 9f 54 04 00       	mov    $0x4549f,%esi
   41cf6:	48 0f 44 ce          	cmove  %rsi,%rcx
                ? "protection problem" : "missing page";
   41cfa:	a8 01                	test   $0x1,%al
   41cfc:	41 b8 a4 54 04 00    	mov    $0x454a4,%r8d
   41d02:	be b7 54 04 00       	mov    $0x454b7,%esi
   41d07:	4c 0f 44 c6          	cmove  %rsi,%r8
        if (!(regs->reg_errcode & PTE_U)) {
   41d0b:	a8 04                	test   $0x4,%al
   41d0d:	75 1d                	jne    41d2c <exception(regstate*)+0xc3>
            proc_panic(current, "Kernel page fault on %p (%s %s, rip=%p)!\n",
   41d0f:	4c 8b 8b a8 00 00 00 	mov    0xa8(%rbx),%r9
   41d16:	be 28 55 04 00       	mov    $0x45528,%esi
   41d1b:	48 8b 3d de 74 01 00 	mov    0x174de(%rip),%rdi        # 59200 <current>
   41d22:	b8 00 00 00 00       	mov    $0x0,%eax
   41d27:	e8 1a 1b 00 00       	call   43846 <proc_panic(proc const*, char const*, ...)>
        error_printf(CPOS(24, 0), 0x0C00,
   41d2c:	48 8b 05 cd 74 01 00 	mov    0x174cd(%rip),%rax        # 59200 <current>
   41d33:	8b 40 08             	mov    0x8(%rax),%eax
   41d36:	ff b3 a8 00 00 00    	push   0xa8(%rbx)
   41d3c:	41 50                	push   %r8
   41d3e:	49 89 c9             	mov    %rcx,%r9
   41d41:	49 89 d0             	mov    %rdx,%r8
   41d44:	89 c1                	mov    %eax,%ecx
   41d46:	ba 58 55 04 00       	mov    $0x45558,%edx
   41d4b:	be 00 0c 00 00       	mov    $0xc00,%esi
   41d50:	bf 80 07 00 00       	mov    $0x780,%edi
   41d55:	b8 00 00 00 00       	mov    $0x0,%eax
   41d5a:	e8 ea 35 00 00       	call   45349 <error_printf(int, int, char const*, ...)>
        current->state = P_FAULTED;
   41d5f:	48 8b 05 9a 74 01 00 	mov    0x1749a(%rip),%rax        # 59200 <current>
   41d66:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%rax)
        schedule();
   41d6d:	e8 43 fe ff ff       	call   41bb5 <schedule()>
        proc_panic(current, "Unhandled exception %d (rip=%p)!\n",
   41d72:	48 8b 8b a8 00 00 00 	mov    0xa8(%rbx),%rcx
   41d79:	be 88 55 04 00       	mov    $0x45588,%esi
   41d7e:	48 8b 3d 7b 74 01 00 	mov    0x1747b(%rip),%rdi        # 59200 <current>
   41d85:	b8 00 00 00 00       	mov    $0x0,%eax
   41d8a:	e8 b7 1a 00 00       	call   43846 <proc_panic(proc const*, char const*, ...)>

0000000000041d8f <syscall(regstate*)>:
uintptr_t syscall(regstate* regs) {
   41d8f:	f3 0f 1e fa          	endbr64 
   41d93:	55                   	push   %rbp
   41d94:	48 89 e5             	mov    %rsp,%rbp
   41d97:	53                   	push   %rbx
   41d98:	48 83 ec 08          	sub    $0x8,%rsp
   41d9c:	48 89 fe             	mov    %rdi,%rsi
    current->regs = *regs;
   41d9f:	48 8b 1d 5a 74 01 00 	mov    0x1745a(%rip),%rbx        # 59200 <current>
   41da6:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
   41daa:	b9 18 00 00 00       	mov    $0x18,%ecx
   41daf:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    console_show_cursor(cursorpos);
   41db2:	8b 3d 44 72 07 00    	mov    0x77244(%rip),%edi        # b8ffc <cursorpos>
   41db8:	e8 53 08 00 00       	call   42610 <console_show_cursor(int)>
    memshow();
   41dbd:	e8 f8 fc ff ff       	call   41aba <memshow()>
    check_keyboard();
   41dc2:	e8 66 18 00 00       	call   4362d <check_keyboard()>
    switch (regs->reg_rax) {
   41dc7:	48 8b 53 10          	mov    0x10(%rbx),%rdx
   41dcb:	48 83 fa 06          	cmp    $0x6,%rdx
   41dcf:	77 6a                	ja     41e3b <syscall(regstate*)+0xac>
   41dd1:	3e ff 24 d5 e0 55 04 	notrack jmp *0x455e0(,%rdx,8)
   41dd8:	00 
        user_panic(current);
   41dd9:	48 8b 3d 20 74 01 00 	mov    0x17420(%rip),%rdi        # 59200 <current>
   41de0:	e8 6e 19 00 00       	call   43753 <user_panic(proc const*)>
        return current->pid;
   41de5:	48 8b 05 14 74 01 00 	mov    0x17414(%rip),%rax        # 59200 <current>
   41dec:	48 63 40 08          	movslq 0x8(%rax),%rax
}
   41df0:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   41df4:	c9                   	leave  
   41df5:	c3                   	ret    
        current->regs.reg_rax = 0;
   41df6:	48 8b 05 03 74 01 00 	mov    0x17403(%rip),%rax        # 59200 <current>
   41dfd:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
   41e04:	00 
        schedule();             // does not return
   41e05:	e8 ab fd ff ff       	call   41bb5 <schedule()>
        return syscall_page_alloc(current->regs.reg_rdi);
   41e0a:	48 8b 05 ef 73 01 00 	mov    0x173ef(%rip),%rax        # 59200 <current>
   41e11:	48 8b 78 40          	mov    0x40(%rax),%rdi
   41e15:	e8 9f f9 ff ff       	call   417b9 <syscall_page_alloc(unsigned long)>
   41e1a:	48 98                	cltq   
   41e1c:	eb d2                	jmp    41df0 <syscall(regstate*)+0x61>
        return syscall_fork();
   41e1e:	e8 d3 f5 ff ff       	call   413f6 <syscall_fork()>
   41e23:	48 98                	cltq   
   41e25:	eb c9                	jmp    41df0 <syscall(regstate*)+0x61>
        sys_exit(current->pid);
   41e27:	48 8b 05 d2 73 01 00 	mov    0x173d2(%rip),%rax        # 59200 <current>
   41e2e:	8b 78 08             	mov    0x8(%rax),%edi
   41e31:	e8 1b f4 ff ff       	call   41251 <sys_exit(int)>
        schedule();
   41e36:	e8 7a fd ff ff       	call   41bb5 <schedule()>
        proc_panic(current, "Unhandled system call %ld (pid=%d, rip=%p)!\n",
   41e3b:	48 8b 3d be 73 01 00 	mov    0x173be(%rip),%rdi        # 59200 <current>
   41e42:	8b 4f 08             	mov    0x8(%rdi),%ecx
   41e45:	4c 8b 83 a8 00 00 00 	mov    0xa8(%rbx),%r8
   41e4c:	be b0 55 04 00       	mov    $0x455b0,%esi
   41e51:	b8 00 00 00 00       	mov    $0x0,%eax
   41e56:	e8 eb 19 00 00       	call   43846 <proc_panic(proc const*, char const*, ...)>
   41e5b:	90                   	nop

0000000000041e5c <vmiter::down()>:
    } else {
        return 0;
    }
}

void vmiter::down() {
   41e5c:	f3 0f 1e fa          	endbr64 
   41e60:	48 89 f8             	mov    %rdi,%rax
    while (level_ > 0 && (*pep_ & (PTE_P | PTE_PS)) == PTE_P) {
   41e63:	8b 77 10             	mov    0x10(%rdi),%esi
   41e66:	85 f6                	test   %esi,%esi
   41e68:	7e 56                	jle    41ec0 <vmiter::down()+0x64>
   41e6a:	8d 4c f6 03          	lea    0x3(%rsi,%rsi,8),%ecx
        perm_ &= *pep_ | ~(PTE_P | PTE_W | PTE_U);
        --level_;
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41e6e:	49 b9 00 f0 ff ff ff 	movabs $0xffffffffff000,%r9
   41e75:	ff 0f 00 
    while (level_ > 0 && (*pep_ & (PTE_P | PTE_PS)) == PTE_P) {
   41e78:	48 8b 78 08          	mov    0x8(%rax),%rdi
   41e7c:	48 8b 17             	mov    (%rdi),%rdx
   41e7f:	49 89 d0             	mov    %rdx,%r8
   41e82:	41 81 e0 81 00 00 00 	and    $0x81,%r8d
   41e89:	49 83 f8 01          	cmp    $0x1,%r8
   41e8d:	75 31                	jne    41ec0 <vmiter::down()+0x64>
        perm_ &= *pep_ | ~(PTE_P | PTE_W | PTE_U);
   41e8f:	83 ca f8             	or     $0xfffffff8,%edx
   41e92:	21 50 14             	and    %edx,0x14(%rax)
        --level_;
   41e95:	83 ee 01             	sub    $0x1,%esi
   41e98:	89 70 10             	mov    %esi,0x10(%rax)
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41e9b:	4c 89 ca             	mov    %r9,%rdx
   41e9e:	48 23 17             	and    (%rdi),%rdx
   41ea1:	48 89 d7             	mov    %rdx,%rdi
    return (int) (addr >> (PAGEOFFBITS + level * PAGEINDEXBITS)) & 0x1FF;
   41ea4:	48 8b 50 18          	mov    0x18(%rax),%rdx
   41ea8:	48 d3 ea             	shr    %cl,%rdx
        x86_64_pagetable* pt = reinterpret_cast<x86_64_pagetable*>(pa);
        pep_ = &pt->entry[pageindex(va_, level_)];
   41eab:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
   41eb1:	48 8d 14 d7          	lea    (%rdi,%rdx,8),%rdx
   41eb5:	48 89 50 08          	mov    %rdx,0x8(%rax)
    while (level_ > 0 && (*pep_ & (PTE_P | PTE_PS)) == PTE_P) {
   41eb9:	83 e9 09             	sub    $0x9,%ecx
   41ebc:	85 f6                	test   %esi,%esi
   41ebe:	75 b8                	jne    41e78 <vmiter::down()+0x1c>
    }
    if ((*pep_ & PTE_PAMASK) >= 0x100000000UL) {
   41ec0:	48 8b 50 08          	mov    0x8(%rax),%rdx
   41ec4:	48 8b 0a             	mov    (%rdx),%rcx
   41ec7:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   41ece:	ff 0f 00 
   41ed1:	48 21 ca             	and    %rcx,%rdx
   41ed4:	48 c1 ea 20          	shr    $0x20,%rdx
   41ed8:	75 01                	jne    41edb <vmiter::down()+0x7f>
   41eda:	c3                   	ret    
void vmiter::down() {
   41edb:	55                   	push   %rbp
   41edc:	48 89 e5             	mov    %rsp,%rbp
        panic("Page table %p may contain uninitialized memory!\n"
   41edf:	48 89 ca             	mov    %rcx,%rdx
   41ee2:	48 8b 30             	mov    (%rax),%rsi
   41ee5:	bf 18 56 04 00       	mov    $0x45618,%edi
   41eea:	b8 00 00 00 00       	mov    $0x0,%eax
   41eef:	e8 d7 19 00 00       	call   438cb <panic(char const*, ...)>

0000000000041ef4 <vmiter::real_find(unsigned long)>:
              "(Page table contents: %p)\n", pt_, *pep_);
    }
}

void vmiter::real_find(uintptr_t va) {
   41ef4:	f3 0f 1e fa          	endbr64 
   41ef8:	55                   	push   %rbp
   41ef9:	48 89 e5             	mov    %rsp,%rbp
   41efc:	48 89 f0             	mov    %rsi,%rax
    if (level_ == 3 || ((va_ ^ va) & ~pageoffmask(level_ + 1)) != 0) {
   41eff:	8b 57 10             	mov    0x10(%rdi),%edx
   41f02:	83 fa 03             	cmp    $0x3,%edx
   41f05:	74 1d                	je     41f24 <vmiter::real_find(unsigned long)+0x30>
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   41f07:	8d 74 d2 09          	lea    0x9(%rdx,%rdx,8),%esi
   41f0b:	8d 4e 0c             	lea    0xc(%rsi),%ecx
   41f0e:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   41f15:	48 d3 e2             	shl    %cl,%rdx
   41f18:	48 89 c1             	mov    %rax,%rcx
   41f1b:	48 33 4f 18          	xor    0x18(%rdi),%rcx
   41f1f:	48 85 ca             	test   %rcx,%rdx
   41f22:	74 31                	je     41f55 <vmiter::real_find(unsigned long)+0x61>
        level_ = 3;
   41f24:	c7 47 10 03 00 00 00 	movl   $0x3,0x10(%rdi)
    return va <= VA_LOWMAX || va >= VA_HIGHMIN;
   41f2b:	48 ba 00 00 00 00 00 	movabs $0xffff800000000000,%rdx
   41f32:	80 ff ff 
   41f35:	48 01 c2             	add    %rax,%rdx
        if (va_is_canonical(va)) {
   41f38:	48 b9 ff ff ff ff ff 	movabs $0xfffeffffffffffff,%rcx
   41f3f:	ff fe ff 
   41f42:	48 39 ca             	cmp    %rcx,%rdx
   41f45:	77 39                	ja     41f80 <vmiter::real_find(unsigned long)+0x8c>
            perm_ = initial_perm;
            pep_ = &pt_->entry[pageindex(va, level_)];
        } else {
            perm_ = 0;
   41f47:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%rdi)
   41f4e:	ba 88 57 04 00       	mov    $0x45788,%edx
   41f53:	eb 42                	jmp    41f97 <vmiter::real_find(unsigned long)+0xa3>
            pep_ = const_cast<x86_64_pageentry_t*>(&zero_pe);
        }
    } else {
        int curidx = (reinterpret_cast<uintptr_t>(pep_) % PAGESIZE) >> 3;
   41f55:	4c 8b 47 08          	mov    0x8(%rdi),%r8
    return (int) (addr >> (PAGEOFFBITS + level * PAGEINDEXBITS)) & 0x1FF;
   41f59:	8d 4e 03             	lea    0x3(%rsi),%ecx
   41f5c:	48 89 c2             	mov    %rax,%rdx
   41f5f:	48 d3 ea             	shr    %cl,%rdx
   41f62:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
   41f68:	4c 89 c1             	mov    %r8,%rcx
   41f6b:	48 c1 e9 03          	shr    $0x3,%rcx
   41f6f:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
        pep_ += pageindex(va, level_) - curidx;
   41f75:	29 ca                	sub    %ecx,%edx
   41f77:	48 63 d2             	movslq %edx,%rdx
   41f7a:	49 8d 14 d0          	lea    (%r8,%rdx,8),%rdx
   41f7e:	eb 17                	jmp    41f97 <vmiter::real_find(unsigned long)+0xa3>
            perm_ = initial_perm;
   41f80:	c7 47 14 ff 0f 00 00 	movl   $0xfff,0x14(%rdi)
            pep_ = &pt_->entry[pageindex(va, level_)];
   41f87:	48 89 c2             	mov    %rax,%rdx
   41f8a:	48 c1 ea 24          	shr    $0x24,%rdx
   41f8e:	81 e2 f8 0f 00 00    	and    $0xff8,%edx
   41f94:	48 03 17             	add    (%rdi),%rdx
            pep_ = const_cast<x86_64_pageentry_t*>(&zero_pe);
   41f97:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    }
    va_ = va;
   41f9b:	48 89 47 18          	mov    %rax,0x18(%rdi)
    down();
   41f9f:	e8 b8 fe ff ff       	call   41e5c <vmiter::down()>
}
   41fa4:	5d                   	pop    %rbp
   41fa5:	c3                   	ret    

0000000000041fa6 <vmiter::range_perm(unsigned long) const>:
uint64_t vmiter::range_perm(size_t sz) const {
   41fa6:	f3 0f 1e fa          	endbr64 
   41faa:	55                   	push   %rbp
   41fab:	48 89 e5             	mov    %rsp,%rbp
   41fae:	41 55                	push   %r13
   41fb0:	41 54                	push   %r12
   41fb2:	53                   	push   %rbx
   41fb3:	48 83 ec 28          	sub    $0x28,%rsp
    uint64_t ph = *pep_ & perm_;
   41fb7:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   41fbb:	48 63 47 14          	movslq 0x14(%rdi),%rax
   41fbf:	48 23 01             	and    (%rcx),%rax
    return ph & -(ph & PTE_P);
   41fc2:	48 89 c3             	mov    %rax,%rbx
   41fc5:	83 e3 01             	and    $0x1,%ebx
   41fc8:	48 f7 db             	neg    %rbx
   41fcb:	48 21 c3             	and    %rax,%rbx
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   41fce:	8b 47 10             	mov    0x10(%rdi),%eax
   41fd1:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   41fd5:	b8 01 00 00 00       	mov    $0x1,%eax
   41fda:	48 d3 e0             	shl    %cl,%rax
    if ((p & PTE_P) != 0 && sz > rsz) {
   41fdd:	f6 c3 01             	test   $0x1,%bl
   41fe0:	74 08                	je     41fea <vmiter::range_perm(unsigned long) const+0x44>
   41fe2:	48 89 fa             	mov    %rdi,%rdx
   41fe5:	48 39 c6             	cmp    %rax,%rsi
   41fe8:	77 18                	ja     42002 <vmiter::range_perm(unsigned long) const+0x5c>
        return 0;
   41fea:	48 89 d8             	mov    %rbx,%rax
   41fed:	83 e0 01             	and    $0x1,%eax
   41ff0:	48 0f 44 d8          	cmove  %rax,%rbx
}
   41ff4:	48 89 d8             	mov    %rbx,%rax
   41ff7:	48 83 c4 28          	add    $0x28,%rsp
   41ffb:	5b                   	pop    %rbx
   41ffc:	41 5c                	pop    %r12
   41ffe:	41 5d                	pop    %r13
   42000:	5d                   	pop    %rbp
   42001:	c3                   	ret    
    return va_;
   42002:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
        if (sz > ((int64_t) va() < 0 ? 0 : VA_LOWEND) - va()) {
   42006:	48 89 f9             	mov    %rdi,%rcx
   42009:	48 f7 d1             	not    %rcx
   4200c:	48 c1 e9 3f          	shr    $0x3f,%rcx
   42010:	48 c1 e1 2f          	shl    $0x2f,%rcx
   42014:	48 29 f9             	sub    %rdi,%rcx
   42017:	48 39 f1             	cmp    %rsi,%rcx
   4201a:	0f 82 8e 00 00 00    	jb     420ae <vmiter::range_perm(unsigned long) const+0x108>
        vmiter it(*this);
   42020:	48 8b 0a             	mov    (%rdx),%rcx
   42023:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
   42027:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   4202b:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
   4202f:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   42033:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
   42037:	48 8b 52 18          	mov    0x18(%rdx),%rdx
   4203b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
   4203f:	4c 8d 60 ff          	lea    -0x1(%rax),%r12
        sz += va() & (rsz - 1);
   42043:	49 21 fc             	and    %rdi,%r12
   42046:	49 01 f4             	add    %rsi,%r12
   42049:	41 bd 01 00 00 00    	mov    $0x1,%r13d
            sz -= rsz;
   4204f:	49 29 c4             	sub    %rax,%r12
   42052:	8b 45 d0             	mov    -0x30(%rbp),%eax
   42055:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   42059:	4c 89 ee             	mov    %r13,%rsi
   4205c:	48 d3 e6             	shl    %cl,%rsi
   4205f:	48 83 ee 01          	sub    $0x1,%rsi
    return (va_ | pageoffmask(level_)) + 1;
   42063:	48 0b 75 d8          	or     -0x28(%rbp),%rsi
   42067:	48 83 c6 01          	add    $0x1,%rsi
    real_find(last_va());
   4206b:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   4206f:	e8 80 fe ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    uint64_t ph = *pep_ & perm_;
   42074:	48 63 55 d4          	movslq -0x2c(%rbp),%rdx
   42078:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4207c:	48 23 10             	and    (%rax),%rdx
    return ph & -(ph & PTE_P);
   4207f:	48 89 d0             	mov    %rdx,%rax
   42082:	83 e0 01             	and    $0x1,%eax
   42085:	48 f7 d8             	neg    %rax
   42088:	48 21 d0             	and    %rdx,%rax
            p &= it.perm();
   4208b:	48 21 c3             	and    %rax,%rbx
   4208e:	8b 45 d0             	mov    -0x30(%rbp),%eax
   42091:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   42095:	4c 89 e8             	mov    %r13,%rax
   42098:	48 d3 e0             	shl    %cl,%rax
        } while ((p & PTE_P) != 0 && sz > rsz);
   4209b:	f6 c3 01             	test   $0x1,%bl
   4209e:	0f 84 46 ff ff ff    	je     41fea <vmiter::range_perm(unsigned long) const+0x44>
   420a4:	49 39 c4             	cmp    %rax,%r12
   420a7:	77 a6                	ja     4204f <vmiter::range_perm(unsigned long) const+0xa9>
   420a9:	e9 3c ff ff ff       	jmp    41fea <vmiter::range_perm(unsigned long) const+0x44>
            return 0;
   420ae:	bb 00 00 00 00       	mov    $0x0,%ebx
   420b3:	e9 3c ff ff ff       	jmp    41ff4 <vmiter::range_perm(unsigned long) const+0x4e>

00000000000420b8 <vmiter::next()>:

void vmiter::next() {
   420b8:	f3 0f 1e fa          	endbr64 
   420bc:	55                   	push   %rbp
   420bd:	48 89 e5             	mov    %rsp,%rbp
    int level = 0;
    if (level_ > 0 && !perm()) {
   420c0:	8b 47 10             	mov    0x10(%rdi),%eax
   420c3:	85 c0                	test   %eax,%eax
   420c5:	7e 3e                	jle    42105 <vmiter::next()+0x4d>
    uint64_t ph = *pep_ & perm_;
   420c7:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   420cb:	48 63 57 14          	movslq 0x14(%rdi),%rdx
   420cf:	48 23 11             	and    (%rcx),%rdx
    return ph & -(ph & PTE_P);
   420d2:	48 89 d1             	mov    %rdx,%rcx
   420d5:	83 e1 01             	and    $0x1,%ecx
   420d8:	48 f7 d9             	neg    %rcx
    int level = 0;
   420db:	48 85 d1             	test   %rdx,%rcx
   420de:	ba 00 00 00 00       	mov    $0x0,%edx
   420e3:	0f 45 c2             	cmovne %edx,%eax
   420e6:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   420ea:	be 01 00 00 00       	mov    $0x1,%esi
   420ef:	48 d3 e6             	shl    %cl,%rsi
   420f2:	48 83 ee 01          	sub    $0x1,%rsi
        level = level_;
    }
    real_find((va_ | pageoffmask(level)) + 1);
   420f6:	48 0b 77 18          	or     0x18(%rdi),%rsi
   420fa:	48 83 c6 01          	add    $0x1,%rsi
   420fe:	e8 f1 fd ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
}
   42103:	5d                   	pop    %rbp
   42104:	c3                   	ret    
    int level = 0;
   42105:	b8 00 00 00 00       	mov    $0x0,%eax
   4210a:	eb da                	jmp    420e6 <vmiter::next()+0x2e>

000000000004210c <vmiter::try_map(unsigned long, int)>:

int vmiter::try_map(uintptr_t pa, int perm) {
   4210c:	f3 0f 1e fa          	endbr64 
   42110:	55                   	push   %rbp
   42111:	48 89 e5             	mov    %rsp,%rbp
   42114:	41 57                	push   %r15
   42116:	41 56                	push   %r14
   42118:	41 55                	push   %r13
   4211a:	41 54                	push   %r12
   4211c:	53                   	push   %rbx
   4211d:	48 83 ec 08          	sub    $0x8,%rsp
   42121:	49 89 fc             	mov    %rdi,%r12
   42124:	49 89 f7             	mov    %rsi,%r15
   42127:	41 89 d6             	mov    %edx,%r14d
    if (pa == (uintptr_t) -1 && perm == 0) {
   4212a:	48 83 fe ff          	cmp    $0xffffffffffffffff,%rsi
   4212e:	75 2a                	jne    4215a <vmiter::try_map(unsigned long, int)+0x4e>
   42130:	85 d2                	test   %edx,%edx
   42132:	75 26                	jne    4215a <vmiter::try_map(unsigned long, int)+0x4e>
        pa = 0;
    }
    // virtual address is page-aligned
    assert((va_ % PAGESIZE) == 0, "vmiter::try_map va not aligned");
   42134:	4c 8b 7f 18          	mov    0x18(%rdi),%r15
   42138:	41 81 e7 ff 0f 00 00 	and    $0xfff,%r15d
   4213f:	74 4d                	je     4218e <vmiter::try_map(unsigned long, int)+0x82>
   42141:	b9 68 56 04 00       	mov    $0x45668,%ecx
   42146:	ba fb 56 04 00       	mov    $0x456fb,%edx
   4214b:	be 49 00 00 00       	mov    $0x49,%esi
   42150:	bf 11 57 04 00       	mov    $0x45711,%edi
   42155:	e8 98 0b 00 00       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
   4215a:	66 41 f7 44 24 18 ff 	testw  $0xfff,0x18(%r12)
   42161:	0f 
   42162:	75 dd                	jne    42141 <vmiter::try_map(unsigned long, int)+0x35>
    if (perm & PTE_P) {
   42164:	41 f6 c6 01          	test   $0x1,%r14b
   42168:	0f 84 ef 00 00 00    	je     4225d <vmiter::try_map(unsigned long, int)+0x151>
        // if mapping present, physical address is page-aligned
        assert(pa != (uintptr_t) -1, "vmiter::try_map mapping nonexistent pa");
   4216e:	49 83 ff ff          	cmp    $0xffffffffffffffff,%r15
   42172:	0f 84 b3 00 00 00    	je     4222b <vmiter::try_map(unsigned long, int)+0x11f>
        assert((pa & PTE_PAMASK) == pa, "vmiter::try_map pa not aligned");
   42178:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   4217f:	ff 0f 00 
   42182:	4c 21 f8             	and    %r15,%rax
   42185:	4c 39 f8             	cmp    %r15,%rax
   42188:	0f 85 b6 00 00 00    	jne    42244 <vmiter::try_map(unsigned long, int)+0x138>
    } else {
        assert((pa & PTE_P) == 0, "vmiter::try_map invalid pa");
    }
    // new permissions (`perm`) cannot be less restrictive than permissions
    // imposed by higher-level page tables (`perm_`)
    assert(!(perm & ~perm_ & (PTE_P | PTE_W | PTE_U)));
   4218e:	45 8b 6c 24 14       	mov    0x14(%r12),%r13d
   42193:	41 f7 d5             	not    %r13d
   42196:	45 21 f5             	and    %r14d,%r13d
   42199:	41 83 e5 07          	and    $0x7,%r13d
   4219d:	0f 85 dd 00 00 00    	jne    42280 <vmiter::try_map(unsigned long, int)+0x174>

    while (level_ > 0 && perm) {
   421a3:	41 8b 44 24 10       	mov    0x10(%r12),%eax
   421a8:	45 85 f6             	test   %r14d,%r14d
   421ab:	74 57                	je     42204 <vmiter::try_map(unsigned long, int)+0xf8>
   421ad:	85 c0                	test   %eax,%eax
   421af:	7e 53                	jle    42204 <vmiter::try_map(unsigned long, int)+0xf8>
        assert(!(*pep_ & PTE_P));
   421b1:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   421b6:	f6 00 01             	testb  $0x1,(%rax)
   421b9:	0f 85 da 00 00 00    	jne    42299 <vmiter::try_map(unsigned long, int)+0x18d>
        x86_64_pagetable* pt = (x86_64_pagetable*) kalloc(PAGESIZE);
   421bf:	bf 00 10 00 00       	mov    $0x1000,%edi
   421c4:	e8 9d e9 ff ff       	call   40b66 <kalloc(unsigned long)>
   421c9:	48 89 c3             	mov    %rax,%rbx
        if (!pt) {
   421cc:	48 85 c0             	test   %rax,%rax
   421cf:	0f 84 dd 00 00 00    	je     422b2 <vmiter::try_map(unsigned long, int)+0x1a6>
            return -1;
        }
        memset(pt, 0, PAGESIZE);
   421d5:	ba 00 10 00 00       	mov    $0x1000,%edx
   421da:	be 00 00 00 00       	mov    $0x0,%esi
   421df:	48 89 c7             	mov    %rax,%rdi
   421e2:	e8 2c 25 00 00       	call   44713 <memset>
        *pep_ = (uintptr_t) pt | PTE_P | PTE_W | PTE_U;
   421e7:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   421ec:	48 83 cb 07          	or     $0x7,%rbx
   421f0:	48 89 18             	mov    %rbx,(%rax)
        down();
   421f3:	4c 89 e7             	mov    %r12,%rdi
   421f6:	e8 61 fc ff ff       	call   41e5c <vmiter::down()>
    while (level_ > 0 && perm) {
   421fb:	41 8b 44 24 10       	mov    0x10(%r12),%eax
   42200:	85 c0                	test   %eax,%eax
   42202:	7f ad                	jg     421b1 <vmiter::try_map(unsigned long, int)+0xa5>
    }

    if (level_ == 0) {
   42204:	85 c0                	test   %eax,%eax
   42206:	75 11                	jne    42219 <vmiter::try_map(unsigned long, int)+0x10d>
        *pep_ = pa | perm;
   42208:	49 8b 54 24 08       	mov    0x8(%r12),%rdx
   4220d:	4d 63 f6             	movslq %r14d,%r14
   42210:	4d 09 fe             	or     %r15,%r14
   42213:	4c 89 32             	mov    %r14,(%rdx)
    }
    return 0;
   42216:	41 89 c5             	mov    %eax,%r13d
}
   42219:	44 89 e8             	mov    %r13d,%eax
   4221c:	48 83 c4 08          	add    $0x8,%rsp
   42220:	5b                   	pop    %rbx
   42221:	41 5c                	pop    %r12
   42223:	41 5d                	pop    %r13
   42225:	41 5e                	pop    %r14
   42227:	41 5f                	pop    %r15
   42229:	5d                   	pop    %rbp
   4222a:	c3                   	ret    
        assert(pa != (uintptr_t) -1, "vmiter::try_map mapping nonexistent pa");
   4222b:	b9 88 56 04 00       	mov    $0x45688,%ecx
   42230:	ba 1d 57 04 00       	mov    $0x4571d,%edx
   42235:	be 4c 00 00 00       	mov    $0x4c,%esi
   4223a:	bf 11 57 04 00       	mov    $0x45711,%edi
   4223f:	e8 ae 0a 00 00       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
        assert((pa & PTE_PAMASK) == pa, "vmiter::try_map pa not aligned");
   42244:	b9 b0 56 04 00       	mov    $0x456b0,%ecx
   42249:	ba 32 57 04 00       	mov    $0x45732,%edx
   4224e:	be 4d 00 00 00       	mov    $0x4d,%esi
   42253:	bf 11 57 04 00       	mov    $0x45711,%edi
   42258:	e8 95 0a 00 00       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
        assert((pa & PTE_P) == 0, "vmiter::try_map invalid pa");
   4225d:	41 f6 c7 01          	test   $0x1,%r15b
   42261:	0f 84 27 ff ff ff    	je     4218e <vmiter::try_map(unsigned long, int)+0x82>
   42267:	b9 4a 57 04 00       	mov    $0x4574a,%ecx
   4226c:	ba 65 57 04 00       	mov    $0x45765,%edx
   42271:	be 4f 00 00 00       	mov    $0x4f,%esi
   42276:	bf 11 57 04 00       	mov    $0x45711,%edi
   4227b:	e8 72 0a 00 00       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
    assert(!(perm & ~perm_ & (PTE_P | PTE_W | PTE_U)));
   42280:	b9 00 00 00 00       	mov    $0x0,%ecx
   42285:	ba d0 56 04 00       	mov    $0x456d0,%edx
   4228a:	be 53 00 00 00       	mov    $0x53,%esi
   4228f:	bf 11 57 04 00       	mov    $0x45711,%edi
   42294:	e8 59 0a 00 00       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
        assert(!(*pep_ & PTE_P));
   42299:	b9 00 00 00 00       	mov    $0x0,%ecx
   4229e:	ba 77 57 04 00       	mov    $0x45777,%edx
   422a3:	be 56 00 00 00       	mov    $0x56,%esi
   422a8:	bf 11 57 04 00       	mov    $0x45711,%edi
   422ad:	e8 40 0a 00 00       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
            return -1;
   422b2:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   422b8:	e9 5c ff ff ff       	jmp    42219 <vmiter::try_map(unsigned long, int)+0x10d>
   422bd:	90                   	nop

00000000000422be <ptiter::down(bool)>:
ptiter::ptiter(x86_64_pagetable* pt)
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), va_(0) {
    down(false);
}

void ptiter::down(bool skip) {
   422be:	f3 0f 1e fa          	endbr64 
   422c2:	55                   	push   %rbp
   422c3:	48 89 e5             	mov    %rsp,%rbp
   422c6:	41 55                	push   %r13
   422c8:	41 54                	push   %r12
   422ca:	53                   	push   %rbx
    int stop_level = 1;
   422cb:	41 bd 01 00 00 00    	mov    $0x1,%r13d
   422d1:	41 ba 01 00 00 00    	mov    $0x1,%r10d
        if ((*pep_ & (PTE_P | PTE_PS)) == PTE_P && !skip) {
            if (level_ == stop_level) {
                break;
            } else {
                --level_;
                uintptr_t pa = *pep_ & PTE_PAMASK;
   422d7:	48 bb 00 f0 ff ff ff 	movabs $0xffffffffff000,%rbx
   422de:	ff 0f 00 
                // up one level
                if (level_ == 3) {
                    va_ = VA_NONCANONMAX + 1;
                    return;
                }
                stop_level = level_ + 1;
   422e1:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   422e7:	eb 53                	jmp    4233c <ptiter::down(bool)+0x7e>
            if (level_ == stop_level) {
   422e9:	8b 47 10             	mov    0x10(%rdi),%eax
   422ec:	44 39 e8             	cmp    %r13d,%eax
   422ef:	74 35                	je     42326 <ptiter::down(bool)+0x68>
                --level_;
   422f1:	83 e8 01             	sub    $0x1,%eax
   422f4:	89 47 10             	mov    %eax,0x10(%rdi)
                uintptr_t pa = *pep_ & PTE_PAMASK;
   422f7:	48 89 da             	mov    %rbx,%rdx
   422fa:	49 23 14 24          	and    (%r12),%rdx
    return (int) (addr >> (PAGEOFFBITS + level * PAGEINDEXBITS)) & 0x1FF;
   422fe:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   42302:	48 8b 47 18          	mov    0x18(%rdi),%rax
   42306:	48 d3 e8             	shr    %cl,%rax
                pep_ = &pt->entry[pageindex(va_, level_)];
   42309:	25 ff 01 00 00       	and    $0x1ff,%eax
   4230e:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
   42312:	48 89 47 08          	mov    %rax,0x8(%rdi)
        } else {
   42316:	eb 21                	jmp    42339 <ptiter::down(bool)+0x7b>
                    va_ = VA_NONCANONMAX + 1;
   42318:	48 b8 00 00 00 00 00 	movabs $0x1000000000000,%rax
   4231f:	00 01 00 
   42322:	48 89 47 18          	mov    %rax,0x18(%rdi)
                va_ = va;
            }
            skip = false;
        }
    }
}
   42326:	5b                   	pop    %rbx
   42327:	41 5c                	pop    %r12
   42329:	41 5d                	pop    %r13
   4232b:	5d                   	pop    %rbp
   4232c:	c3                   	ret    
                ++pep_;
   4232d:	49 83 c4 08          	add    $0x8,%r12
   42331:	4c 89 67 08          	mov    %r12,0x8(%rdi)
                va_ = va;
   42335:	48 89 47 18          	mov    %rax,0x18(%rdi)
                stop_level = level_ + 1;
   42339:	44 89 de             	mov    %r11d,%esi
        if ((*pep_ & (PTE_P | PTE_PS)) == PTE_P && !skip) {
   4233c:	4c 8b 67 08          	mov    0x8(%rdi),%r12
   42340:	49 8b 04 24          	mov    (%r12),%rax
   42344:	25 81 00 00 00       	and    $0x81,%eax
   42349:	48 83 f8 01          	cmp    $0x1,%rax
   4234d:	75 05                	jne    42354 <ptiter::down(bool)+0x96>
   4234f:	40 84 f6             	test   %sil,%sil
   42352:	74 95                	je     422e9 <ptiter::down(bool)+0x2b>
            uintptr_t va = (va_ | pageoffmask(level_)) + 1;
   42354:	48 8b 77 18          	mov    0x18(%rdi),%rsi
   42358:	44 8b 4f 10          	mov    0x10(%rdi),%r9d
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   4235c:	47 8d 04 c9          	lea    (%r9,%r9,8),%r8d
   42360:	41 8d 48 0c          	lea    0xc(%r8),%ecx
   42364:	4c 89 d2             	mov    %r10,%rdx
   42367:	48 d3 e2             	shl    %cl,%rdx
   4236a:	48 83 ea 01          	sub    $0x1,%rdx
   4236e:	48 09 f2             	or     %rsi,%rdx
   42371:	48 8d 42 01          	lea    0x1(%rdx),%rax
            if ((va ^ va_) & ~pageoffmask(level_ + 1)) {
   42375:	41 8d 51 01          	lea    0x1(%r9),%edx
   42379:	41 8d 48 15          	lea    0x15(%r8),%ecx
   4237d:	4d 89 d0             	mov    %r10,%r8
   42380:	49 d3 e0             	shl    %cl,%r8
   42383:	4c 89 c1             	mov    %r8,%rcx
   42386:	48 f7 d9             	neg    %rcx
   42389:	49 89 f0             	mov    %rsi,%r8
   4238c:	49 31 c0             	xor    %rax,%r8
   4238f:	4c 85 c1             	test   %r8,%rcx
   42392:	74 99                	je     4232d <ptiter::down(bool)+0x6f>
                if (level_ == 3) {
   42394:	41 83 f9 03          	cmp    $0x3,%r9d
   42398:	0f 84 7a ff ff ff    	je     42318 <ptiter::down(bool)+0x5a>
                level_ = 3;
   4239e:	c7 47 10 03 00 00 00 	movl   $0x3,0x10(%rdi)
                pep_ = &pt_->entry[pageindex(va_, level_)];
   423a5:	48 89 f0             	mov    %rsi,%rax
   423a8:	48 c1 e8 24          	shr    $0x24,%rax
   423ac:	25 f8 0f 00 00       	and    $0xff8,%eax
   423b1:	48 03 07             	add    (%rdi),%rax
   423b4:	48 89 47 08          	mov    %rax,0x8(%rdi)
                stop_level = level_ + 1;
   423b8:	41 89 d5             	mov    %edx,%r13d
   423bb:	e9 79 ff ff ff       	jmp    42339 <ptiter::down(bool)+0x7b>

00000000000423c0 <ptiter::ptiter(x86_64_pagetable*)>:
ptiter::ptiter(x86_64_pagetable* pt)
   423c0:	f3 0f 1e fa          	endbr64 
   423c4:	55                   	push   %rbp
   423c5:	48 89 e5             	mov    %rsp,%rbp
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), va_(0) {
   423c8:	48 89 37             	mov    %rsi,(%rdi)
   423cb:	48 89 77 08          	mov    %rsi,0x8(%rdi)
   423cf:	c7 47 10 03 00 00 00 	movl   $0x3,0x10(%rdi)
   423d6:	48 c7 47 18 00 00 00 	movq   $0x0,0x18(%rdi)
   423dd:	00 
    down(false);
   423de:	be 00 00 00 00       	mov    $0x0,%esi
   423e3:	e8 d6 fe ff ff       	call   422be <ptiter::down(bool)>
}
   423e8:	5d                   	pop    %rbp
   423e9:	c3                   	ret    

00000000000423ea <(anonymous namespace)::log_printer::putc(unsigned char, int)>:
         | IO_PARALLEL_CONTROL_INIT);
}

namespace {
struct log_printer : public printer {
    void putc(unsigned char c, int) override {
   423ea:	f3 0f 1e fa          	endbr64 
   423ee:	41 89 f0             	mov    %esi,%r8d
    if (!initialized) {
   423f1:	83 3d 0c dc 01 00 00 	cmpl   $0x0,0x1dc0c(%rip)        # 60004 <parallel_port_putc(unsigned char)::initialized>
   423f8:	75 15                	jne    4240f <(anonymous namespace)::log_printer::putc(unsigned char, int)+0x25>
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
   423fa:	b8 00 00 00 00       	mov    $0x0,%eax
   423ff:	ba 7a 03 00 00       	mov    $0x37a,%edx
   42404:	ee                   	out    %al,(%dx)
        initialized = 1;
   42405:	c7 05 f5 db 01 00 01 	movl   $0x1,0x1dbf5(%rip)        # 60004 <parallel_port_putc(unsigned char)::initialized>
   4240c:	00 00 00 
    asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
   4240f:	ba 79 03 00 00       	mov    $0x379,%edx
   42414:	ec                   	in     (%dx),%al
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   42415:	be 00 32 00 00       	mov    $0x3200,%esi
   4241a:	b9 84 00 00 00       	mov    $0x84,%ecx
   4241f:	bf 79 03 00 00       	mov    $0x379,%edi
   42424:	84 c0                	test   %al,%al
   42426:	78 12                	js     4243a <(anonymous namespace)::log_printer::putc(unsigned char, int)+0x50>
   42428:	89 ca                	mov    %ecx,%edx
   4242a:	ec                   	in     (%dx),%al
   4242b:	ec                   	in     (%dx),%al
   4242c:	ec                   	in     (%dx),%al
   4242d:	ec                   	in     (%dx),%al
   4242e:	83 ee 01             	sub    $0x1,%esi
   42431:	74 07                	je     4243a <(anonymous namespace)::log_printer::putc(unsigned char, int)+0x50>
   42433:	89 fa                	mov    %edi,%edx
   42435:	ec                   	in     (%dx),%al
   42436:	84 c0                	test   %al,%al
   42438:	79 ee                	jns    42428 <(anonymous namespace)::log_printer::putc(unsigned char, int)+0x3e>
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
   4243a:	ba 78 03 00 00       	mov    $0x378,%edx
   4243f:	44 89 c0             	mov    %r8d,%eax
   42442:	ee                   	out    %al,(%dx)
   42443:	ba 7a 03 00 00       	mov    $0x37a,%edx
   42448:	b8 0d 00 00 00       	mov    $0xd,%eax
   4244d:	ee                   	out    %al,(%dx)
   4244e:	b8 0c 00 00 00       	mov    $0xc,%eax
   42453:	ee                   	out    %al,(%dx)
        parallel_port_putc(c);
    }
   42454:	c3                   	ret    

0000000000042455 <stash_kernel_data(bool)>:

// stash_kernel_data
//    Soft reboot requires that we restore kernel data memory to
//    its initial state, so we store its initial state in unused
//    physical memory.
static void stash_kernel_data(bool reboot) {
   42455:	55                   	push   %rbp
   42456:	48 89 e5             	mov    %rsp,%rbp
   42459:	89 f8                	mov    %edi,%eax
    // stash initial value of data segment for soft-reboot support
    extern uint8_t _data_start[], _edata[], _kernel_end[];
    uintptr_t data_size = (uintptr_t) _edata - (uintptr_t) _data_start;
   4245b:	ba 30 80 05 00       	mov    $0x58030,%edx
   42460:	48 81 ea 00 70 04 00 	sub    $0x47000,%rdx
    uint8_t* data_stash = (uint8_t*) (SYMTAB_ADDR - data_size);
   42467:	bf 00 70 04 01       	mov    $0x1047000,%edi
   4246c:	48 81 ef 30 80 05 00 	sub    $0x58030,%rdi
    if (reboot) {
   42473:	84 c0                	test   %al,%al
   42475:	74 2a                	je     424a1 <stash_kernel_data(bool)+0x4c>
        memcpy(_data_start, data_stash, data_size);
   42477:	48 89 fe             	mov    %rdi,%rsi
   4247a:	bf 00 70 04 00       	mov    $0x47000,%edi
   4247f:	e8 6b 22 00 00       	call   446ef <memcpy>
        memset(_edata, 0, _kernel_end - _edata);
   42484:	ba b0 01 06 00       	mov    $0x601b0,%edx
   42489:	48 81 ea 30 80 05 00 	sub    $0x58030,%rdx
   42490:	be 00 00 00 00       	mov    $0x0,%esi
   42495:	bf 30 80 05 00       	mov    $0x58030,%edi
   4249a:	e8 74 22 00 00       	call   44713 <memset>
    } else {
        memcpy(data_stash, _data_start, data_size);
    }
}
   4249f:	5d                   	pop    %rbp
   424a0:	c3                   	ret    
        memcpy(data_stash, _data_start, data_size);
   424a1:	be 00 70 04 00       	mov    $0x47000,%esi
   424a6:	e8 44 22 00 00       	call   446ef <memcpy>
}
   424ab:	eb f2                	jmp    4249f <stash_kernel_data(bool)+0x4a>

00000000000424ad <init_timer(int)>:
void init_timer(int rate) {
   424ad:	f3 0f 1e fa          	endbr64 
    if (rate > 0) {
   424b1:	85 ff                	test   %edi,%edi
   424b3:	7e 12                	jle    424c7 <init_timer(int)+0x1a>
        lapic.write(lapic.reg_timer_initial_count, 1000000000 / rate);
   424b5:	b8 00 ca 9a 3b       	mov    $0x3b9aca00,%eax
   424ba:	99                   	cltd   
   424bb:	f7 ff                	idiv   %edi
   424bd:	a3 80 03 e0 fe 00 00 	movabs %eax,0xfee00380
   424c4:	00 00 
}
   424c6:	c3                   	ret    
    reg_[reg].v = v;
   424c7:	b8 80 03 e0 fe       	mov    $0xfee00380,%eax
   424cc:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
}
   424d2:	c3                   	ret    

00000000000424d3 <kalloc_pagetable()>:
x86_64_pagetable* kalloc_pagetable() {
   424d3:	f3 0f 1e fa          	endbr64 
   424d7:	55                   	push   %rbp
   424d8:	48 89 e5             	mov    %rsp,%rbp
   424db:	53                   	push   %rbx
   424dc:	48 83 ec 08          	sub    $0x8,%rsp
    x86_64_pagetable* pt = reinterpret_cast<x86_64_pagetable*>(kalloc(PAGESIZE));
   424e0:	bf 00 10 00 00       	mov    $0x1000,%edi
   424e5:	e8 7c e6 ff ff       	call   40b66 <kalloc(unsigned long)>
   424ea:	48 89 c3             	mov    %rax,%rbx
    if (pt) {
   424ed:	48 85 c0             	test   %rax,%rax
   424f0:	74 12                	je     42504 <kalloc_pagetable()+0x31>
        memset(&pt->entry[0], 0, sizeof(x86_64_pageentry_t) * 512);
   424f2:	ba 00 10 00 00       	mov    $0x1000,%edx
   424f7:	be 00 00 00 00       	mov    $0x0,%esi
   424fc:	48 89 c7             	mov    %rax,%rdi
   424ff:	e8 0f 22 00 00       	call   44713 <memset>
}
   42504:	48 89 d8             	mov    %rbx,%rax
   42507:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   4250b:	c9                   	leave  
   4250c:	c3                   	ret    

000000000004250d <reserved_physical_address(unsigned long)>:
bool reserved_physical_address(uintptr_t pa) {
   4250d:	f3 0f 1e fa          	endbr64 
    return pa < PAGESIZE || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   42511:	48 8d 87 00 00 f6 ff 	lea    -0xa0000(%rdi),%rax
   42518:	48 3d ff ff 05 00    	cmp    $0x5ffff,%rax
   4251e:	0f 96 c0             	setbe  %al
   42521:	48 81 ff ff 0f 00 00 	cmp    $0xfff,%rdi
   42528:	0f 96 c2             	setbe  %dl
   4252b:	09 d0                	or     %edx,%eax
}
   4252d:	c3                   	ret    

000000000004252e <allocatable_physical_address(unsigned long)>:
bool allocatable_physical_address(uintptr_t pa) {
   4252e:	f3 0f 1e fa          	endbr64 
   42532:	55                   	push   %rbp
   42533:	48 89 e5             	mov    %rsp,%rbp
   42536:	53                   	push   %rbx
   42537:	48 83 ec 08          	sub    $0x8,%rsp
   4253b:	48 89 fb             	mov    %rdi,%rbx
    return !reserved_physical_address(pa)
   4253e:	e8 ca ff ff ff       	call   4250d <reserved_physical_address(unsigned long)>
        && pa < MEMSIZE_PHYSICAL;
   42543:	84 c0                	test   %al,%al
   42545:	75 38                	jne    4257f <allocatable_physical_address(unsigned long)+0x51>
        && (pa < KERNEL_START_ADDR
   42547:	48 81 fb ff ff 03 00 	cmp    $0x3ffff,%rbx
   4254e:	76 11                	jbe    42561 <allocatable_physical_address(unsigned long)+0x33>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
   42550:	ba af 11 06 00       	mov    $0x611af,%edx
            || pa >= round_up((uintptr_t) _kernel_end, PAGESIZE))
   42555:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
   4255c:	48 39 d3             	cmp    %rdx,%rbx
   4255f:	72 23                	jb     42584 <allocatable_physical_address(unsigned long)+0x56>
            || pa >= KERNEL_STACK_TOP)
   42561:	48 8d 83 00 10 f8 ff 	lea    -0x7f000(%rbx),%rax
        && (pa < KERNEL_STACK_TOP - PAGESIZE
   42568:	48 3d ff 0f 00 00    	cmp    $0xfff,%rax
   4256e:	0f 97 c0             	seta   %al
        && pa < MEMSIZE_PHYSICAL;
   42571:	48 81 fb ff ff 1f 00 	cmp    $0x1fffff,%rbx
   42578:	0f 96 c2             	setbe  %dl
   4257b:	21 d0                	and    %edx,%eax
   4257d:	eb 05                	jmp    42584 <allocatable_physical_address(unsigned long)+0x56>
   4257f:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42584:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42588:	c9                   	leave  
   42589:	c3                   	ret    

000000000004258a <init_process(proc*, int)>:
void init_process(proc* p, int flags) {
   4258a:	f3 0f 1e fa          	endbr64 
   4258e:	55                   	push   %rbp
   4258f:	48 89 e5             	mov    %rsp,%rbp
   42592:	41 54                	push   %r12
   42594:	53                   	push   %rbx
   42595:	48 89 fb             	mov    %rdi,%rbx
   42598:	41 89 f4             	mov    %esi,%r12d
    memset(&p->regs, 0, sizeof(p->regs));
   4259b:	48 8d 7f 10          	lea    0x10(%rdi),%rdi
   4259f:	ba c0 00 00 00       	mov    $0xc0,%edx
   425a4:	be 00 00 00 00       	mov    $0x0,%esi
   425a9:	e8 65 21 00 00       	call   44713 <memset>
    p->regs.reg_cs = SEGSEL_APP_CODE | 3;
   425ae:	48 c7 83 b0 00 00 00 	movq   $0x1b,0xb0(%rbx)
   425b5:	1b 00 00 00 
    p->regs.reg_fs = SEGSEL_APP_DATA | 3;
   425b9:	48 c7 83 88 00 00 00 	movq   $0x23,0x88(%rbx)
   425c0:	23 00 00 00 
    p->regs.reg_gs = SEGSEL_APP_DATA | 3;
   425c4:	48 c7 83 90 00 00 00 	movq   $0x23,0x90(%rbx)
   425cb:	23 00 00 00 
    p->regs.reg_ss = SEGSEL_APP_DATA | 3;
   425cf:	48 c7 83 c8 00 00 00 	movq   $0x23,0xc8(%rbx)
   425d6:	23 00 00 00 
    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   425da:	44 89 e0             	mov    %r12d,%eax
   425dd:	83 e0 01             	and    $0x1,%eax
        p->regs.reg_rflags |= EFLAGS_IOPL_3;
   425e0:	83 f8 01             	cmp    $0x1,%eax
   425e3:	48 19 c0             	sbb    %rax,%rax
   425e6:	48 25 00 d0 ff ff    	and    $0xffffffffffffd000,%rax
   425ec:	48 05 00 32 00 00    	add    $0x3200,%rax
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   425f2:	41 f6 c4 02          	test   $0x2,%r12b
   425f6:	75 09                	jne    42601 <init_process(proc*, int)+0x77>
   425f8:	48 89 83 b8 00 00 00 	mov    %rax,0xb8(%rbx)
   425ff:	eb 0a                	jmp    4260b <init_process(proc*, int)+0x81>
        p->regs.reg_rflags &= ~EFLAGS_IF;
   42601:	80 e4 fd             	and    $0xfd,%ah
   42604:	48 89 83 b8 00 00 00 	mov    %rax,0xb8(%rbx)
}
   4260b:	5b                   	pop    %rbx
   4260c:	41 5c                	pop    %r12
   4260e:	5d                   	pop    %rbp
   4260f:	c3                   	ret    

0000000000042610 <console_show_cursor(int)>:
void console_show_cursor(int cpos) {
   42610:	f3 0f 1e fa          	endbr64 
        cpos = 0;
   42614:	81 ff d1 07 00 00    	cmp    $0x7d1,%edi
   4261a:	b8 00 00 00 00       	mov    $0x0,%eax
   4261f:	0f 43 f8             	cmovae %eax,%edi
   42622:	be d4 03 00 00       	mov    $0x3d4,%esi
   42627:	b8 0e 00 00 00       	mov    $0xe,%eax
   4262c:	89 f2                	mov    %esi,%edx
   4262e:	ee                   	out    %al,(%dx)
    outb(0x3D5, cpos / 256);
   4262f:	8d 87 ff 00 00 00    	lea    0xff(%rdi),%eax
   42635:	85 ff                	test   %edi,%edi
   42637:	0f 49 c7             	cmovns %edi,%eax
   4263a:	c1 f8 08             	sar    $0x8,%eax
   4263d:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
   42642:	89 ca                	mov    %ecx,%edx
   42644:	ee                   	out    %al,(%dx)
   42645:	b8 0f 00 00 00       	mov    $0xf,%eax
   4264a:	89 f2                	mov    %esi,%edx
   4264c:	ee                   	out    %al,(%dx)
    outb(0x3D5, cpos % 256);
   4264d:	89 fa                	mov    %edi,%edx
   4264f:	c1 fa 1f             	sar    $0x1f,%edx
   42652:	c1 ea 18             	shr    $0x18,%edx
   42655:	8d 04 17             	lea    (%rdi,%rdx,1),%eax
   42658:	0f b6 c0             	movzbl %al,%eax
   4265b:	29 d0                	sub    %edx,%eax
   4265d:	89 ca                	mov    %ecx,%edx
   4265f:	ee                   	out    %al,(%dx)
}
   42660:	c3                   	ret    

0000000000042661 <keyboard_readc()>:
int keyboard_readc() {
   42661:	f3 0f 1e fa          	endbr64 
    asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
   42665:	ba 64 00 00 00       	mov    $0x64,%edx
   4266a:	ec                   	in     (%dx),%al
    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   4266b:	a8 01                	test   $0x1,%al
   4266d:	0f 84 1d 01 00 00    	je     42790 <keyboard_readc()+0x12f>
   42673:	ba 60 00 00 00       	mov    $0x60,%edx
   42678:	ec                   	in     (%dx),%al
    uint8_t escape = last_escape;
   42679:	0f b6 15 88 d9 01 00 	movzbl 0x1d988(%rip),%edx        # 60008 <keyboard_readc()::last_escape>
    last_escape = 0;
   42680:	c6 05 81 d9 01 00 00 	movb   $0x0,0x1d981(%rip)        # 60008 <keyboard_readc()::last_escape>
    if (data == 0xE0) {         // mode shift
   42687:	3c e0                	cmp    $0xe0,%al
   42689:	74 2a                	je     426b5 <keyboard_readc()+0x54>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   4268b:	84 c0                	test   %al,%al
   4268d:	78 33                	js     426c2 <keyboard_readc()+0x61>
    int ch = (unsigned char) keymap[data | escape];
   4268f:	09 c2                	or     %eax,%edx
   42691:	0f b6 d2             	movzbl %dl,%edx
   42694:	0f b6 82 e0 5b 04 00 	movzbl 0x45be0(%rdx),%eax
    if (ch >= 'a' && ch <= 'z') {
   4269b:	89 c1                	mov    %eax,%ecx
   4269d:	8d 50 9f             	lea    -0x61(%rax),%edx
   426a0:	83 fa 19             	cmp    $0x19,%edx
   426a3:	77 76                	ja     4271b <keyboard_readc()+0xba>
        if (modifiers & MOD_CONTROL) {
   426a5:	0f b6 15 5d d9 01 00 	movzbl 0x1d95d(%rip),%edx        # 60009 <keyboard_readc()::modifiers>
   426ac:	f6 c2 02             	test   $0x2,%dl
   426af:	74 50                	je     42701 <keyboard_readc()+0xa0>
            ch -= 0x60;
   426b1:	83 e8 60             	sub    $0x60,%eax
   426b4:	c3                   	ret    
        last_escape = 0x80;
   426b5:	c6 05 4c d9 01 00 80 	movb   $0x80,0x1d94c(%rip)        # 60008 <keyboard_readc()::last_escape>
        return 0;
   426bc:	b8 00 00 00 00       	mov    $0x0,%eax
   426c1:	c3                   	ret    
        int ch = keymap[(data & 0x7F) | escape];
   426c2:	83 e0 7f             	and    $0x7f,%eax
   426c5:	09 d0                	or     %edx,%eax
   426c7:	0f b6 c0             	movzbl %al,%eax
   426ca:	0f b6 88 e0 5b 04 00 	movzbl 0x45be0(%rax),%ecx
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   426d1:	0f b6 d1             	movzbl %cl,%edx
   426d4:	81 ea fa 00 00 00    	sub    $0xfa,%edx
        return 0;
   426da:	b8 00 00 00 00       	mov    $0x0,%eax
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   426df:	83 fa 02             	cmp    $0x2,%edx
   426e2:	0f 87 ad 00 00 00    	ja     42795 <keyboard_readc()+0x134>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   426e8:	83 c1 06             	add    $0x6,%ecx
   426eb:	0f b6 05 17 d9 01 00 	movzbl 0x1d917(%rip),%eax        # 60009 <keyboard_readc()::modifiers>
   426f2:	0f b3 c8             	btr    %ecx,%eax
   426f5:	88 05 0e d9 01 00    	mov    %al,0x1d90e(%rip)        # 60009 <keyboard_readc()::modifiers>
        return 0;
   426fb:	b8 00 00 00 00       	mov    $0x0,%eax
   42700:	c3                   	ret    
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   42701:	89 d1                	mov    %edx,%ecx
   42703:	83 f1 01             	xor    $0x1,%ecx
   42706:	83 e1 01             	and    $0x1,%ecx
   42709:	c0 ea 03             	shr    $0x3,%dl
   4270c:	83 f2 01             	xor    $0x1,%edx
   4270f:	83 e2 01             	and    $0x1,%edx
            ch -= 0x20;
   42712:	8d 70 e0             	lea    -0x20(%rax),%esi
   42715:	38 d1                	cmp    %dl,%cl
   42717:	0f 45 c6             	cmovne %esi,%eax
   4271a:	c3                   	ret    
    } else if (ch >= KEY_CAPSLOCK) {
   4271b:	3d fc 00 00 00       	cmp    $0xfc,%eax
   42720:	7e 19                	jle    4273b <keyboard_readc()+0xda>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   42722:	8d 88 06 ff ff ff    	lea    -0xfa(%rax),%ecx
   42728:	ba 01 00 00 00       	mov    $0x1,%edx
   4272d:	d3 e2                	shl    %cl,%edx
   4272f:	30 15 d4 d8 01 00    	xor    %dl,0x1d8d4(%rip)        # 60009 <keyboard_readc()::modifiers>
        ch = 0;
   42735:	b8 00 00 00 00       	mov    $0x0,%eax
   4273a:	c3                   	ret    
    } else if (ch >= KEY_SHIFT) {
   4273b:	3d f9 00 00 00       	cmp    $0xf9,%eax
   42740:	7e 19                	jle    4275b <keyboard_readc()+0xfa>
        modifiers |= 1 << (ch - KEY_SHIFT);
   42742:	8d 88 06 ff ff ff    	lea    -0xfa(%rax),%ecx
   42748:	ba 01 00 00 00       	mov    $0x1,%edx
   4274d:	d3 e2                	shl    %cl,%edx
   4274f:	08 15 b4 d8 01 00    	or     %dl,0x1d8b4(%rip)        # 60009 <keyboard_readc()::modifiers>
        ch = 0;
   42755:	b8 00 00 00 00       	mov    $0x0,%eax
   4275a:	c3                   	ret    
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   4275b:	83 c1 80             	add    $0xffffff80,%ecx
   4275e:	83 f9 15             	cmp    $0x15,%ecx
   42761:	77 18                	ja     4277b <keyboard_readc()+0x11a>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   42763:	0f b6 15 9f d8 01 00 	movzbl 0x1d89f(%rip),%edx        # 60009 <keyboard_readc()::modifiers>
   4276a:	83 e2 03             	and    $0x3,%edx
   4276d:	83 c0 80             	add    $0xffffff80,%eax
   42770:	48 98                	cltq   
   42772:	0f b6 84 82 80 5b 04 	movzbl 0x45b80(%rdx,%rax,4),%eax
   42779:	00 
   4277a:	c3                   	ret    
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   4277b:	83 f8 7f             	cmp    $0x7f,%eax
   4277e:	7f 15                	jg     42795 <keyboard_readc()+0x134>
        ch = 0;
   42780:	f6 05 82 d8 01 00 02 	testb  $0x2,0x1d882(%rip)        # 60009 <keyboard_readc()::modifiers>
   42787:	ba 00 00 00 00       	mov    $0x0,%edx
   4278c:	0f 45 c2             	cmovne %edx,%eax
   4278f:	c3                   	ret    
        return -1;
   42790:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   42795:	c3                   	ret    

0000000000042796 <log_vprintf(char const*, __va_list_tag*)>:
void log_vprintf(const char* format, va_list val) {
   42796:	f3 0f 1e fa          	endbr64 
   4279a:	55                   	push   %rbp
   4279b:	48 89 e5             	mov    %rsp,%rbp
   4279e:	48 83 ec 10          	sub    $0x10,%rsp
   427a2:	48 89 fa             	mov    %rdi,%rdx
   427a5:	48 89 f1             	mov    %rsi,%rcx
    log_printer p;
   427a8:	48 c7 45 f8 70 5b 04 	movq   $0x45b70,-0x8(%rbp)
   427af:	00 
    p.vprintf(0, format, val);
   427b0:	be 00 00 00 00       	mov    $0x0,%esi
   427b5:	48 8d 7d f8          	lea    -0x8(%rbp),%rdi
   427b9:	e8 88 20 00 00       	call   44846 <printer::vprintf(int, char const*, __va_list_tag*)>
}
   427be:	c9                   	leave  
   427bf:	c3                   	ret    

00000000000427c0 <log_printf(char const*, ...)>:
void log_printf(const char* format, ...) {
   427c0:	f3 0f 1e fa          	endbr64 
   427c4:	55                   	push   %rbp
   427c5:	48 89 e5             	mov    %rsp,%rbp
   427c8:	48 83 ec 50          	sub    $0x50,%rsp
   427cc:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   427d0:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   427d4:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   427d8:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   427dc:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   427e0:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   427e7:	48 8d 45 10          	lea    0x10(%rbp),%rax
   427eb:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   427ef:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   427f3:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   427f7:	48 8d 75 b8          	lea    -0x48(%rbp),%rsi
   427fb:	e8 96 ff ff ff       	call   42796 <log_vprintf(char const*, __va_list_tag*)>
}
   42800:	c9                   	leave  
   42801:	c3                   	ret    

0000000000042802 <lookup_symbol(unsigned long, char const**, unsigned long*)>:
bool lookup_symbol(uintptr_t addr, const char** name, uintptr_t* start) {
   42802:	f3 0f 1e fa          	endbr64 
   42806:	55                   	push   %rbp
   42807:	48 89 e5             	mov    %rsp,%rbp
   4280a:	41 54                	push   %r12
   4280c:	53                   	push   %rbx
   4280d:	48 89 f3             	mov    %rsi,%rbx
   42810:	49 89 d4             	mov    %rdx,%r12
    if (!kernel_pagetable[2].entry[SYMTAB_ADDR / 0x200000]) {
   42813:	48 83 3d 25 a8 01 00 	cmpq   $0x0,0x1a825(%rip)        # 5d040 <kernel_pagetable+0x2040>
   4281a:	00 
   4281b:	75 0b                	jne    42828 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x26>
        kernel_pagetable[2].entry[SYMTAB_ADDR / 0x200000] =
   4281d:	48 c7 05 18 a8 01 00 	movq   $0x1000083,0x1a818(%rip)        # 5d040 <kernel_pagetable+0x2040>
   42824:	83 00 00 01 
    size_t r = symtab.nsym;
   42828:	4c 8b 1d 79 48 00 00 	mov    0x4879(%rip),%r11        # 470a8 <symtab+0x8>
        auto& sym = symtab.sym[m];
   4282f:	4c 8b 15 6a 48 00 00 	mov    0x486a(%rip),%r10        # 470a0 <symtab>
    size_t r = symtab.nsym;
   42836:	4c 89 de             	mov    %r11,%rsi
    size_t l = 0;
   42839:	b9 00 00 00 00       	mov    $0x0,%ecx
    while (l < r) {
   4283e:	eb 25                	jmp    42865 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x63>
                ? addr < sym.st_value + 0x1000
   42840:	4c 8d 8a 00 10 00 00 	lea    0x1000(%rdx),%r9
            && (m + 1 == symtab.nsym
   42847:	49 39 f9             	cmp    %rdi,%r9
   4284a:	76 11                	jbe    4285d <lookup_symbol(unsigned long, char const**, unsigned long*)+0x5b>
            && (sym.st_size == 0 || addr <= sym.st_value + sym.st_size)) {
   4284c:	4d 8b 48 10          	mov    0x10(%r8),%r9
   42850:	4d 85 c9             	test   %r9,%r9
   42853:	74 43                	je     42898 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x96>
   42855:	49 01 d1             	add    %rdx,%r9
   42858:	49 39 f9             	cmp    %rdi,%r9
   4285b:	73 3b                	jae    42898 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x96>
        } else if (sym.st_value < addr) {
   4285d:	48 39 fa             	cmp    %rdi,%rdx
   42860:	72 6b                	jb     428cd <lookup_symbol(unsigned long, char const**, unsigned long*)+0xcb>
        size_t m = l + ((r - l) >> 1);
   42862:	48 89 c6             	mov    %rax,%rsi
    while (l < r) {
   42865:	48 39 f1             	cmp    %rsi,%rcx
   42868:	73 69                	jae    428d3 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xd1>
        size_t m = l + ((r - l) >> 1);
   4286a:	48 89 f0             	mov    %rsi,%rax
   4286d:	48 29 c8             	sub    %rcx,%rax
   42870:	48 d1 e8             	shr    %rax
   42873:	48 01 c8             	add    %rcx,%rax
        auto& sym = symtab.sym[m];
   42876:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   4287a:	4d 8d 04 d2          	lea    (%r10,%rdx,8),%r8
        if (sym.st_value <= addr
   4287e:	49 8b 50 08          	mov    0x8(%r8),%rdx
   42882:	48 39 fa             	cmp    %rdi,%rdx
   42885:	77 d6                	ja     4285d <lookup_symbol(unsigned long, char const**, unsigned long*)+0x5b>
            && (m + 1 == symtab.nsym
   42887:	4c 8d 48 01          	lea    0x1(%rax),%r9
        if (sym.st_value <= addr
   4288b:	4d 39 d9             	cmp    %r11,%r9
   4288e:	74 b0                	je     42840 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x3e>
                ? addr < sym.st_value + 0x1000
   42890:	49 39 78 20          	cmp    %rdi,0x20(%r8)
   42894:	76 c7                	jbe    4285d <lookup_symbol(unsigned long, char const**, unsigned long*)+0x5b>
   42896:	eb b4                	jmp    4284c <lookup_symbol(unsigned long, char const**, unsigned long*)+0x4a>
                return false;
   42898:	b8 00 00 00 00       	mov    $0x0,%eax
            if (!sym.st_value) {
   4289d:	48 85 d2             	test   %rdx,%rdx
   428a0:	74 36                	je     428d8 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xd6>
            if (name) {
   428a2:	48 85 db             	test   %rbx,%rbx
   428a5:	74 0d                	je     428b4 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xb2>
                *name = symtab.strtab + sym.st_name;
   428a7:	41 8b 00             	mov    (%r8),%eax
   428aa:	48 03 05 ff 47 00 00 	add    0x47ff(%rip),%rax        # 470b0 <symtab+0x10>
   428b1:	48 89 03             	mov    %rax,(%rbx)
            return true;
   428b4:	b8 01 00 00 00       	mov    $0x1,%eax
            if (start) {
   428b9:	4d 85 e4             	test   %r12,%r12
   428bc:	74 1a                	je     428d8 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xd6>
                *start = sym.st_value;
   428be:	49 8b 40 08          	mov    0x8(%r8),%rax
   428c2:	49 89 04 24          	mov    %rax,(%r12)
            return true;
   428c6:	b8 01 00 00 00       	mov    $0x1,%eax
   428cb:	eb 0b                	jmp    428d8 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xd6>
            l = m + 1;
   428cd:	48 8d 48 01          	lea    0x1(%rax),%rcx
   428d1:	eb 92                	jmp    42865 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x63>
    return false;
   428d3:	b8 00 00 00 00       	mov    $0x0,%eax
}
   428d8:	5b                   	pop    %rbx
   428d9:	41 5c                	pop    %r12
   428db:	5d                   	pop    %rbp
   428dc:	c3                   	ret    

00000000000428dd <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)>:
                                  bool include_rip) {
   428dd:	55                   	push   %rbp
   428de:	48 89 e5             	mov    %rsp,%rbp
   428e1:	41 57                	push   %r15
   428e3:	41 56                	push   %r14
   428e5:	41 55                	push   %r13
   428e7:	41 54                	push   %r12
   428e9:	53                   	push   %rbx
   428ea:	48 83 ec 28          	sub    $0x28,%rsp
   428ee:	48 89 fb             	mov    %rdi,%rbx
   428f1:	49 89 f4             	mov    %rsi,%r12
   428f4:	41 89 d5             	mov    %edx,%r13d
    if (CCOL(cursorpos)) {
   428f7:	8b 05 ff 66 07 00    	mov    0x766ff(%rip),%eax        # b8ffc <cursorpos>
   428fd:	b9 50 00 00 00       	mov    $0x50,%ecx
   42902:	99                   	cltd   
   42903:	f7 f9                	idiv   %ecx
   42905:	85 d2                	test   %edx,%edx
   42907:	74 0c                	je     42915 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x38>
        error_printf("\n");
   42909:	bf f1 5a 04 00       	mov    $0x45af1,%edi
   4290e:	b0 00                	mov    $0x0,%al
   42910:	e8 6e 2a 00 00       	call   45383 <error_printf(char const*, ...)>
    if (include_rip && regs.reg_rip) {
   42915:	45 84 ed             	test   %r13b,%r13b
   42918:	74 39                	je     42953 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x76>
   4291a:	48 8b bb 98 00 00 00 	mov    0x98(%rbx),%rdi
   42921:	48 85 ff             	test   %rdi,%rdi
   42924:	74 2d                	je     42953 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x76>
        if (lookup_symbol(regs.reg_rip, &name, nullptr)) {
   42926:	ba 00 00 00 00       	mov    $0x0,%edx
   4292b:	48 8d 75 b0          	lea    -0x50(%rbp),%rsi
   4292f:	e8 ce fe ff ff       	call   42802 <lookup_symbol(unsigned long, char const**, unsigned long*)>
   42934:	84 c0                	test   %al,%al
   42936:	0f 84 b1 00 00 00    	je     429ed <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x110>
            error_printf("  #0  %p  <%s>\n", regs.reg_rip, name);
   4293c:	48 8b b3 98 00 00 00 	mov    0x98(%rbx),%rsi
   42943:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
   42947:	bf 21 5a 04 00       	mov    $0x45a21,%edi
   4294c:	b0 00                	mov    $0x0,%al
   4294e:	e8 30 2a 00 00       	call   45383 <error_printf(char const*, ...)>
        : backtracer(regs, round_up(regs.reg_rsp, PAGESIZE), pt) {
   42953:	4c 8b ab b0 00 00 00 	mov    0xb0(%rbx),%r13
   4295a:	4d 8d b5 ff 0f 00 00 	lea    0xfff(%r13),%r14
   42961:	49 81 e6 00 f0 ff ff 	and    $0xfffffffffffff000,%r14
        : rbp_(regs.reg_rbp), rsp_(regs.reg_rsp), stack_top_(stack_top),
   42968:	48 8b 5b 20          	mov    0x20(%rbx),%rbx
            || stack_top_ < rbp_
   4296c:	49 39 de             	cmp    %rbx,%r14
   4296f:	72 57                	jb     429c8 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xeb>
   42971:	49 39 dd             	cmp    %rbx,%r13
   42974:	77 52                	ja     429c8 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xeb>
            || stack_top_ - rbp_ < 16
   42976:	4c 89 f0             	mov    %r14,%rax
   42979:	48 29 d8             	sub    %rbx,%rax
            || !pt_
   4297c:	48 83 f8 0f          	cmp    $0xf,%rax
   42980:	76 46                	jbe    429c8 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xeb>
   42982:	4d 85 e4             	test   %r12,%r12
   42985:	74 41                	je     429c8 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xeb>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   42987:	4c 89 65 b0          	mov    %r12,-0x50(%rbp)
   4298b:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
   4298f:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   42996:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   4299d:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   429a4:	00 
    real_find(va);
   429a5:	48 89 de             	mov    %rbx,%rsi
   429a8:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   429ac:	e8 43 f5 ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
            || (vmiter(pt_, rbp_).range_perm(16) & PTE_P) == 0
   429b1:	be 10 00 00 00       	mov    $0x10,%esi
   429b6:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   429ba:	e8 e7 f5 ff ff       	call   41fa6 <vmiter::range_perm(unsigned long) const>
   429bf:	a8 01                	test   $0x1,%al
   429c1:	74 05                	je     429c8 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xeb>
            || (rbp_ & 7) != 0) {
   429c3:	f6 c3 07             	test   $0x7,%bl
   429c6:	74 0b                	je     429d3 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xf6>
            rbp_ = rsp_ = 0;
   429c8:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   429ce:	bb 00 00 00 00       	mov    $0x0,%ebx
            || (vmiter(pt_, rbp_).range_perm(16) & PTE_P) == 0
   429d3:	41 bf 01 00 00 00    	mov    $0x1,%r15d
    for (int frame = 1; bt.ok(); bt.step(), ++frame) {
   429d9:	4d 85 ed             	test   %r13,%r13
   429dc:	75 27                	jne    42a05 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x128>
}
   429de:	48 83 c4 28          	add    $0x28,%rsp
   429e2:	5b                   	pop    %rbx
   429e3:	41 5c                	pop    %r12
   429e5:	41 5d                	pop    %r13
   429e7:	41 5e                	pop    %r14
   429e9:	41 5f                	pop    %r15
   429eb:	5d                   	pop    %rbp
   429ec:	c3                   	ret    
            error_printf("  #0  %p\n", regs.reg_rip);
   429ed:	48 8b b3 98 00 00 00 	mov    0x98(%rbx),%rsi
   429f4:	bf 31 5a 04 00       	mov    $0x45a31,%edi
   429f9:	b0 00                	mov    $0x0,%al
   429fb:	e8 83 29 00 00       	call   45383 <error_printf(char const*, ...)>
   42a00:	e9 4e ff ff ff       	jmp    42953 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x76>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   42a05:	4c 89 65 b0          	mov    %r12,-0x50(%rbp)
   42a09:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
   42a0d:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   42a14:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   42a1b:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   42a22:	00 
        return *vmiter(pt_, rbp_ + off).kptr<const uintptr_t*>();
   42a23:	48 8d 73 08          	lea    0x8(%rbx),%rsi
    real_find(va);
   42a27:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42a2b:	e8 c4 f4 ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   42a30:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42a34:	48 8b 10             	mov    (%rax),%rdx
        return nullptr;
   42a37:	b8 00 00 00 00       	mov    $0x0,%eax
    if (*pep_ & PTE_P) {
   42a3c:	f6 c2 01             	test   $0x1,%dl
   42a3f:	74 3b                	je     42a7c <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x19f>
        if (level_ > 0) {
   42a41:	8b 4d c0             	mov    -0x40(%rbp),%ecx
            pa &= ~0x1000UL;
   42a44:	48 be 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rsi
   42a4b:	ff 0f 00 
   42a4e:	48 21 d6             	and    %rdx,%rsi
        if (level_ > 0) {
   42a51:	85 c9                	test   %ecx,%ecx
   42a53:	7f 0d                	jg     42a62 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x185>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   42a55:	48 be 00 f0 ff ff ff 	movabs $0xffffffffff000,%rsi
   42a5c:	ff 0f 00 
   42a5f:	48 21 d6             	and    %rdx,%rsi
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   42a62:	6b c9 09             	imul   $0x9,%ecx,%ecx
   42a65:	83 c1 0c             	add    $0xc,%ecx
        return pa + (va_ & pageoffmask(level_));
   42a68:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   42a6f:	48 d3 e0             	shl    %cl,%rax
   42a72:	48 f7 d0             	not    %rax
   42a75:	48 23 45 c8          	and    -0x38(%rbp),%rax
   42a79:	48 01 f0             	add    %rsi,%rax
   42a7c:	4c 8b 28             	mov    (%rax),%r13
        if (lookup_symbol(ret_rip - 2, &name, nullptr)) {
   42a7f:	49 8d 7d fe          	lea    -0x2(%r13),%rdi
   42a83:	ba 00 00 00 00       	mov    $0x0,%edx
   42a88:	48 8d 75 b0          	lea    -0x50(%rbp),%rsi
   42a8c:	e8 71 fd ff ff       	call   42802 <lookup_symbol(unsigned long, char const**, unsigned long*)>
   42a91:	84 c0                	test   %al,%al
   42a93:	0f 84 02 01 00 00    	je     42b9b <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2be>
            error_printf("  #%d  %p  <%s>\n", frame, ret_rip, name);
   42a99:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
   42a9d:	4c 89 ea             	mov    %r13,%rdx
   42aa0:	44 89 fe             	mov    %r15d,%esi
   42aa3:	bf 03 5a 04 00       	mov    $0x45a03,%edi
   42aa8:	b0 00                	mov    $0x0,%al
   42aaa:	e8 d4 28 00 00       	call   45383 <error_printf(char const*, ...)>
        rsp_ = rbp_ + 16;
   42aaf:	4c 8d 6b 10          	lea    0x10(%rbx),%r13
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   42ab3:	4c 89 65 b0          	mov    %r12,-0x50(%rbp)
   42ab7:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
   42abb:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   42ac2:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   42ac9:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   42ad0:	00 
    real_find(va);
   42ad1:	48 89 de             	mov    %rbx,%rsi
   42ad4:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42ad8:	e8 17 f4 ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   42add:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42ae1:	48 8b 10             	mov    (%rax),%rdx
        return nullptr;
   42ae4:	b8 00 00 00 00       	mov    $0x0,%eax
    if (*pep_ & PTE_P) {
   42ae9:	f6 c2 01             	test   $0x1,%dl
   42aec:	74 3b                	je     42b29 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x24c>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   42aee:	48 be 00 f0 ff ff ff 	movabs $0xffffffffff000,%rsi
   42af5:	ff 0f 00 
   42af8:	48 21 d6             	and    %rdx,%rsi
        if (level_ > 0) {
   42afb:	8b 4d c0             	mov    -0x40(%rbp),%ecx
   42afe:	85 c9                	test   %ecx,%ecx
   42b00:	7e 0d                	jle    42b0f <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x232>
            pa &= ~0x1000UL;
   42b02:	48 be 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rsi
   42b09:	ff 0f 00 
   42b0c:	48 21 d6             	and    %rdx,%rsi
   42b0f:	6b c9 09             	imul   $0x9,%ecx,%ecx
   42b12:	83 c1 0c             	add    $0xc,%ecx
        return pa + (va_ & pageoffmask(level_));
   42b15:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   42b1c:	48 d3 e0             	shl    %cl,%rax
   42b1f:	48 f7 d0             	not    %rax
   42b22:	48 23 45 c8          	and    -0x38(%rbp),%rax
   42b26:	48 01 f0             	add    %rsi,%rax
        return *vmiter(pt_, rbp_ + off).kptr<const uintptr_t*>();
   42b29:	48 8b 18             	mov    (%rax),%rbx
            || stack_top_ < rbp_
   42b2c:	49 39 de             	cmp    %rbx,%r14
   42b2f:	72 57                	jb     42b88 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2ab>
   42b31:	49 39 dd             	cmp    %rbx,%r13
   42b34:	77 52                	ja     42b88 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2ab>
            || stack_top_ - rbp_ < 16
   42b36:	4c 89 f0             	mov    %r14,%rax
   42b39:	48 29 d8             	sub    %rbx,%rax
            || !pt_
   42b3c:	48 83 f8 0f          	cmp    $0xf,%rax
   42b40:	76 46                	jbe    42b88 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2ab>
   42b42:	4d 85 e4             	test   %r12,%r12
   42b45:	74 41                	je     42b88 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2ab>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   42b47:	4c 89 65 b0          	mov    %r12,-0x50(%rbp)
   42b4b:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
   42b4f:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   42b56:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   42b5d:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   42b64:	00 
    real_find(va);
   42b65:	48 89 de             	mov    %rbx,%rsi
   42b68:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42b6c:	e8 83 f3 ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
            || (vmiter(pt_, rbp_).range_perm(16) & PTE_P) == 0
   42b71:	be 10 00 00 00       	mov    $0x10,%esi
   42b76:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42b7a:	e8 27 f4 ff ff       	call   41fa6 <vmiter::range_perm(unsigned long) const>
   42b7f:	a8 01                	test   $0x1,%al
   42b81:	74 05                	je     42b88 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2ab>
            || (rbp_ & 7) != 0) {
   42b83:	f6 c3 07             	test   $0x7,%bl
   42b86:	74 0b                	je     42b93 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2b6>
            rbp_ = rsp_ = 0;
   42b88:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   42b8e:	bb 00 00 00 00       	mov    $0x0,%ebx
    for (int frame = 1; bt.ok(); bt.step(), ++frame) {
   42b93:	41 ff c7             	inc    %r15d
   42b96:	e9 3e fe ff ff       	jmp    429d9 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xfc>
            error_printf("  #%d  %p\n", frame, ret_rip);
   42b9b:	4c 89 ea             	mov    %r13,%rdx
   42b9e:	44 89 fe             	mov    %r15d,%esi
   42ba1:	bf 16 5a 04 00       	mov    $0x45a16,%edi
   42ba6:	b0 00                	mov    $0x0,%al
   42ba8:	e8 d6 27 00 00       	call   45383 <error_printf(char const*, ...)>
   42bad:	e9 fd fe ff ff       	jmp    42aaf <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x1d2>

0000000000042bb2 <error_vprintf(int, int, char const*, __va_list_tag*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
   42bb2:	f3 0f 1e fa          	endbr64 
   42bb6:	55                   	push   %rbp
   42bb7:	48 89 e5             	mov    %rsp,%rbp
   42bba:	41 56                	push   %r14
   42bbc:	41 55                	push   %r13
   42bbe:	41 54                	push   %r12
   42bc0:	53                   	push   %rbx
   42bc1:	48 83 ec 20          	sub    $0x20,%rsp
   42bc5:	41 89 fd             	mov    %edi,%r13d
   42bc8:	41 89 f6             	mov    %esi,%r14d
   42bcb:	49 89 d4             	mov    %rdx,%r12
   42bce:	48 89 cb             	mov    %rcx,%rbx
    __builtin_va_copy(val2, val);
   42bd1:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   42bd5:	b9 06 00 00 00       	mov    $0x6,%ecx
   42bda:	48 89 c7             	mov    %rax,%rdi
   42bdd:	48 89 de             	mov    %rbx,%rsi
   42be0:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
    log_vprintf(format, val2);
   42be2:	48 89 c6             	mov    %rax,%rsi
   42be5:	48 89 d7             	mov    %rdx,%rdi
   42be8:	e8 a9 fb ff ff       	call   42796 <log_vprintf(char const*, __va_list_tag*)>
    return console_vprintf(cpos, color, format, val);
   42bed:	48 89 d9             	mov    %rbx,%rcx
   42bf0:	4c 89 e2             	mov    %r12,%rdx
   42bf3:	44 89 f6             	mov    %r14d,%esi
   42bf6:	44 89 ef             	mov    %r13d,%edi
   42bf9:	e8 a8 26 00 00       	call   452a6 <console_vprintf(int, int, char const*, __va_list_tag*)>
}
   42bfe:	48 83 c4 20          	add    $0x20,%rsp
   42c02:	5b                   	pop    %rbx
   42c03:	41 5c                	pop    %r12
   42c05:	41 5d                	pop    %r13
   42c07:	41 5e                	pop    %r14
   42c09:	5d                   	pop    %rbp
   42c0a:	c3                   	ret    

0000000000042c0b <strlcpy_from_user(char*, vmiter, unsigned long)>:
void strlcpy_from_user(char* buf, vmiter it, size_t maxlen) {
   42c0b:	f3 0f 1e fa          	endbr64 
   42c0f:	55                   	push   %rbp
   42c10:	48 89 e5             	mov    %rsp,%rbp
   42c13:	41 57                	push   %r15
   42c15:	41 56                	push   %r14
   42c17:	41 55                	push   %r13
   42c19:	41 54                	push   %r12
   42c1b:	53                   	push   %rbx
   42c1c:	48 83 ec 08          	sub    $0x8,%rsp
   42c20:	49 89 fc             	mov    %rdi,%r12
   42c23:	49 89 f7             	mov    %rsi,%r15
    while (i + 1 < maxlen && it.user()) {
   42c26:	48 83 fe 01          	cmp    $0x1,%rsi
   42c2a:	0f 86 bb 00 00 00    	jbe    42ceb <strlcpy_from_user(char*, vmiter, unsigned long)+0xe0>
   42c30:	4c 8d 6e ff          	lea    -0x1(%rsi),%r13
   42c34:	bb 00 00 00 00       	mov    $0x0,%ebx
        return pa + (va_ & pageoffmask(level_));
   42c39:	49 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%r14
   42c40:	eb 22                	jmp    42c64 <strlcpy_from_user(char*, vmiter, unsigned long)+0x59>
        return nullptr;
   42c42:	b8 00 00 00 00       	mov    $0x0,%eax
        buf[i] = *it.kptr<const char*>();
   42c47:	0f b6 00             	movzbl (%rax),%eax
   42c4a:	41 88 04 34          	mov    %al,(%r12,%rsi,1)
    return find(va_ + 1);
   42c4e:	48 8b 45 28          	mov    0x28(%rbp),%rax
   42c52:	48 8d 70 01          	lea    0x1(%rax),%rsi
        real_find(va);
   42c56:	48 8d 7d 10          	lea    0x10(%rbp),%rdi
   42c5a:	e8 95 f2 ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    while (i + 1 < maxlen && it.user()) {
   42c5f:	4c 39 eb             	cmp    %r13,%rbx
   42c62:	74 6b                	je     42ccf <strlcpy_from_user(char*, vmiter, unsigned long)+0xc4>
   42c64:	48 89 de             	mov    %rbx,%rsi
   42c67:	48 83 c3 01          	add    $0x1,%rbx
    uint64_t ph = *pep_ & perm_;
   42c6b:	48 8b 45 18          	mov    0x18(%rbp),%rax
   42c6f:	48 8b 10             	mov    (%rax),%rdx
   42c72:	48 63 4d 24          	movslq 0x24(%rbp),%rcx
   42c76:	48 21 d1             	and    %rdx,%rcx
    return ph & -(ph & PTE_P);
   42c79:	48 89 c8             	mov    %rcx,%rax
   42c7c:	83 e0 01             	and    $0x1,%eax
   42c7f:	48 f7 d8             	neg    %rax
   42c82:	48 21 c8             	and    %rcx,%rax
    return (perm() & desired_perm) == desired_perm;
   42c85:	83 e0 05             	and    $0x5,%eax
   42c88:	48 83 f8 05          	cmp    $0x5,%rax
   42c8c:	75 44                	jne    42cd2 <strlcpy_from_user(char*, vmiter, unsigned long)+0xc7>
    if (*pep_ & PTE_P) {
   42c8e:	f6 c2 01             	test   $0x1,%dl
   42c91:	74 af                	je     42c42 <strlcpy_from_user(char*, vmiter, unsigned long)+0x37>
        if (level_ > 0) {
   42c93:	8b 45 20             	mov    0x20(%rbp),%eax
        uintptr_t pa = *pep_ & PTE_PAMASK;
   42c96:	48 bf 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdi
   42c9d:	ff 0f 00 
   42ca0:	48 21 d7             	and    %rdx,%rdi
   42ca3:	48 b9 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rcx
   42caa:	ff 0f 00 
   42cad:	48 21 ca             	and    %rcx,%rdx
   42cb0:	85 c0                	test   %eax,%eax
   42cb2:	48 0f 4f fa          	cmovg  %rdx,%rdi
   42cb6:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   42cba:	4c 89 f0             	mov    %r14,%rax
   42cbd:	48 d3 e0             	shl    %cl,%rax
   42cc0:	48 f7 d0             	not    %rax
   42cc3:	48 23 45 28          	and    0x28(%rbp),%rax
   42cc7:	48 01 f8             	add    %rdi,%rax
        return reinterpret_cast<T>(pa());
   42cca:	e9 78 ff ff ff       	jmp    42c47 <strlcpy_from_user(char*, vmiter, unsigned long)+0x3c>
   42ccf:	48 89 de             	mov    %rbx,%rsi
    if (i < maxlen) {
   42cd2:	49 39 f7             	cmp    %rsi,%r15
   42cd5:	76 05                	jbe    42cdc <strlcpy_from_user(char*, vmiter, unsigned long)+0xd1>
        buf[i] = '\0';
   42cd7:	41 c6 04 34 00       	movb   $0x0,(%r12,%rsi,1)
}
   42cdc:	48 83 c4 08          	add    $0x8,%rsp
   42ce0:	5b                   	pop    %rbx
   42ce1:	41 5c                	pop    %r12
   42ce3:	41 5d                	pop    %r13
   42ce5:	41 5e                	pop    %r14
   42ce7:	41 5f                	pop    %r15
   42ce9:	5d                   	pop    %rbp
   42cea:	c3                   	ret    
    size_t i = 0;
   42ceb:	be 00 00 00 00       	mov    $0x0,%esi
   42cf0:	eb e0                	jmp    42cd2 <strlcpy_from_user(char*, vmiter, unsigned long)+0xc7>

0000000000042cf2 <assert_fail(char const*, int, char const*, char const*)>:
                 const char* description) {
   42cf2:	f3 0f 1e fa          	endbr64 
   42cf6:	55                   	push   %rbp
   42cf7:	48 89 e5             	mov    %rsp,%rbp
   42cfa:	41 55                	push   %r13
   42cfc:	41 54                	push   %r12
   42cfe:	53                   	push   %rbx
   42cff:	48 83 ec 08          	sub    $0x8,%rsp
   42d03:	48 89 fb             	mov    %rdi,%rbx
   42d06:	41 89 f4             	mov    %esi,%r12d
   42d09:	49 89 d5             	mov    %rdx,%r13
    cursorpos = CPOS(23, 0);
   42d0c:	c7 05 e6 62 07 00 30 	movl   $0x730,0x762e6(%rip)        # b8ffc <cursorpos>
   42d13:	07 00 00 
    if (description) {
   42d16:	48 85 c9             	test   %rcx,%rcx
   42d19:	74 11                	je     42d2c <assert_fail(char const*, int, char const*, char const*)+0x3a>
        error_printf("%s:%d: %s\n", file, line, description);
   42d1b:	89 f2                	mov    %esi,%edx
   42d1d:	48 89 fe             	mov    %rdi,%rsi
   42d20:	bf 3b 5a 04 00       	mov    $0x45a3b,%edi
   42d25:	b0 00                	mov    $0x0,%al
   42d27:	e8 57 26 00 00       	call   45383 <error_printf(char const*, ...)>
    error_printf("%s:%d: kernel assertion '%s' failed\n", file, line, msg);
   42d2c:	4c 89 e9             	mov    %r13,%rcx
   42d2f:	44 89 e2             	mov    %r12d,%edx
   42d32:	48 89 de             	mov    %rbx,%rsi
   42d35:	bf c8 57 04 00       	mov    $0x457c8,%edi
   42d3a:	b0 00                	mov    $0x0,%al
   42d3c:	e8 42 26 00 00       	call   45383 <error_printf(char const*, ...)>
    return x;
}

__always_inline uintptr_t rdcr3() {
    uintptr_t x;
    asm volatile("movq %%cr3, %0" : "=r" (x));
   42d41:	0f 20 de             	mov    %cr3,%rsi
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
   42d44:	48 89 e0             	mov    %rsp,%rax
    backtrace_kernel_regs.reg_rsp = rdrsp();
   42d47:	48 89 05 42 d4 01 00 	mov    %rax,0x1d442(%rip)        # 60190 <backtrace_current_regs()::backtrace_kernel_regs+0xb0>
    asm volatile("movq %%rbp, %0" : "=r" (x));
   42d4e:	48 89 e8             	mov    %rbp,%rax
    backtrace_kernel_regs.reg_rbp = rdrbp();
   42d51:	48 89 05 a8 d3 01 00 	mov    %rax,0x1d3a8(%rip)        # 60100 <backtrace_current_regs()::backtrace_kernel_regs+0x20>
    backtrace_kernel_regs.reg_rip = 0;
   42d58:	48 c7 05 15 d4 01 00 	movq   $0x0,0x1d415(%rip)        # 60178 <backtrace_current_regs()::backtrace_kernel_regs+0x98>
   42d5f:	00 00 00 00 
    error_print_backtrace(backtrace_current_regs(), backtrace_current_pagetable(), false);
   42d63:	ba 00 00 00 00       	mov    $0x0,%edx
   42d68:	bf e0 00 06 00       	mov    $0x600e0,%edi
   42d6d:	e8 6b fb ff ff       	call   428dd <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)>
        check_keyboard();
   42d72:	e8 b6 08 00 00       	call   4362d <check_keyboard()>
    while (true) {
   42d77:	eb f9                	jmp    42d72 <assert_fail(char const*, int, char const*, char const*)+0x80>

0000000000042d79 <init_hardware()>:
void init_hardware() {
   42d79:	f3 0f 1e fa          	endbr64 
   42d7d:	55                   	push   %rbp
   42d7e:	48 89 e5             	mov    %rsp,%rbp
   42d81:	53                   	push   %rbx
   42d82:	48 83 ec 38          	sub    $0x38,%rsp
    stash_kernel_data(false);
   42d86:	bf 00 00 00 00       	mov    $0x0,%edi
   42d8b:	e8 c5 f6 ff ff       	call   42455 <stash_kernel_data(bool)>
    gdt_segments[0] = 0;
   42d90:	48 c7 05 05 d3 01 00 	movq   $0x0,0x1d305(%rip)        # 600a0 <gdt_segments>
   42d97:	00 00 00 00 
    *segment = type
   42d9b:	48 b8 00 00 00 00 00 	movabs $0x20980000000000,%rax
   42da2:	98 20 00 
   42da5:	48 89 05 fc d2 01 00 	mov    %rax,0x1d2fc(%rip)        # 600a8 <gdt_segments+0x8>
   42dac:	48 b8 00 00 00 00 00 	movabs $0x920000000000,%rax
   42db3:	92 00 00 
   42db6:	48 89 05 f3 d2 01 00 	mov    %rax,0x1d2f3(%rip)        # 600b0 <gdt_segments+0x10>
    gdt.limit = sizeof(gdt_segments[0]) * 3 - 1;
   42dbd:	66 c7 45 c6 17 00    	movw   $0x17,-0x3a(%rbp)
    gdt.base = (uint64_t) gdt_segments;
   42dc3:	48 c7 45 c8 a0 00 06 	movq   $0x600a0,-0x38(%rbp)
   42dca:	00 
    asm volatile("lgdt %0" : : "m" (gdt.limit));
   42dcb:	0f 01 55 c6          	lgdt   -0x3a(%rbp)
    memset(kernel_pagetable, 0, sizeof(kernel_pagetable));
   42dcf:	ba 00 50 00 00       	mov    $0x5000,%edx
   42dd4:	be 00 00 00 00       	mov    $0x0,%esi
   42dd9:	bf 00 b0 05 00       	mov    $0x5b000,%edi
   42dde:	e8 30 19 00 00       	call   44713 <memset>
        kptr2pa(&kernel_pagetable[1]) | PTE_P | PTE_W | PTE_U;
   42de3:	b8 00 c0 05 00       	mov    $0x5c000,%eax
   42de8:	48 83 c8 07          	or     $0x7,%rax
   42dec:	48 89 05 0d 82 01 00 	mov    %rax,0x1820d(%rip)        # 5b000 <kernel_pagetable>
        kptr2pa(&kernel_pagetable[2]) | PTE_P | PTE_W | PTE_U;
   42df3:	b8 00 d0 05 00       	mov    $0x5d000,%eax
   42df8:	48 83 c8 07          	or     $0x7,%rax
   42dfc:	48 89 05 fd 91 01 00 	mov    %rax,0x191fd(%rip)        # 5c000 <kernel_pagetable+0x1000>
        kptr2pa(&kernel_pagetable[3]) | PTE_P | PTE_W | PTE_U;
   42e03:	b8 00 e0 05 00       	mov    $0x5e000,%eax
   42e08:	48 83 c8 07          	or     $0x7,%rax
   42e0c:	48 89 05 ed a1 01 00 	mov    %rax,0x1a1ed(%rip)        # 5d000 <kernel_pagetable+0x2000>
        kptr2pa(&kernel_pagetable[4]) | PTE_P | PTE_W | PTE_U;
   42e13:	b8 00 f0 05 00       	mov    $0x5f000,%eax
   42e18:	48 83 c8 07          	or     $0x7,%rax
   42e1c:	48 89 05 e5 a1 01 00 	mov    %rax,0x1a1e5(%rip)        # 5d008 <kernel_pagetable+0x2008>
    kernel_pagetable[1].entry[1] =
   42e23:	48 c7 05 da 91 01 00 	movq   $0x40000083,0x191da(%rip)        # 5c008 <kernel_pagetable+0x1008>
   42e2a:	83 00 00 40 
    kernel_pagetable[1].entry[2] =
   42e2e:	b8 83 00 00 80       	mov    $0x80000083,%eax
   42e33:	48 89 05 d6 91 01 00 	mov    %rax,0x191d6(%rip)        # 5c010 <kernel_pagetable+0x1010>
    kernel_pagetable[1].entry[3] =
   42e3a:	48 8d 80 00 00 00 40 	lea    0x40000000(%rax),%rax
   42e41:	48 89 05 d0 91 01 00 	mov    %rax,0x191d0(%rip)        # 5c018 <kernel_pagetable+0x1018>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   42e48:	48 c7 45 d0 00 b0 05 	movq   $0x5b000,-0x30(%rbp)
   42e4f:	00 
   42e50:	48 c7 45 d8 00 b0 05 	movq   $0x5b000,-0x28(%rbp)
   42e57:	00 
   42e58:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   42e5f:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   42e66:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   42e6d:	00 
    real_find(va);
   42e6e:	be 00 00 00 00       	mov    $0x0,%esi
   42e73:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   42e77:	e8 78 f0 ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    return va_;
   42e7c:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
         it.va() < MEMSIZE_PHYSICAL;
   42e80:	48 81 fe ff ff 1f 00 	cmp    $0x1fffff,%rsi
   42e87:	76 72                	jbe    42efb <init_hardware()+0x182>
    asm volatile("movq %0, %%cr3" : : "r" (x) : "memory");
   42e89:	b8 00 b0 05 00       	mov    $0x5b000,%eax
   42e8e:	0f 22 d8             	mov    %rax,%cr3
    cursorpos = 3 * CONSOLE_COLUMNS;
   42e91:	c7 05 61 61 07 00 f0 	movl   $0xf0,0x76161(%rip)        # b8ffc <cursorpos>
   42e98:	00 00 00 
   42e9b:	b9 30 70 05 00       	mov    $0x57030,%ecx
    for (int i = 0; i < 256; ++i) {
   42ea0:	be 00 00 00 00       	mov    $0x0,%esi
        | ((addr & 0x00000000FFFF0000UL) << 32);
   42ea5:	49 b9 00 00 00 00 00 	movabs $0x600000000000,%r9
   42eac:	60 00 00 
   42eaf:	49 b8 00 00 00 00 00 	movabs $0xffff000000000000,%r8
   42eb6:	00 ff ff 
   42eb9:	48 bf 00 00 08 00 00 	movabs $0x8e0000080000,%rdi
   42ec0:	8e 00 00 
   42ec3:	e9 f8 00 00 00       	jmp    42fc0 <init_hardware()+0x247>
    int r = try_map(pa, perm);
   42ec8:	ba 07 00 00 00       	mov    $0x7,%edx
   42ecd:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   42ed1:	e8 36 f2 ff ff       	call   4210c <vmiter::try_map(unsigned long, int)>
    assert(r == 0, "vmiter::map failed");
   42ed6:	85 c0                	test   %eax,%eax
   42ed8:	75 28                	jne    42f02 <init_hardware()+0x189>
    return find(va_ + delta);
   42eda:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42ede:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va);
   42ee5:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   42ee9:	e8 06 f0 ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    return va_;
   42eee:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
         it.va() < MEMSIZE_PHYSICAL;
   42ef2:	48 81 fe ff ff 1f 00 	cmp    $0x1fffff,%rsi
   42ef9:	77 8e                	ja     42e89 <init_hardware()+0x110>
        if (it.va() != 0) {
   42efb:	48 85 f6             	test   %rsi,%rsi
   42efe:	74 da                	je     42eda <init_hardware()+0x161>
   42f00:	eb c6                	jmp    42ec8 <init_hardware()+0x14f>
    assert(r == 0, "vmiter::map failed");
   42f02:	b9 1c 54 04 00       	mov    $0x4541c,%ecx
   42f07:	ba 0b 54 04 00       	mov    $0x4540b,%edx
   42f0c:	be f4 00 00 00       	mov    $0xf4,%esi
   42f11:	bf 2f 54 04 00       	mov    $0x4542f,%edi
   42f16:	e8 d7 fd ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
    assert(cpuid(1).edx & (1 << 9));
   42f1b:	b9 00 00 00 00       	mov    $0x0,%ecx
   42f20:	ba 46 5a 04 00       	mov    $0x45a46,%edx
   42f25:	be a4 00 00 00       	mov    $0xa4,%esi
   42f2a:	bf 5e 5a 04 00       	mov    $0x45a5e,%edi
   42f2f:	e8 be fd ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
    assert(apic_base & IA32_APIC_BASE_ENABLED);
   42f34:	b9 00 00 00 00       	mov    $0x0,%ecx
   42f39:	ba f0 57 04 00       	mov    $0x457f0,%edx
   42f3e:	be a6 00 00 00       	mov    $0xa6,%esi
   42f43:	bf 5e 5a 04 00       	mov    $0x45a5e,%edi
   42f48:	e8 a5 fd ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
    assert((apic_base & 0xFFFFFFFFF000) == lapicstate::lapic_pa);
   42f4d:	b9 00 00 00 00       	mov    $0x0,%ecx
   42f52:	ba 18 58 04 00       	mov    $0x45818,%edx
   42f57:	be a7 00 00 00       	mov    $0xa7,%esi
   42f5c:	bf 5e 5a 04 00       	mov    $0x45a5e,%edi
   42f61:	e8 8c fd ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
    assert((ioapic_ver & 0xFF) == 0x11 || (ioapic_ver & 0xFF) == 0x20);
   42f66:	b9 00 00 00 00       	mov    $0x0,%ecx
   42f6b:	ba 50 58 04 00       	mov    $0x45850,%edx
   42f70:	be ac 00 00 00       	mov    $0xac,%esi
   42f75:	bf 5e 5a 04 00       	mov    $0x45a5e,%edi
   42f7a:	e8 73 fd ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
    assert((ioapic_ver >> 16) >= 0x17);
   42f7f:	b9 00 00 00 00       	mov    $0x0,%ecx
   42f84:	ba 6c 5a 04 00       	mov    $0x45a6c,%edx
   42f89:	be ad 00 00 00       	mov    $0xad,%esi
   42f8e:	bf 5e 5a 04 00       	mov    $0x45a5e,%edi
   42f93:	e8 5a fd ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
    gate->gd_low = (addr & 0x000000000000FFFFUL)
   42f98:	0f b7 c2             	movzwl %dx,%eax
        | ((addr & 0x00000000FFFF0000UL) << 32);
   42f9b:	4c 09 c8             	or     %r9,%rax
   42f9e:	49 89 d2             	mov    %rdx,%r10
   42fa1:	49 c1 e2 20          	shl    $0x20,%r10
   42fa5:	4d 21 c2             	and    %r8,%r10
   42fa8:	4c 09 d0             	or     %r10,%rax
   42fab:	48 09 f8             	or     %rdi,%rax
   42fae:	48 89 01             	mov    %rax,(%rcx)
    gate->gd_high = addr >> 32;
   42fb1:	48 c1 ea 20          	shr    $0x20,%rdx
   42fb5:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    for (int i = 0; i < 256; ++i) {
   42fb9:	83 c6 01             	add    $0x1,%esi
   42fbc:	48 83 c1 10          	add    $0x10,%rcx
        uintptr_t addr = interrupt_descriptors[i].gd_low;
   42fc0:	48 8b 11             	mov    (%rcx),%rdx
        set_gate(&interrupt_descriptors[i], addr,
   42fc3:	83 fe 03             	cmp    $0x3,%esi
   42fc6:	74 d0                	je     42f98 <init_hardware()+0x21f>
        | ((addr & 0x00000000FFFF0000UL) << 32);
   42fc8:	48 89 d0             	mov    %rdx,%rax
   42fcb:	48 c1 e0 20          	shl    $0x20,%rax
   42fcf:	4c 21 c0             	and    %r8,%rax
    gate->gd_low = (addr & 0x000000000000FFFFUL)
   42fd2:	44 0f b7 d2          	movzwl %dx,%r10d
        | ((addr & 0x00000000FFFF0000UL) << 32);
   42fd6:	4c 09 d0             	or     %r10,%rax
   42fd9:	48 09 f8             	or     %rdi,%rax
   42fdc:	48 89 01             	mov    %rax,(%rcx)
    gate->gd_high = addr >> 32;
   42fdf:	48 c1 ea 20          	shr    $0x20,%rdx
   42fe3:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    for (int i = 0; i < 256; ++i) {
   42fe7:	83 c6 01             	add    $0x1,%esi
   42fea:	48 83 c1 10          	add    $0x10,%rcx
   42fee:	81 fe 00 01 00 00    	cmp    $0x100,%esi
   42ff4:	75 ca                	jne    42fc0 <init_hardware()+0x247>
    uint32_t eax, ebx, ecx, edx;
} x86_64_cpuid_t;

__always_inline x86_64_cpuid_t cpuid(uint32_t leaf) {
    x86_64_cpuid_t ret;
    asm volatile("cpuid"
   42ff6:	b8 01 00 00 00       	mov    $0x1,%eax
   42ffb:	0f a2                	cpuid  
    assert(cpuid(1).edx & (1 << 9));
   42ffd:	f6 c6 02             	test   $0x2,%dh
   43000:	0f 84 15 ff ff ff    	je     42f1b <init_hardware()+0x1a2>
    return ret;
}

__always_inline uint64_t rdmsr(uint32_t msr) {
    uint64_t low, high;
    asm volatile("rdmsr" : "=a" (low), "=d" (high) : "c" (msr));
   43006:	b9 1b 00 00 00       	mov    $0x1b,%ecx
   4300b:	0f 32                	rdmsr  
    return low | (high << 32);
   4300d:	48 c1 e2 20          	shl    $0x20,%rdx
   43011:	48 09 c2             	or     %rax,%rdx
    assert(apic_base & IA32_APIC_BASE_ENABLED);
   43014:	f6 c4 08             	test   $0x8,%ah
   43017:	0f 84 17 ff ff ff    	je     42f34 <init_hardware()+0x1bb>
    assert((apic_base & 0xFFFFFFFFF000) == lapicstate::lapic_pa);
   4301d:	48 b8 00 f0 ff ff ff 	movabs $0xfffffffff000,%rax
   43024:	ff 00 00 
   43027:	48 21 c2             	and    %rax,%rdx
   4302a:	b8 00 00 e0 fe       	mov    $0xfee00000,%eax
   4302f:	48 39 c2             	cmp    %rax,%rdx
   43032:	0f 85 15 ff ff ff    	jne    42f4d <init_hardware()+0x1d4>
inline void ioapicstate::disable_irq(int entry) {
    write(reg_redtbl + 2 * entry, redtbl_masked);
    write(reg_redtbl + 2 * entry + 1, 0);
}
inline uint32_t ioapicstate::read(int reg) const {
    reg_[0].v = reg;
   43038:	b8 00 00 c0 fe       	mov    $0xfec00000,%eax
   4303d:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
    return reg_[1].v;
   43043:	8b 40 10             	mov    0x10(%rax),%eax
    assert((ioapic_ver & 0xFF) == 0x11 || (ioapic_ver & 0xFF) == 0x20);
   43046:	0f b6 d0             	movzbl %al,%edx
   43049:	3c 20                	cmp    $0x20,%al
   4304b:	74 09                	je     43056 <init_hardware()+0x2dd>
   4304d:	83 fa 11             	cmp    $0x11,%edx
   43050:	0f 85 10 ff ff ff    	jne    42f66 <init_hardware()+0x1ed>
    assert((ioapic_ver >> 16) >= 0x17);
   43056:	3d ff ff 16 00       	cmp    $0x16ffff,%eax
   4305b:	0f 86 1e ff ff ff    	jbe    42f7f <init_hardware()+0x206>
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
   43061:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43066:	ba 21 00 00 00       	mov    $0x21,%edx
   4306b:	ee                   	out    %al,(%dx)
   4306c:	ba a1 00 00 00       	mov    $0xa1,%edx
   43071:	ee                   	out    %al,(%dx)
    for (auto fp = __init_array_start; fp != __init_array_end; ++fp) {
   43072:	b8 20 66 04 00       	mov    $0x46620,%eax
   43077:	48 3d 20 66 04 00    	cmp    $0x46620,%rax
   4307d:	74 12                	je     43091 <init_hardware()+0x318>
   4307f:	48 89 c3             	mov    %rax,%rbx
        (*fp)();
   43082:	ff 13                	call   *(%rbx)
    for (auto fp = __init_array_start; fp != __init_array_end; ++fp) {
   43084:	48 83 c3 08          	add    $0x8,%rbx
   43088:	48 81 fb 20 66 04 00 	cmp    $0x46620,%rbx
   4308f:	75 f1                	jne    43082 <init_hardware()+0x309>
    gdt_segments[0] = 0;
   43091:	48 c7 05 04 d0 01 00 	movq   $0x0,0x1d004(%rip)        # 600a0 <gdt_segments>
   43098:	00 00 00 00 
    *segment = type
   4309c:	48 b8 00 00 00 00 00 	movabs $0x20980000000000,%rax
   430a3:	98 20 00 
   430a6:	48 89 05 fb cf 01 00 	mov    %rax,0x1cffb(%rip)        # 600a8 <gdt_segments+0x8>
   430ad:	48 b8 00 00 00 00 00 	movabs $0x920000000000,%rax
   430b4:	92 00 00 
   430b7:	48 89 05 f2 cf 01 00 	mov    %rax,0x1cff2(%rip)        # 600b0 <gdt_segments+0x10>
   430be:	48 b8 00 00 00 00 00 	movabs $0x20f80000000000,%rax
   430c5:	f8 20 00 
   430c8:	48 89 05 e9 cf 01 00 	mov    %rax,0x1cfe9(%rip)        # 600b8 <gdt_segments+0x18>
   430cf:	48 b8 00 00 00 00 00 	movabs $0xf20000000000,%rax
   430d6:	f2 00 00 
   430d9:	48 89 05 e0 cf 01 00 	mov    %rax,0x1cfe0(%rip)        # 600c0 <gdt_segments+0x20>
    set_sys_segment(&gdt_segments[SEGSEL_TASKSTATE >> 3],
   430e0:	ba 20 00 06 00       	mov    $0x60020,%edx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   430e5:	48 89 d0             	mov    %rdx,%rax
   430e8:	48 c1 e0 10          	shl    $0x10,%rax
   430ec:	48 b9 00 00 ff ff ff 	movabs $0xffffff0000,%rcx
   430f3:	00 00 00 
   430f6:	48 21 c8             	and    %rcx,%rax
        | ((addr & 0x00000000FF000000UL) << 32)
   430f9:	48 89 d1             	mov    %rdx,%rcx
   430fc:	48 c1 e1 20          	shl    $0x20,%rcx
   43100:	48 be 00 00 00 00 00 	movabs $0xff00000000000000,%rsi
   43107:	00 00 ff 
   4310a:	48 21 f1             	and    %rsi,%rcx
   4310d:	48 09 c8             	or     %rcx,%rax
        | X86SEG_P;                   // segment present
   43110:	48 b9 67 00 00 00 00 	movabs $0x890000000067,%rcx
   43117:	89 00 00 
   4311a:	48 09 c8             	or     %rcx,%rax
   4311d:	48 89 05 a4 cf 01 00 	mov    %rax,0x1cfa4(%rip)        # 600c8 <gdt_segments+0x28>
    segment[1] = addr >> 32;
   43124:	48 c1 ea 20          	shr    $0x20,%rdx
   43128:	48 89 15 a1 cf 01 00 	mov    %rdx,0x1cfa1(%rip)        # 600d0 <gdt_segments+0x30>
    memset(&taskstate, 0, sizeof(taskstate));
   4312f:	ba 68 00 00 00       	mov    $0x68,%edx
   43134:	be 00 00 00 00       	mov    $0x0,%esi
   43139:	bf 20 00 06 00       	mov    $0x60020,%edi
   4313e:	e8 d0 15 00 00       	call   44713 <memset>
    taskstate.ts_rsp[0] = KERNEL_STACK_TOP;
   43143:	48 c7 05 d6 ce 01 00 	movq   $0x80000,0x1ced6(%rip)        # 60024 <taskstate+0x4>
   4314a:	00 00 08 00 
    gdt.limit = sizeof(gdt_segments) - 1;
   4314e:	66 c7 45 c6 37 00    	movw   $0x37,-0x3a(%rbp)
    gdt.base = (uint64_t) gdt_segments;
   43154:	48 c7 45 c8 a0 00 06 	movq   $0x600a0,-0x38(%rbp)
   4315b:	00 
    idt.limit = sizeof(interrupt_descriptors) - 1;
   4315c:	66 c7 45 d6 ff 0f    	movw   $0xfff,-0x2a(%rbp)
    idt.base = (uint64_t) interrupt_descriptors;
   43162:	48 c7 45 d8 30 70 05 	movq   $0x57030,-0x28(%rbp)
   43169:	00 
    asm volatile("lgdt %0; ltr %1; lidt %2"
   4316a:	b8 28 00 00 00       	mov    $0x28,%eax
   4316f:	0f 01 55 c6          	lgdt   -0x3a(%rbp)
   43173:	0f 00 d8             	ltr    %ax
   43176:	0f 01 5d d6          	lidt   -0x2a(%rbp)
    asm volatile("movw %%ax, %%fs; movw %%ax, %%gs"
   4317a:	b8 10 00 00 00       	mov    $0x10,%eax
   4317f:	8e e0                	mov    %eax,%fs
   43181:	8e e8                	mov    %eax,%gs
    asm volatile("movq %%cr0, %0" : "=r" (x));
   43183:	0f 20 c0             	mov    %cr0,%rax
    wrcr0(cr0);
   43186:	0d 23 00 05 80       	or     $0x80050023,%eax
    asm volatile("movq %0, %%cr0" : : "r" (x));
   4318b:	0f 22 c0             	mov    %rax,%cr0
}
__always_inline void wrmsr(uint32_t msr, uint64_t x) {
    asm volatile("wrmsr" : : "c" (msr), "a" ((uint32_t) x), "d" (x >> 32));
   4318e:	b9 81 00 00 c0       	mov    $0xc0000081,%ecx
   43193:	b8 00 00 00 00       	mov    $0x0,%eax
   43198:	ba 08 00 18 00       	mov    $0x180008,%edx
   4319d:	0f 30                	wrmsr  
    wrmsr(MSR_IA32_LSTAR, reinterpret_cast<uint64_t>(syscall_entry));
   4319f:	b8 d6 0a 04 00       	mov    $0x40ad6,%eax
   431a4:	48 89 c2             	mov    %rax,%rdx
   431a7:	48 c1 ea 20          	shr    $0x20,%rdx
   431ab:	b9 82 00 00 c0       	mov    $0xc0000082,%ecx
   431b0:	0f 30                	wrmsr  
   431b2:	b9 84 00 00 c0       	mov    $0xc0000084,%ecx
   431b7:	b8 00 77 04 00       	mov    $0x47700,%eax
   431bc:	ba 00 00 00 00       	mov    $0x0,%edx
   431c1:	0f 30                	wrmsr  
    return reg_[reg].v;
   431c3:	b8 00 00 e0 fe       	mov    $0xfee00000,%eax
   431c8:	8b 90 f0 00 00 00    	mov    0xf0(%rax),%edx
    write(reg_svr, (read(reg_svr) & ~0xFF) | 0x100 | vector);
   431ce:	81 e2 00 fe ff ff    	and    $0xfffffe00,%edx
   431d4:	81 ca 3f 01 00 00    	or     $0x13f,%edx
    reg_[reg].v = v;
   431da:	89 90 f0 00 00 00    	mov    %edx,0xf0(%rax)
   431e0:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%rax)
   431e7:	00 00 00 
   431ea:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%rax)
   431f1:	00 02 00 
   431f4:	c7 80 80 03 00 00 00 	movl   $0x0,0x380(%rax)
   431fb:	00 00 00 
   431fe:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%rax)
   43205:	00 01 00 
   43208:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%rax)
   4320f:	00 01 00 
   43212:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%rax)
   43219:	00 00 00 
   4321c:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%rax)
   43223:	00 00 00 
    return reg_[reg].v;
   43226:	8b 90 80 02 00 00    	mov    0x280(%rax),%edx
    reg_[reg].v = v;
   4322c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%rax)
   43233:	00 00 00 
}
   43236:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   4323a:	c9                   	leave  
   4323b:	c3                   	ret    

000000000004323c <check_pagetable(x86_64_pagetable*)>:
void check_pagetable(x86_64_pagetable* pagetable) {
   4323c:	f3 0f 1e fa          	endbr64 
   43240:	55                   	push   %rbp
   43241:	48 89 e5             	mov    %rsp,%rbp
   43244:	53                   	push   %rbx
   43245:	48 83 ec 28          	sub    $0x28,%rsp
    assert(((uintptr_t) pagetable % PAGESIZE) == 0); // must be page aligned
   43249:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
   4324f:	0f 85 78 01 00 00    	jne    433cd <check_pagetable(x86_64_pagetable*)+0x191>
   43255:	48 89 fb             	mov    %rdi,%rbx
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   43258:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
   4325c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43260:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   43267:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   4326e:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   43275:	00 
    real_find(va);
   43276:	be 72 0a 04 00       	mov    $0x40a72,%esi
   4327b:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   4327f:	e8 70 ec ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   43284:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43288:	48 8b 08             	mov    (%rax),%rcx
   4328b:	f6 c1 01             	test   $0x1,%cl
   4328e:	0f 84 64 01 00 00    	je     433f8 <check_pagetable(x86_64_pagetable*)+0x1bc>
        if (level_ > 0) {
   43294:	8b 45 e0             	mov    -0x20(%rbp),%eax
            pa &= ~0x1000UL;
   43297:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   4329e:	ff 0f 00 
   432a1:	48 21 ca             	and    %rcx,%rdx
        if (level_ > 0) {
   432a4:	85 c0                	test   %eax,%eax
   432a6:	0f 8e 3a 01 00 00    	jle    433e6 <check_pagetable(x86_64_pagetable*)+0x1aa>
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   432ac:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   432b0:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   432b7:	48 d3 e0             	shl    %cl,%rax
   432ba:	48 f7 d0             	not    %rax
   432bd:	48 23 45 e8          	and    -0x18(%rbp),%rax
   432c1:	48 01 d0             	add    %rdx,%rax
    assert(vmiter(pagetable, (uintptr_t) exception_entry).pa()
   432c4:	ba 72 0a 04 00       	mov    $0x40a72,%edx
   432c9:	48 39 c2             	cmp    %rax,%rdx
   432cc:	0f 85 26 01 00 00    	jne    433f8 <check_pagetable(x86_64_pagetable*)+0x1bc>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   432d2:	48 c7 45 d0 00 b0 05 	movq   $0x5b000,-0x30(%rbp)
   432d9:	00 
   432da:	48 c7 45 d8 00 b0 05 	movq   $0x5b000,-0x28(%rbp)
   432e1:	00 
   432e2:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   432e9:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   432f0:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   432f7:	00 
    real_find(va);
   432f8:	48 89 de             	mov    %rbx,%rsi
   432fb:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   432ff:	e8 f0 eb ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   43304:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43308:	48 8b 08             	mov    (%rax),%rcx
   4330b:	f6 c1 01             	test   $0x1,%cl
   4330e:	0f 84 0f 01 00 00    	je     43423 <check_pagetable(x86_64_pagetable*)+0x1e7>
        if (level_ > 0) {
   43314:	8b 45 e0             	mov    -0x20(%rbp),%eax
            pa &= ~0x1000UL;
   43317:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   4331e:	ff 0f 00 
   43321:	48 21 ca             	and    %rcx,%rdx
        if (level_ > 0) {
   43324:	85 c0                	test   %eax,%eax
   43326:	0f 8e e5 00 00 00    	jle    43411 <check_pagetable(x86_64_pagetable*)+0x1d5>
   4332c:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   43330:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   43337:	48 d3 e0             	shl    %cl,%rax
   4333a:	48 f7 d0             	not    %rax
   4333d:	48 23 45 e8          	and    -0x18(%rbp),%rax
   43341:	48 01 d0             	add    %rdx,%rax
    assert(vmiter(kernel_pagetable, (uintptr_t) pagetable).pa()
   43344:	48 39 c3             	cmp    %rax,%rbx
   43347:	0f 85 d6 00 00 00    	jne    43423 <check_pagetable(x86_64_pagetable*)+0x1e7>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4334d:	48 89 5d d0          	mov    %rbx,-0x30(%rbp)
   43351:	48 89 5d d8          	mov    %rbx,-0x28(%rbp)
   43355:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   4335c:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   43363:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   4336a:	00 
    real_find(va);
   4336b:	be 00 b0 05 00       	mov    $0x5b000,%esi
   43370:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   43374:	e8 7b eb ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   43379:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4337d:	48 8b 08             	mov    (%rax),%rcx
   43380:	f6 c1 01             	test   $0x1,%cl
   43383:	0f 84 c5 00 00 00    	je     4344e <check_pagetable(x86_64_pagetable*)+0x212>
        if (level_ > 0) {
   43389:	8b 45 e0             	mov    -0x20(%rbp),%eax
            pa &= ~0x1000UL;
   4338c:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   43393:	ff 0f 00 
   43396:	48 21 ca             	and    %rcx,%rdx
        if (level_ > 0) {
   43399:	85 c0                	test   %eax,%eax
   4339b:	0f 8e 9b 00 00 00    	jle    4343c <check_pagetable(x86_64_pagetable*)+0x200>
   433a1:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   433a5:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   433ac:	48 d3 e0             	shl    %cl,%rax
   433af:	48 f7 d0             	not    %rax
   433b2:	48 23 45 e8          	and    -0x18(%rbp),%rax
   433b6:	48 01 d0             	add    %rdx,%rax
    assert(vmiter(pagetable, (uintptr_t) kernel_pagetable).pa()
   433b9:	ba 00 b0 05 00       	mov    $0x5b000,%edx
   433be:	48 39 c2             	cmp    %rax,%rdx
   433c1:	0f 85 87 00 00 00    	jne    4344e <check_pagetable(x86_64_pagetable*)+0x212>
}
   433c7:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   433cb:	c9                   	leave  
   433cc:	c3                   	ret    
    assert(((uintptr_t) pagetable % PAGESIZE) == 0); // must be page aligned
   433cd:	b9 00 00 00 00       	mov    $0x0,%ecx
   433d2:	ba 90 58 04 00       	mov    $0x45890,%edx
   433d7:	be 2e 01 00 00       	mov    $0x12e,%esi
   433dc:	bf 5e 5a 04 00       	mov    $0x45a5e,%edi
   433e1:	e8 0c f9 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   433e6:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   433ed:	ff 0f 00 
   433f0:	48 21 ca             	and    %rcx,%rdx
   433f3:	e9 b4 fe ff ff       	jmp    432ac <check_pagetable(x86_64_pagetable*)+0x70>
    assert(vmiter(pagetable, (uintptr_t) exception_entry).pa()
   433f8:	b9 00 00 00 00       	mov    $0x0,%ecx
   433fd:	ba b8 58 04 00       	mov    $0x458b8,%edx
   43402:	be 2f 01 00 00       	mov    $0x12f,%esi
   43407:	bf 5e 5a 04 00       	mov    $0x45a5e,%edi
   4340c:	e8 e1 f8 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
   43411:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   43418:	ff 0f 00 
   4341b:	48 21 ca             	and    %rcx,%rdx
   4341e:	e9 09 ff ff ff       	jmp    4332c <check_pagetable(x86_64_pagetable*)+0xf0>
    assert(vmiter(kernel_pagetable, (uintptr_t) pagetable).pa()
   43423:	b9 00 00 00 00       	mov    $0x0,%ecx
   43428:	ba 08 59 04 00       	mov    $0x45908,%edx
   4342d:	be 31 01 00 00       	mov    $0x131,%esi
   43432:	bf 5e 5a 04 00       	mov    $0x45a5e,%edi
   43437:	e8 b6 f8 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
   4343c:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   43443:	ff 0f 00 
   43446:	48 21 ca             	and    %rcx,%rdx
   43449:	e9 53 ff ff ff       	jmp    433a1 <check_pagetable(x86_64_pagetable*)+0x165>
    assert(vmiter(pagetable, (uintptr_t) kernel_pagetable).pa()
   4344e:	b9 00 00 00 00       	mov    $0x0,%ecx
   43453:	ba 58 59 04 00       	mov    $0x45958,%edx
   43458:	be 33 01 00 00       	mov    $0x133,%esi
   4345d:	bf 5e 5a 04 00       	mov    $0x45a5e,%edi
   43462:	e8 8b f8 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
   43467:	90                   	nop

0000000000043468 <pcistate::next(int) const>:
int pcistate::next(int addr) const {
   43468:	f3 0f 1e fa          	endbr64 
   4346c:	55                   	push   %rbp
   4346d:	48 89 e5             	mov    %rsp,%rbp
    }
    return addr;
}

inline uint32_t pcistate::readl(int addr) const {
    assert(addr >= 0 && !(addr & 3));
   43470:	89 f0                	mov    %esi,%eax
   43472:	83 c0 0c             	add    $0xc,%eax
   43475:	78 23                	js     4349a <pcistate::next(int) const+0x32>
   43477:	a8 03                	test   $0x3,%al
   43479:	75 1f                	jne    4349a <pcistate::next(int) const+0x32>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   4347b:	0d 00 00 00 80       	or     $0x80000000,%eax
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   43480:	ba f8 0c 00 00       	mov    $0xcf8,%edx
   43485:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   43486:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   4348b:	ed                   	in     (%dx),%eax
   4348c:	89 c2                	mov    %eax,%edx
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   4348e:	bf f8 0c 00 00       	mov    $0xcf8,%edi
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   43493:	b9 fc 0c 00 00       	mov    $0xcfc,%ecx
   43498:	eb 5b                	jmp    434f5 <pcistate::next(int) const+0x8d>
    assert(addr >= 0 && !(addr & 3));
   4349a:	b9 00 00 00 00       	mov    $0x0,%ecx
   4349f:	ba a9 5a 04 00       	mov    $0x45aa9,%edx
   434a4:	be 57 00 00 00       	mov    $0x57,%esi
   434a9:	bf a0 5a 04 00       	mov    $0x45aa0,%edi
   434ae:	e8 3f f8 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
    assert(addr >= 0 && addr < 0x1000000);
   434b3:	b9 00 00 00 00       	mov    $0x0,%ecx
   434b8:	ba c2 5a 04 00       	mov    $0x45ac2,%edx
   434bd:	be 4a 00 00 00       	mov    $0x4a,%esi
   434c2:	bf a0 5a 04 00       	mov    $0x45aa0,%edi
   434c7:	e8 26 f8 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
            addr += make_addr(0, 0, 1);
   434cc:	81 c6 00 01 00 00    	add    $0x100,%esi
        if (addr >= addr_end) {
   434d2:	81 fe ff ff 07 00    	cmp    $0x7ffff,%esi
   434d8:	7f 5d                	jg     43537 <pcistate::next(int) const+0xcf>
        x = readl(addr + config_lthb);
   434da:	8d 46 0c             	lea    0xc(%rsi),%eax
    assert(addr >= 0 && !(addr & 3));
   434dd:	40 f6 c6 03          	test   $0x3,%sil
   434e1:	75 37                	jne    4351a <pcistate::next(int) const+0xb2>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   434e3:	0d 00 00 00 80       	or     $0x80000000,%eax
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   434e8:	89 fa                	mov    %edi,%edx
   434ea:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   434eb:	89 ca                	mov    %ecx,%edx
   434ed:	ed                   	in     (%dx),%eax
   434ee:	89 c2                	mov    %eax,%edx
        if (x != uint32_t(-1)) {
   434f0:	83 f8 ff             	cmp    $0xffffffff,%eax
   434f3:	75 3e                	jne    43533 <pcistate::next(int) const+0xcb>
    assert(addr >= 0 && addr < 0x1000000);
   434f5:	81 fe ff ff ff 00    	cmp    $0xffffff,%esi
   434fb:	77 b6                	ja     434b3 <pcistate::next(int) const+0x4b>
            && (x == uint32_t(-1) || !(x & 0x800000))) {
   434fd:	f7 c6 00 07 00 00    	test   $0x700,%esi
   43503:	75 c7                	jne    434cc <pcistate::next(int) const+0x64>
   43505:	83 fa ff             	cmp    $0xffffffff,%edx
   43508:	74 08                	je     43512 <pcistate::next(int) const+0xaa>
   4350a:	f7 c2 00 00 80 00    	test   $0x800000,%edx
   43510:	75 ba                	jne    434cc <pcistate::next(int) const+0x64>
            addr += make_addr(0, 1, 0);
   43512:	81 c6 00 08 00 00    	add    $0x800,%esi
   43518:	eb b8                	jmp    434d2 <pcistate::next(int) const+0x6a>
    assert(addr >= 0 && !(addr & 3));
   4351a:	b9 00 00 00 00       	mov    $0x0,%ecx
   4351f:	ba a9 5a 04 00       	mov    $0x45aa9,%edx
   43524:	be 57 00 00 00       	mov    $0x57,%esi
   43529:	bf a0 5a 04 00       	mov    $0x45aa0,%edi
   4352e:	e8 bf f7 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
   43533:	89 f0                	mov    %esi,%eax
   43535:	eb 05                	jmp    4353c <pcistate::next(int) const+0xd4>
            return -1;
   43537:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   4353c:	5d                   	pop    %rbp
   4353d:	c3                   	ret    

000000000004353e <poweroff()>:
void poweroff() {
   4353e:	f3 0f 1e fa          	endbr64 
   43542:	55                   	push   %rbp
   43543:	48 89 e5             	mov    %rsp,%rbp
   43546:	53                   	push   %rbx
   43547:	48 83 ec 08          	sub    $0x8,%rsp
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   4354b:	b8 00 00 00 80       	mov    $0x80000000,%eax
   43550:	ba f8 0c 00 00       	mov    $0xcf8,%edx
   43555:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   43556:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   4355b:	ed                   	in     (%dx),%eax
    while (addr >= 0 && !predicate(addr)) {
   4355c:	3d 86 80 18 29       	cmp    $0x29188086,%eax
   43561:	0f 84 bf 00 00 00    	je     43626 <poweroff()+0xe8>
   43567:	3d 86 80 13 71       	cmp    $0x71138086,%eax
   4356c:	0f 84 b4 00 00 00    	je     43626 <poweroff()+0xe8>
   43572:	be 00 00 00 00       	mov    $0x0,%esi
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   43577:	bb f8 0c 00 00       	mov    $0xcf8,%ebx
        addr = next(addr);
   4357c:	bf 00 00 06 00       	mov    $0x60000,%edi
   43581:	e8 e2 fe ff ff       	call   43468 <pcistate::next(int) const>
   43586:	89 c6                	mov    %eax,%esi
    while (addr >= 0 && !predicate(addr)) {
   43588:	85 c0                	test   %eax,%eax
   4358a:	78 4d                	js     435d9 <poweroff()+0x9b>
    assert(addr >= 0 && !(addr & 3));
   4358c:	40 f6 c6 03          	test   $0x3,%sil
   43590:	75 62                	jne    435f4 <poweroff()+0xb6>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   43592:	89 f0                	mov    %esi,%eax
   43594:	0d 00 00 00 80       	or     $0x80000000,%eax
   43599:	89 da                	mov    %ebx,%edx
   4359b:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   4359c:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   435a1:	ed                   	in     (%dx),%eax
    while (addr >= 0 && !predicate(addr)) {
   435a2:	3d 86 80 13 71       	cmp    $0x71138086,%eax
   435a7:	74 07                	je     435b0 <poweroff()+0x72>
   435a9:	3d 86 80 18 29       	cmp    $0x29188086,%eax
   435ae:	75 cc                	jne    4357c <poweroff()+0x3e>
        int pm_io_base = pci.readl(addr + 0x40) & 0xFFC0;
   435b0:	8d 46 40             	lea    0x40(%rsi),%eax
    assert(addr >= 0 && !(addr & 3));
   435b3:	40 f6 c6 03          	test   $0x3,%sil
   435b7:	75 54                	jne    4360d <poweroff()+0xcf>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   435b9:	0d 00 00 00 80       	or     $0x80000000,%eax
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   435be:	ba f8 0c 00 00       	mov    $0xcf8,%edx
   435c3:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   435c4:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   435c9:	ed                   	in     (%dx),%eax
   435ca:	25 c0 ff 00 00       	and    $0xffc0,%eax
        outw(pm_io_base + 4, 0x2000);
   435cf:	8d 50 04             	lea    0x4(%rax),%edx
    asm volatile("outw %0, %w1" : : "a" (data), "d" (port));
   435d2:	b8 00 20 00 00       	mov    $0x2000,%eax
   435d7:	66 ef                	out    %ax,(%dx)
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   435d9:	ba e0 5a 04 00       	mov    $0x45ae0,%edx
   435de:	be 00 c0 00 00       	mov    $0xc000,%esi
   435e3:	bf 80 07 00 00       	mov    $0x780,%edi
   435e8:	b8 00 00 00 00       	mov    $0x0,%eax
   435ed:	e8 1d 1d 00 00       	call   4530f <console_printf(int, int, char const*, ...)>
    while (true) {
   435f2:	eb fe                	jmp    435f2 <poweroff()+0xb4>
    assert(addr >= 0 && !(addr & 3));
   435f4:	b9 00 00 00 00       	mov    $0x0,%ecx
   435f9:	ba a9 5a 04 00       	mov    $0x45aa9,%edx
   435fe:	be 57 00 00 00       	mov    $0x57,%esi
   43603:	bf a0 5a 04 00       	mov    $0x45aa0,%edi
   43608:	e8 e5 f6 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
   4360d:	b9 00 00 00 00       	mov    $0x0,%ecx
   43612:	ba a9 5a 04 00       	mov    $0x45aa9,%edx
   43617:	be 57 00 00 00       	mov    $0x57,%esi
   4361c:	bf a0 5a 04 00       	mov    $0x45aa0,%edi
   43621:	e8 cc f6 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
        int pm_io_base = pci.readl(addr + 0x40) & 0xFFC0;
   43626:	b8 40 00 00 00       	mov    $0x40,%eax
   4362b:	eb 8c                	jmp    435b9 <poweroff()+0x7b>

000000000004362d <check_keyboard()>:
int check_keyboard() {
   4362d:	f3 0f 1e fa          	endbr64 
   43631:	55                   	push   %rbp
   43632:	48 89 e5             	mov    %rsp,%rbp
   43635:	41 54                	push   %r12
   43637:	53                   	push   %rbx
   43638:	48 83 ec 20          	sub    $0x20,%rsp
    int c = keyboard_readc();
   4363c:	e8 20 f0 ff ff       	call   42661 <keyboard_readc()>
   43641:	41 89 c4             	mov    %eax,%r12d
    if (c == 'a' || c == 'f' || c == 'e') {
   43644:	8d 40 9b             	lea    -0x65(%rax),%eax
   43647:	83 f8 01             	cmp    $0x1,%eax
   4364a:	76 1b                	jbe    43667 <check_keyboard()+0x3a>
   4364c:	41 83 fc 61          	cmp    $0x61,%r12d
   43650:	74 15                	je     43667 <check_keyboard()+0x3a>
    } else if (c == 0x03 || c == 'q') {
   43652:	41 83 fc 03          	cmp    $0x3,%r12d
   43656:	74 0a                	je     43662 <check_keyboard()+0x35>
   43658:	41 83 fc 71          	cmp    $0x71,%r12d
   4365c:	0f 85 cc 00 00 00    	jne    4372e <check_keyboard()+0x101>
        poweroff();
   43662:	e8 d7 fe ff ff       	call   4353e <poweroff()>
   43667:	b8 80 03 e0 fe       	mov    $0xfee00380,%eax
   4366c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
        memset(pt, 0, PAGESIZE * 2);
   43672:	ba 00 20 00 00       	mov    $0x2000,%edx
   43677:	be 00 00 00 00       	mov    $0x0,%esi
   4367c:	bf 00 10 00 00       	mov    $0x1000,%edi
   43681:	e8 8d 10 00 00       	call   44713 <memset>
        pt[0].entry[0] = 0x2000 | PTE_P | PTE_W;
   43686:	48 c7 04 25 00 10 00 	movq   $0x2003,0x1000
   4368d:	00 03 20 00 00 
        pt[1].entry[0] = PTE_P | PTE_W | PTE_PS;
   43692:	48 c7 04 25 00 20 00 	movq   $0x83,0x2000
   43699:	00 83 00 00 00 
    asm volatile("movq %0, %%cr3" : : "r" (x) : "memory");
   4369e:	b8 00 10 00 00       	mov    $0x1000,%eax
   436a3:	0f 22 d8             	mov    %rax,%cr3
        multiboot_info[0] = 4;
   436a6:	c7 45 dc 04 00 00 00 	movl   $0x4,-0x24(%rbp)
            argument = "allocators";
   436ad:	b8 f3 5a 04 00       	mov    $0x45af3,%eax
        if (c == 'a') {
   436b2:	41 83 fc 61          	cmp    $0x61,%r12d
   436b6:	74 12                	je     436ca <check_keyboard()+0x9d>
            argument = "exit";
   436b8:	41 83 fc 65          	cmp    $0x65,%r12d
   436bc:	b8 fe 5a 04 00       	mov    $0x45afe,%eax
   436c1:	ba 52 54 04 00       	mov    $0x45452,%edx
   436c6:	48 0f 44 c2          	cmove  %rdx,%rax
        assert(argument_ptr < 0x100000000L);
   436ca:	48 89 c1             	mov    %rax,%rcx
   436cd:	48 c1 e9 20          	shr    $0x20,%rcx
   436d1:	75 67                	jne    4373a <check_keyboard()+0x10d>
        multiboot_info[4] = (uint32_t) argument_ptr;
   436d3:	89 45 ec             	mov    %eax,-0x14(%rbp)
        stash_kernel_data(true);
   436d6:	bf 01 00 00 00       	mov    $0x1,%edi
   436db:	e8 75 ed ff ff       	call   42455 <stash_kernel_data(bool)>
        uintptr_t zero_size = (uintptr_t) _kernel_end - (uintptr_t) _edata;
   436e0:	bb b0 01 06 00       	mov    $0x601b0,%ebx
   436e5:	48 81 eb 30 80 05 00 	sub    $0x58030,%rbx
        uintptr_t data_size = (uintptr_t) _edata - (uintptr_t) _data_start;
   436ec:	ba 30 80 05 00       	mov    $0x58030,%edx
   436f1:	48 81 ea 00 70 04 00 	sub    $0x47000,%rdx
        uint8_t* data_stash = (uint8_t*) (SYMTAB_ADDR - data_size);
   436f8:	be 00 70 04 01       	mov    $0x1047000,%esi
   436fd:	48 81 ee 30 80 05 00 	sub    $0x58030,%rsi
        memcpy(_data_start, data_stash, data_size);
   43704:	bf 00 70 04 00       	mov    $0x47000,%edi
   43709:	e8 e1 0f 00 00       	call   446ef <memcpy>
        memset(_edata, 0, zero_size);
   4370e:	48 89 da             	mov    %rbx,%rdx
   43711:	be 00 00 00 00       	mov    $0x0,%esi
   43716:	bf 30 80 05 00       	mov    $0x58030,%edi
   4371b:	e8 f3 0f 00 00       	call   44713 <memset>
        asm volatile("movl $0x2BADB002, %%eax; jmp kernel_entry"
   43720:	48 8d 5d dc          	lea    -0x24(%rbp),%rbx
   43724:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   43729:	e9 d2 c8 ff ff       	jmp    40000 <_kernel_start>
}
   4372e:	44 89 e0             	mov    %r12d,%eax
   43731:	48 83 c4 20          	add    $0x20,%rsp
   43735:	5b                   	pop    %rbx
   43736:	41 5c                	pop    %r12
   43738:	5d                   	pop    %rbp
   43739:	c3                   	ret    
        assert(argument_ptr < 0x100000000L);
   4373a:	b9 00 00 00 00       	mov    $0x0,%ecx
   4373f:	ba 03 5b 04 00       	mov    $0x45b03,%edx
   43744:	be 29 03 00 00       	mov    $0x329,%esi
   43749:	bf 5e 5a 04 00       	mov    $0x45a5e,%edi
   4374e:	e8 9f f5 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>

0000000000043753 <user_panic(proc const*)>:
void user_panic(const proc* p) {
   43753:	f3 0f 1e fa          	endbr64 
   43757:	55                   	push   %rbp
   43758:	48 89 e5             	mov    %rsp,%rbp
   4375b:	53                   	push   %rbx
   4375c:	48 81 ec 28 01 00 00 	sub    $0x128,%rsp
   43763:	48 89 fb             	mov    %rdi,%rbx
	__always_inline void store(T i, memory_order m = memory_order::seq_cst) noexcept { __atomic_store_n(&_value, i, int(m)); }
   43766:	b8 01 00 00 00       	mov    $0x1,%eax
   4376b:	86 05 98 68 01 00    	xchg   %al,0x16898(%rip)        # 5a009 <panicking>
    cursorpos = CPOS(24, 80);
   43771:	c7 05 81 58 07 00 d0 	movl   $0x7d0,0x75881(%rip)        # b8ffc <cursorpos>
   43778:	07 00 00 
    memset(buf, 0, sizeof(buf));
   4377b:	ba 00 01 00 00       	mov    $0x100,%edx
   43780:	be 00 00 00 00       	mov    $0x0,%esi
   43785:	48 8d bd f0 fe ff ff 	lea    -0x110(%rbp),%rdi
   4378c:	e8 82 0f 00 00       	call   44713 <memset>
    if (p->regs.reg_rdi == 0) {
   43791:	48 8b 73 40          	mov    0x40(%rbx),%rsi
   43795:	48 85 f6             	test   %rsi,%rsi
   43798:	0f 84 a1 00 00 00    	je     4383f <user_panic(proc const*)+0xec>
    : vmiter(p->pagetable, va) {
   4379e:	48 8b 03             	mov    (%rbx),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   437a1:	48 89 85 d0 fe ff ff 	mov    %rax,-0x130(%rbp)
   437a8:	48 89 85 d8 fe ff ff 	mov    %rax,-0x128(%rbp)
   437af:	c7 85 e0 fe ff ff 03 	movl   $0x3,-0x120(%rbp)
   437b6:	00 00 00 
   437b9:	c7 85 e4 fe ff ff ff 	movl   $0xfff,-0x11c(%rbp)
   437c0:	0f 00 00 
   437c3:	48 c7 85 e8 fe ff ff 	movq   $0x0,-0x118(%rbp)
   437ca:	00 00 00 00 
    real_find(va);
   437ce:	48 8d bd d0 fe ff ff 	lea    -0x130(%rbp),%rdi
   437d5:	e8 1a e7 ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
        strlcpy_from_user(buf, vmiter(p, p->regs.reg_rdi), sizeof(buf));
   437da:	ff b5 e8 fe ff ff    	push   -0x118(%rbp)
   437e0:	ff b5 e0 fe ff ff    	push   -0x120(%rbp)
   437e6:	ff b5 d8 fe ff ff    	push   -0x128(%rbp)
   437ec:	ff b5 d0 fe ff ff    	push   -0x130(%rbp)
   437f2:	be 00 01 00 00       	mov    $0x100,%esi
   437f7:	48 8d bd f0 fe ff ff 	lea    -0x110(%rbp),%rdi
   437fe:	e8 08 f4 ff ff       	call   42c0b <strlcpy_from_user(char*, vmiter, unsigned long)>
   43803:	48 83 c4 20          	add    $0x20,%rsp
        fmt = "USER PANIC: %s";
   43807:	ba 2a 5b 04 00       	mov    $0x45b2a,%edx
    error_printf(-1, COLOR_ERROR, fmt, buf);
   4380c:	48 8d 8d f0 fe ff ff 	lea    -0x110(%rbp),%rcx
   43813:	be 00 c0 00 00       	mov    $0xc000,%esi
   43818:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   4381d:	b8 00 00 00 00       	mov    $0x0,%eax
   43822:	e8 22 1b 00 00       	call   45349 <error_printf(int, int, char const*, ...)>
    error_print_backtrace(p->regs, p->pagetable, true);
   43827:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
   4382b:	ba 01 00 00 00       	mov    $0x1,%edx
   43830:	48 8b 33             	mov    (%rbx),%rsi
   43833:	e8 a5 f0 ff ff       	call   428dd <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)>
        check_keyboard();
   43838:	e8 f0 fd ff ff       	call   4362d <check_keyboard()>
    while (true) {
   4383d:	eb f9                	jmp    43838 <user_panic(proc const*)+0xe5>
        fmt = "USER PANIC";
   4383f:	ba 1f 5b 04 00       	mov    $0x45b1f,%edx
   43844:	eb c6                	jmp    4380c <user_panic(proc const*)+0xb9>

0000000000043846 <proc_panic(proc const*, char const*, ...)>:
void proc_panic(const proc* p, const char* format, ...) {
   43846:	f3 0f 1e fa          	endbr64 
   4384a:	55                   	push   %rbp
   4384b:	48 89 e5             	mov    %rsp,%rbp
   4384e:	53                   	push   %rbx
   4384f:	48 83 ec 58          	sub    $0x58,%rsp
   43853:	48 89 fb             	mov    %rdi,%rbx
   43856:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   4385a:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
   4385e:	4c 89 45 e0          	mov    %r8,-0x20(%rbp)
   43862:	4c 89 4d e8          	mov    %r9,-0x18(%rbp)
   43866:	b0 01                	mov    $0x1,%al
   43868:	86 05 9b 67 01 00    	xchg   %al,0x1679b(%rip)        # 5a009 <panicking>
    cursorpos = CPOS(24, 80);
   4386e:	c7 05 84 57 07 00 d0 	movl   $0x7d0,0x75784(%rip)        # b8ffc <cursorpos>
   43875:	07 00 00 
    va_start(val, format);
   43878:	c7 45 a8 10 00 00 00 	movl   $0x10,-0x58(%rbp)
   4387f:	48 8d 45 10          	lea    0x10(%rbp),%rax
   43883:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   43887:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   4388b:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    error_vprintf(-1, COLOR_ERROR, format, val);
   4388f:	48 8d 4d a8          	lea    -0x58(%rbp),%rcx
   43893:	48 89 f2             	mov    %rsi,%rdx
   43896:	be 00 c0 00 00       	mov    $0xc000,%esi
   4389b:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   438a0:	e8 0d f3 ff ff       	call   42bb2 <error_vprintf(int, int, char const*, __va_list_tag*)>
    if ((p->regs.reg_cs & 3) == 0) {
   438a5:	f6 83 b0 00 00 00 03 	testb  $0x3,0xb0(%rbx)
   438ac:	75 18                	jne    438c6 <proc_panic(proc const*, char const*, ...)+0x80>
    asm volatile("movq %%cr3, %0" : "=r" (x));
   438ae:	0f 20 de             	mov    %cr3,%rsi
    error_print_backtrace(p->regs, pt, true);
   438b1:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
   438b5:	ba 01 00 00 00       	mov    $0x1,%edx
   438ba:	e8 1e f0 ff ff       	call   428dd <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)>
        check_keyboard();
   438bf:	e8 69 fd ff ff       	call   4362d <check_keyboard()>
    while (true) {
   438c4:	eb f9                	jmp    438bf <proc_panic(proc const*, char const*, ...)+0x79>
        pt = p->pagetable;
   438c6:	48 8b 33             	mov    (%rbx),%rsi
   438c9:	eb e6                	jmp    438b1 <proc_panic(proc const*, char const*, ...)+0x6b>

00000000000438cb <panic(char const*, ...)>:
void panic(const char* format, ...) {
   438cb:	f3 0f 1e fa          	endbr64 
   438cf:	55                   	push   %rbp
   438d0:	48 89 e5             	mov    %rsp,%rbp
   438d3:	53                   	push   %rbx
   438d4:	48 83 ec 58          	sub    $0x58,%rsp
   438d8:	48 89 fb             	mov    %rdi,%rbx
   438db:	48 89 75 c8          	mov    %rsi,-0x38(%rbp)
   438df:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   438e3:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
   438e7:	4c 89 45 e0          	mov    %r8,-0x20(%rbp)
   438eb:	4c 89 4d e8          	mov    %r9,-0x18(%rbp)
   438ef:	b0 01                	mov    $0x1,%al
   438f1:	86 05 12 67 01 00    	xchg   %al,0x16712(%rip)        # 5a009 <panicking>
    cursorpos = CPOS(24, 80);
   438f7:	c7 05 fb 56 07 00 d0 	movl   $0x7d0,0x756fb(%rip)        # b8ffc <cursorpos>
   438fe:	07 00 00 
    if (!format) {
   43901:	48 85 ff             	test   %rdi,%rdi
   43904:	75 05                	jne    4390b <panic(char const*, ...)+0x40>
        format = "PANIC";
   43906:	bb 24 5b 04 00       	mov    $0x45b24,%ebx
    if (strstr(format, "PANIC") == nullptr) {
   4390b:	be 24 5b 04 00       	mov    $0x45b24,%esi
   43910:	48 89 df             	mov    %rbx,%rdi
   43913:	e8 dc 0e 00 00       	call   447f4 <strstr>
   43918:	48 85 c0             	test   %rax,%rax
   4391b:	75 14                	jne    43931 <panic(char const*, ...)+0x66>
        error_printf(-1, COLOR_ERROR, "PANIC: ");
   4391d:	ba 39 5b 04 00       	mov    $0x45b39,%edx
   43922:	be 00 c0 00 00       	mov    $0xc000,%esi
   43927:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   4392c:	e8 18 1a 00 00       	call   45349 <error_printf(int, int, char const*, ...)>
    va_start(val, format);
   43931:	c7 45 a8 08 00 00 00 	movl   $0x8,-0x58(%rbp)
   43938:	48 8d 45 10          	lea    0x10(%rbp),%rax
   4393c:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   43940:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   43944:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    error_vprintf(-1, COLOR_ERROR, format, val);
   43948:	48 8d 4d a8          	lea    -0x58(%rbp),%rcx
   4394c:	48 89 da             	mov    %rbx,%rdx
   4394f:	be 00 c0 00 00       	mov    $0xc000,%esi
   43954:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   43959:	e8 54 f2 ff ff       	call   42bb2 <error_vprintf(int, int, char const*, __va_list_tag*)>
   4395e:	0f 20 de             	mov    %cr3,%rsi
    asm volatile("movq %%rsp, %0" : "=r" (x));
   43961:	48 89 e0             	mov    %rsp,%rax
    backtrace_kernel_regs.reg_rsp = rdrsp();
   43964:	48 89 05 25 c8 01 00 	mov    %rax,0x1c825(%rip)        # 60190 <backtrace_current_regs()::backtrace_kernel_regs+0xb0>
    asm volatile("movq %%rbp, %0" : "=r" (x));
   4396b:	48 89 e8             	mov    %rbp,%rax
    backtrace_kernel_regs.reg_rbp = rdrbp();
   4396e:	48 89 05 8b c7 01 00 	mov    %rax,0x1c78b(%rip)        # 60100 <backtrace_current_regs()::backtrace_kernel_regs+0x20>
    backtrace_kernel_regs.reg_rip = 0;
   43975:	48 c7 05 f8 c7 01 00 	movq   $0x0,0x1c7f8(%rip)        # 60178 <backtrace_current_regs()::backtrace_kernel_regs+0x98>
   4397c:	00 00 00 00 
    error_print_backtrace(backtrace_current_regs(), backtrace_current_pagetable(), false);
   43980:	ba 00 00 00 00       	mov    $0x0,%edx
   43985:	bf e0 00 06 00       	mov    $0x600e0,%edi
   4398a:	e8 4e ef ff ff       	call   428dd <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)>
        check_keyboard();
   4398f:	e8 99 fc ff ff       	call   4362d <check_keyboard()>
    while (true) {
   43994:	eb f9                	jmp    4398f <panic(char const*, ...)+0xc4>

0000000000043996 <program_image::program_image(int)>:
program_image::program_image(int program_number) {
   43996:	f3 0f 1e fa          	endbr64 
    elf_ = nullptr;
   4399a:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
    if (program_number >= 0
   439a1:	83 fe 05             	cmp    $0x5,%esi
   439a4:	77 1a                	ja     439c0 <program_image::program_image(int)+0x2a>
        elf_ = (elf_header*) ramimages[program_number].begin;
   439a6:	48 63 f6             	movslq %esi,%rsi
   439a9:	48 8d 04 76          	lea    (%rsi,%rsi,2),%rax
   439ad:	48 8b 04 c5 08 70 04 	mov    0x47008(,%rax,8),%rax
   439b4:	00 
   439b5:	48 89 07             	mov    %rax,(%rdi)
        assert(elf_->e_magic == ELF_MAGIC);
   439b8:	81 38 7f 45 4c 46    	cmpl   $0x464c457f,(%rax)
   439be:	75 01                	jne    439c1 <program_image::program_image(int)+0x2b>
   439c0:	c3                   	ret    
program_image::program_image(int program_number) {
   439c1:	55                   	push   %rbp
   439c2:	48 89 e5             	mov    %rsp,%rbp
        assert(elf_->e_magic == ELF_MAGIC);
   439c5:	b9 00 00 00 00       	mov    $0x0,%ecx
   439ca:	ba 41 5b 04 00       	mov    $0x45b41,%edx
   439cf:	be d6 03 00 00       	mov    $0x3d6,%esi
   439d4:	bf 5e 5a 04 00       	mov    $0x45a5e,%edi
   439d9:	e8 14 f3 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>

00000000000439de <program_image::program_number(char const*)>:
int program_image::program_number(const char* program_name) {
   439de:	f3 0f 1e fa          	endbr64 
   439e2:	55                   	push   %rbp
   439e3:	48 89 e5             	mov    %rsp,%rbp
   439e6:	41 54                	push   %r12
   439e8:	53                   	push   %rbx
   439e9:	49 89 fc             	mov    %rdi,%r12
    for (size_t i = 0; i != sizeof(ramimages) / sizeof(ramimages[0]); ++i) {
   439ec:	bb 00 00 00 00       	mov    $0x0,%ebx
        if (strcmp(program_name, ramimages[i].name) == 0) {
   439f1:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
   439f5:	48 8b 34 c5 00 70 04 	mov    0x47000(,%rax,8),%rsi
   439fc:	00 
   439fd:	4c 89 e7             	mov    %r12,%rdi
   43a00:	e8 73 0d 00 00       	call   44778 <strcmp>
   43a05:	85 c0                	test   %eax,%eax
   43a07:	74 14                	je     43a1d <program_image::program_number(char const*)+0x3f>
    for (size_t i = 0; i != sizeof(ramimages) / sizeof(ramimages[0]); ++i) {
   43a09:	48 83 c3 01          	add    $0x1,%rbx
   43a0d:	48 83 fb 06          	cmp    $0x6,%rbx
   43a11:	75 de                	jne    439f1 <program_image::program_number(char const*)+0x13>
    return -1;
   43a13:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   43a18:	5b                   	pop    %rbx
   43a19:	41 5c                	pop    %r12
   43a1b:	5d                   	pop    %rbp
   43a1c:	c3                   	ret    
            return i;
   43a1d:	89 d8                	mov    %ebx,%eax
   43a1f:	eb f7                	jmp    43a18 <program_image::program_number(char const*)+0x3a>
   43a21:	90                   	nop

0000000000043a22 <program_image::program_image(char const*)>:
program_image::program_image(const char* program_name)
   43a22:	f3 0f 1e fa          	endbr64 
   43a26:	55                   	push   %rbp
   43a27:	48 89 e5             	mov    %rsp,%rbp
   43a2a:	53                   	push   %rbx
   43a2b:	48 83 ec 08          	sub    $0x8,%rsp
   43a2f:	48 89 fb             	mov    %rdi,%rbx
   43a32:	48 89 f7             	mov    %rsi,%rdi
    : program_image(program_number(program_name)) {
   43a35:	e8 a4 ff ff ff       	call   439de <program_image::program_number(char const*)>
   43a3a:	89 c6                	mov    %eax,%esi
   43a3c:	48 89 df             	mov    %rbx,%rdi
   43a3f:	e8 52 ff ff ff       	call   43996 <program_image::program_image(int)>
}
   43a44:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   43a48:	c9                   	leave  
   43a49:	c3                   	ret    

0000000000043a4a <program_image::entry() const>:
uintptr_t program_image::entry() const {
   43a4a:	f3 0f 1e fa          	endbr64 
    return elf_ ? elf_->e_entry : 0;
   43a4e:	48 8b 17             	mov    (%rdi),%rdx
   43a51:	b8 00 00 00 00       	mov    $0x0,%eax
   43a56:	48 85 d2             	test   %rdx,%rdx
   43a59:	74 04                	je     43a5f <program_image::entry() const+0x15>
   43a5b:	48 8b 42 18          	mov    0x18(%rdx),%rax
}
   43a5f:	c3                   	ret    

0000000000043a60 <program_image::empty() const>:
bool program_image::empty() const {
   43a60:	f3 0f 1e fa          	endbr64 
    return !elf_ || elf_->e_phnum == 0;
   43a64:	48 8b 17             	mov    (%rdi),%rdx
   43a67:	b8 01 00 00 00       	mov    $0x1,%eax
   43a6c:	48 85 d2             	test   %rdx,%rdx
   43a6f:	74 08                	je     43a79 <program_image::empty() const+0x19>
   43a71:	66 83 7a 38 00       	cmpw   $0x0,0x38(%rdx)
   43a76:	0f 94 c0             	sete   %al
}
   43a79:	c3                   	ret    

0000000000043a7a <program_image_segment::program_image_segment(elf_program*, elf_header*)>:
program_image_segment::program_image_segment(elf_program* ph, elf_header* elf)
   43a7a:	f3 0f 1e fa          	endbr64 
    : ph_(ph), elf_(elf) {
   43a7e:	48 89 37             	mov    %rsi,(%rdi)
   43a81:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    if (elf) {
   43a85:	48 85 d2             	test   %rdx,%rdx
   43a88:	74 1a                	je     43aa4 <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x2a>
        return ph + (end ? elf->e_phnum : 0);
   43a8a:	0f b7 4a 38          	movzwl 0x38(%rdx),%ecx
   43a8e:	48 8d 04 cd 00 00 00 	lea    0x0(,%rcx,8),%rax
   43a95:	00 
   43a96:	48 29 c8             	sub    %rcx,%rax
   43a99:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
   43a9d:	48 03 42 20          	add    0x20(%rdx),%rax
   43aa1:	48 89 c2             	mov    %rax,%rdx
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   43aa4:	48 39 d6             	cmp    %rdx,%rsi
   43aa7:	74 12                	je     43abb <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x41>
   43aa9:	83 3e 01             	cmpl   $0x1,(%rsi)
   43aac:	74 0c                	je     43aba <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x40>
        ++ph_;
   43aae:	48 83 c6 38          	add    $0x38,%rsi
   43ab2:	48 89 37             	mov    %rsi,(%rdi)
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   43ab5:	48 39 d6             	cmp    %rdx,%rsi
   43ab8:	75 ef                	jne    43aa9 <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x2f>
}
   43aba:	c3                   	ret    
   43abb:	c3                   	ret    

0000000000043abc <program_image::begin() const>:
program_image_segment program_image::begin() const {
   43abc:	f3 0f 1e fa          	endbr64 
   43ac0:	55                   	push   %rbp
   43ac1:	48 89 e5             	mov    %rsp,%rbp
   43ac4:	48 83 ec 10          	sub    $0x10,%rsp
    return program_image_segment(elf_header_program(elf_, false), elf_);
   43ac8:	48 8b 17             	mov    (%rdi),%rdx
    if (elf) {
   43acb:	48 85 d2             	test   %rdx,%rdx
   43ace:	74 1a                	je     43aea <program_image::begin() const+0x2e>
        return ph + (end ? elf->e_phnum : 0);
   43ad0:	48 89 d6             	mov    %rdx,%rsi
   43ad3:	48 03 72 20          	add    0x20(%rdx),%rsi
    return program_image_segment(elf_header_program(elf_, false), elf_);
   43ad7:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   43adb:	e8 9a ff ff ff       	call   43a7a <program_image_segment::program_image_segment(elf_program*, elf_header*)>
}
   43ae0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43ae4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43ae8:	c9                   	leave  
   43ae9:	c3                   	ret    
        return nullptr;
   43aea:	48 89 d6             	mov    %rdx,%rsi
   43aed:	eb e8                	jmp    43ad7 <program_image::begin() const+0x1b>
   43aef:	90                   	nop

0000000000043af0 <program_image::end() const>:
program_image_segment program_image::end() const {
   43af0:	f3 0f 1e fa          	endbr64 
   43af4:	55                   	push   %rbp
   43af5:	48 89 e5             	mov    %rsp,%rbp
   43af8:	48 83 ec 10          	sub    $0x10,%rsp
    return program_image_segment(elf_header_program(elf_, true), elf_);
   43afc:	48 8b 17             	mov    (%rdi),%rdx
    if (elf) {
   43aff:	48 85 d2             	test   %rdx,%rdx
   43b02:	74 2a                	je     43b2e <program_image::end() const+0x3e>
        return ph + (end ? elf->e_phnum : 0);
   43b04:	0f b7 4a 38          	movzwl 0x38(%rdx),%ecx
   43b08:	48 8d 04 cd 00 00 00 	lea    0x0(,%rcx,8),%rax
   43b0f:	00 
   43b10:	48 29 c8             	sub    %rcx,%rax
   43b13:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   43b17:	48 03 72 20          	add    0x20(%rdx),%rsi
    return program_image_segment(elf_header_program(elf_, true), elf_);
   43b1b:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   43b1f:	e8 56 ff ff ff       	call   43a7a <program_image_segment::program_image_segment(elf_program*, elf_header*)>
}
   43b24:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43b28:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43b2c:	c9                   	leave  
   43b2d:	c3                   	ret    
        return nullptr;
   43b2e:	48 89 d6             	mov    %rdx,%rsi
   43b31:	eb e8                	jmp    43b1b <program_image::end() const+0x2b>
   43b33:	90                   	nop

0000000000043b34 <program_image_segment::va() const>:
uintptr_t program_image_segment::va() const {
   43b34:	f3 0f 1e fa          	endbr64 
    return ph_->p_va;
   43b38:	48 8b 07             	mov    (%rdi),%rax
   43b3b:	48 8b 40 10          	mov    0x10(%rax),%rax
}
   43b3f:	c3                   	ret    

0000000000043b40 <program_image_segment::size() const>:
size_t program_image_segment::size() const {
   43b40:	f3 0f 1e fa          	endbr64 
    return ph_->p_memsz;
   43b44:	48 8b 07             	mov    (%rdi),%rax
   43b47:	48 8b 40 28          	mov    0x28(%rax),%rax
}
   43b4b:	c3                   	ret    

0000000000043b4c <program_image_segment::data() const>:
const char* program_image_segment::data() const {
   43b4c:	f3 0f 1e fa          	endbr64 
    return (const char*) elf_ + ph_->p_offset;
   43b50:	48 8b 07             	mov    (%rdi),%rax
   43b53:	48 8b 40 08          	mov    0x8(%rax),%rax
   43b57:	48 03 47 08          	add    0x8(%rdi),%rax
}
   43b5b:	c3                   	ret    

0000000000043b5c <program_image_segment::data_size() const>:
size_t program_image_segment::data_size() const {
   43b5c:	f3 0f 1e fa          	endbr64 
    return ph_->p_filesz;
   43b60:	48 8b 07             	mov    (%rdi),%rax
   43b63:	48 8b 40 20          	mov    0x20(%rax),%rax
}
   43b67:	c3                   	ret    

0000000000043b68 <program_image_segment::writable() const>:
bool program_image_segment::writable() const {
   43b68:	f3 0f 1e fa          	endbr64 
    return ph_->p_flags & ELF_PFLAG_WRITE;
   43b6c:	48 8b 07             	mov    (%rdi),%rax
   43b6f:	8b 40 04             	mov    0x4(%rax),%eax
   43b72:	d1 e8                	shr    %eax
   43b74:	83 e0 01             	and    $0x1,%eax
}
   43b77:	c3                   	ret    

0000000000043b78 <program_image_segment::operator!=(program_image_segment const&) const>:
bool program_image_segment::operator!=(const program_image_segment& x) const {
   43b78:	f3 0f 1e fa          	endbr64 
    return ph_ != x.ph_;
   43b7c:	48 8b 06             	mov    (%rsi),%rax
   43b7f:	48 39 07             	cmp    %rax,(%rdi)
   43b82:	0f 95 c0             	setne  %al
}
   43b85:	c3                   	ret    

0000000000043b86 <program_image_segment::operator++()>:
void program_image_segment::operator++() {
   43b86:	f3 0f 1e fa          	endbr64 
    assert(ph_ != elf_header_program(elf_, true));
   43b8a:	48 8b 07             	mov    (%rdi),%rax
   43b8d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    if (elf) {
   43b91:	48 85 d2             	test   %rdx,%rdx
   43b94:	74 54                	je     43bea <program_image_segment::operator++()+0x64>
        return ph + (end ? elf->e_phnum : 0);
   43b96:	0f b7 72 38          	movzwl 0x38(%rdx),%esi
   43b9a:	48 8d 0c f5 00 00 00 	lea    0x0(,%rsi,8),%rcx
   43ba1:	00 
   43ba2:	48 29 f1             	sub    %rsi,%rcx
   43ba5:	48 8d 0c ca          	lea    (%rdx,%rcx,8),%rcx
   43ba9:	48 03 4a 20          	add    0x20(%rdx),%rcx
    assert(ph_ != elf_header_program(elf_, true));
   43bad:	48 39 c8             	cmp    %rcx,%rax
   43bb0:	74 46                	je     43bf8 <program_image_segment::operator++()+0x72>
    ++ph_;
   43bb2:	48 83 c0 38          	add    $0x38,%rax
   43bb6:	48 89 07             	mov    %rax,(%rdi)
        return ph + (end ? elf->e_phnum : 0);
   43bb9:	0f b7 72 38          	movzwl 0x38(%rdx),%esi
   43bbd:	48 8d 0c f5 00 00 00 	lea    0x0(,%rsi,8),%rcx
   43bc4:	00 
   43bc5:	48 29 f1             	sub    %rsi,%rcx
   43bc8:	48 8d 0c ca          	lea    (%rdx,%rcx,8),%rcx
   43bcc:	48 03 4a 20          	add    0x20(%rdx),%rcx
   43bd0:	48 89 ca             	mov    %rcx,%rdx
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   43bd3:	48 39 c8             	cmp    %rcx,%rax
   43bd6:	74 11                	je     43be9 <program_image_segment::operator++()+0x63>
   43bd8:	83 38 01             	cmpl   $0x1,(%rax)
   43bdb:	74 38                	je     43c15 <program_image_segment::operator++()+0x8f>
        ++ph_;
   43bdd:	48 83 c0 38          	add    $0x38,%rax
   43be1:	48 89 07             	mov    %rax,(%rdi)
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   43be4:	48 39 d0             	cmp    %rdx,%rax
   43be7:	75 ef                	jne    43bd8 <program_image_segment::operator++()+0x52>
   43be9:	c3                   	ret    
    assert(ph_ != elf_header_program(elf_, true));
   43bea:	48 85 c0             	test   %rax,%rax
   43bed:	74 09                	je     43bf8 <program_image_segment::operator++()+0x72>
    ++ph_;
   43bef:	48 83 c0 38          	add    $0x38,%rax
   43bf3:	48 89 07             	mov    %rax,(%rdi)
    if (elf) {
   43bf6:	eb e0                	jmp    43bd8 <program_image_segment::operator++()+0x52>
void program_image_segment::operator++() {
   43bf8:	55                   	push   %rbp
   43bf9:	48 89 e5             	mov    %rsp,%rbp
    assert(ph_ != elf_header_program(elf_, true));
   43bfc:	b9 00 00 00 00       	mov    $0x0,%ecx
   43c01:	ba b0 59 04 00       	mov    $0x459b0,%edx
   43c06:	be 1c 04 00 00       	mov    $0x41c,%esi
   43c0b:	bf 5e 5a 04 00       	mov    $0x45a5e,%edi
   43c10:	e8 dd f0 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
   43c15:	c3                   	ret    

0000000000043c16 <__cxa_guard_acquire>:
int __cxa_guard_acquire(long long* arg) {
   43c16:	f3 0f 1e fa          	endbr64 
	__always_inline T load(memory_order m = memory_order::seq_cst) const noexcept { return __atomic_load_n(&_value, int(m)); }
   43c1a:	0f b6 17             	movzbl (%rdi),%edx
        return 0;
   43c1d:	b8 00 00 00 00       	mov    $0x0,%eax
    if (guard->load(memory_order_relaxed) == 2) {
   43c22:	80 fa 02             	cmp    $0x2,%dl
   43c25:	74 22                	je     43c49 <__cxa_guard_acquire+0x33>
	__always_inline void store(T i, memory_order m = memory_order::seq_cst) volatile noexcept { __atomic_store_n(&_value, i, int(m)); }

	__always_inline T exchange(T i, memory_order m = memory_order::seq_cst) noexcept { return __atomic_exchange_n(&_value, i, int(m)); }
   43c27:	ba 01 00 00 00       	mov    $0x1,%edx
   43c2c:	89 d0                	mov    %edx,%eax
   43c2e:	86 07                	xchg   %al,(%rdi)
        if (old_value == 2) {
   43c30:	3c 02                	cmp    $0x2,%al
   43c32:	74 08                	je     43c3c <__cxa_guard_acquire+0x26>
        } else if (old_value == 1) {
   43c34:	3c 01                	cmp    $0x1,%al
   43c36:	75 0c                	jne    43c44 <__cxa_guard_acquire+0x2e>
    asm volatile("rdtsc" : "=a" (low), "=d" (high));
    return low | (high << 32);
}

__always_inline void pause() {
    asm volatile("pause" : : : "memory");
   43c38:	f3 90                	pause  
}
   43c3a:	eb f0                	jmp    43c2c <__cxa_guard_acquire+0x16>
   43c3c:	86 07                	xchg   %al,(%rdi)
            return 0;
   43c3e:	b8 00 00 00 00       	mov    $0x0,%eax
   43c43:	c3                   	ret    
            return 1;
   43c44:	b8 01 00 00 00       	mov    $0x1,%eax
}
   43c49:	c3                   	ret    

0000000000043c4a <__cxa_guard_release>:
void __cxa_guard_release(long long* arg) {
   43c4a:	f3 0f 1e fa          	endbr64 
	__always_inline void store(T i, memory_order m = memory_order::seq_cst) noexcept { __atomic_store_n(&_value, i, int(m)); }
   43c4e:	b8 02 00 00 00       	mov    $0x2,%eax
   43c53:	86 07                	xchg   %al,(%rdi)
}
   43c55:	c3                   	ret    

0000000000043c56 <memusage::refresh()>:

// memusage::refresh()
//    Calculate the current physical usage map, using the current process
//    table.

void memusage::refresh() {
   43c56:	f3 0f 1e fa          	endbr64 
   43c5a:	55                   	push   %rbp
   43c5b:	48 89 e5             	mov    %rsp,%rbp
   43c5e:	41 57                	push   %r15
   43c60:	41 56                	push   %r14
   43c62:	41 55                	push   %r13
   43c64:	41 54                	push   %r12
   43c66:	53                   	push   %rbx
   43c67:	48 83 ec 48          	sub    $0x48,%rsp
   43c6b:	49 89 fe             	mov    %rdi,%r14
    if (!v_) {
   43c6e:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   43c72:	74 3f                	je     43cb3 <memusage::refresh()+0x5d>
        v_ = reinterpret_cast<unsigned*>(kalloc(PAGESIZE));
        assert(v_ != nullptr);
    }

    memset(v_, 0, (maxpa / PAGESIZE) * sizeof(*v_));
   43c74:	ba 00 10 00 00       	mov    $0x1000,%edx
   43c79:	be 00 00 00 00       	mov    $0x0,%esi
   43c7e:	49 8b 3e             	mov    (%r14),%rdi
   43c81:	e8 8d 0a 00 00       	call   44713 <memset>

    // mark kernel page tables
    for (ptiter it(kernel_pagetable); !it.done(); it.next()) {
   43c86:	be 00 b0 05 00       	mov    $0x5b000,%esi
   43c8b:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43c8f:	e8 2c e7 ff ff       	call   423c0 <ptiter::ptiter(x86_64_pagetable*)>
   43c94:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffff,%rax
   43c9b:	ff 00 00 
   43c9e:	48 39 45 c8          	cmp    %rax,-0x38(%rbp)
   43ca2:	77 70                	ja     43d14 <memusage::refresh()+0xbe>
    return *pep_ & PTE_PAMASK;
   43ca4:	49 bc 00 f0 ff ff ff 	movabs $0xffffffffff000,%r12
   43cab:	ff 0f 00 
   43cae:	48 89 c3             	mov    %rax,%rbx
   43cb1:	eb 3f                	jmp    43cf2 <memusage::refresh()+0x9c>
        v_ = reinterpret_cast<unsigned*>(kalloc(PAGESIZE));
   43cb3:	bf 00 10 00 00       	mov    $0x1000,%edi
   43cb8:	e8 a9 ce ff ff       	call   40b66 <kalloc(unsigned long)>
   43cbd:	49 89 06             	mov    %rax,(%r14)
        assert(v_ != nullptr);
   43cc0:	48 85 c0             	test   %rax,%rax
   43cc3:	75 af                	jne    43c74 <memusage::refresh()+0x1e>
   43cc5:	b9 00 00 00 00       	mov    $0x0,%ecx
   43cca:	ba e0 5c 04 00       	mov    $0x45ce0,%edx
   43ccf:	be 48 00 00 00       	mov    $0x48,%esi
   43cd4:	bf ee 5c 04 00       	mov    $0x45cee,%edi
   43cd9:	e8 14 f0 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
    down(true);
   43cde:	be 01 00 00 00       	mov    $0x1,%esi
   43ce3:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43ce7:	e8 d2 e5 ff ff       	call   422be <ptiter::down(bool)>
    for (ptiter it(kernel_pagetable); !it.done(); it.next()) {
   43cec:	48 39 5d c8          	cmp    %rbx,-0x38(%rbp)
   43cf0:	77 22                	ja     43d14 <memusage::refresh()+0xbe>
    return *pep_ & PTE_PAMASK;
   43cf2:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43cf6:	4c 89 e6             	mov    %r12,%rsi
   43cf9:	48 23 30             	and    (%rax),%rsi
   43cfc:	48 89 f0             	mov    %rsi,%rax
        if (pa < maxpa) {
   43cff:	48 81 fe ff ff 3f 00 	cmp    $0x3fffff,%rsi
   43d06:	77 d6                	ja     43cde <memusage::refresh()+0x88>
            v_[pa / PAGESIZE] |= flags;
   43d08:	48 c1 e8 0a          	shr    $0xa,%rax
   43d0c:	49 03 06             	add    (%r14),%rax
   43d0f:	83 08 01             	orl    $0x1,(%rax)
   43d12:	eb ca                	jmp    43cde <memusage::refresh()+0x88>
// address translation functions for identity-mapped kernels
inline uint64_t kptr2pa(uint64_t kptr) {
    return kptr;
}
template <typename T> inline uint64_t kptr2pa(T* kptr) {
    return reinterpret_cast<uint64_t>(kptr);
   43d14:	b8 00 b0 05 00       	mov    $0x5b000,%eax
        if (pa < maxpa) {
   43d19:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   43d1f:	77 0b                	ja     43d2c <memusage::refresh()+0xd6>
            v_[pa / PAGESIZE] |= flags;
   43d21:	48 c1 e8 0c          	shr    $0xc,%rax
   43d25:	49 8b 16             	mov    (%r14),%rdx
   43d28:	83 0c 82 01          	orl    $0x1,(%rdx,%rax,4)
    }
    mark(kptr2pa(kernel_pagetable), f_kernel);

    // mark pages accessible from each process's page table
    bool any = false;
    for (int pid = 1; pid < NPROC; ++pid) {
   43d2c:	41 bc f0 92 05 00    	mov    $0x592f0,%r12d
void memusage::refresh() {
   43d32:	bb 00 00 00 00       	mov    $0x0,%ebx
   43d37:	b9 00 00 00 00       	mov    $0x0,%ecx
        if (p->state != P_FREE
            && p->pagetable
            && p->pagetable != kernel_pagetable) {
            any = true;

            for (ptiter it(p); it.va() < VA_LOWEND; it.next()) {
   43d3c:	49 bd ff ff ff ff ff 	movabs $0x7fffffffffff,%r13
   43d43:	7f 00 00 
        uintptr_t pa = *pep_ & PTE_PAMASK;
   43d46:	49 bf 00 f0 ff ff ff 	movabs $0xffffffffff000,%r15
   43d4d:	ff 0f 00 
   43d50:	e9 b3 01 00 00       	jmp    43f08 <memusage::refresh()+0x2b2>
    down(true);
   43d55:	be 01 00 00 00       	mov    $0x1,%esi
   43d5a:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43d5e:	e8 5b e5 ff ff       	call   422be <ptiter::down(bool)>
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   43d63:	8b 45 c0             	mov    -0x40(%rbp),%eax
   43d66:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   43d6a:	b8 01 00 00 00       	mov    $0x1,%eax
   43d6f:	48 d3 e0             	shl    %cl,%rax
    return va_ & ~pageoffmask(level_);
   43d72:	48 f7 d8             	neg    %rax
   43d75:	48 23 45 c8          	and    -0x38(%rbp),%rax
   43d79:	4c 39 e8             	cmp    %r13,%rax
   43d7c:	77 29                	ja     43da7 <memusage::refresh()+0x151>
    return *pep_ & PTE_PAMASK;
   43d7e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43d82:	4c 89 ff             	mov    %r15,%rdi
   43d85:	48 23 38             	and    (%rax),%rdi
   43d88:	48 89 f8             	mov    %rdi,%rax
        if (pa < maxpa) {
   43d8b:	48 81 ff ff ff 3f 00 	cmp    $0x3fffff,%rdi
   43d92:	77 c1                	ja     43d55 <memusage::refresh()+0xff>
            v_[pa / PAGESIZE] |= flags;
   43d94:	48 c1 e8 0a          	shr    $0xa,%rax
   43d98:	49 03 06             	add    (%r14),%rax
   43d9b:	8b 55 98             	mov    -0x68(%rbp),%edx
   43d9e:	0b 10                	or     (%rax),%edx
   43da0:	83 ca 01             	or     $0x1,%edx
   43da3:	89 10                	mov    %edx,(%rax)
   43da5:	eb ae                	jmp    43d55 <memusage::refresh()+0xff>
            return 2U << pid;
   43da7:	b8 02 00 00 00       	mov    $0x2,%eax
   43dac:	0f b6 4d ac          	movzbl -0x54(%rbp),%ecx
   43db0:	d3 e0                	shl    %cl,%eax
   43db2:	83 7d a8 1d          	cmpl   $0x1d,-0x58(%rbp)
   43db6:	ba 00 00 00 00       	mov    $0x0,%edx
   43dbb:	0f 43 c2             	cmovae %edx,%eax
   43dbe:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
   43dc2:	48 8b 11             	mov    (%rcx),%rdx
        if (pa < maxpa) {
   43dc5:	48 81 fa ff ff 3f 00 	cmp    $0x3fffff,%rdx
   43dcc:	77 12                	ja     43de0 <memusage::refresh()+0x18a>
            v_[pa / PAGESIZE] |= flags;
   43dce:	48 c1 ea 0c          	shr    $0xc,%rdx
   43dd2:	49 8b 0e             	mov    (%r14),%rcx
   43dd5:	48 8d 14 91          	lea    (%rcx,%rdx,4),%rdx
   43dd9:	0b 02                	or     (%rdx),%eax
   43ddb:	83 c8 01             	or     $0x1,%eax
   43dde:	89 02                	mov    %eax,(%rdx)
    : vmiter(p->pagetable, va) {
   43de0:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   43de4:	48 8b 00             	mov    (%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   43de7:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   43deb:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   43def:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   43df6:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   43dfd:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   43e04:	00 
    real_find(va);
   43e05:	be 00 00 00 00       	mov    $0x0,%esi
   43e0a:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43e0e:	e8 e1 e0 ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    return va_;
   43e13:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
                mark(it.pa(), f_kernel | f_process(pid));
            }
            mark(kptr2pa(p->pagetable), f_kernel | f_process(pid));

            for (vmiter it(p, 0); it.va() < VA_LOWEND; ) {
   43e17:	4c 39 ef             	cmp    %r13,%rdi
   43e1a:	0f 87 d8 00 00 00    	ja     43ef8 <memusage::refresh()+0x2a2>
            return 2U << pid;
   43e20:	b8 02 00 00 00       	mov    $0x2,%eax
   43e25:	0f b6 4d ac          	movzbl -0x54(%rbp),%ecx
   43e29:	d3 e0                	shl    %cl,%eax
   43e2b:	83 7d a8 1c          	cmpl   $0x1c,-0x58(%rbp)
   43e2f:	ba 00 00 00 00       	mov    $0x0,%edx
   43e34:	0f 46 d0             	cmovbe %eax,%edx
   43e37:	89 55 ac             	mov    %edx,-0x54(%rbp)
   43e3a:	eb 2b                	jmp    43e67 <memusage::refresh()+0x211>
            v_[pa / PAGESIZE] |= flags;
   43e3c:	48 c1 e8 0c          	shr    $0xc,%rax
   43e40:	49 8b 16             	mov    (%r14),%rdx
   43e43:	48 8d 14 82          	lea    (%rdx,%rax,4),%rdx
   43e47:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43e4a:	0b 02                	or     (%rdx),%eax
   43e4c:	83 c8 02             	or     $0x2,%eax
   43e4f:	89 02                	mov    %eax,(%rdx)
                if (it.user()) {
                    mark(it.pa(), f_user | f_process(pid));
                    it.next();
   43e51:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43e55:	e8 5e e2 ff ff       	call   420b8 <vmiter::next()>
   43e5a:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
            for (vmiter it(p, 0); it.va() < VA_LOWEND; ) {
   43e5e:	4c 39 ef             	cmp    %r13,%rdi
   43e61:	0f 87 91 00 00 00    	ja     43ef8 <memusage::refresh()+0x2a2>
    uint64_t ph = *pep_ & perm_;
   43e67:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43e6b:	48 8b 08             	mov    (%rax),%rcx
   43e6e:	48 63 55 c4          	movslq -0x3c(%rbp),%rdx
   43e72:	48 21 ca             	and    %rcx,%rdx
    return ph & -(ph & PTE_P);
   43e75:	48 89 d0             	mov    %rdx,%rax
   43e78:	83 e0 01             	and    $0x1,%eax
   43e7b:	48 f7 d8             	neg    %rax
   43e7e:	48 21 d0             	and    %rdx,%rax
    return (perm() & desired_perm) == desired_perm;
   43e81:	83 e0 05             	and    $0x5,%eax
                if (it.user()) {
   43e84:	48 83 f8 05          	cmp    $0x5,%rax
   43e88:	75 46                	jne    43ed0 <memusage::refresh()+0x27a>
    if (*pep_ & PTE_P) {
   43e8a:	f6 c1 01             	test   $0x1,%cl
   43e8d:	74 c2                	je     43e51 <memusage::refresh()+0x1fb>
        if (level_ > 0) {
   43e8f:	8b 45 c0             	mov    -0x40(%rbp),%eax
        uintptr_t pa = *pep_ & PTE_PAMASK;
   43e92:	48 89 ca             	mov    %rcx,%rdx
   43e95:	4c 21 fa             	and    %r15,%rdx
   43e98:	48 be 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rsi
   43e9f:	ff 0f 00 
   43ea2:	48 21 f1             	and    %rsi,%rcx
   43ea5:	85 c0                	test   %eax,%eax
   43ea7:	48 0f 4f d1          	cmovg  %rcx,%rdx
   43eab:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   43eaf:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   43eb6:	48 d3 e0             	shl    %cl,%rax
   43eb9:	48 f7 d0             	not    %rax
   43ebc:	48 21 f8             	and    %rdi,%rax
   43ebf:	48 01 d0             	add    %rdx,%rax
        if (pa < maxpa) {
   43ec2:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   43ec8:	0f 86 6e ff ff ff    	jbe    43e3c <memusage::refresh()+0x1e6>
   43ece:	eb 81                	jmp    43e51 <memusage::refresh()+0x1fb>
   43ed0:	8b 45 c0             	mov    -0x40(%rbp),%eax
   43ed3:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   43ed7:	be 01 00 00 00       	mov    $0x1,%esi
   43edc:	48 d3 e6             	shl    %cl,%rsi
   43edf:	48 83 ee 01          	sub    $0x1,%rsi
    return (va_ | pageoffmask(level_)) + 1;
   43ee3:	48 09 fe             	or     %rdi,%rsi
   43ee6:	48 83 c6 01          	add    $0x1,%rsi
    real_find(last_va());
   43eea:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43eee:	e8 01 e0 ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
}
   43ef3:	e9 62 ff ff ff       	jmp    43e5a <memusage::refresh()+0x204>
            any = true;
   43ef8:	0f b6 4d 9f          	movzbl -0x61(%rbp),%ecx
    for (int pid = 1; pid < NPROC; ++pid) {
   43efc:	49 81 c4 d0 00 00 00 	add    $0xd0,%r12
   43f03:	83 fb 0f             	cmp    $0xf,%ebx
   43f06:	74 76                	je     43f7e <memusage::refresh()+0x328>
   43f08:	89 5d a8             	mov    %ebx,-0x58(%rbp)
   43f0b:	83 c3 01             	add    $0x1,%ebx
   43f0e:	89 5d ac             	mov    %ebx,-0x54(%rbp)
        if (p->state != P_FREE
   43f11:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
   43f15:	41 83 7c 24 0c 00    	cmpl   $0x0,0xc(%r12)
   43f1b:	74 df                	je     43efc <memusage::refresh()+0x2a6>
            && p->pagetable
   43f1d:	49 8b 34 24          	mov    (%r12),%rsi
            && p->pagetable != kernel_pagetable) {
   43f21:	48 81 fe 00 b0 05 00 	cmp    $0x5b000,%rsi
   43f28:	0f 95 c2             	setne  %dl
            && p->pagetable
   43f2b:	48 85 f6             	test   %rsi,%rsi
   43f2e:	0f 95 c0             	setne  %al
            && p->pagetable != kernel_pagetable) {
   43f31:	20 c2                	and    %al,%dl
   43f33:	88 55 9f             	mov    %dl,-0x61(%rbp)
   43f36:	74 c4                	je     43efc <memusage::refresh()+0x2a6>
    : ptiter(p->pagetable) {
   43f38:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43f3c:	e8 7f e4 ff ff       	call   423c0 <ptiter::ptiter(x86_64_pagetable*)>
   43f41:	8b 45 c0             	mov    -0x40(%rbp),%eax
   43f44:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   43f48:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    return va_ & ~pageoffmask(level_);
   43f4f:	48 d3 e0             	shl    %cl,%rax
   43f52:	48 23 45 c8          	and    -0x38(%rbp),%rax
            for (ptiter it(p); it.va() < VA_LOWEND; it.next()) {
   43f56:	4c 39 e8             	cmp    %r13,%rax
   43f59:	0f 87 48 fe ff ff    	ja     43da7 <memusage::refresh()+0x151>
            return 2U << pid;
   43f5f:	b8 02 00 00 00       	mov    $0x2,%eax
   43f64:	0f b6 4d ac          	movzbl -0x54(%rbp),%ecx
   43f68:	d3 e0                	shl    %cl,%eax
   43f6a:	83 7d a8 1c          	cmpl   $0x1c,-0x58(%rbp)
   43f6e:	ba 00 00 00 00       	mov    $0x0,%edx
   43f73:	0f 46 d0             	cmovbe %eax,%edx
   43f76:	89 55 98             	mov    %edx,-0x68(%rbp)
   43f79:	e9 00 fe ff ff       	jmp    43d7e <memusage::refresh()+0x128>
            }
        }
    }

    // if no different process page tables, use physical address instead
    if (!any) {
   43f7e:	84 c9                	test   %cl,%cl
   43f80:	74 25                	je     43fa7 <memusage::refresh()+0x351>
        }
    }

    // mark my own memory
    if (any) {
        mark(kptr2pa(v_), f_kernel);
   43f82:	49 8b 06             	mov    (%r14),%rax
        if (pa < maxpa) {
   43f85:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   43f8b:	77 0b                	ja     43f98 <memusage::refresh()+0x342>
            v_[pa / PAGESIZE] |= flags;
   43f8d:	48 89 c2             	mov    %rax,%rdx
   43f90:	48 c1 ea 0c          	shr    $0xc,%rdx
   43f94:	83 0c 90 01          	orl    $0x1,(%rax,%rdx,4)
    }
}
   43f98:	48 83 c4 48          	add    $0x48,%rsp
   43f9c:	5b                   	pop    %rbx
   43f9d:	41 5c                	pop    %r12
   43f9f:	41 5d                	pop    %r13
   43fa1:	41 5e                	pop    %r14
   43fa3:	41 5f                	pop    %r15
   43fa5:	5d                   	pop    %rbp
   43fa6:	c3                   	ret    
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   43fa7:	48 c7 45 b0 00 b0 05 	movq   $0x5b000,-0x50(%rbp)
   43fae:	00 
   43faf:	48 c7 45 b8 00 b0 05 	movq   $0x5b000,-0x48(%rbp)
   43fb6:	00 
   43fb7:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   43fbe:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   43fc5:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   43fcc:	00 
    real_find(va);
   43fcd:	be 00 00 00 00       	mov    $0x0,%esi
   43fd2:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43fd6:	e8 19 df ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    return va_;
   43fdb:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
        for (vmiter it(kernel_pagetable, 0); it.va() < VA_LOWEND; ) {
   43fdf:	48 89 d0             	mov    %rdx,%rax
   43fe2:	48 c1 e8 2f          	shr    $0x2f,%rax
   43fe6:	75 b0                	jne    43f98 <memusage::refresh()+0x342>
   43fe8:	41 bc 01 00 00 00    	mov    $0x1,%r12d
            pa &= ~0x1000UL;
   43fee:	49 bd 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r13
   43ff5:	ff 0f 00 
        uintptr_t pa = *pep_ & PTE_PAMASK;
   43ff8:	49 bf 00 f0 ff ff ff 	movabs $0xffffffffff000,%r15
   43fff:	ff 0f 00 
   44002:	48 bb ff ff ff ff ff 	movabs $0x7fffffffffff,%rbx
   44009:	7f 00 00 
   4400c:	eb 2e                	jmp    4403c <memusage::refresh()+0x3e6>
   4400e:	8b 45 c0             	mov    -0x40(%rbp),%eax
   44011:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   44015:	4c 89 e6             	mov    %r12,%rsi
   44018:	48 d3 e6             	shl    %cl,%rsi
   4401b:	48 83 ee 01          	sub    $0x1,%rsi
    return (va_ | pageoffmask(level_)) + 1;
   4401f:	48 09 d6             	or     %rdx,%rsi
   44022:	48 83 c6 01          	add    $0x1,%rsi
    real_find(last_va());
   44026:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   4402a:	e8 c5 de ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    return va_;
   4402f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   44033:	48 39 da             	cmp    %rbx,%rdx
   44036:	0f 87 5c ff ff ff    	ja     43f98 <memusage::refresh()+0x342>
    uint64_t ph = *pep_ & perm_;
   4403c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   44040:	48 8b 30             	mov    (%rax),%rsi
   44043:	48 63 4d c4          	movslq -0x3c(%rbp),%rcx
   44047:	48 21 f1             	and    %rsi,%rcx
    return ph & -(ph & PTE_P);
   4404a:	48 89 c8             	mov    %rcx,%rax
   4404d:	83 e0 01             	and    $0x1,%eax
   44050:	48 f7 d8             	neg    %rax
   44053:	48 21 c8             	and    %rcx,%rax
    return (perm() & desired_perm) == desired_perm;
   44056:	83 e0 05             	and    $0x5,%eax
                && physpages[it.pa() / PAGESIZE].used()) {
   44059:	48 83 f8 05          	cmp    $0x5,%rax
   4405d:	75 af                	jne    4400e <memusage::refresh()+0x3b8>
    if (*pep_ & PTE_P) {
   4405f:	40 f6 c6 01          	test   $0x1,%sil
   44063:	74 a9                	je     4400e <memusage::refresh()+0x3b8>
        if (level_ > 0) {
   44065:	8b 45 c0             	mov    -0x40(%rbp),%eax
            pa &= ~0x1000UL;
   44068:	48 89 f1             	mov    %rsi,%rcx
   4406b:	4c 21 e9             	and    %r13,%rcx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   4406e:	48 89 f7             	mov    %rsi,%rdi
   44071:	4c 21 ff             	and    %r15,%rdi
   44074:	85 c0                	test   %eax,%eax
   44076:	48 0f 4f f9          	cmovg  %rcx,%rdi
   4407a:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   4407e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   44085:	48 d3 e0             	shl    %cl,%rax
   44088:	48 f7 d0             	not    %rax
   4408b:	48 21 d0             	and    %rdx,%rax
   4408e:	48 01 f8             	add    %rdi,%rax
                && it.pa() < MEMSIZE_PHYSICAL
   44091:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   44097:	0f 87 71 ff ff ff    	ja     4400e <memusage::refresh()+0x3b8>
                && physpages[it.pa() / PAGESIZE].used()) {
   4409d:	48 89 c6             	mov    %rax,%rsi
   440a0:	48 c1 ee 0c          	shr    $0xc,%rsi
   440a4:	80 be 00 90 05 00 00 	cmpb   $0x0,0x59000(%rsi)
   440ab:	0f 84 5d ff ff ff    	je     4400e <memusage::refresh()+0x3b8>
                unsigned owner = (it.pa() - PROC_START_ADDR) / 0x40000;
   440b1:	48 2d 00 00 10 00    	sub    $0x100000,%rax
   440b7:	48 c1 e8 12          	shr    $0x12,%rax
        } else if (pid >= 1) {
   440bb:	83 f8 1c             	cmp    $0x1c,%eax
   440be:	76 21                	jbe    440e1 <memusage::refresh()+0x48b>
            return 0;
   440c0:	b8 00 00 00 00       	mov    $0x0,%eax
            v_[pa / PAGESIZE] |= flags;
   440c5:	49 8b 16             	mov    (%r14),%rdx
   440c8:	48 8d 14 b2          	lea    (%rdx,%rsi,4),%rdx
   440cc:	0b 02                	or     (%rdx),%eax
   440ce:	83 c8 02             	or     $0x2,%eax
   440d1:	89 02                	mov    %eax,(%rdx)
                it.next();
   440d3:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   440d7:	e8 dc df ff ff       	call   420b8 <vmiter::next()>
   440dc:	e9 4e ff ff ff       	jmp    4402f <memusage::refresh()+0x3d9>
                mark(it.pa(), f_user | f_process(owner + 1));
   440e1:	8d 48 01             	lea    0x1(%rax),%ecx
            return 2U << pid;
   440e4:	b8 02 00 00 00       	mov    $0x2,%eax
   440e9:	d3 e0                	shl    %cl,%eax
   440eb:	eb d8                	jmp    440c5 <memusage::refresh()+0x46f>
   440ed:	90                   	nop

00000000000440ee <memusage::page_error(unsigned long, char const*, int) const>:

void memusage::page_error(uintptr_t pa, const char* desc, int pid) const {
   440ee:	f3 0f 1e fa          	endbr64 
   440f2:	55                   	push   %rbp
   440f3:	48 89 e5             	mov    %rsp,%rbp
   440f6:	41 56                	push   %r14
   440f8:	41 55                	push   %r13
   440fa:	41 54                	push   %r12
   440fc:	53                   	push   %rbx
   440fd:	49 89 f5             	mov    %rsi,%r13
   44100:	49 89 d6             	mov    %rdx,%r14
   44103:	89 cb                	mov    %ecx,%ebx
    const char* fmt = pid >= 0
        ? "PAGE TABLE ERROR: %lx: %s (pid %d)\n"
   44105:	85 c9                	test   %ecx,%ecx
   44107:	41 bc b0 5d 04 00    	mov    $0x45db0,%r12d
   4410d:	b8 fd 5c 04 00       	mov    $0x45cfd,%eax
   44112:	4c 0f 48 e0          	cmovs  %rax,%r12
        : "PAGE TABLE ERROR: %lx: %s\n";
    error_printf(CPOS(22, 0), COLOR_ERROR, fmt, pa, desc, pid);
   44116:	41 89 c9             	mov    %ecx,%r9d
   44119:	49 89 d0             	mov    %rdx,%r8
   4411c:	48 89 f1             	mov    %rsi,%rcx
   4411f:	4c 89 e2             	mov    %r12,%rdx
   44122:	be 00 c0 00 00       	mov    $0xc000,%esi
   44127:	bf e0 06 00 00       	mov    $0x6e0,%edi
   4412c:	b0 00                	mov    $0x0,%al
   4412e:	e8 16 12 00 00       	call   45349 <error_printf(int, int, char const*, ...)>
    log_printf(fmt, pa, desc, pid);
   44133:	89 d9                	mov    %ebx,%ecx
   44135:	4c 89 f2             	mov    %r14,%rdx
   44138:	4c 89 ee             	mov    %r13,%rsi
   4413b:	4c 89 e7             	mov    %r12,%rdi
   4413e:	b0 00                	mov    $0x0,%al
   44140:	e8 7b e6 ff ff       	call   427c0 <log_printf(char const*, ...)>
}
   44145:	5b                   	pop    %rbx
   44146:	41 5c                	pop    %r12
   44148:	41 5d                	pop    %r13
   4414a:	41 5e                	pop    %r14
   4414c:	5d                   	pop    %rbp
   4414d:	c3                   	ret    

000000000004414e <memusage::symbol_at(unsigned long) const>:

uint16_t memusage::symbol_at(uintptr_t pa) const {
   4414e:	f3 0f 1e fa          	endbr64 
   44152:	55                   	push   %rbp
   44153:	48 89 e5             	mov    %rsp,%rbp
   44156:	41 57                	push   %r15
   44158:	41 56                	push   %r14
   4415a:	41 55                	push   %r13
   4415c:	41 54                	push   %r12
   4415e:	53                   	push   %rbx
   4415f:	48 83 ec 18          	sub    $0x18,%rsp
   44163:	49 89 fc             	mov    %rdi,%r12
   44166:	48 89 f3             	mov    %rsi,%rbx
    bool is_reserved = reserved_physical_address(pa);
   44169:	48 89 f7             	mov    %rsi,%rdi
   4416c:	e8 9c e3 ff ff       	call   4250d <reserved_physical_address(unsigned long)>
   44171:	41 89 c6             	mov    %eax,%r14d
    bool is_kernel = !is_reserved && !allocatable_physical_address(pa);
   44174:	84 c0                	test   %al,%al
   44176:	74 3f                	je     441b7 <memusage::symbol_at(unsigned long) const+0x69>

    if (pa >= maxpa) {
        if (is_kernel) {
            return 'K' | 0x4000;
        } else if (is_reserved) {
            return '?' | 0x4000;
   44178:	b8 3f 40 00 00       	mov    $0x403f,%eax
    if (pa >= maxpa) {
   4417d:	48 81 fb ff ff 3f 00 	cmp    $0x3fffff,%rbx
   44184:	77 57                	ja     441dd <memusage::symbol_at(unsigned long) const+0x8f>
        } else {
            return '?' | 0xF000;
        }
    }

    auto v = v_[pa / PAGESIZE];
   44186:	48 89 de             	mov    %rbx,%rsi
   44189:	48 c1 ee 0c          	shr    $0xc,%rsi
   4418d:	49 8b 04 24          	mov    (%r12),%rax
   44191:	44 8b 2c b0          	mov    (%rax,%rsi,4),%r13d
    if (pa >= (uintptr_t) console && pa < (uintptr_t) console + PAGESIZE) {
   44195:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   4419a:	48 39 d8             	cmp    %rbx,%rax
   4419d:	77 4d                	ja     441ec <memusage::symbol_at(unsigned long) const+0x9e>
    bool is_kernel = !is_reserved && !allocatable_physical_address(pa);
   4419f:	ba 00 00 00 00       	mov    $0x0,%edx
    if (pa >= (uintptr_t) console && pa < (uintptr_t) console + PAGESIZE) {
   441a4:	48 8d 88 00 10 00 00 	lea    0x1000(%rax),%rcx
        return 'C' | 0x0700;
   441ab:	b8 43 07 00 00       	mov    $0x743,%eax
    if (pa >= (uintptr_t) console && pa < (uintptr_t) console + PAGESIZE) {
   441b0:	48 39 d9             	cmp    %rbx,%rcx
   441b3:	76 3c                	jbe    441f1 <memusage::symbol_at(unsigned long) const+0xa3>
   441b5:	eb 26                	jmp    441dd <memusage::symbol_at(unsigned long) const+0x8f>
    bool is_kernel = !is_reserved && !allocatable_physical_address(pa);
   441b7:	48 89 df             	mov    %rbx,%rdi
   441ba:	e8 6f e3 ff ff       	call   4252e <allocatable_physical_address(unsigned long)>
   441bf:	83 f0 01             	xor    $0x1,%eax
   441c2:	89 c2                	mov    %eax,%edx
    if (pa >= maxpa) {
   441c4:	48 81 fb ff ff 3f 00 	cmp    $0x3fffff,%rbx
   441cb:	0f 86 e4 01 00 00    	jbe    443b5 <memusage::symbol_at(unsigned long) const+0x267>
            return 'K' | 0x4000;
   441d1:	3c 01                	cmp    $0x1,%al
   441d3:	19 c0                	sbb    %eax,%eax
   441d5:	66 25 f4 af          	and    $0xaff4,%ax
   441d9:	66 05 4b 40          	add    $0x404b,%ax
                ch |= names[pid];
            }
            return ch;
        }
    }
}
   441dd:	48 83 c4 18          	add    $0x18,%rsp
   441e1:	5b                   	pop    %rbx
   441e2:	41 5c                	pop    %r12
   441e4:	41 5d                	pop    %r13
   441e6:	41 5e                	pop    %r14
   441e8:	41 5f                	pop    %r15
   441ea:	5d                   	pop    %rbp
   441eb:	c3                   	ret    
    bool is_kernel = !is_reserved && !allocatable_physical_address(pa);
   441ec:	ba 00 00 00 00       	mov    $0x0,%edx
    } else if (is_reserved && v > (f_kernel | f_user)) {
   441f1:	41 83 fd 03          	cmp    $0x3,%r13d
   441f5:	0f 97 c1             	seta   %cl
   441f8:	76 05                	jbe    441ff <memusage::symbol_at(unsigned long) const+0xb1>
   441fa:	45 84 f6             	test   %r14b,%r14b
   441fd:	75 41                	jne    44240 <memusage::symbol_at(unsigned long) const+0xf2>
        return 'R' | 0x0700;
   441ff:	b8 52 07 00 00       	mov    $0x752,%eax
    } else if (is_reserved) {
   44204:	45 84 f6             	test   %r14b,%r14b
   44207:	75 d4                	jne    441dd <memusage::symbol_at(unsigned long) const+0x8f>
    } else if (is_kernel && v > (f_kernel | f_user)) {
   44209:	84 c9                	test   %cl,%cl
   4420b:	74 04                	je     44211 <memusage::symbol_at(unsigned long) const+0xc3>
   4420d:	84 d2                	test   %dl,%dl
   4420f:	75 56                	jne    44267 <memusage::symbol_at(unsigned long) const+0x119>
        return 'K' | 0x0D00;
   44211:	b8 4b 0d 00 00       	mov    $0xd4b,%eax
    } else if (is_kernel) {
   44216:	84 d2                	test   %dl,%dl
   44218:	75 c3                	jne    441dd <memusage::symbol_at(unsigned long) const+0x8f>
        return ' ' | 0x0700;
   4421a:	b8 20 07 00 00       	mov    $0x720,%eax
    } else if (pa >= MEMSIZE_PHYSICAL) {
   4421f:	48 81 fb ff ff 1f 00 	cmp    $0x1fffff,%rbx
   44226:	77 b5                	ja     441dd <memusage::symbol_at(unsigned long) const+0x8f>
        if (v == 0) {
   44228:	45 85 ed             	test   %r13d,%r13d
   4422b:	75 61                	jne    4428e <memusage::symbol_at(unsigned long) const+0x140>
                return '.' | 0x0700;
   4422d:	80 be 00 90 05 00 01 	cmpb   $0x1,0x59000(%rsi)
   44234:	19 c0                	sbb    %eax,%eax
   44236:	66 25 e2 03          	and    $0x3e2,%ax
   4423a:	66 05 4c 03          	add    $0x34c,%ax
   4423e:	eb 9d                	jmp    441dd <memusage::symbol_at(unsigned long) const+0x8f>
        return lsb(v >> 2);
   44240:	44 89 e9             	mov    %r13d,%ecx
   44243:	c1 e9 02             	shr    $0x2,%ecx
    return __builtin_ffs(x);
   44246:	f3 0f bc c9          	tzcnt  %ecx,%ecx
   4424a:	83 c1 01             	add    $0x1,%ecx
        page_error(pa, "reserved page mapped for user", marked_pid(v));
   4424d:	ba 18 5d 04 00       	mov    $0x45d18,%edx
   44252:	48 89 de             	mov    %rbx,%rsi
   44255:	4c 89 e7             	mov    %r12,%rdi
   44258:	e8 91 fe ff ff       	call   440ee <memusage::page_error(unsigned long, char const*, int) const>
        return 'R' | 0x0C00;
   4425d:	b8 52 0c 00 00       	mov    $0xc52,%eax
   44262:	e9 76 ff ff ff       	jmp    441dd <memusage::symbol_at(unsigned long) const+0x8f>
        return lsb(v >> 2);
   44267:	44 89 e9             	mov    %r13d,%ecx
   4426a:	c1 e9 02             	shr    $0x2,%ecx
   4426d:	f3 0f bc c9          	tzcnt  %ecx,%ecx
   44271:	83 c1 01             	add    $0x1,%ecx
        page_error(pa, "kernel data page mapped for user", marked_pid(v));
   44274:	ba d8 5d 04 00       	mov    $0x45dd8,%edx
   44279:	48 89 de             	mov    %rbx,%rsi
   4427c:	4c 89 e7             	mov    %r12,%rdi
   4427f:	e8 6a fe ff ff       	call   440ee <memusage::page_error(unsigned long, char const*, int) const>
        return 'K' | 0xCD00;
   44284:	b8 4b cd ff ff       	mov    $0xffffcd4b,%eax
   44289:	e9 4f ff ff ff       	jmp    441dd <memusage::symbol_at(unsigned long) const+0x8f>
        } else if (v == f_kernel) {
   4428e:	41 83 fd 01          	cmp    $0x1,%r13d
   44292:	0f 84 13 01 00 00    	je     443ab <memusage::symbol_at(unsigned long) const+0x25d>
            return '.' | 0x0700;
   44298:	b8 2e 07 00 00       	mov    $0x72e,%eax
        } else if (v == f_user) {
   4429d:	41 83 fd 02          	cmp    $0x2,%r13d
   442a1:	0f 84 36 ff ff ff    	je     441dd <memusage::symbol_at(unsigned long) const+0x8f>
        } else if ((v & f_kernel) && (v & f_user)) {
   442a7:	44 89 e8             	mov    %r13d,%eax
   442aa:	83 e0 03             	and    $0x3,%eax
   442ad:	83 f8 03             	cmp    $0x3,%eax
   442b0:	0f 84 81 00 00 00    	je     44337 <memusage::symbol_at(unsigned long) const+0x1e9>
        return lsb(v >> 2);
   442b6:	45 89 ef             	mov    %r13d,%r15d
   442b9:	41 c1 ef 02          	shr    $0x2,%r15d
   442bd:	45 0f bc f7          	bsf    %r15d,%r14d
   442c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   442c6:	44 0f 44 f0          	cmove  %eax,%r14d
   442ca:	41 83 c6 01          	add    $0x1,%r14d
            uint16_t ch = colors[pid % 5] << 8;
   442ce:	49 63 c6             	movslq %r14d,%rax
   442d1:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   442d8:	48 c1 f8 21          	sar    $0x21,%rax
   442dc:	44 89 f2             	mov    %r14d,%edx
   442df:	c1 fa 1f             	sar    $0x1f,%edx
   442e2:	29 d0                	sub    %edx,%eax
   442e4:	8d 14 80             	lea    (%rax,%rax,4),%edx
   442e7:	44 89 f0             	mov    %r14d,%eax
   442ea:	29 d0                	sub    %edx,%eax
   442ec:	48 98                	cltq   
   442ee:	0f b6 80 81 5e 04 00 	movzbl 0x45e81(%rax),%eax
   442f5:	c1 e0 08             	shl    $0x8,%eax
   442f8:	66 89 45 ce          	mov    %ax,-0x32(%rbp)
            if (v & f_kernel) {
   442fc:	41 f6 c5 01          	test   $0x1,%r13b
   44300:	74 15                	je     44317 <memusage::symbol_at(unsigned long) const+0x1c9>
                ch = 0x4000 | (ch == 0x0C00 ? 0x0F00 : ch);
   44302:	89 c2                	mov    %eax,%edx
   44304:	80 ce 40             	or     $0x40,%dh
   44307:	66 3d 00 0c          	cmp    $0xc00,%ax
   4430b:	b8 00 4f 00 00       	mov    $0x4f00,%eax
   44310:	0f 45 c2             	cmovne %edx,%eax
   44313:	66 89 45 ce          	mov    %ax,-0x32(%rbp)
            if (!physpages[pa / PAGESIZE].used()) {
   44317:	80 be 00 90 05 00 00 	cmpb   $0x0,0x59000(%rsi)
   4431e:	74 45                	je     44365 <memusage::symbol_at(unsigned long) const+0x217>
        } else if (pid >= 1) {
   44320:	45 85 ff             	test   %r15d,%r15d
   44323:	74 5b                	je     44380 <memusage::symbol_at(unsigned long) const+0x232>
   44325:	41 83 fe 1d          	cmp    $0x1d,%r14d
   44329:	7f 55                	jg     44380 <memusage::symbol_at(unsigned long) const+0x232>
            return 2U << pid;
   4432b:	ba 02 00 00 00       	mov    $0x2,%edx
   44330:	44 89 f1             	mov    %r14d,%ecx
   44333:	d3 e2                	shl    %cl,%edx
   44335:	eb 4e                	jmp    44385 <memusage::symbol_at(unsigned long) const+0x237>
        return lsb(v >> 2);
   44337:	44 89 e9             	mov    %r13d,%ecx
   4433a:	c1 e9 02             	shr    $0x2,%ecx
   4433d:	0f bc c9             	bsf    %ecx,%ecx
   44340:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   44345:	0f 44 c8             	cmove  %eax,%ecx
   44348:	83 c1 01             	add    $0x1,%ecx
            page_error(pa, "kernel allocated page mapped for user",
   4434b:	ba 00 5e 04 00       	mov    $0x45e00,%edx
   44350:	48 89 de             	mov    %rbx,%rsi
   44353:	4c 89 e7             	mov    %r12,%rdi
   44356:	e8 93 fd ff ff       	call   440ee <memusage::page_error(unsigned long, char const*, int) const>
            return '*' | 0xF400;
   4435b:	b8 2a f4 ff ff       	mov    $0xfffff42a,%eax
   44360:	e9 78 fe ff ff       	jmp    441dd <memusage::symbol_at(unsigned long) const+0x8f>
                page_error(pa, "freed page mapped for user", pid);
   44365:	44 89 f1             	mov    %r14d,%ecx
   44368:	ba 36 5d 04 00       	mov    $0x45d36,%edx
   4436d:	48 89 de             	mov    %rbx,%rsi
   44370:	4c 89 e7             	mov    %r12,%rdi
   44373:	e8 76 fd ff ff       	call   440ee <memusage::page_error(unsigned long, char const*, int) const>
                ch |= 0xF000;
   44378:	66 81 4d ce 00 f0    	orw    $0xf000,-0x32(%rbp)
   4437e:	eb a0                	jmp    44320 <memusage::symbol_at(unsigned long) const+0x1d2>
            return 0;
   44380:	ba 00 00 00 00       	mov    $0x0,%edx
            if (v > (f_process(pid) | f_kernel | f_user)) {
   44385:	83 ca 03             	or     $0x3,%edx
                ch = 0x0F00 | 'S';
   44388:	b8 53 0f 00 00       	mov    $0xf53,%eax
            if (v > (f_process(pid) | f_kernel | f_user)) {
   4438d:	44 39 ea             	cmp    %r13d,%edx
   44390:	0f 82 47 fe ff ff    	jb     441dd <memusage::symbol_at(unsigned long) const+0x8f>
                ch |= names[pid];
   44396:	4d 63 f6             	movslq %r14d,%r14
   44399:	66 41 0f be 86 60 5e 	movsbw 0x45e60(%r14),%ax
   443a0:	04 00 
   443a2:	66 0b 45 ce          	or     -0x32(%rbp),%ax
   443a6:	e9 32 fe ff ff       	jmp    441dd <memusage::symbol_at(unsigned long) const+0x8f>
            return 'K' | 0x0D00;
   443ab:	b8 4b 0d 00 00       	mov    $0xd4b,%eax
   443b0:	e9 28 fe ff ff       	jmp    441dd <memusage::symbol_at(unsigned long) const+0x8f>
    auto v = v_[pa / PAGESIZE];
   443b5:	48 89 de             	mov    %rbx,%rsi
   443b8:	48 c1 ee 0c          	shr    $0xc,%rsi
   443bc:	49 8b 04 24          	mov    (%r12),%rax
   443c0:	44 8b 2c b0          	mov    (%rax,%rsi,4),%r13d
    if (pa >= (uintptr_t) console && pa < (uintptr_t) console + PAGESIZE) {
   443c4:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   443c9:	48 39 c3             	cmp    %rax,%rbx
   443cc:	0f 83 d2 fd ff ff    	jae    441a4 <memusage::symbol_at(unsigned long) const+0x56>
    } else if (is_reserved && v > (f_kernel | f_user)) {
   443d2:	41 83 fd 03          	cmp    $0x3,%r13d
   443d6:	0f 97 c1             	seta   %cl
   443d9:	e9 2b fe ff ff       	jmp    44209 <memusage::symbol_at(unsigned long) const+0xbb>

00000000000443de <console_memviewer(proc*)>:
        console[CPOS(11 + pn/64, 12 + pn%64)] = ch;
    }
}


void console_memviewer(proc* vmp) {
   443de:	f3 0f 1e fa          	endbr64 
   443e2:	55                   	push   %rbp
   443e3:	48 89 e5             	mov    %rsp,%rbp
   443e6:	41 57                	push   %r15
   443e8:	41 56                	push   %r14
   443ea:	41 55                	push   %r13
   443ec:	41 54                	push   %r12
   443ee:	53                   	push   %rbx
   443ef:	48 83 ec 28          	sub    $0x28,%rsp
    // Process 0 must never be used.
    assert(ptable[0].state == P_FREE);
   443f3:	8b 1d 33 4e 01 00    	mov    0x14e33(%rip),%ebx        # 5922c <ptable+0xc>
   443f9:	85 db                	test   %ebx,%ebx
   443fb:	75 3c                	jne    44439 <console_memviewer(proc*)+0x5b>
   443fd:	49 89 fd             	mov    %rdi,%r13

    // track physical memory
    static memusage mu;
   44400:	0f b6 05 99 bd 01 00 	movzbl 0x1bd99(%rip),%eax        # 601a0 <guard variable for console_memviewer(proc*)::mu>
   44407:	84 c0                	test   %al,%al
   44409:	74 47                	je     44452 <console_memviewer(proc*)+0x74>
    mu.refresh();
   4440b:	bf a8 01 06 00       	mov    $0x601a8,%edi
   44410:	e8 41 f8 ff ff       	call   43c56 <memusage::refresh()>

    // print physical memory
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY\n");
   44415:	ba 76 5d 04 00       	mov    $0x45d76,%edx
   4441a:	be 00 0f 00 00       	mov    $0xf00,%esi
   4441f:	bf 20 00 00 00       	mov    $0x20,%edi
   44424:	b8 00 00 00 00       	mov    $0x0,%eax
   44429:	e8 e1 0e 00 00       	call   4530f <console_printf(int, int, char const*, ...)>
   4442e:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   44434:	e9 90 00 00 00       	jmp    444c9 <console_memviewer(proc*)+0xeb>
    assert(ptable[0].state == P_FREE);
   44439:	b9 00 00 00 00       	mov    $0x0,%ecx
   4443e:	ba 5c 5d 04 00       	mov    $0x45d5c,%edx
   44443:	be f8 00 00 00       	mov    $0xf8,%esi
   44448:	bf ee 5c 04 00       	mov    $0x45cee,%edi
   4444d:	e8 a0 e8 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
    static memusage mu;
   44452:	bf a0 01 06 00       	mov    $0x601a0,%edi
   44457:	e8 ba f7 ff ff       	call   43c16 <__cxa_guard_acquire>
   4445c:	85 c0                	test   %eax,%eax
   4445e:	74 ab                	je     4440b <console_memviewer(proc*)+0x2d>
        : v_(nullptr) {
   44460:	48 c7 05 3d bd 01 00 	movq   $0x0,0x1bd3d(%rip)        # 601a8 <console_memviewer(proc*)::mu>
   44467:	00 00 00 00 
    static memusage mu;
   4446b:	bf a0 01 06 00       	mov    $0x601a0,%edi
   44470:	e8 d5 f7 ff ff       	call   43c4a <__cxa_guard_release>
   44475:	eb 94                	jmp    4440b <console_memviewer(proc*)+0x2d>

    for (int pn = 0; pn * PAGESIZE < memusage::max_view_pa; ++pn) {
        if (pn % 64 == 0) {
            console_printf(CPOS(1 + pn/64, 3), 0x0F00, "0x%06X ", pn << 12);
        }
        console[CPOS(1 + pn/64, 12 + pn%64)] = mu.symbol_at(pn * PAGESIZE);
   44477:	8d 43 3f             	lea    0x3f(%rbx),%eax
   4447a:	85 db                	test   %ebx,%ebx
   4447c:	0f 49 c3             	cmovns %ebx,%eax
   4447f:	c1 f8 06             	sar    $0x6,%eax
   44482:	8d 4c 80 05          	lea    0x5(%rax,%rax,4),%ecx
   44486:	c1 e1 04             	shl    $0x4,%ecx
   44489:	89 da                	mov    %ebx,%edx
   4448b:	c1 fa 1f             	sar    $0x1f,%edx
   4448e:	c1 ea 1a             	shr    $0x1a,%edx
   44491:	8d 04 13             	lea    (%rbx,%rdx,1),%eax
   44494:	83 e0 3f             	and    $0x3f,%eax
   44497:	29 d0                	sub    %edx,%eax
   44499:	44 8d 74 01 0c       	lea    0xc(%rcx,%rax,1),%r14d
   4449e:	4c 89 e6             	mov    %r12,%rsi
   444a1:	bf a8 01 06 00       	mov    $0x601a8,%edi
   444a6:	e8 a3 fc ff ff       	call   4414e <memusage::symbol_at(unsigned long) const>
   444ab:	4d 63 f6             	movslq %r14d,%r14
   444ae:	66 43 89 84 36 00 80 	mov    %ax,0xb8000(%r14,%r14,1)
   444b5:	0b 00 
    for (int pn = 0; pn * PAGESIZE < memusage::max_view_pa; ++pn) {
   444b7:	83 c3 01             	add    $0x1,%ebx
   444ba:	49 81 c4 00 10 00 00 	add    $0x1000,%r12
   444c1:	81 fb 00 02 00 00    	cmp    $0x200,%ebx
   444c7:	74 36                	je     444ff <console_memviewer(proc*)+0x121>
        if (pn % 64 == 0) {
   444c9:	f6 c3 3f             	test   $0x3f,%bl
   444cc:	75 a9                	jne    44477 <console_memviewer(proc*)+0x99>
            console_printf(CPOS(1 + pn/64, 3), 0x0F00, "0x%06X ", pn << 12);
   444ce:	8d 43 3f             	lea    0x3f(%rbx),%eax
   444d1:	85 db                	test   %ebx,%ebx
   444d3:	0f 49 c3             	cmovns %ebx,%eax
   444d6:	c1 f8 06             	sar    $0x6,%eax
   444d9:	8d 7c 80 05          	lea    0x5(%rax,%rax,4),%edi
   444dd:	c1 e7 04             	shl    $0x4,%edi
   444e0:	83 c7 03             	add    $0x3,%edi
   444e3:	44 89 e1             	mov    %r12d,%ecx
   444e6:	ba 87 5d 04 00       	mov    $0x45d87,%edx
   444eb:	be 00 0f 00 00       	mov    $0xf00,%esi
   444f0:	b8 00 00 00 00       	mov    $0x0,%eax
   444f5:	e8 15 0e 00 00       	call   4530f <console_printf(int, int, char const*, ...)>
   444fa:	e9 78 ff ff ff       	jmp    44477 <console_memviewer(proc*)+0x99>
    }

    // print virtual memory
    if (vmp) {
   444ff:	4d 85 ed             	test   %r13,%r13
   44502:	0f 84 d8 01 00 00    	je     446e0 <console_memviewer(proc*)+0x302>
    assert(vmp->pagetable != nullptr);
   44508:	49 83 7d 00 00       	cmpq   $0x0,0x0(%r13)
   4450d:	0f 84 98 00 00 00    	je     445ab <console_memviewer(proc*)+0x1cd>
    const char* statemsg = vmp->state == P_FAULTED ? " (faulted)" : "";
   44513:	41 83 7d 0c 03       	cmpl   $0x3,0xc(%r13)
    console_printf(CPOS(10, 26), 0x0F00,
   44518:	41 8b 4d 08          	mov    0x8(%r13),%ecx
   4451c:	41 b9 51 5d 04 00    	mov    $0x45d51,%r9d
   44522:	b8 f2 5a 04 00       	mov    $0x45af2,%eax
   44527:	4c 0f 45 c8          	cmovne %rax,%r9
   4452b:	41 b8 00 07 00 00    	mov    $0x700,%r8d
   44531:	ba 28 5e 04 00       	mov    $0x45e28,%edx
   44536:	be 00 0f 00 00       	mov    $0xf00,%esi
   4453b:	bf 3a 03 00 00       	mov    $0x33a,%edi
   44540:	b8 00 00 00 00       	mov    $0x0,%eax
   44545:	e8 c5 0d 00 00       	call   4530f <console_printf(int, int, char const*, ...)>
    : vmiter(p->pagetable, va) {
   4454a:	49 8b 45 00          	mov    0x0(%r13),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4454e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   44552:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   44556:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   4455d:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   44564:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   4456b:	00 
    real_find(va);
   4456c:	be 00 00 00 00       	mov    $0x0,%esi
   44571:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   44575:	e8 7a d9 ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    return va_;
   4457a:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
         it.va() < memusage::max_view_va;
   4457e:	48 81 fb ff ff 2f 00 	cmp    $0x2fffff,%rbx
   44585:	0f 87 55 01 00 00    	ja     446e0 <console_memviewer(proc*)+0x302>
        return -1;
   4458b:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
            pa &= ~0x1000UL;
   44592:	49 be 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r14
   44599:	ff 0f 00 
        uintptr_t pa = *pep_ & PTE_PAMASK;
   4459c:	49 bf 00 f0 ff ff ff 	movabs $0xffffffffff000,%r15
   445a3:	ff 0f 00 
   445a6:	e9 8b 00 00 00       	jmp    44636 <console_memviewer(proc*)+0x258>
    assert(vmp->pagetable != nullptr);
   445ab:	b9 00 00 00 00       	mov    $0x0,%ecx
   445b0:	ba 8f 5d 04 00       	mov    $0x45d8f,%edx
   445b5:	be d4 00 00 00       	mov    $0xd4,%esi
   445ba:	bf ee 5c 04 00       	mov    $0x45cee,%edi
   445bf:	e8 2e e7 ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00,
   445c4:	48 89 d8             	mov    %rbx,%rax
   445c7:	48 c1 e8 12          	shr    $0x12,%rax
   445cb:	8d 3c 80             	lea    (%rax,%rax,4),%edi
   445ce:	c1 e7 04             	shl    $0x4,%edi
   445d1:	81 c7 73 03 00 00    	add    $0x373,%edi
   445d7:	48 89 d9             	mov    %rbx,%rcx
   445da:	ba 87 5d 04 00       	mov    $0x45d87,%edx
   445df:	be 00 0f 00 00       	mov    $0xf00,%esi
   445e4:	b8 00 00 00 00       	mov    $0x0,%eax
   445e9:	e8 21 0d 00 00       	call   4530f <console_printf(int, int, char const*, ...)>
   445ee:	eb 53                	jmp    44643 <console_memviewer(proc*)+0x265>
                    ch ^= 0xFE00;
   445f0:	b9 53 f1 ff ff       	mov    $0xfffff153,%ecx
        console[CPOS(11 + pn/64, 12 + pn%64)] = ch;
   445f5:	48 c1 eb 12          	shr    $0x12,%rbx
   445f9:	48 8d 04 9b          	lea    (%rbx,%rbx,4),%rax
   445fd:	48 c1 e0 04          	shl    $0x4,%rax
   44601:	49 8d 84 04 7c 03 00 	lea    0x37c(%r12,%rax,1),%rax
   44608:	00 
   44609:	66 89 8c 00 00 80 0b 	mov    %cx,0xb8000(%rax,%rax,1)
   44610:	00 
    return find(va_ + delta);
   44611:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   44615:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va);
   4461c:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   44620:	e8 cf d8 ff ff       	call   41ef4 <vmiter::real_find(unsigned long)>
    return va_;
   44625:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
         it.va() < memusage::max_view_va;
   44629:	48 81 fb ff ff 2f 00 	cmp    $0x2fffff,%rbx
   44630:	0f 87 aa 00 00 00    	ja     446e0 <console_memviewer(proc*)+0x302>
        unsigned long pn = it.va() / PAGESIZE;
   44636:	49 89 dc             	mov    %rbx,%r12
   44639:	49 c1 ec 0c          	shr    $0xc,%r12
        if (pn % 64 == 0) {
   4463d:	41 83 e4 3f          	and    $0x3f,%r12d
   44641:	74 81                	je     445c4 <console_memviewer(proc*)+0x1e6>
    uint64_t ph = *pep_ & perm_;
   44643:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   44647:	48 8b 10             	mov    (%rax),%rdx
   4464a:	48 63 45 c4          	movslq -0x3c(%rbp),%rax
   4464e:	48 21 d0             	and    %rdx,%rax
            ch = ' ';
   44651:	b9 20 00 00 00       	mov    $0x20,%ecx
        if (!it.present()) {
   44656:	a8 01                	test   $0x1,%al
   44658:	74 9b                	je     445f5 <console_memviewer(proc*)+0x217>
        return -1;
   4465a:	4c 89 ee             	mov    %r13,%rsi
    if (*pep_ & PTE_P) {
   4465d:	f6 c2 01             	test   $0x1,%dl
   44660:	74 23                	je     44685 <console_memviewer(proc*)+0x2a7>
        if (level_ > 0) {
   44662:	8b 4d c0             	mov    -0x40(%rbp),%ecx
            pa &= ~0x1000UL;
   44665:	48 89 d0             	mov    %rdx,%rax
        uintptr_t pa = *pep_ & PTE_PAMASK;
   44668:	4c 21 f8             	and    %r15,%rax
   4466b:	4c 21 f2             	and    %r14,%rdx
   4466e:	85 c9                	test   %ecx,%ecx
   44670:	48 0f 4f c2          	cmovg  %rdx,%rax
   44674:	8d 4c c9 0c          	lea    0xc(%rcx,%rcx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   44678:	48 d3 e6             	shl    %cl,%rsi
   4467b:	48 f7 d6             	not    %rsi
   4467e:	48 23 75 c8          	and    -0x38(%rbp),%rsi
   44682:	48 01 c6             	add    %rax,%rsi
            ch = mu.symbol_at(it.pa());
   44685:	bf a8 01 06 00       	mov    $0x601a8,%edi
   4468a:	e8 bf fa ff ff       	call   4414e <memusage::symbol_at(unsigned long) const>
   4468f:	89 c1                	mov    %eax,%ecx
    uint64_t ph = *pep_ & perm_;
   44691:	48 63 55 c4          	movslq -0x3c(%rbp),%rdx
   44695:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   44699:	48 23 10             	and    (%rax),%rdx
    return ph & -(ph & PTE_P);
   4469c:	48 89 d0             	mov    %rdx,%rax
   4469f:	83 e0 01             	and    $0x1,%eax
   446a2:	48 f7 d8             	neg    %rax
   446a5:	48 21 d0             	and    %rdx,%rax
    return (perm() & desired_perm) == desired_perm;
   446a8:	83 e0 05             	and    $0x5,%eax
            if (it.user()) { // switch foreground & background colors
   446ab:	48 83 f8 05          	cmp    $0x5,%rax
   446af:	0f 85 40 ff ff ff    	jne    445f5 <console_memviewer(proc*)+0x217>
                if (ch == (0x0F00 | 'S')) {
   446b5:	66 81 f9 53 0f       	cmp    $0xf53,%cx
   446ba:	0f 84 30 ff ff ff    	je     445f0 <console_memviewer(proc*)+0x212>
                    uint16_t z = (ch & 0x0F00) ^ ((ch & 0xF000) >> 4);
   446c0:	89 c8                	mov    %ecx,%eax
   446c2:	66 c1 e8 04          	shr    $0x4,%ax
   446c6:	31 c8                	xor    %ecx,%eax
   446c8:	89 c2                	mov    %eax,%edx
   446ca:	66 81 e2 00 0f       	and    $0xf00,%dx
                    ch ^= z | (z << 4);
   446cf:	25 00 0f 00 00       	and    $0xf00,%eax
   446d4:	c1 e0 04             	shl    $0x4,%eax
   446d7:	09 d0                	or     %edx,%eax
   446d9:	31 c1                	xor    %eax,%ecx
   446db:	e9 15 ff ff ff       	jmp    445f5 <console_memviewer(proc*)+0x217>
        console_memviewer_virtual(mu, vmp);
    }
}
   446e0:	48 83 c4 28          	add    $0x28,%rsp
   446e4:	5b                   	pop    %rbx
   446e5:	41 5c                	pop    %r12
   446e7:	41 5d                	pop    %r13
   446e9:	41 5e                	pop    %r14
   446eb:	41 5f                	pop    %r15
   446ed:	5d                   	pop    %rbp
   446ee:	c3                   	ret    

00000000000446ef <memcpy>:
// memcpy, memmove, memset, memcmp, memchr, strlen, strnlen,
// strcpy, strncpy, strlcpy, strcmp, strncmp, strchr, strstr,
// strtoul, strtol
//    We must provide our own implementations.

void* memcpy(void* dst, const void* src, size_t n) {
   446ef:	f3 0f 1e fa          	endbr64 
   446f3:	48 89 f8             	mov    %rdi,%rax
    const char* s = (const char*) src;
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   446f6:	48 85 d2             	test   %rdx,%rdx
   446f9:	74 17                	je     44712 <memcpy+0x23>
   446fb:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
   44700:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
   44705:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   44709:	48 83 c1 01          	add    $0x1,%rcx
   4470d:	48 39 d1             	cmp    %rdx,%rcx
   44710:	75 ee                	jne    44700 <memcpy+0x11>
    }
    return dst;
}
   44712:	c3                   	ret    

0000000000044713 <memset>:
        }
    }
    return dst;
}

void* memset(void* v, int c, size_t n) {
   44713:	f3 0f 1e fa          	endbr64 
   44717:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
   4471a:	48 85 d2             	test   %rdx,%rdx
   4471d:	74 12                	je     44731 <memset+0x1e>
   4471f:	48 01 fa             	add    %rdi,%rdx
   44722:	48 89 f9             	mov    %rdi,%rcx
        *p = c;
   44725:	40 88 31             	mov    %sil,(%rcx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   44728:	48 83 c1 01          	add    $0x1,%rcx
   4472c:	48 39 ca             	cmp    %rcx,%rdx
   4472f:	75 f4                	jne    44725 <memset+0x12>
    }
    return v;
}
   44731:	c3                   	ret    

0000000000044732 <strlen>:
        }
    }
    return nullptr;
}

size_t strlen(const char* s) {
   44732:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
   44736:	80 3f 00             	cmpb   $0x0,(%rdi)
   44739:	74 10                	je     4474b <strlen+0x19>
   4473b:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
   44740:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
   44744:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
   44748:	75 f6                	jne    44740 <strlen+0xe>
   4474a:	c3                   	ret    
   4474b:	b8 00 00 00 00       	mov    $0x0,%eax
    }
    return n;
}
   44750:	c3                   	ret    

0000000000044751 <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
   44751:	f3 0f 1e fa          	endbr64 
   44755:	48 89 f0             	mov    %rsi,%rax
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   44758:	ba 00 00 00 00       	mov    $0x0,%edx
   4475d:	48 85 f6             	test   %rsi,%rsi
   44760:	74 11                	je     44773 <strnlen+0x22>
   44762:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
   44766:	74 0c                	je     44774 <strnlen+0x23>
        ++n;
   44768:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   4476c:	48 39 d0             	cmp    %rdx,%rax
   4476f:	75 f1                	jne    44762 <strnlen+0x11>
   44771:	eb 04                	jmp    44777 <strnlen+0x26>
   44773:	c3                   	ret    
   44774:	48 89 d0             	mov    %rdx,%rax
    }
    return n;
}
   44777:	c3                   	ret    

0000000000044778 <strcmp>:
        dst[nn] = '\0';
    }
    return n;
}

int strcmp(const char* a, const char* b) {
   44778:	f3 0f 1e fa          	endbr64 
    while (true) {
        unsigned char ac = *a, bc = *b;
   4477c:	0f b6 17             	movzbl (%rdi),%edx
   4477f:	0f b6 0e             	movzbl (%rsi),%ecx
        if (ac == '\0' || bc == '\0' || ac != bc) {
   44782:	84 d2                	test   %dl,%dl
   44784:	0f 94 c0             	sete   %al
   44787:	38 ca                	cmp    %cl,%dl
   44789:	41 0f 95 c0          	setne  %r8b
   4478d:	44 08 c0             	or     %r8b,%al
   44790:	75 2a                	jne    447bc <strcmp+0x44>
   44792:	b8 01 00 00 00       	mov    $0x1,%eax
   44797:	84 c9                	test   %cl,%cl
   44799:	74 21                	je     447bc <strcmp+0x44>
        unsigned char ac = *a, bc = *b;
   4479b:	0f b6 14 07          	movzbl (%rdi,%rax,1),%edx
   4479f:	0f b6 0c 06          	movzbl (%rsi,%rax,1),%ecx
        if (ac == '\0' || bc == '\0' || ac != bc) {
   447a3:	48 83 c0 01          	add    $0x1,%rax
   447a7:	84 d2                	test   %dl,%dl
   447a9:	41 0f 94 c0          	sete   %r8b
   447ad:	84 c9                	test   %cl,%cl
   447af:	41 0f 94 c1          	sete   %r9b
   447b3:	45 08 c8             	or     %r9b,%r8b
   447b6:	75 04                	jne    447bc <strcmp+0x44>
   447b8:	38 ca                	cmp    %cl,%dl
   447ba:	74 df                	je     4479b <strcmp+0x23>
            return (ac > bc) - (ac < bc);
   447bc:	38 ca                	cmp    %cl,%dl
   447be:	0f 97 c0             	seta   %al
   447c1:	0f b6 c0             	movzbl %al,%eax
   447c4:	83 d8 00             	sbb    $0x0,%eax
        }
        ++a, ++b;
    }
}
   447c7:	c3                   	ret    

00000000000447c8 <strchr>:
        }
        ++a, ++b, --n;
    }
}

char* strchr(const char* s, int c) {
   447c8:	f3 0f 1e fa          	endbr64 
    while (*s != '\0' && *s != (char) c) {
   447cc:	0f b6 07             	movzbl (%rdi),%eax
   447cf:	84 c0                	test   %al,%al
   447d1:	74 10                	je     447e3 <strchr+0x1b>
   447d3:	40 38 f0             	cmp    %sil,%al
   447d6:	74 18                	je     447f0 <strchr+0x28>
        ++s;
   447d8:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
   447dc:	0f b6 07             	movzbl (%rdi),%eax
   447df:	84 c0                	test   %al,%al
   447e1:	75 f0                	jne    447d3 <strchr+0xb>
    }
    if (*s == (char) c) {
        return (char*) s;
    } else {
        return nullptr;
   447e3:	40 84 f6             	test   %sil,%sil
   447e6:	b8 00 00 00 00       	mov    $0x0,%eax
   447eb:	48 0f 44 c7          	cmove  %rdi,%rax
    }
}
   447ef:	c3                   	ret    
   447f0:	48 89 f8             	mov    %rdi,%rax
   447f3:	c3                   	ret    

00000000000447f4 <strstr>:

char* strstr(const char* hs, const char* ns) {
   447f4:	f3 0f 1e fa          	endbr64 
    size_t i = 0, j = 0;
    while (hs[i] != '\0' && ns[j] != '\0') {
   447f8:	49 89 f8             	mov    %rdi,%r8
    size_t i = 0, j = 0;
   447fb:	b8 00 00 00 00       	mov    $0x0,%eax
   44800:	ba 00 00 00 00       	mov    $0x0,%edx
    while (hs[i] != '\0' && ns[j] != '\0') {
   44805:	80 3f 00             	cmpb   $0x0,(%rdi)
   44808:	75 1f                	jne    44829 <strstr+0x35>
        }
    }
    if (ns[j] == '\0') {
        return const_cast<char*>(&hs[i]);
    } else {
        return nullptr;
   4480a:	80 3c 06 00          	cmpb   $0x0,(%rsi,%rax,1)
   4480e:	b8 00 00 00 00       	mov    $0x0,%eax
   44813:	4c 0f 45 c0          	cmovne %rax,%r8
    }
}
   44817:	4c 89 c0             	mov    %r8,%rax
   4481a:	c3                   	ret    
            ++j;
   4481b:	48 83 c0 01          	add    $0x1,%rax
    while (hs[i] != '\0' && ns[j] != '\0') {
   4481f:	4c 8d 04 17          	lea    (%rdi,%rdx,1),%r8
   44823:	41 80 38 00          	cmpb   $0x0,(%r8)
   44827:	74 e1                	je     4480a <strstr+0x16>
   44829:	0f b6 0c 06          	movzbl (%rsi,%rax,1),%ecx
   4482d:	84 c9                	test   %cl,%cl
   4482f:	74 e6                	je     44817 <strstr+0x23>
        if (hs[i + j] == ns[j]) {
   44831:	4c 8d 04 17          	lea    (%rdi,%rdx,1),%r8
   44835:	41 38 0c 00          	cmp    %cl,(%r8,%rax,1)
   44839:	74 e0                	je     4481b <strstr+0x27>
            ++i;
   4483b:	48 83 c2 01          	add    $0x1,%rdx
            j = 0;
   4483f:	b8 00 00 00 00       	mov    $0x0,%eax
   44844:	eb d9                	jmp    4481f <strstr+0x2b>

0000000000044846 <printer::vprintf(int, char const*, __va_list_tag*)>:
        }
    } while (val != 0 && pos != buf);
    return pos;
}

void printer::vprintf(int color, const char* format, va_list val) {
   44846:	f3 0f 1e fa          	endbr64 
   4484a:	55                   	push   %rbp
   4484b:	48 89 e5             	mov    %rsp,%rbp
   4484e:	41 57                	push   %r15
   44850:	41 56                	push   %r14
   44852:	41 55                	push   %r13
   44854:	41 54                	push   %r12
   44856:	53                   	push   %rbx
   44857:	48 83 ec 58          	sub    $0x58,%rsp
   4485b:	49 89 fe             	mov    %rdi,%r14
   4485e:	89 75 ac             	mov    %esi,-0x54(%rbp)
   44861:	49 89 d4             	mov    %rdx,%r12
   44864:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
#define NUMBUFSIZ 32
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
   44868:	0f b6 02             	movzbl (%rdx),%eax
   4486b:	84 c0                	test   %al,%al
   4486d:	0f 85 cc 05 00 00    	jne    44e3f <printer::vprintf(int, char const*, __va_list_tag*)+0x5f9>
        }
        for (; width > 0; --width) {
            putc(' ', color);
        }
    }
}
   44873:	48 83 c4 58          	add    $0x58,%rsp
   44877:	5b                   	pop    %rbx
   44878:	41 5c                	pop    %r12
   4487a:	41 5d                	pop    %r13
   4487c:	41 5e                	pop    %r14
   4487e:	41 5f                	pop    %r15
   44880:	5d                   	pop    %rbp
   44881:	c3                   	ret    
        for (++format; *format; ++format) {
   44882:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   44887:	41 0f b6 5c 24 01    	movzbl 0x1(%r12),%ebx
   4488d:	84 db                	test   %bl,%bl
   4488f:	0f 84 f4 07 00 00    	je     45089 <printer::vprintf(int, char const*, __va_list_tag*)+0x843>
        int flags = 0;
   44895:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                flags |= 1 << (flagc - flag_chars);
   4489b:	41 bc 01 00 00 00    	mov    $0x1,%r12d
            const char* flagc = strchr(flag_chars, *format);
   448a1:	0f be f3             	movsbl %bl,%esi
   448a4:	bf a1 65 04 00       	mov    $0x465a1,%edi
   448a9:	e8 1a ff ff ff       	call   447c8 <strchr>
   448ae:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
   448b1:	48 85 c0             	test   %rax,%rax
   448b4:	74 70                	je     44926 <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
   448b6:	48 81 e9 a1 65 04 00 	sub    $0x465a1,%rcx
   448bd:	44 89 e0             	mov    %r12d,%eax
   448c0:	d3 e0                	shl    %cl,%eax
   448c2:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
   448c5:	49 83 c7 01          	add    $0x1,%r15
   448c9:	41 0f b6 1f          	movzbl (%r15),%ebx
   448cd:	84 db                	test   %bl,%bl
   448cf:	75 d0                	jne    448a1 <printer::vprintf(int, char const*, __va_list_tag*)+0x5b>
   448d1:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
        int width = -1;
   448d5:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
   448db:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%rbp)
        if (*format == '.') {
   448e2:	41 80 3f 2e          	cmpb   $0x2e,(%r15)
   448e6:	0f 84 c8 00 00 00    	je     449b4 <printer::vprintf(int, char const*, __va_list_tag*)+0x16e>
        switch (*format) {
   448ec:	41 0f b6 07          	movzbl (%r15),%eax
   448f0:	3c 6c                	cmp    $0x6c,%al
   448f2:	0f 84 50 01 00 00    	je     44a48 <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
   448f8:	0f 8f 3e 01 00 00    	jg     44a3c <printer::vprintf(int, char const*, __va_list_tag*)+0x1f6>
   448fe:	3c 68                	cmp    $0x68,%al
   44900:	0f 85 62 01 00 00    	jne    44a68 <printer::vprintf(int, char const*, __va_list_tag*)+0x222>
            ++format;
   44906:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
   4490a:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
   4490f:	8d 50 bd             	lea    -0x43(%rax),%edx
   44912:	80 fa 35             	cmp    $0x35,%dl
   44915:	0f 87 de 05 00 00    	ja     44ef9 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
   4491b:	0f b6 d2             	movzbl %dl,%edx
   4491e:	3e ff 24 d5 b0 5e 04 	notrack jmp *0x45eb0(,%rdx,8)
   44925:	00 
        if (*format >= '1' && *format <= '9') {
   44926:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
   4492a:	8d 43 cf             	lea    -0x31(%rbx),%eax
   4492d:	3c 08                	cmp    $0x8,%al
   4492f:	77 34                	ja     44965 <printer::vprintf(int, char const*, __va_list_tag*)+0x11f>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   44931:	41 0f b6 07          	movzbl (%r15),%eax
   44935:	8d 50 d0             	lea    -0x30(%rax),%edx
   44938:	80 fa 09             	cmp    $0x9,%dl
   4493b:	77 61                	ja     4499e <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
   4493d:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
   44943:	49 83 c7 01          	add    $0x1,%r15
   44947:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
   4494c:	0f be c0             	movsbl %al,%eax
   4494f:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   44954:	41 0f b6 07          	movzbl (%r15),%eax
   44958:	8d 50 d0             	lea    -0x30(%rax),%edx
   4495b:	80 fa 09             	cmp    $0x9,%dl
   4495e:	76 e3                	jbe    44943 <printer::vprintf(int, char const*, __va_list_tag*)+0xfd>
   44960:	e9 76 ff ff ff       	jmp    448db <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        } else if (*format == '*') {
   44965:	80 fb 2a             	cmp    $0x2a,%bl
   44968:	75 3f                	jne    449a9 <printer::vprintf(int, char const*, __va_list_tag*)+0x163>
            width = va_arg(val, int);
   4496a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   4496e:	8b 07                	mov    (%rdi),%eax
   44970:	83 f8 2f             	cmp    $0x2f,%eax
   44973:	77 17                	ja     4498c <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
   44975:	89 c2                	mov    %eax,%edx
   44977:	48 03 57 10          	add    0x10(%rdi),%rdx
   4497b:	83 c0 08             	add    $0x8,%eax
   4497e:	89 07                	mov    %eax,(%rdi)
   44980:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
   44983:	49 83 c7 01          	add    $0x1,%r15
   44987:	e9 4f ff ff ff       	jmp    448db <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            width = va_arg(val, int);
   4498c:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44990:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   44994:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44998:	48 89 41 08          	mov    %rax,0x8(%rcx)
   4499c:	eb e2                	jmp    44980 <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   4499e:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   449a4:	e9 32 ff ff ff       	jmp    448db <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
        int width = -1;
   449a9:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   449af:	e9 27 ff ff ff       	jmp    448db <printer::vprintf(int, char const*, __va_list_tag*)+0x95>
            ++format;
   449b4:	49 8d 57 01          	lea    0x1(%r15),%rdx
            if (*format >= '0' && *format <= '9') {
   449b8:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
   449bd:	8d 48 d0             	lea    -0x30(%rax),%ecx
   449c0:	80 f9 09             	cmp    $0x9,%cl
   449c3:	76 13                	jbe    449d8 <printer::vprintf(int, char const*, __va_list_tag*)+0x192>
            } else if (*format == '*') {
   449c5:	3c 2a                	cmp    $0x2a,%al
   449c7:	74 33                	je     449fc <printer::vprintf(int, char const*, __va_list_tag*)+0x1b6>
            ++format;
   449c9:	49 89 d7             	mov    %rdx,%r15
                precision = 0;
   449cc:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
   449d3:	e9 14 ff ff ff       	jmp    448ec <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   449d8:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
   449dd:	48 83 c2 01          	add    $0x1,%rdx
   449e1:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
   449e4:	0f be c0             	movsbl %al,%eax
   449e7:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   449eb:	0f b6 02             	movzbl (%rdx),%eax
   449ee:	8d 70 d0             	lea    -0x30(%rax),%esi
   449f1:	40 80 fe 09          	cmp    $0x9,%sil
   449f5:	76 e6                	jbe    449dd <printer::vprintf(int, char const*, __va_list_tag*)+0x197>
                    precision = 10 * precision + *format++ - '0';
   449f7:	49 89 d7             	mov    %rdx,%r15
   449fa:	eb 1c                	jmp    44a18 <printer::vprintf(int, char const*, __va_list_tag*)+0x1d2>
                precision = va_arg(val, int);
   449fc:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44a00:	8b 01                	mov    (%rcx),%eax
   44a02:	83 f8 2f             	cmp    $0x2f,%eax
   44a05:	77 23                	ja     44a2a <printer::vprintf(int, char const*, __va_list_tag*)+0x1e4>
   44a07:	89 c2                	mov    %eax,%edx
   44a09:	48 03 51 10          	add    0x10(%rcx),%rdx
   44a0d:	83 c0 08             	add    $0x8,%eax
   44a10:	89 01                	mov    %eax,(%rcx)
   44a12:	8b 0a                	mov    (%rdx),%ecx
                ++format;
   44a14:	49 83 c7 02          	add    $0x2,%r15
            if (precision < 0) {
   44a18:	85 c9                	test   %ecx,%ecx
   44a1a:	b8 00 00 00 00       	mov    $0x0,%eax
   44a1f:	0f 49 c1             	cmovns %ecx,%eax
   44a22:	89 45 a8             	mov    %eax,-0x58(%rbp)
   44a25:	e9 c2 fe ff ff       	jmp    448ec <printer::vprintf(int, char const*, __va_list_tag*)+0xa6>
                precision = va_arg(val, int);
   44a2a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44a2e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   44a32:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44a36:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44a3a:	eb d6                	jmp    44a12 <printer::vprintf(int, char const*, __va_list_tag*)+0x1cc>
        switch (*format) {
   44a3c:	3c 74                	cmp    $0x74,%al
   44a3e:	74 08                	je     44a48 <printer::vprintf(int, char const*, __va_list_tag*)+0x202>
   44a40:	3c 7a                	cmp    $0x7a,%al
   44a42:	0f 85 77 06 00 00    	jne    450bf <printer::vprintf(int, char const*, __va_list_tag*)+0x879>
            ++format;
   44a48:	49 8d 4f 01          	lea    0x1(%r15),%rcx
        switch (*format) {
   44a4c:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
   44a51:	8d 50 bd             	lea    -0x43(%rax),%edx
   44a54:	80 fa 35             	cmp    $0x35,%dl
   44a57:	0f 87 9c 04 00 00    	ja     44ef9 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b3>
   44a5d:	0f b6 d2             	movzbl %dl,%edx
   44a60:	3e ff 24 d5 60 60 04 	notrack jmp *0x46060(,%rdx,8)
   44a67:	00 
   44a68:	8d 50 bd             	lea    -0x43(%rax),%edx
   44a6b:	80 fa 35             	cmp    $0x35,%dl
   44a6e:	0f 87 82 04 00 00    	ja     44ef6 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b0>
   44a74:	0f b6 d2             	movzbl %dl,%edx
   44a77:	3e ff 24 d5 10 62 04 	notrack jmp *0x46210(,%rdx,8)
   44a7e:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
   44a7f:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44a83:	8b 07                	mov    (%rdi),%eax
   44a85:	83 f8 2f             	cmp    $0x2f,%eax
   44a88:	77 3a                	ja     44ac4 <printer::vprintf(int, char const*, __va_list_tag*)+0x27e>
   44a8a:	89 c2                	mov    %eax,%edx
   44a8c:	48 03 57 10          	add    0x10(%rdi),%rdx
   44a90:	83 c0 08             	add    $0x8,%eax
   44a93:	89 07                	mov    %eax,(%rdi)
   44a95:	48 8b 12             	mov    (%rdx),%rdx
   44a98:	49 89 cf             	mov    %rcx,%r15
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   44a9b:	48 89 d0             	mov    %rdx,%rax
   44a9e:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
   44aa2:	49 89 d2             	mov    %rdx,%r10
   44aa5:	49 f7 da             	neg    %r10
   44aa8:	25 00 01 00 00       	and    $0x100,%eax
   44aad:	4c 0f 44 d2          	cmove  %rdx,%r10
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   44ab1:	0b 45 a0             	or     -0x60(%rbp),%eax
   44ab4:	0c c0                	or     $0xc0,%al
   44ab6:	89 45 a0             	mov    %eax,-0x60(%rbp)
        const char* data = "";
   44ab9:	41 bc f2 5a 04 00    	mov    $0x45af2,%r12d
            break;
   44abf:	e9 ec 01 00 00       	jmp    44cb0 <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   44ac4:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44ac8:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   44acc:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44ad0:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44ad4:	eb bf                	jmp    44a95 <printer::vprintf(int, char const*, __va_list_tag*)+0x24f>
        switch (*format) {
   44ad6:	49 89 cf             	mov    %rcx,%r15
            long x = length ? va_arg(val, long) : va_arg(val, int);
   44ad9:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44add:	8b 01                	mov    (%rcx),%eax
   44adf:	83 f8 2f             	cmp    $0x2f,%eax
   44ae2:	77 10                	ja     44af4 <printer::vprintf(int, char const*, __va_list_tag*)+0x2ae>
   44ae4:	89 c2                	mov    %eax,%edx
   44ae6:	48 03 51 10          	add    0x10(%rcx),%rdx
   44aea:	83 c0 08             	add    $0x8,%eax
   44aed:	89 01                	mov    %eax,(%rcx)
   44aef:	48 63 12             	movslq (%rdx),%rdx
   44af2:	eb a7                	jmp    44a9b <printer::vprintf(int, char const*, __va_list_tag*)+0x255>
   44af4:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44af8:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   44afc:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44b00:	48 89 41 08          	mov    %rax,0x8(%rcx)
   44b04:	eb e9                	jmp    44aef <printer::vprintf(int, char const*, __va_list_tag*)+0x2a9>
        switch (*format) {
   44b06:	49 89 cf             	mov    %rcx,%r15
   44b09:	b8 01 00 00 00       	mov    $0x1,%eax
   44b0e:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
   44b14:	e9 8f 00 00 00       	jmp    44ba8 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
   44b19:	49 89 cf             	mov    %rcx,%r15
   44b1c:	b8 00 00 00 00       	mov    $0x0,%eax
   44b21:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
   44b27:	eb 7f                	jmp    44ba8 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
   44b29:	b8 00 00 00 00       	mov    $0x0,%eax
   44b2e:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
   44b34:	eb 72                	jmp    44ba8 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
   44b36:	b8 00 00 00 00       	mov    $0x0,%eax
   44b3b:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
   44b41:	eb 65                	jmp    44ba8 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   44b43:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44b47:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   44b4b:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44b4f:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44b53:	eb 6d                	jmp    44bc2 <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
   44b55:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44b59:	8b 07                	mov    (%rdi),%eax
   44b5b:	83 f8 2f             	cmp    $0x2f,%eax
   44b5e:	77 10                	ja     44b70 <printer::vprintf(int, char const*, __va_list_tag*)+0x32a>
   44b60:	89 c2                	mov    %eax,%edx
   44b62:	48 03 57 10          	add    0x10(%rdi),%rdx
   44b66:	83 c0 08             	add    $0x8,%eax
   44b69:	89 07                	mov    %eax,(%rdi)
   44b6b:	44 8b 12             	mov    (%rdx),%r10d
   44b6e:	eb 55                	jmp    44bc5 <printer::vprintf(int, char const*, __va_list_tag*)+0x37f>
   44b70:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44b74:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   44b78:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44b7c:	48 89 41 08          	mov    %rax,0x8(%rcx)
   44b80:	eb e9                	jmp    44b6b <printer::vprintf(int, char const*, __va_list_tag*)+0x325>
        switch (*format) {
   44b82:	49 89 cf             	mov    %rcx,%r15
   44b85:	b8 01 00 00 00       	mov    $0x1,%eax
   44b8a:	eb 16                	jmp    44ba2 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
   44b8c:	49 89 cf             	mov    %rcx,%r15
   44b8f:	b8 00 00 00 00       	mov    $0x0,%eax
   44b94:	eb 0c                	jmp    44ba2 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
   44b96:	b8 00 00 00 00       	mov    $0x0,%eax
   44b9b:	eb 05                	jmp    44ba2 <printer::vprintf(int, char const*, __va_list_tag*)+0x35c>
   44b9d:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
   44ba2:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   44ba8:	85 c0                	test   %eax,%eax
   44baa:	74 a9                	je     44b55 <printer::vprintf(int, char const*, __va_list_tag*)+0x30f>
   44bac:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44bb0:	8b 01                	mov    (%rcx),%eax
   44bb2:	83 f8 2f             	cmp    $0x2f,%eax
   44bb5:	77 8c                	ja     44b43 <printer::vprintf(int, char const*, __va_list_tag*)+0x2fd>
   44bb7:	89 c2                	mov    %eax,%edx
   44bb9:	48 03 51 10          	add    0x10(%rcx),%rdx
   44bbd:	83 c0 08             	add    $0x8,%eax
   44bc0:	89 01                	mov    %eax,(%rcx)
   44bc2:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_NUMERIC;
   44bc5:	83 4d a0 40          	orl    $0x40,-0x60(%rbp)
    if (base < 0) {
   44bc9:	45 89 c3             	mov    %r8d,%r11d
    const char* digits = upper_digits;
   44bcc:	41 b9 90 65 04 00    	mov    $0x46590,%r9d
    if (base < 0) {
   44bd2:	45 85 c0             	test   %r8d,%r8d
   44bd5:	79 0c                	jns    44be3 <printer::vprintf(int, char const*, __va_list_tag*)+0x39d>
        base = -base;
   44bd7:	45 89 c3             	mov    %r8d,%r11d
   44bda:	41 f7 d8             	neg    %r8d
        digits = lower_digits;
   44bdd:	41 b9 70 65 04 00    	mov    $0x46570,%r9d
    *--pos = '\0';
   44be3:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
   44be7:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
   44beb:	0f 84 49 03 00 00    	je     44f3a <printer::vprintf(int, char const*, __va_list_tag*)+0x6f4>
        thousands_pos = pos - (base == 10 ? 3 : 4);
   44bf1:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
   44bf8:	41 83 f8 0a          	cmp    $0xa,%r8d
   44bfc:	0f 94 c0             	sete   %al
   44bff:	0f b6 c0             	movzbl %al,%eax
   44c02:	48 83 e8 04          	sub    $0x4,%rax
   44c06:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
   44c0b:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
   44c0f:	4c 89 d0             	mov    %r10,%rax
            *--pos = digits[val % base];
   44c12:	49 63 f0             	movslq %r8d,%rsi
   44c15:	e9 5d 03 00 00       	jmp    44f77 <printer::vprintf(int, char const*, __va_list_tag*)+0x731>
        switch (*format) {
   44c1a:	49 89 cf             	mov    %rcx,%r15
   44c1d:	b8 01 00 00 00       	mov    $0x1,%eax
   44c22:	eb 16                	jmp    44c3a <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
   44c24:	49 89 cf             	mov    %rcx,%r15
   44c27:	b8 00 00 00 00       	mov    $0x0,%eax
   44c2c:	eb 0c                	jmp    44c3a <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
   44c2e:	b8 00 00 00 00       	mov    $0x0,%eax
   44c33:	eb 05                	jmp    44c3a <printer::vprintf(int, char const*, __va_list_tag*)+0x3f4>
   44c35:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
   44c3a:	41 b8 10 00 00 00    	mov    $0x10,%r8d
            goto format_unsigned;
   44c40:	e9 63 ff ff ff       	jmp    44ba8 <printer::vprintf(int, char const*, __va_list_tag*)+0x362>
        switch (*format) {
   44c45:	49 89 cf             	mov    %rcx,%r15
            num = (uintptr_t) va_arg(val, void*);
   44c48:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44c4c:	8b 01                	mov    (%rcx),%eax
   44c4e:	83 f8 2f             	cmp    $0x2f,%eax
   44c51:	77 25                	ja     44c78 <printer::vprintf(int, char const*, __va_list_tag*)+0x432>
   44c53:	89 c2                	mov    %eax,%edx
   44c55:	48 03 51 10          	add    0x10(%rcx),%rdx
   44c59:	83 c0 08             	add    $0x8,%eax
   44c5c:	89 01                	mov    %eax,(%rcx)
   44c5e:	4c 8b 12             	mov    (%rdx),%r10
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   44c61:	81 4d a0 41 02 00 00 	orl    $0x241,-0x60(%rbp)
            base = -16;
   44c68:	41 b8 f0 ff ff ff    	mov    $0xfffffff0,%r8d
   44c6e:	e9 64 ff ff ff       	jmp    44bd7 <printer::vprintf(int, char const*, __va_list_tag*)+0x391>
        switch (*format) {
   44c73:	49 89 cf             	mov    %rcx,%r15
   44c76:	eb d0                	jmp    44c48 <printer::vprintf(int, char const*, __va_list_tag*)+0x402>
            num = (uintptr_t) va_arg(val, void*);
   44c78:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44c7c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   44c80:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44c84:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44c88:	eb d4                	jmp    44c5e <printer::vprintf(int, char const*, __va_list_tag*)+0x418>
        switch (*format) {
   44c8a:	49 89 cf             	mov    %rcx,%r15
            data = va_arg(val, char*);
   44c8d:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44c91:	8b 07                	mov    (%rdi),%eax
   44c93:	83 f8 2f             	cmp    $0x2f,%eax
   44c96:	0f 87 c6 01 00 00    	ja     44e62 <printer::vprintf(int, char const*, __va_list_tag*)+0x61c>
   44c9c:	89 c2                	mov    %eax,%edx
   44c9e:	48 03 57 10          	add    0x10(%rdi),%rdx
   44ca2:	83 c0 08             	add    $0x8,%eax
   44ca5:	89 07                	mov    %eax,(%rdi)
   44ca7:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
   44caa:	41 ba 00 00 00 00    	mov    $0x0,%r10d
        if (flags & FLAG_NUMERIC) {
   44cb0:	8b 45 a0             	mov    -0x60(%rbp),%eax
   44cb3:	83 e0 40             	and    $0x40,%eax
   44cb6:	89 45 98             	mov    %eax,-0x68(%rbp)
   44cb9:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
   44cbf:	0f 85 d0 03 00 00    	jne    45095 <printer::vprintf(int, char const*, __va_list_tag*)+0x84f>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   44cc5:	8b 45 a0             	mov    -0x60(%rbp),%eax
   44cc8:	89 45 8c             	mov    %eax,-0x74(%rbp)
   44ccb:	25 c0 00 00 00       	and    $0xc0,%eax
   44cd0:	3d c0 00 00 00       	cmp    $0xc0,%eax
   44cd5:	0f 84 c4 02 00 00    	je     44f9f <printer::vprintf(int, char const*, __va_list_tag*)+0x759>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   44cdb:	8b 45 a0             	mov    -0x60(%rbp),%eax
   44cde:	83 e0 41             	and    $0x41,%eax
        const char* prefix = "";
   44ce1:	bb f2 5a 04 00       	mov    $0x45af2,%ebx
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   44ce6:	83 f8 41             	cmp    $0x41,%eax
   44ce9:	0f 84 e6 02 00 00    	je     44fd5 <printer::vprintf(int, char const*, __va_list_tag*)+0x78f>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   44cef:	8b 4d a8             	mov    -0x58(%rbp),%ecx
   44cf2:	89 c8                	mov    %ecx,%eax
   44cf4:	f7 d0                	not    %eax
   44cf6:	c1 e8 1f             	shr    $0x1f,%eax
   44cf9:	89 45 88             	mov    %eax,-0x78(%rbp)
   44cfc:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
   44d00:	0f 85 0a 03 00 00    	jne    45010 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
   44d06:	84 c0                	test   %al,%al
   44d08:	0f 84 02 03 00 00    	je     45010 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ca>
            datalen = strnlen(data, precision);
   44d0e:	48 63 f1             	movslq %ecx,%rsi
   44d11:	4c 89 e7             	mov    %r12,%rdi
   44d14:	e8 38 fa ff ff       	call   44751 <strnlen>
   44d19:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
   44d1c:	8b 45 8c             	mov    -0x74(%rbp),%eax
   44d1f:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
   44d22:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
   44d29:	83 f8 42             	cmp    $0x42,%eax
   44d2c:	0f 84 16 03 00 00    	je     45048 <printer::vprintf(int, char const*, __va_list_tag*)+0x802>
        width -= datalen + zeros + strlen(prefix);
   44d32:	48 89 df             	mov    %rbx,%rdi
   44d35:	e8 f8 f9 ff ff       	call   44732 <strlen>
   44d3a:	8b 55 a8             	mov    -0x58(%rbp),%edx
   44d3d:	03 55 9c             	add    -0x64(%rbp),%edx
   44d40:	44 89 e9             	mov    %r13d,%ecx
   44d43:	29 d1                	sub    %edx,%ecx
   44d45:	29 c1                	sub    %eax,%ecx
   44d47:	89 4d 98             	mov    %ecx,-0x68(%rbp)
   44d4a:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   44d4d:	f6 45 a0 04          	testb  $0x4,-0x60(%rbp)
   44d51:	75 39                	jne    44d8c <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
   44d53:	85 c9                	test   %ecx,%ecx
   44d55:	7e 35                	jle    44d8c <printer::vprintf(int, char const*, __va_list_tag*)+0x546>
        width -= datalen + zeros + strlen(prefix);
   44d57:	48 89 5d a0          	mov    %rbx,-0x60(%rbp)
   44d5b:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
   44d5e:	49 8b 06             	mov    (%r14),%rax
   44d61:	89 da                	mov    %ebx,%edx
   44d63:	be 20 00 00 00       	mov    $0x20,%esi
   44d68:	4c 89 f7             	mov    %r14,%rdi
   44d6b:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   44d6d:	41 83 ed 01          	sub    $0x1,%r13d
   44d71:	45 85 ed             	test   %r13d,%r13d
   44d74:	7f e8                	jg     44d5e <printer::vprintf(int, char const*, __va_list_tag*)+0x518>
   44d76:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
   44d7a:	8b 7d 98             	mov    -0x68(%rbp),%edi
   44d7d:	85 ff                	test   %edi,%edi
   44d7f:	b8 01 00 00 00       	mov    $0x1,%eax
   44d84:	0f 4f c7             	cmovg  %edi,%eax
   44d87:	29 c7                	sub    %eax,%edi
   44d89:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
   44d8c:	0f b6 03             	movzbl (%rbx),%eax
   44d8f:	84 c0                	test   %al,%al
   44d91:	74 25                	je     44db8 <printer::vprintf(int, char const*, __va_list_tag*)+0x572>
   44d93:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
   44d97:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc(*prefix, color);
   44d9b:	0f b6 f0             	movzbl %al,%esi
   44d9e:	49 8b 06             	mov    (%r14),%rax
   44da1:	44 89 e2             	mov    %r12d,%edx
   44da4:	4c 89 f7             	mov    %r14,%rdi
   44da7:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
   44da9:	48 83 c3 01          	add    $0x1,%rbx
   44dad:	0f b6 03             	movzbl (%rbx),%eax
   44db0:	84 c0                	test   %al,%al
   44db2:	75 e7                	jne    44d9b <printer::vprintf(int, char const*, __va_list_tag*)+0x555>
   44db4:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; zeros > 0; --zeros) {
   44db8:	8b 5d a8             	mov    -0x58(%rbp),%ebx
   44dbb:	85 db                	test   %ebx,%ebx
   44dbd:	7e 21                	jle    44de0 <printer::vprintf(int, char const*, __va_list_tag*)+0x59a>
   44dbf:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
   44dc3:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            putc('0', color);
   44dc7:	49 8b 06             	mov    (%r14),%rax
   44dca:	44 89 e2             	mov    %r12d,%edx
   44dcd:	be 30 00 00 00       	mov    $0x30,%esi
   44dd2:	4c 89 f7             	mov    %r14,%rdi
   44dd5:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
   44dd7:	83 eb 01             	sub    $0x1,%ebx
   44dda:	75 eb                	jne    44dc7 <printer::vprintf(int, char const*, __va_list_tag*)+0x581>
   44ddc:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; datalen > 0; ++data, --datalen) {
   44de0:	8b 45 9c             	mov    -0x64(%rbp),%eax
   44de3:	85 c0                	test   %eax,%eax
   44de5:	7e 2a                	jle    44e11 <printer::vprintf(int, char const*, __va_list_tag*)+0x5cb>
   44de7:	89 c3                	mov    %eax,%ebx
   44de9:	4c 01 e3             	add    %r12,%rbx
   44dec:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
   44df0:	44 8b 6d ac          	mov    -0x54(%rbp),%r13d
            putc(*data, color);
   44df4:	41 0f b6 34 24       	movzbl (%r12),%esi
   44df9:	49 8b 06             	mov    (%r14),%rax
   44dfc:	44 89 ea             	mov    %r13d,%edx
   44dff:	4c 89 f7             	mov    %r14,%rdi
   44e02:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
   44e04:	49 83 c4 01          	add    $0x1,%r12
   44e08:	4c 39 e3             	cmp    %r12,%rbx
   44e0b:	75 e7                	jne    44df4 <printer::vprintf(int, char const*, __va_list_tag*)+0x5ae>
   44e0d:	44 8b 6d a0          	mov    -0x60(%rbp),%r13d
        for (; width > 0; --width) {
   44e11:	45 85 ed             	test   %r13d,%r13d
   44e14:	7e 18                	jle    44e2e <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
   44e16:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            putc(' ', color);
   44e19:	49 8b 06             	mov    (%r14),%rax
   44e1c:	89 da                	mov    %ebx,%edx
   44e1e:	be 20 00 00 00       	mov    $0x20,%esi
   44e23:	4c 89 f7             	mov    %r14,%rdi
   44e26:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
   44e28:	41 83 ed 01          	sub    $0x1,%r13d
   44e2c:	75 eb                	jne    44e19 <printer::vprintf(int, char const*, __va_list_tag*)+0x5d3>
    for (; *format; ++format) {
   44e2e:	4d 8d 67 01          	lea    0x1(%r15),%r12
   44e32:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
   44e37:	84 c0                	test   %al,%al
   44e39:	0f 84 34 fa ff ff    	je     44873 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
   44e3f:	3c 25                	cmp    $0x25,%al
   44e41:	0f 84 3b fa ff ff    	je     44882 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
   44e47:	0f b6 f0             	movzbl %al,%esi
   44e4a:	49 8b 06             	mov    (%r14),%rax
   44e4d:	8b 55 ac             	mov    -0x54(%rbp),%edx
   44e50:	4c 89 f7             	mov    %r14,%rdi
   44e53:	ff 10                	call   *(%rax)
            continue;
   44e55:	4d 89 e7             	mov    %r12,%r15
   44e58:	eb d4                	jmp    44e2e <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
   44e5a:	49 89 cf             	mov    %rcx,%r15
   44e5d:	e9 2b fe ff ff       	jmp    44c8d <printer::vprintf(int, char const*, __va_list_tag*)+0x447>
            data = va_arg(val, char*);
   44e62:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44e66:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   44e6a:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44e6e:	48 89 41 08          	mov    %rax,0x8(%rcx)
   44e72:	e9 30 fe ff ff       	jmp    44ca7 <printer::vprintf(int, char const*, __va_list_tag*)+0x461>
        switch (*format) {
   44e77:	49 89 cf             	mov    %rcx,%r15
            color = va_arg(val, int);
   44e7a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44e7e:	8b 01                	mov    (%rcx),%eax
   44e80:	83 f8 2f             	cmp    $0x2f,%eax
   44e83:	77 17                	ja     44e9c <printer::vprintf(int, char const*, __va_list_tag*)+0x656>
   44e85:	89 c2                	mov    %eax,%edx
   44e87:	48 03 51 10          	add    0x10(%rcx),%rdx
   44e8b:	83 c0 08             	add    $0x8,%eax
   44e8e:	89 01                	mov    %eax,(%rcx)
   44e90:	8b 02                	mov    (%rdx),%eax
   44e92:	89 45 ac             	mov    %eax,-0x54(%rbp)
            continue;
   44e95:	eb 97                	jmp    44e2e <printer::vprintf(int, char const*, __va_list_tag*)+0x5e8>
        switch (*format) {
   44e97:	49 89 cf             	mov    %rcx,%r15
   44e9a:	eb de                	jmp    44e7a <printer::vprintf(int, char const*, __va_list_tag*)+0x634>
            color = va_arg(val, int);
   44e9c:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44ea0:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   44ea4:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44ea8:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44eac:	eb e2                	jmp    44e90 <printer::vprintf(int, char const*, __va_list_tag*)+0x64a>
        switch (*format) {
   44eae:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = va_arg(val, int);
   44eb1:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44eb5:	8b 07                	mov    (%rdi),%eax
   44eb7:	83 f8 2f             	cmp    $0x2f,%eax
   44eba:	77 28                	ja     44ee4 <printer::vprintf(int, char const*, __va_list_tag*)+0x69e>
   44ebc:	89 c2                	mov    %eax,%edx
   44ebe:	48 03 57 10          	add    0x10(%rdi),%rdx
   44ec2:	83 c0 08             	add    $0x8,%eax
   44ec5:	89 07                	mov    %eax,(%rdi)
   44ec7:	8b 02                	mov    (%rdx),%eax
   44ec9:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
   44ecc:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
   44ed0:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
   44ed4:	41 ba 00 00 00 00    	mov    $0x0,%r10d
            break;
   44eda:	e9 d1 fd ff ff       	jmp    44cb0 <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        switch (*format) {
   44edf:	49 89 cf             	mov    %rcx,%r15
   44ee2:	eb cd                	jmp    44eb1 <printer::vprintf(int, char const*, __va_list_tag*)+0x66b>
            numbuf[0] = va_arg(val, int);
   44ee4:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44ee8:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   44eec:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44ef0:	48 89 41 08          	mov    %rax,0x8(%rcx)
   44ef4:	eb d1                	jmp    44ec7 <printer::vprintf(int, char const*, __va_list_tag*)+0x681>
        switch (*format) {
   44ef6:	4c 89 f9             	mov    %r15,%rcx
            numbuf[0] = (*format ? *format : '%');
   44ef9:	84 c0                	test   %al,%al
   44efb:	0f 85 6f 01 00 00    	jne    45070 <printer::vprintf(int, char const*, __va_list_tag*)+0x82a>
   44f01:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
   44f05:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
   44f09:	4c 8d 79 ff          	lea    -0x1(%rcx),%r15
            data = numbuf;
   44f0d:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
   44f11:	41 ba 00 00 00 00    	mov    $0x0,%r10d
   44f17:	e9 94 fd ff ff       	jmp    44cb0 <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
    if (flags & FLAG_THOUSANDS) {
   44f1c:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
   44f22:	41 b9 90 65 04 00    	mov    $0x46590,%r9d
    if (flags & FLAG_THOUSANDS) {
   44f28:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = pos - (base == 10 ? 3 : 4);
   44f2e:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
   44f35:	e9 cc fc ff ff       	jmp    44c06 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c0>
   44f3a:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
   44f41:	bf 00 00 00 00       	mov    $0x0,%edi
   44f46:	e9 c0 fc ff ff       	jmp    44c0b <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
            *--pos = digits[val % base];
   44f4b:	49 89 cc             	mov    %rcx,%r12
   44f4e:	ba 00 00 00 00       	mov    $0x0,%edx
   44f53:	48 f7 f6             	div    %rsi
   44f56:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
   44f5b:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
   44f5d:	48 83 e9 01          	sub    $0x1,%rcx
   44f61:	48 85 c0             	test   %rax,%rax
   44f64:	0f 84 5b fd ff ff    	je     44cc5 <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
   44f6a:	48 8d 55 b0          	lea    -0x50(%rbp),%rdx
   44f6e:	49 39 d4             	cmp    %rdx,%r12
   44f71:	0f 84 4e fd ff ff    	je     44cc5 <printer::vprintf(int, char const*, __va_list_tag*)+0x47f>
        if (pos == thousands_pos) {
   44f77:	48 8d 51 01          	lea    0x1(%rcx),%rdx
   44f7b:	48 39 d7             	cmp    %rdx,%rdi
   44f7e:	75 cb                	jne    44f4b <printer::vprintf(int, char const*, __va_list_tag*)+0x705>
            *--pos = base == 10 ? ',' : '\'';
   44f80:	49 89 cc             	mov    %rcx,%r12
   44f83:	41 83 f8 0a          	cmp    $0xa,%r8d
   44f87:	0f 94 c2             	sete   %dl
   44f8a:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
   44f8e:	40 0f 94 c7          	sete   %dil
   44f92:	40 0f b6 ff          	movzbl %dil,%edi
   44f96:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
   44f98:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
   44f9d:	eb be                	jmp    44f5d <printer::vprintf(int, char const*, __va_list_tag*)+0x717>
                prefix = "-";
   44f9f:	bb 9d 5e 04 00       	mov    $0x45e9d,%ebx
            if (flags & FLAG_NEGATIVE) {
   44fa4:	8b 45 a0             	mov    -0x60(%rbp),%eax
   44fa7:	f6 c4 01             	test   $0x1,%ah
   44faa:	0f 85 3f fd ff ff    	jne    44cef <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = "+";
   44fb0:	bb 98 5e 04 00       	mov    $0x45e98,%ebx
            } else if (flags & FLAG_PLUSPOSITIVE) {
   44fb5:	a8 10                	test   $0x10,%al
   44fb7:	0f 85 32 fd ff ff    	jne    44cef <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                prefix = " ";
   44fbd:	a8 08                	test   $0x8,%al
   44fbf:	ba f2 5a 04 00       	mov    $0x45af2,%edx
   44fc4:	b8 3f 5b 04 00       	mov    $0x45b3f,%eax
   44fc9:	48 0f 44 c2          	cmove  %rdx,%rax
   44fcd:	48 89 c3             	mov    %rax,%rbx
   44fd0:	e9 1a fd ff ff       	jmp    44cef <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (base == 16 || base == -16)
   44fd5:	41 8d 43 10          	lea    0x10(%r11),%eax
   44fd9:	a9 df ff ff ff       	test   $0xffffffdf,%eax
   44fde:	0f 85 0b fd ff ff    	jne    44cef <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
                   && (num || (flags & FLAG_ALT2))) {
   44fe4:	4d 85 d2             	test   %r10,%r10
   44fe7:	75 0d                	jne    44ff6 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b0>
   44fe9:	f7 45 a0 00 02 00 00 	testl  $0x200,-0x60(%rbp)
   44ff0:	0f 84 f9 fc ff ff    	je     44cef <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            prefix = (base == -16 ? "0x" : "0X");
   44ff6:	41 83 fb f0          	cmp    $0xfffffff0,%r11d
   44ffa:	ba 9f 5e 04 00       	mov    $0x45e9f,%edx
   44fff:	b8 9a 5e 04 00       	mov    $0x45e9a,%eax
   45004:	48 0f 44 c2          	cmove  %rdx,%rax
   45008:	48 89 c3             	mov    %rax,%rbx
   4500b:	e9 df fc ff ff       	jmp    44cef <printer::vprintf(int, char const*, __va_list_tag*)+0x4a9>
            datalen = strlen(data);
   45010:	4c 89 e7             	mov    %r12,%rdi
   45013:	e8 1a f7 ff ff       	call   44732 <strlen>
   45018:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
   4501b:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
   4501f:	0f 84 f7 fc ff ff    	je     44d1c <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
   45025:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
   45029:	0f 84 ed fc ff ff    	je     44d1c <printer::vprintf(int, char const*, __va_list_tag*)+0x4d6>
            zeros = precision > datalen ? precision - datalen : 0;
   4502f:	8b 4d a8             	mov    -0x58(%rbp),%ecx
   45032:	89 ca                	mov    %ecx,%edx
   45034:	29 c2                	sub    %eax,%edx
   45036:	39 c1                	cmp    %eax,%ecx
   45038:	b8 00 00 00 00       	mov    $0x0,%eax
   4503d:	0f 4f c2             	cmovg  %edx,%eax
   45040:	89 45 a8             	mov    %eax,-0x58(%rbp)
   45043:	e9 ea fc ff ff       	jmp    44d32 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
                   && datalen + (int) strlen(prefix) < width) {
   45048:	48 89 df             	mov    %rbx,%rdi
   4504b:	e8 e2 f6 ff ff       	call   44732 <strlen>
   45050:	8b 7d 9c             	mov    -0x64(%rbp),%edi
   45053:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
   45056:	44 89 e9             	mov    %r13d,%ecx
   45059:	29 f9                	sub    %edi,%ecx
   4505b:	29 c1                	sub    %eax,%ecx
   4505d:	44 39 ea             	cmp    %r13d,%edx
   45060:	b8 00 00 00 00       	mov    $0x0,%eax
   45065:	0f 4c c1             	cmovl  %ecx,%eax
   45068:	89 45 a8             	mov    %eax,-0x58(%rbp)
   4506b:	e9 c2 fc ff ff       	jmp    44d32 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ec>
   45070:	49 89 cf             	mov    %rcx,%r15
            numbuf[0] = (*format ? *format : '%');
   45073:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
   45076:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
   4507a:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
        unsigned long num = 0;
   4507e:	41 ba 00 00 00 00    	mov    $0x0,%r10d
   45084:	e9 27 fc ff ff       	jmp    44cb0 <printer::vprintf(int, char const*, __va_list_tag*)+0x46a>
        int flags = 0;
   45089:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
   45090:	e9 40 f8 ff ff       	jmp    448d5 <printer::vprintf(int, char const*, __va_list_tag*)+0x8f>
    *--pos = '\0';
   45095:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
   45099:	f6 45 a0 20          	testb  $0x20,-0x60(%rbp)
   4509d:	0f 85 79 fe ff ff    	jne    44f1c <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
   450a3:	41 bb 0a 00 00 00    	mov    $0xa,%r11d
    const char* digits = upper_digits;
   450a9:	41 b9 90 65 04 00    	mov    $0x46590,%r9d
    if (flags & FLAG_THOUSANDS) {
   450af:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
        thousands_pos = nullptr;
   450b5:	bf 00 00 00 00       	mov    $0x0,%edi
   450ba:	e9 4c fb ff ff       	jmp    44c0b <printer::vprintf(int, char const*, __va_list_tag*)+0x3c5>
        switch (*format) {
   450bf:	8d 50 bd             	lea    -0x43(%rax),%edx
   450c2:	80 fa 35             	cmp    $0x35,%dl
   450c5:	77 ac                	ja     45073 <printer::vprintf(int, char const*, __va_list_tag*)+0x82d>
   450c7:	0f b6 d2             	movzbl %dl,%edx
   450ca:	3e ff 24 d5 c0 63 04 	notrack jmp *0x463c0(,%rdx,8)
   450d1:	00 

00000000000450d2 <console_clear()>:


// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear() {
   450d2:	f3 0f 1e fa          	endbr64 
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   450d6:	b8 00 00 00 00       	mov    $0x0,%eax
        console[i] = ' ' | 0x0700;
   450db:	48 63 d0             	movslq %eax,%rdx
   450de:	66 c7 84 12 00 80 0b 	movw   $0x720,0xb8000(%rdx,%rdx,1)
   450e5:	00 20 07 
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   450e8:	83 c0 01             	add    $0x1,%eax
   450eb:	3d d0 07 00 00       	cmp    $0x7d0,%eax
   450f0:	75 e9                	jne    450db <console_clear()+0x9>
    }
    cursorpos = 0;
   450f2:	c7 05 00 3f 07 00 00 	movl   $0x0,0x73f00(%rip)        # b8ffc <cursorpos>
   450f9:	00 00 00 
}
   450fc:	c3                   	ret    
   450fd:	90                   	nop

00000000000450fe <console_printer::console_printer(int, bool)>:
    void scroll();
    void move_cursor();
};

__noinline
console_printer::console_printer(int cpos, bool scroll)
   450fe:	f3 0f 1e fa          	endbr64 
    : cell_(console), scroll_(scroll) {
   45102:	48 c7 07 18 66 04 00 	movq   $0x46618,(%rdi)
   45109:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
   45110:	00 
   45111:	88 57 10             	mov    %dl,0x10(%rdi)
    if (cpos < 0) {
   45114:	85 f6                	test   %esi,%esi
   45116:	78 18                	js     45130 <console_printer::console_printer(int, bool)+0x32>
        cell_ += cursorpos;
    } else if (cpos <= CONSOLE_ROWS * CONSOLE_COLUMNS) {
   45118:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
   4511e:	7f 0f                	jg     4512f <console_printer::console_printer(int, bool)+0x31>
        cell_ += cpos;
   45120:	48 63 f6             	movslq %esi,%rsi
   45123:	48 8d 84 36 00 80 0b 	lea    0xb8000(%rsi,%rsi,1),%rax
   4512a:	00 
   4512b:	48 89 47 08          	mov    %rax,0x8(%rdi)
    }
}
   4512f:	c3                   	ret    
        cell_ += cursorpos;
   45130:	8b 05 c6 3e 07 00    	mov    0x73ec6(%rip),%eax        # b8ffc <cursorpos>
   45136:	48 98                	cltq   
   45138:	48 8d 84 00 00 80 0b 	lea    0xb8000(%rax,%rax,1),%rax
   4513f:	00 
   45140:	48 89 47 08          	mov    %rax,0x8(%rdi)
   45144:	c3                   	ret    
   45145:	90                   	nop

0000000000045146 <console_printer::scroll()>:

__noinline
void console_printer::scroll() {
   45146:	f3 0f 1e fa          	endbr64 
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
   4514a:	48 81 7f 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rdi)
   45151:	00 
   45152:	72 56                	jb     451aa <console_printer::scroll()+0x64>
    if (scroll_) {
   45154:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   45159:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
   4515d:	74 46                	je     451a5 <console_printer::scroll()+0x5f>
        int i = 0;
   4515f:	b8 00 00 00 00       	mov    $0x0,%eax
        while (i != (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS) {
            console[i] = console[i + CONSOLE_COLUMNS];
   45164:	8d 50 50             	lea    0x50(%rax),%edx
   45167:	b9 00 80 0b 00       	mov    $0xb8000,%ecx
   4516c:	48 63 d2             	movslq %edx,%rdx
   4516f:	0f b7 34 51          	movzwl (%rcx,%rdx,2),%esi
   45173:	48 63 d0             	movslq %eax,%rdx
   45176:	66 89 34 51          	mov    %si,(%rcx,%rdx,2)
            ++i;
   4517a:	83 c0 01             	add    $0x1,%eax
        while (i != (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS) {
   4517d:	3d 80 07 00 00       	cmp    $0x780,%eax
   45182:	75 e0                	jne    45164 <console_printer::scroll()+0x1e>
        }
        while (i != CONSOLE_ROWS * CONSOLE_COLUMNS) {
            console[i] = 0;
   45184:	48 63 d0             	movslq %eax,%rdx
   45187:	66 c7 84 12 00 80 0b 	movw   $0x0,0xb8000(%rdx,%rdx,1)
   4518e:	00 00 00 
            ++i;
   45191:	83 c0 01             	add    $0x1,%eax
        while (i != CONSOLE_ROWS * CONSOLE_COLUMNS) {
   45194:	3d d0 07 00 00       	cmp    $0x7d0,%eax
   45199:	75 e9                	jne    45184 <console_printer::scroll()+0x3e>
        }
        cell_ -= CONSOLE_COLUMNS;
   4519b:	48 8b 47 08          	mov    0x8(%rdi),%rax
   4519f:	48 2d a0 00 00 00    	sub    $0xa0,%rax
   451a5:	48 89 47 08          	mov    %rax,0x8(%rdi)
   451a9:	c3                   	ret    
void console_printer::scroll() {
   451aa:	55                   	push   %rbp
   451ab:	48 89 e5             	mov    %rsp,%rbp
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
   451ae:	b9 00 00 00 00       	mov    $0x0,%ecx
   451b3:	ba a8 65 04 00       	mov    $0x465a8,%edx
   451b8:	be 80 02 00 00       	mov    $0x280,%esi
   451bd:	bf 91 5e 04 00       	mov    $0x45e91,%edi
   451c2:	e8 2b db ff ff       	call   42cf2 <assert_fail(char const*, int, char const*, char const*)>
   451c7:	90                   	nop

00000000000451c8 <console_printer::putc(unsigned char, int)>:
    extern void console_show_cursor(int);
    console_show_cursor(cursorpos);
#endif
}

inline void console_printer::putc(unsigned char c, int color) {
   451c8:	f3 0f 1e fa          	endbr64 
   451cc:	55                   	push   %rbp
   451cd:	48 89 e5             	mov    %rsp,%rbp
   451d0:	41 55                	push   %r13
   451d2:	41 54                	push   %r12
   451d4:	53                   	push   %rbx
   451d5:	48 83 ec 08          	sub    $0x8,%rsp
   451d9:	48 89 fb             	mov    %rdi,%rbx
   451dc:	41 89 f5             	mov    %esi,%r13d
   451df:	41 89 d4             	mov    %edx,%r12d
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   451e2:	48 8b 47 08          	mov    0x8(%rdi),%rax
   451e6:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
   451ec:	72 14                	jb     45202 <console_printer::putc(unsigned char, int)+0x3a>
        scroll();
   451ee:	48 89 df             	mov    %rbx,%rdi
   451f1:	e8 50 ff ff ff       	call   45146 <console_printer::scroll()>
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   451f6:	48 8b 43 08          	mov    0x8(%rbx),%rax
   451fa:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
   45200:	73 ec                	jae    451ee <console_printer::putc(unsigned char, int)+0x26>
    }
    if (c == '\n') {
   45202:	41 80 fd 0a          	cmp    $0xa,%r13b
   45206:	74 1e                	je     45226 <console_printer::putc(unsigned char, int)+0x5e>
        while (pos != 80) {
            *cell_++ = ' ' | color;
            ++pos;
        }
    } else {
        *cell_++ = c | color;
   45208:	45 0f b6 ed          	movzbl %r13b,%r13d
   4520c:	45 09 e5             	or     %r12d,%r13d
   4520f:	48 8d 50 02          	lea    0x2(%rax),%rdx
   45213:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   45217:	66 44 89 28          	mov    %r13w,(%rax)
    }
}
   4521b:	48 83 c4 08          	add    $0x8,%rsp
   4521f:	5b                   	pop    %rbx
   45220:	41 5c                	pop    %r12
   45222:	41 5d                	pop    %r13
   45224:	5d                   	pop    %rbp
   45225:	c3                   	ret    
        int pos = (cell_ - console) % 80;
   45226:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   4522c:	48 89 c1             	mov    %rax,%rcx
   4522f:	48 89 c6             	mov    %rax,%rsi
   45232:	48 d1 fe             	sar    %rsi
   45235:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   4523c:	66 66 66 
   4523f:	48 89 f0             	mov    %rsi,%rax
   45242:	48 f7 ea             	imul   %rdx
   45245:	48 c1 fa 05          	sar    $0x5,%rdx
   45249:	48 89 c8             	mov    %rcx,%rax
   4524c:	48 c1 f8 3f          	sar    $0x3f,%rax
   45250:	48 29 c2             	sub    %rax,%rdx
   45253:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
   45257:	48 c1 e2 04          	shl    $0x4,%rdx
   4525b:	89 f0                	mov    %esi,%eax
   4525d:	29 d0                	sub    %edx,%eax
            *cell_++ = ' ' | color;
   4525f:	41 83 cc 20          	or     $0x20,%r12d
   45263:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   45267:	48 8d 4a 02          	lea    0x2(%rdx),%rcx
   4526b:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
   4526f:	66 44 89 22          	mov    %r12w,(%rdx)
            ++pos;
   45273:	83 c0 01             	add    $0x1,%eax
        while (pos != 80) {
   45276:	83 f8 50             	cmp    $0x50,%eax
   45279:	75 e8                	jne    45263 <console_printer::putc(unsigned char, int)+0x9b>
   4527b:	eb 9e                	jmp    4521b <console_printer::putc(unsigned char, int)+0x53>
   4527d:	90                   	nop

000000000004527e <console_printer::move_cursor()>:
void console_printer::move_cursor() {
   4527e:	f3 0f 1e fa          	endbr64 
   45282:	55                   	push   %rbp
   45283:	48 89 e5             	mov    %rsp,%rbp
    cursorpos = cell_ - console;
   45286:	48 8b 47 08          	mov    0x8(%rdi),%rax
   4528a:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   45290:	48 d1 f8             	sar    %rax
   45293:	89 05 63 3d 07 00    	mov    %eax,0x73d63(%rip)        # b8ffc <cursorpos>
    console_show_cursor(cursorpos);
   45299:	8b 3d 5d 3d 07 00    	mov    0x73d5d(%rip),%edi        # b8ffc <cursorpos>
   4529f:	e8 6c d3 ff ff       	call   42610 <console_show_cursor(int)>
}
   452a4:	5d                   	pop    %rbp
   452a5:	c3                   	ret    

00000000000452a6 <console_vprintf(int, int, char const*, __va_list_tag*)>:

// console_vprintf, console_printf
//    Print a message onto the console, starting at the given cursor position.

__noinline
int console_vprintf(int cpos, int color, const char* format, va_list val) {
   452a6:	f3 0f 1e fa          	endbr64 
   452aa:	55                   	push   %rbp
   452ab:	48 89 e5             	mov    %rsp,%rbp
   452ae:	41 56                	push   %r14
   452b0:	41 55                	push   %r13
   452b2:	41 54                	push   %r12
   452b4:	53                   	push   %rbx
   452b5:	48 83 ec 20          	sub    $0x20,%rsp
   452b9:	89 fb                	mov    %edi,%ebx
   452bb:	41 89 f4             	mov    %esi,%r12d
   452be:	49 89 d5             	mov    %rdx,%r13
   452c1:	49 89 ce             	mov    %rcx,%r14
    console_printer cp(cpos, cpos < 0);
   452c4:	89 fa                	mov    %edi,%edx
   452c6:	c1 ea 1f             	shr    $0x1f,%edx
   452c9:	89 fe                	mov    %edi,%esi
   452cb:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   452cf:	e8 2a fe ff ff       	call   450fe <console_printer::console_printer(int, bool)>
    cp.vprintf(color, format, val);
   452d4:	4c 89 f1             	mov    %r14,%rcx
   452d7:	4c 89 ea             	mov    %r13,%rdx
   452da:	44 89 e6             	mov    %r12d,%esi
   452dd:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   452e1:	e8 60 f5 ff ff       	call   44846 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (cpos < 0) {
   452e6:	85 db                	test   %ebx,%ebx
   452e8:	78 1a                	js     45304 <console_vprintf(int, int, char const*, __va_list_tag*)+0x5e>
        cp.move_cursor();
    }
    return cp.cell_ - console;
   452ea:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   452ee:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   452f4:	48 d1 f8             	sar    %rax
}
   452f7:	48 83 c4 20          	add    $0x20,%rsp
   452fb:	5b                   	pop    %rbx
   452fc:	41 5c                	pop    %r12
   452fe:	41 5d                	pop    %r13
   45300:	41 5e                	pop    %r14
   45302:	5d                   	pop    %rbp
   45303:	c3                   	ret    
        cp.move_cursor();
   45304:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   45308:	e8 71 ff ff ff       	call   4527e <console_printer::move_cursor()>
   4530d:	eb db                	jmp    452ea <console_vprintf(int, int, char const*, __va_list_tag*)+0x44>

000000000004530f <console_printf(int, int, char const*, ...)>:

__noinline
int console_printf(int cpos, int color, const char* format, ...) {
   4530f:	f3 0f 1e fa          	endbr64 
   45313:	55                   	push   %rbp
   45314:	48 89 e5             	mov    %rsp,%rbp
   45317:	48 83 ec 50          	sub    $0x50,%rsp
   4531b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4531f:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   45323:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   45327:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   4532e:	48 8d 45 10          	lea    0x10(%rbp),%rax
   45332:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   45336:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4533a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   4533e:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   45342:	e8 5f ff ff ff       	call   452a6 <console_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
    return cpos;
}
   45347:	c9                   	leave  
   45348:	c3                   	ret    

0000000000045349 <error_printf(int, int, char const*, ...)>:


// k-hardware.cc/u-lib.cc supply error_vprintf

__noinline
int error_printf(int cpos, int color, const char* format, ...) {
   45349:	f3 0f 1e fa          	endbr64 
   4534d:	55                   	push   %rbp
   4534e:	48 89 e5             	mov    %rsp,%rbp
   45351:	48 83 ec 50          	sub    $0x50,%rsp
   45355:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   45359:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   4535d:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   45361:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   45368:	48 8d 45 10          	lea    0x10(%rbp),%rax
   4536c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   45370:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   45374:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   45378:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   4537c:	e8 31 d8 ff ff       	call   42bb2 <error_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
    return cpos;
}
   45381:	c9                   	leave  
   45382:	c3                   	ret    

0000000000045383 <error_printf(char const*, ...)>:
    error_vprintf(-1, color, format, val);
    va_end(val);
}

__noinline
void error_printf(const char* format, ...) {
   45383:	f3 0f 1e fa          	endbr64 
   45387:	55                   	push   %rbp
   45388:	48 89 e5             	mov    %rsp,%rbp
   4538b:	48 83 ec 50          	sub    $0x50,%rsp
   4538f:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   45393:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   45397:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4539b:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   4539f:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   453a3:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   453aa:	48 8d 45 10          	lea    0x10(%rbp),%rax
   453ae:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   453b2:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   453b6:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    error_vprintf(-1, COLOR_ERROR, format, val);
   453ba:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   453be:	48 89 fa             	mov    %rdi,%rdx
   453c1:	be 00 c0 00 00       	mov    $0xc000,%esi
   453c6:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   453cb:	e8 e2 d7 ff ff       	call   42bb2 <error_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
}
   453d0:	c9                   	leave  
   453d1:	c3                   	ret    
