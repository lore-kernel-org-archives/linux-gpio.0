From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: gpio: mvebu: switch to regmap for register access
Date: Fri, 9 Jun 2017 03:36:57 +0000
Message-ID: <0fb1464cf9eb44deaf7397ef8b0477ff@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:57286 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751483AbdFIDhH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2017 23:37:07 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 04DE783660
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2017 15:37:04 +1200 (NZST)
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Gregory Clement <gregory.clement@free-electrons.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>

Hi Thomas,=0A=
=0A=
Doing some more testing against linux-next and I've found that this =0A=
patch causes a flood of bad interrupts on my armada-xp-98dx3236 based =0A=
board (kernel startup output below). If I revert this patch I can boot =0A=
as normal.=0A=
=0A=
This doesn't happen on the 98dx3236 DB or another Armada-385 based board =
=0A=
I have so it's probably related something specific to this board =0A=
(probably one of the i2c gpios based on the log messages).=0A=
=0A=
Any thoughts on where I should start looking?=0A=
=0A=
Booting Linux on physical CPU 0x0=0A=
Linux version 4.12.0-rc4-next-20170606-at1+ (chrisp@chrisp-dl) (gcc =0A=
version 4.9.3 (crosstool-NG crosstool-ng-1.22.0) ) #98 SMP PREEMP=0A=
T Fri Jun 9 03:18:42 UTC 2017=0A=
CPU: ARMv7 Processor [562f5842] revision 2 (ARMv7), cr=3D10c5387d=0A=
CPU: div instructions available: patching division code=0A=
CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache=0A=
OF: fdt: Machine model: x220/52=0A=
Memory policy: Data cache writealloc=0A=
On node 0 totalpages: 131072=0A=
free_area_init_node: node 0, pgdat 8092b100, node_mem_map 9fbfa000=0A=
   Normal zone: 1024 pages used for memmap=0A=
   Normal zone: 0 pages reserved=0A=
   Normal zone: 131072 pages, LIFO batch:31=0A=
percpu: Embedded 15 pages/cpu @9fbde000 s31040 r8192 d22208 u61440=0A=
pcpu-alloc: s31040 r8192 d22208 u61440 alloc=3D15*4096=0A=
pcpu-alloc: [0] 0=0A=
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 130048=
=0A=
Kernel command line: console=3DttyS0,115200 root=3D/dev/ram0 =0A=
releasefile=3Dlinuxbox_armv7-tb233.rel bootversion=3D6.2.4-devel loglevel=
=3D8 mtdo=0A=
ops.mtddev=3Derrlog mvebu_edac.edac_op_state=3D0 reladdr=3D0x1000000,df49d3=
=0A=
PID hash table entries: 2048 (order: 1, 8192 bytes)=0A=
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)=0A=
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)=0A=
Memory: 499368K/524288K available (5120K kernel code, 174K rwdata, 1380K =
=0A=
rodata, 1024K init, 122K bss, 24920K reserved, 0K cma-reserv=0A=
ed)=0A=
Virtual kernel memory layout:=0A=
     vector  : 0xffff0000 - 0xffff1000   (   4 kB)=0A=
     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)=0A=
     vmalloc : 0xa0800000 - 0xff800000   (1520 MB)=0A=
     lowmem  : 0x80000000 - 0xa0000000   ( 512 MB)=0A=
     modules : 0x7f000000 - 0x80000000   (  16 MB)=0A=
       .text : 0x80008000 - 0x80600000   (6112 kB)=0A=
       .init : 0x80800000 - 0x80900000   (1024 kB)=0A=
       .data : 0x80900000 - 0x8092b800   ( 174 kB)=0A=
        .bss : 0x809308e8 - 0x8094f480   ( 123 kB)=0A=
SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1=0A=
Preemptible hierarchical RCU implementation.=0A=
         RCU restricting CPUs from NR_CPUS=3D4 to nr_cpu_ids=3D1.=0A=
         Tasks RCU enabled.=0A=
RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D1=0A=
NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16=0A=
L2C: DT/platform modifies aux control register: 0x1a08e700 -> 0x1a08e702=0A=
Aurora cache controller enabled, 8 ways, 512 kB=0A=
Aurora: CACHE_ID 0x00000100, AUX_CTRL 0x1a08e702=0A=
Switching to timer-based delay loop, resolution 40ns=0A=
sched_clock: 32 bits at 25MHz, resolution 40ns, wraps every 85899345900ns=
=0A=
clocksource: armada_370_xp_clocksource: mask: 0xffffffff max_cycles: =0A=
0xffffffff, max_idle_ns: 76450417870 ns=0A=
Calibrating delay loop (skipped), value calculated using timer =0A=
frequency.. 50.00 BogoMIPS (lpj=3D250000)=0A=
pid_max: default: 32768 minimum: 301=0A=
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)=0A=
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)=0A=
CPU: Testing write buffer coherency: ok=0A=
CPU0: thread -1, cpu 0, socket 0, mpidr 80000000=0A=
Setting up static identity map for 0x100000 - 0x100060=0A=
mvebu-soc-id: MVEBU SoC ID=3D0xF410, Rev=3D0x4=0A=
mvebu-pmsu: Initializing Power Management Service Unit=0A=
Hierarchical SRCU implementation.=0A=
smp: Bringing up secondary CPUs ...=0A=
smp: Brought up 1 node, 1 CPU=0A=
SMP: Total of 1 processors activated (50.00 BogoMIPS).=0A=
CPU: All CPU(s) started in SVC mode.=0A=
devtmpfs: initialized=0A=
VFP support v0.3: implementor 56 architecture 2 part 20 variant 9 rev 6=0A=
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, =0A=
max_idle_ns: 19112604462750000 ns=0A=
futex hash table entries: 256 (order: 2, 16384 bytes)=0A=
pinctrl core: initialized pinctrl subsystem=0A=
NET: Registered protocol family 16=0A=
DMA: preallocated 256 KiB pool for atomic coherent allocations=0A=
SCSI subsystem initialized=0A=
usbcore: registered new interface driver usbfs=0A=
usbcore: registered new interface driver hub=0A=
usbcore: registered new device driver usb=0A=
clocksource: Switched to clocksource armada_370_xp_clocksource=0A=
NET: Registered protocol family 2=0A=
TCP established hash table entries: 4096 (order: 2, 16384 bytes)=0A=
TCP bind hash table entries: 4096 (order: 3, 32768 bytes)=0A=
TCP: Hash tables configured (established 4096 bind 4096)=0A=
UDP hash table entries: 256 (order: 1, 8192 bytes)=0A=
UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)=0A=
NET: Registered protocol family 1=0A=
PCI: CLS 0 bytes, default 64=0A=
Trying to unpack rootfs image as initramfs...=0A=
rootfs image is not initramfs (junk in compressed archive); looks like =0A=
an initrd=0A=
Freeing initrd memory: 11756K=0A=
workingset: timestamp_bits=3D30 max_order=3D17 bucket_order=3D0=0A=
squashfs: version 4.0 (2009/01/31) Phillip Lougher=0A=
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)=0A=
io scheduler noop registered=0A=
io scheduler deadline registered=0A=
io scheduler cfq registered (default)=0A=
io scheduler mq-deadline registered=0A=
io scheduler kyber registered=0A=
armada-xp-pinctrl f1018000.pin-ctrl: registered pinctrl driver=0A=
GPIO line 31 (bb-override) hogged as output/low=0A=
mvebu-pcie soc:pcie-controller@82000000: PCI host bridge to bus 0000:00=0A=
pci_bus 0000:00: root bus resource [io  0x1000-0xfffff]=0A=
pci_bus 0000:00: root bus resource [mem 0xf8000000-0xffdfffff]=0A=
pci_bus 0000:00: root bus resource [bus 00-ff]=0A=
pci 0000:00:01.0: [11ab:f410] type 01 class 0x060400=0A=
PCI: bus0: Fast back to back transfers disabled=0A=
pci 0000:00:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring=
=0A=
pci 0000:01:00.0: [11ab:f410] type 00 class 0x020000=0A=
pci 0000:01:00.0: reg 0x10: [mem 0xe8000000-0xe80fffff 64bit pref]=0A=
pci 0000:01:00.0: reg 0x18: can't handle BAR above 4GB (bus address =0A=
0xfffffffffc000000)=0A=
pci 0000:01:00.0: reg 0x18: [mem size 0x04000000 64bit pref]=0A=
pci 0000:01:00.0: reg 0x20: [mem 0xe8800000-0xe8ffffff 64bit pref]=0A=
pci 0000:01:00.0: supports D1 D2=0A=
PCI: bus1: Fast back to back transfers disabled=0A=
pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01=0A=
pci 0000:00:01.0: BAR 8: assigned [mem 0xf8000000-0xfdffffff]=0A=
pci 0000:01:00.0: BAR 2: assigned [mem 0xf8000000-0xfbffffff 64bit pref]=0A=
pci 0000:01:00.0: BAR 4: assigned [mem 0xfc000000-0xfc7fffff 64bit pref]=0A=
pci 0000:01:00.0: BAR 0: assigned [mem 0xfc800000-0xfc8fffff 64bit pref]=0A=
pci 0000:00:01.0: PCI bridge to [bus 01]=0A=
pci 0000:00:01.0:   bridge window [mem 0xf8000000-0xfdffffff]=0A=
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled=0A=
console [ttyS0] disabled=0A=
f1012000.serial: ttyS0 at MMIO 0xf1012000 (irq =3D 19, base_baud =3D =0A=
12500000) is a 16550A=0A=
console [ttyS0] enabled=0A=
f1012100.serial: ttyS1 at MMIO 0xf1012100 (irq =3D 20, base_baud =3D =0A=
12500000) is a 16550A=0A=
brd: module loaded=0A=
loop: module loaded=0A=
pxa3xx-nand f10d0000.nand: This platform can't do DMA on this device=0A=
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xf1=0A=
nand: Micron MT29F1G08ABAEAWP=0A=
nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64=0A=
pxa3xx-nand f10d0000.nand: ECC strength 16, ECC step size 2048=0A=
Bad block table found at page 65472, version 0x01=0A=
Bad block table found at page 65408, version 0x01=0A=
3 ofpart partitions found on MTD device pxa3xx_nand-0=0A=
Creating 3 MTD partitions on "pxa3xx_nand-0":=0A=
0x000000000000-0x000007000000 : "user"=0A=
0x000007000000-0x000007800000 : "errlog"=0A=
random: fast init done=0A=
mtdoops: ready 0, 1 (no erase)=0A=
mtdoops: Attached to MTD device 1=0A=
0x000007800000-0x000008000000 : "nand-bbt"=0A=
m25p80 spi0.0: m25p128 (16384 Kbytes)=0A=
4 ofpart partitions found on MTD device spi0.0=0A=
Creating 4 MTD partitions on "spi0.0":=0A=
0x000000000000-0x000000100000 : "u-boot"=0A=
0x000000100000-0x000000140000 : "u-boot-env"=0A=
0x000000140000-0x000000fc0000 : "unused"=0A=
0x000000fc0000-0x000001000000 : "idprom"=0A=
1 ofpart partitions found on MTD device spi0.1=0A=
Creating 1 MTD partitions on "spi0.1":=0A=
0x000000000000-0x000000020000 : "nvs"=0A=
libphy: Fixed MDIO Bus: probed=0A=
libphy: orion_mdio_bus: probed=0A=
usbcore: registered new interface driver asix=0A=
usbcore: registered new interface driver cdc_ether=0A=
usbcore: registered new interface driver smsc75xx=0A=
usbcore: registered new interface driver usb-storage=0A=
i2c /dev entries driver=0A=
irq 0, desc: 9c004700, depth: 1, count: 0, unhandled: 0=0A=
->handle_irq():  8015948c,=0A=
handle_bad_irq+0x0/0x294=0A=
->irq_data.chip(): 8090ed08,=0A=
no_irq_chip+0x0/0x88=0A=
->action():   (null)=0A=
    IRQ_NOPROBE set=0A=
  IRQ_NOREQUEST set=0A=
unexpected IRQ trap at vector 00=0A=
irq 0, desc: 9c004700, depth: 1, count: 0, unhandled: 0=0A=
->handle_irq():  8015948c,=0A=
handle_bad_irq+0x0/0x294=0A=
->irq_data.chip(): 8090ed08,=0A=
no_irq_chip+0x0/0x88=0A=
->action():   (null)=0A=
    IRQ_NOPROBE set=0A=
  IRQ_NOREQUEST set=0A=
unexpected IRQ trap at vector 00=0A=
irq 0, desc: 9c004700, depth: 1, count: 0, unhandled: 0=0A=
->handle_irq():  8015948c,=0A=
handle_bad_irq+0x0/0x294=0A=
->irq_data.chip(): 8090ed08,=0A=
no_irq_chip+0x0/0x88=0A=
->action():   (null)=0A=
    IRQ_NOPROBE set=0A=
  IRQ_NOREQUEST set=0A=
unexpected IRQ trap at vector 00=0A=
irq 0, desc: 9c004700, depth: 1, count: 0, unhandled: 0=0A=
->handle_irq():  8015948c,=0A=
handle_bad_irq+0x0/0x294=0A=
->irq_data.chip(): 8090ed08,=0A=
no_irq_chip+0x0/0x88=0A=
->action():   (null)=0A=
    IRQ_NOPROBE set=0A=
  IRQ_NOREQUEST set=0A=
unexpected IRQ trap at vector 00=0A=
