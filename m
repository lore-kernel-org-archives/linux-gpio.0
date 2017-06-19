From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: bcm2835_pinctrl_probe: WARNING: CPU: 0 PID: 1 at
 kernel/irq/chip.c:850
Date: Mon, 19 Jun 2017 22:59:02 +0200 (CEST)
Message-ID: <2049796110.190734.1497905942101@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:54174 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752084AbdFSU7i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2017 16:59:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org

Hi,

i'm currently working Raspberry Pi Zero W support and had problems to boot with Mini UART (no sign of life after startup). After switching to pl011 with EARLY_PRINTK, the Zero W boots and i get the following output:

Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] random: start_kernel+0x30/0x3e4 get_random_bytes called with crng_init=0
[    0.000000] Linux version 4.12.0-rc5-next-20170616+ (stefan@Latitude-E4310) (gcc version 4.8.3 20140303 (prerelease) (crosstool-NG linaro-1.13.1+bzr2650 - Linaro GCC 2014.03) ) #3 Mon Jun 19 20:01:18 CEST 2017
[    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv7), cr=00c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
[    0.000000] OF: fdt: Machine model: Raspberry Pi Zero W Rev 1.1
[    0.000000] Memory policy: Data cache writeback
[    0.000000] cma: Reserved 16 MiB at 0x1ac00000
[    0.000000] CPU: All CPU(s) started in SVC mode.
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 113792
[    0.000000] Kernel command line: 8250.nr_uarts=1 bcm2708_fb.fbwidth=656 bcm2708_fb.fbheight=512 bcm2708_fb.fbswap=1 dma.dmachans=0x7f35 bcm2708.boardrev=0x9000c1 bcm2708.serial=0xc72f44da bcm2708.uart_clock=48000000 bcm2708.disk_led_gpio=47 smsc95xx.macaddr=B8:27:EB:2F:44:DA vc_mem.mem_base=0x1ec00000 vc_mem.mem_size=0x20000000  dwc_otg.lpm_enable=0 console=ttyAMA0,115200 console=tty1 root=PARTUUID=da67f4dc-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait
[    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
[    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
[    0.000000] Memory: 425708K/458752K available (7168K kernel code, 533K rwdata, 2176K rodata, 1024K init, 688K bss, 16660K reserved, 16384K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0xdc800000 - 0xff800000   ( 560 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xdc000000   ( 448 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0800000   (8160 kB)
[    0.000000]       .init : 0xc0b00000 - 0xc0c00000   (1024 kB)
[    0.000000]       .data : 0xc0c00000 - 0xc0c85510   ( 534 kB)
[    0.000000]        .bss : 0xc0c8c640 - 0xc0d387d0   ( 689 kB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] ftrace: allocating 25477 entries in 75 pages
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000030] sched_clock: 32 bits at 1000kHz, resolution 1000ns, wraps every 2147483647500ns
[    0.000072] clocksource: timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275 ns
[    0.000153] bcm2835: system timer (irq = 27)
[    0.000525] Console: colour dummy device 80x30
[    0.001477] console [tty1] enabled
[    0.001537] Calibrating delay loop... 697.95 BogoMIPS (lpj=3489792)
[    0.060344] pid_max: default: 32768 minimum: 301
[    0.060730] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.060800] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.061835] CPU: Testing write buffer coherency: ok
[    0.062023] random: copy_process.part.4+0x1a0/0x14d0 get_random_u32 called with crng_init=0
[    0.063062] Setting up static identity map for 0x100000 - 0x100054
[    0.067433] devtmpfs: initialized
[    0.075293] VFP support v0.3: implementor 41 architecture 1 part 20 variant b rev 5
[    0.075804] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.075910] futex hash table entries: 256 (order: -1, 3072 bytes)
[    0.078351] pinctrl core: initialized pinctrl subsystem
[    0.078983] random: bucket_table_alloc+0x15c/0x1a4 get_random_u32 called with crng_init=0
[    0.079190] NET: Registered protocol family 16
[    0.080309] random: copy_process.part.4+0x1a0/0x14d0 get_random_u32 called with crng_init=0
[    0.081779] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.087556] No ATAGs?
[    0.087592] hw-breakpoint: found 6 breakpoint and 1 watchpoint registers.
[    0.087705] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.088020] Serial: AMBA PL011 UART driver
[    0.090322] uart-pl011 20201000.uart: could not find pctldev for node /soc/gpio@7e200000/uart0_pins, deferring probe
[    0.108882] SCSI subsystem initialized
[    0.109407] usbcore: registered new interface driver usbfs
[    0.109592] usbcore: registered new interface driver hub
[    0.109799] usbcore: registered new device driver usb
[    0.110391] Advanced Linux Sound Architecture Driver Initialized.
[    0.113377] clocksource: Switched to clocksource timer
[    0.216836] NET: Registered protocol family 2
[    0.217033] random: neigh_hash_alloc+0x98/0xc0 get_random_u32 called with crng_init=0
[    0.218089] random: rt_genid_init+0x28/0x34 get_random_u32 called with crng_init=0
[    0.218217] TCP established hash table entries: 4096 (order: 2, 16384 bytes)
[    0.218344] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
[    0.218477] TCP: Hash tables configured (established 4096 bind 4096)
[    0.218673] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.218750] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.219036] NET: Registered protocol family 1
[    0.219266] random: copy_process.part.4+0x1a0/0x14d0 get_random_u32 called with crng_init=0
[    0.219854] RPC: Registered named UNIX socket transport module.
[    0.219928] RPC: Registered udp transport module.
[    0.219970] RPC: Registered tcp transport module.
[    0.220009] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.222253] hw perfevents: no irqs for PMU, sampling events not supported
[    0.222390] hw perfevents: enabled with armv6_1176 PMU driver, 3 counters available
[    0.224866] workingset: timestamp_bits=30 max_order=17 bucket_order=0
[    0.241897] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[    0.249379] jitterentropy: Initialization failed with host not compliant with requirements: 2
[    0.249902] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    0.249997] io scheduler noop registered
[    0.250041] io scheduler deadline registered (default)
[    0.250143] io scheduler cfq registered
[    0.250193] io scheduler mq-deadline registered
[    0.250234] io scheduler kyber registered
[    0.255621] ------------[ cut here ]------------
[    0.255742] WARNING: CPU: 0 PID: 1 at kernel/irq/chip.c:850 __irq_do_set_handler+0x4c/0x14c
[    0.255811] Modules linked in:
[    0.255862] CPU: 0 PID: 1 Comm: swapper Not tainted 4.12.0-rc5-next-20170616+ #3
[    0.255924] Hardware name: Generic DT based system
[    0.256009] [<c010f64c>] (unwind_backtrace) from [<c010c604>] (show_stack+0x20/0x24)
[    0.256109] [<c010c604>] (show_stack) from [<c037bb88>] (dump_stack+0x20/0x28)
[    0.256204] [<c037bb88>] (dump_stack) from [<c011e76c>] (__warn+0xe4/0x110)
[    0.256270] [<c011e76c>] (__warn) from [<c011e868>] (warn_slowpath_null+0x30/0x38)
[    0.256355] [<c011e868>] (warn_slowpath_null) from [<c01590f0>] (__irq_do_set_handler+0x4c/0x14c)
[    0.256444] [<c01590f0>] (__irq_do_set_handler) from [<c01592dc>] (irq_set_chained_handler_and_data+0x4c/0x64)
[    0.256548] [<c01592dc>] (irq_set_chained_handler_and_data) from [<c03ae534>] (gpiochip_set_chained_irqchip+0x80/0xa0)
[    0.256641] [<c03ae534>] (gpiochip_set_chained_irqchip) from [<c03aa9e8>] (bcm2835_pinctrl_probe+0x31c/0x3c8)
[    0.256746] [<c03aa9e8>] (bcm2835_pinctrl_probe) from [<c044f03c>] (platform_drv_probe+0x60/0xac)
[    0.256840] [<c044f03c>] (platform_drv_probe) from [<c044d434>] (driver_probe_device+0x1d8/0x438)
[    0.256929] [<c044d434>] (driver_probe_device) from [<c044d730>] (__driver_attach+0x9c/0x100)
[    0.257014] [<c044d730>] (__driver_attach) from [<c044b6e4>] (bus_for_each_dev+0x84/0x98)
[    0.257098] [<c044b6e4>] (bus_for_each_dev) from [<c044cd7c>] (driver_attach+0x28/0x30)
[    0.257181] [<c044cd7c>] (driver_attach) from [<c044c7dc>] (bus_add_drcm2835_pinctrl_driver_init+0x20/0x28)
[    0.257535] [<c0b2c9b0>] (bcm2835_pinctrl_driver_init) from [<c0101ac0>] (do_one_initcall+0xc0/0x188)
[    0.257635] [<c0101ac0>] (do_one_initcall) from [<c0b00f64>] (kernel_init_freeable+0x170/0x234)
[    0.257728] [<c0b00f64>] (kernel_init_freeable) from [<c07366b4>] (kernel_init+0x18/0x11c)
[    0.257822] [<c07366b4>] (kernel_init) from [<c0107f38>] (ret_from_fork+0x14/0x3c)
[    0.257904] random: init_oops_id+0x30/0x4c get_random_bytes called with crng_init=0
[    0.257980] ---[ end trace 9c0064da26f1596a ]---
[    0.261962] Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled
[    0.265460] libphy: Fixed MDIO Bus: probed
...

According to the source code, this is the relevant line:

if (WARN_ON(!irq_data || irq_data->chip == &no_irq_chip))
	return;

Regards
Stefan
