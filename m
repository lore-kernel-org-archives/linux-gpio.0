From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Gpio exporting oopses sometimes
Date: Wed, 11 Nov 2015 11:28:18 +0100
Message-ID: <87egfwakzh.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:17716 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752100AbbKKKfT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2015 05:35:19 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

Hi Linux and Alexandre,

>From time to time (probability of 5% around), the following script triggers an
Oops on my platform on v4.3 kernel. Is this something you have already seen ?
	ssh mio "echo 504 > /sys/class/gpio/export"
	ssh mio "echo out > /sys/class/gpio/gpio504/direction"
	ssh mio "echo 1 > /sys/class/gpio/gpio504/value"

The faulting line is :
rj@belgarion:~/mio_linux/kernel$ arm-linux-gnueabi-addr2line -i -e vmlinux 0xc0232ff4
/home/rj/mio_linux/kernel/drivers/gpio/gpiolib-sysfs.c:608 (discriminator 1)

Which in my kernel translates to :
	if (chip->names && chip->names[offset])

The Oops:
[   55.608907] Unable to handle kernel paging request at virtual address 03020120
[   55.616932] pgd = c30ec000
[   55.620567] [03020120] *pgd=00000000
[   55.624468] Internal error: Oops: f5 [#1] PREEMPT ARM
[   55.628020] Modules linked in:
[   55.631339] CPU: 0 PID: 978 Comm: sh Tainted: G        W       4.3.0+ #1245
[   55.637844] Hardware name: MIO A701
[   55.641094] task: c33247e0 ti: c30de000 task.ti: c30de000
[   55.644417] PC is at gpiod_export+0x264/0x3b8
[   55.647683] LR is at gpiod_export+0x210/0x3b8
[   55.650899] pc : [<c0232ff4>]    lr : [<c0232fa0>]    psr: 20000013
[   55.650899] sp : c30dfe20  ip : c30dfe20  fp : c30dfe54
[   55.660400] r10: 00000051  r9 : c30dff80  r8 : c3b98910
[   55.663591] r7 : 00000001  r6 : c32f96e0  r5 : 00000000  r4 : c3b9e980
[   55.669847] r3 : 00000018  r2 : 00000008  r1 : 03020100  r0 : c32f96e4
[   55.676130] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[   55.682444] Control: 0000397f  Table: a30ec000  DAC: 00000051
[   55.688845] Process sh (pid: 978, stack limit = 0xc30de198)
[   55.695262] Stack: (0xc30dfe20 to 0xc30e0000)
[   55.698520] fe20: c30dfe54 c30dfe30 c023124c c022e7a4 00000004 00000000 c3b9e980 b6fce000
[   55.704974] fe40: c33ea60c c30dff80 c30dfe7c c30dfe58 c02331d0 c0232d9c 000000d0 000001f8
[   55.711444] fe60: c30dfea4 c32f91a0 00000004 c32f91a0 c30dfe8c c30dfe80 c028b4d0 c0233154
[   55.717922] fe80: c30dfea4 c30dfe90 c014dba4 c028b4b4 c014db58 c33ea600 c30dfedc c30dfea8
[   55.724400] fea0: c014d4d8 c014db64 00000000 00000000 c30dfefc c33e39a0 c30dff80 b6fce000
[   55.730886] fec0: c30dff80 c000a728 c30de000 00020000 c30dff4c c30dfee0 c00e501c c014d3a0
[   55.737386] fee0: c30dff80 c000a728 c30dff0c c30dfef8 c0040700 c0099df8 00000000 00000001
[   55.743895] ff00: c30dff24 c30dff10 c004c5b0 c00406d0 c30c9d6c 00000004 c30dff3c c30dff28
[   55.750414] ff20: c004c6a8 c004c570 c33e39a0 c33e39a0 00000004 b6fce000 c30dff80 c000a728
[   55.756944] ff40: c30dff7c c30dff50 c00e5650 c00e4ff4 00000003 c0103a38 c30dff7c c33e39a0
[   55.763477] ff60: c33e39a0 00000004 b6fce000 c000a728 c30dffa4 c30dff80 c00e5eb8 c00e55ac
[   55.770026] ff80: 00000000 00000000 b6ed4658 00000004 b6fce000 00000004 00000000 c30dffa8
[   55.776617] ffa0: c000a560 c00e5e70 b6ed4658 00000004 00000001 b6fce000 00000004 00000000
[   55.783225] ffc0: b6ed4658 00000004 b6fce000 00000004 00000004 000ad16c ffffffff 00000000
[   55.789863] ffe0: 00000004 bec9e5e8 b6e270a8 b6e6c1cc 60000010 00000001 00000000 00000000
[   55.796633] (gpiod_export) from export_store (/drivers/gpio/gpiolib-sysfs.c:475)
[   55.803423] (export_store) from class_attr_store (/drivers/base/class.c:46)
[   55.810275] (class_attr_store) from sysfs_kf_write (/fs/sysfs/file.c:131)
[   55.817176] (sysfs_kf_write) from kernfs_fop_write (/fs/kernfs/file.c:316)
[   55.824143] (kernfs_fop_write) from __vfs_write (/fs/read_write.c:489)
[   55.831115] (__vfs_write) from vfs_write (/include/linux/fs.h:1215 /include/linux/fsnotify.h:215 /fs/read_write.c:540)
[   55.838107] (vfs_write) from SyS_write (/fs/read_write.c:586 /fs/read_write.c:577)
[   55.845096] (SyS_write) from ret_fast_syscall (/arch/arm/kernel/entry-common.S:62)
[ 55.852074] Code: e0822402 e0822802 e0832082 0a00003c (e7913102)
All code
========
   0:	e0822402 	add	r2, r2, r2, lsl #8
   4:	e0822802 	add	r2, r2, r2, lsl #16
   8:	e0832082 	add	r2, r3, r2, lsl #1
   c:	0a00003c 	beq	0x104
  10:*	e7913102 	ldr	r3, [r1, r2, lsl #2]		<-- trapping instruction

Code starting with the faulting instruction
===========================================
   0:	e7913102 	ldr	r3, [r1, r2, lsl #2]
[   55.859591] ---[ end trace 8ef5b92cfa7b4ed3 ]---
[   77.502907] random: nonblocking pool is initialized

Cheers.

-- 
Robert
