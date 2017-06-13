From: Donglin Peng <dolinux.peng@gmail.com>
Subject: A bug in pinctrl-s3c24xx.c
Date: Tue, 13 Jun 2017 21:34:23 +0800
Message-ID: <CAErzpmud4WwfDMfLp7V75ParmpseiA9urR4TCukf=xLyy48XcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f181.google.com ([209.85.161.181]:34245 "EHLO
        mail-yw0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752326AbdFMNeo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2017 09:34:44 -0400
Received: by mail-yw0-f181.google.com with SMTP id e142so41103400ywa.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2017 06:34:44 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: cw00.choi@samsung.com
Cc: linux-gpio@vger.kernel.org

Hi Chanwoo Choi,

The following commit introduced a bug for s3c2440 platform:

commit 8b1bd11c1f8f529057369c5b3702d13fd24e2765

For S3C2440 chip, GPF4-7 share EINT4-7, and GPG0-15 share EINT8-23.
When the interrupt EINT4-7 or EINT8-23
is triggered, kernel will panic in function s3c24xx_demux_eint:

    pend = readl(bank->eint_base + EINTPEND_REG);

I find that bank->eint_base is 0.
The bank variable here is actually initialized as &intc->irqs[intc_hw]
in the function s3c24xx_irq_map_of other than ddata->bank
in the function s3c24xx_gpf_irq_map.

Kernel panic log:

[   51.221098] CPU: 0 PID: 0 Comm: swapper Not tainted 4.10.17+ #4
[   51.226949] Hardware name: TQ2440 (Flattened Device Tree)
[   51.232310] task: c067b3d8 task.stack: c0676000
[   51.236900] PC is at s3c24xx_demux_eint4_7+0x24/0x120
[   51.241818] LR is at s3c24xx_demux_eint4_7+0x11c/0x120
[   51.246916] pc : [<c0250f64>]    lr : [<c025105c>]    psr: a0000093
[   51.246916] sp : c0677f00  ip : 23e0dcc0  fp : 00000000
[   51.258314] r10: 00000000  r9 : c0676000  r8 : c0691000
[   51.197965] r7 : c06856c8  r6 : c06856d8  r5 : c34609d0  r4 : c3408460
[   51.204443] r3 : f6000010  r2 : 00000000  r1 : f6000000  r0 : 00000001
[   51.210930] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
Segment none
[   51.218095] Control: c000717f  Table: 32dc4000  DAC: 00000051
[   51.223797] Process swapper (pid: 0, stack limit = 0xc0676190)
[   51.229587] Stack: (0xc0677f00 to 0xc0678000)
[   51.233926] 7f00: c06856c8 c0690d28 00000000 00000001 c3402000
c004469c c06e8978 c0677f40
[   51.242041] 7f20: ffffffff c0677f74 c0679070 c0009444 c000b4d4
c000b4e0 60000013 c000e5fc
[   51.250162] 7f40: 00000001 00e2a574 00e2a570 60000013 00000000
c0676018 c0679068 c069ffb0
[   51.258283] 7f60: c0679070 c068a448 00000000 00000000 00000000
c0677f90 c000b4d4 c000b4e0
[   51.200869] 7f80: 60000013 ffffffff 00000053 00000000 00000000
c003d554 c06b2ad0 c06b2a80
[   51.208991] 7fa0: ffffffff c0679000 c0668a28 c3ffcc20 00000001
c003d840 00000000 c0643be0
[   51.217113] 7fc0: ffffffff ffffffff 00000000 c064367c 00000000
c0668a28 c06b2c14 c0679018
[   51.225235] 7fe0: c0668a24 c067c1e0 30004000 41129200 306670c0
30008048 00000000 00000000
[   51.233511] [<c0250f64>] (s3c24xx_demux_eint4_7) from [<c004469c>]
(__handle_domain_irq+0x6c/0xcc)
[   51.242290] [<c004469c>] (__handle_domain_irq) from [<c0009444>]
(s3c24xx_handle_irq+0x6c/0x12c)
[   51.251016] [<c0009444>] (s3c24xx_handle_irq) from [<c000e5fc>]
(__irq_svc+0x5c/0x78)
[   51.258744] Exception stack(0xc0677f40 to 0xc0677f88)
[   51.198232] 7f40: 00000001 00e2a574 00e2a570 60000013 00000000
c0676018 c0679068 c069ffb0
[   51.206353] 7f60: c0679070 c068a448 00000000 00000000 00000000
c0677f90 c000b4d4 c000b4e0
[   51.214461] 7f80: 60000013 ffffffff
[   51.217952] [<c000e5fc>] (__irq_svc) from [<c000b4e0>]
(arch_cpu_idle+0x28/0x38)
[   51.225280] [<c000b4e0>] (arch_cpu_idle) from [<c003d554>]
(do_idle+0xf8/0x180)
[   51.232536] [<c003d554>] (do_idle) from [<c003d840>]
(cpu_startup_entry+0xc/0x10)
[   51.240038] [<c003d840>] (cpu_startup_entry) from [<c0643be0>]
(start_kernel+0x318/0x38c)
[   51.248120] Code: e3530000 e5904028 0a00002d e5942010 (e59230a8)
[   51.254206] ---[ end trace 289ad59d79fbf13a ]---
[   51.258709] Kernel panic - not syncing: Fatal exception in interrupt
[   51.199485] ---[ end Kernel panic - not syncing: Fatal exception in interrupt


Thanks
