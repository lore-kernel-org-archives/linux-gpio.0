From: Peter Rosin <peda@axentia.se>
Subject: [REGRESSION] mux/gpio.c is not able to get any gpio pins
Date: Tue, 16 Jan 2018 22:47:32 +0100
Message-ID: <6c711f96-e412-f7a6-125b-59c61829d802@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi!

I have found that the drivers/mux/gpio.c driver fails to get
the required gpio pins when I test with next-20180116.

The driver calls devm_gpiod_get_array() during probe and that
request returns -EPROBE_DEFER in three probes long after the pinctrl
driver has been registered (verified with a few extra traces, see
below), then the kernel gives up since the defers does not seem to
get resolved. End result: a booted system w/o the required mux driver.
I.e. things just don't work correctly at all.

I have bisected this bug to:

e10f72bf4b3e8885c1915a119141481e7fc45ca8 is the first bad commit
commit e10f72bf4b3e8885c1915a119141481e7fc45ca8
Author: Andrew Jeffery <andrew@aj.id.au>
Date:   Thu Nov 30 14:25:24 2017 +1030

    gpio: gpiolib: Generalise state persistence beyond sleep

    General support for state persistence is added to gpiolib with the
    introduction of a new pinconf parameter to propagate the request to
    hardware. The existing persistence support for sleep is adapted to
    include hardware support if the GPIO driver provides it. Persistence
    continues to be enabled by default; in-kernel consumers can opt out, but
    userspace (currently) does not have a choice.

    The *_SLEEP_MAY_LOSE_VALUE and *_SLEEP_MAINTAIN_VALUE symbols are
    renamed, dropping the SLEEP prefix to reflect that the concept is no
    longer sleep-specific.  I feel that renaming to just *_MAY_LOSE_VALUE
    could initially be misinterpreted, so I've further changed the symbols
    to *_TRANSITORY and *_PERSISTENT to address this.

    The sysfs interface is modified only to keep consistency with the
    chardev interface in enforcing persistence for userspace exports.

    Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
    Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
    Acked-by: Rob Herring <robh@kernel.org>
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>


I feebly tried to revert that on top of next-20180116, but that appears
to be a bit involved and I gave up.

The pinctrl driver that fails is pinctrl-sx150x.c and I have a sx1502
chip.

I used this diff to trace:

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index 468bf1709606..67e7b98fd608 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -73,8 +73,7 @@ static int mux_gpio_probe(struct platform_device *pdev)
 	mux_gpio->gpios = devm_gpiod_get_array(dev, "mux", GPIOD_OUT_LOW);
 	if (IS_ERR(mux_gpio->gpios)) {
 		ret = PTR_ERR(mux_gpio->gpios);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get gpios\n");
+		dev_err(dev, "failed to get gpios: %d\n", ret);
 		return ret;
 	}
 	WARN_ON(pins != mux_gpio->gpios->ndescs);
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index fb242c542dc9..a463b7337dca 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1230,6 +1230,7 @@ static int sx150x_probe(struct i2c_client *client,
 		dev_err(dev, "Failed to register pinctrl device\n");
 		return PTR_ERR(pctl->pctldev);
 	}
+	dev_err(dev, "reg");
 
 	return 0;
 }


With the above, and on the commit just before the above bisection result,
I get this good boot log:

CPU: ARMv7 Processor [410fc051] revision 1 (ARMv7), cr=10c53c7d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
OF: fdt: Machine model: Axentia Linea-Nattis v2 Natte v2
Memory policy: Data cache writeback
CPU: All CPU(s) started in SVC mode.
random: fast init done
Built 1 zonelists, mobility grouping on.  Total pages: 16256
Kernel command line: console=ttyS0,115200 rw consoleblank=0 ip=none root=ubi0:rootfs ubi.mtd=6 rootfstype=ubifs noinitrd mtdparts=atmel_nand:256k(at91bootstrap),384k(barebox)ro,256k@768k(bareboxenv),256k(bareboxenv2),128k@1536k(oftree),5M@2M(kernel),-@8M(rootfs)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 56252K/65536K available (5120K kernel code, 182K rwdata, 1052K rodata, 1024K init, 109K bss, 9284K reserved, 0K cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0xc4800000 - 0xff800000   ( 944 MB)
    lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
      .text : 0xc0008000 - 0xc0600000   (6112 kB)
      .init : 0xc0800000 - 0xc0900000   (1024 kB)
      .data : 0xc0900000 - 0xc092da8c   ( 183 kB)
       .bss : 0xc092da8c - 0xc0948f8c   ( 110 kB)
NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
clocksource: pit: mask: 0xfffffff max_cycles: 0xfffffff, max_idle_ns: 14479245754 ns
sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every 21474836475000000ns
Console: colour dummy device 80x30
Calibrating delay loop... 351.43 BogoMIPS (lpj=1757184)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
Setting up static identity map for 0x20100000 - 0x20100060
devtmpfs: initialized
VFP support v0.3: implementor 41 architecture 2 part 30 variant 5 rev 1
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
futex hash table entries: 256 (order: -1, 3072 bytes)
pinctrl core: initialized pinctrl subsystem
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
AT91: PM: standby: standby, suspend: ulp0
No ATAGs?
gpio-at91 fffff200.gpio: at address c485a200
gpio-at91 fffff400.gpio: at address c485c400
gpio-at91 fffff600.gpio: at address c485e600
gpio-at91 fffff800.gpio: at address c4881800
gpio-at91 fffffa00.gpio: at address c4883a00
pinctrl-at91 ahb:apb:pinctrl@fffff200: initialized AT91 pinctrl driver
clocksource: tcb_clksrc: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 115833966437 ns
at_hdmac ffffe600.dma-controller: Atmel AHB DMA Controller ( cpy set slave ), 8 channels
at_hdmac ffffe800.dma-controller: Atmel AHB DMA Controller ( cpy set slave ), 8 channels
AT91: Detected SoC family: sama5d3
AT91: Detected SoC: sama5d31, revision 2
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
at91_i2c f0014000.i2c: using dma0chan0 (tx) and dma0chan1 (rx) for DMA transfers
sx150x-pinctrl 0-0020: reg
at91_i2c f0014000.i2c: AT91 i2c bus driver (hw version: 0x402).
clocksource: Switched to clocksource tcb_clksrc
NET: Registered protocol family 2
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
Initialise system trusted keyrings
workingset: timestamp_bits=30 max_order=14 bucket_order=0
Key type asymmetric registered
Asymmetric key parser 'x509' registered
io scheduler noop registered (default)
io scheduler mq-deadline registered
io scheduler kyber registered
f001c000.serial: ttyS1 at MMIO 0xf001c000 (irq = 22, base_baud = 4125000) is a ATMEL_SERIAL
ffffee00.serial: ttyS0 at MMIO 0xffffee00 (irq = 30, base_baud = 8250000) is a ATMEL_SERIAL
console [ttyS0] enabled
loop: module loaded
ssc f0008000.ssc: Atmel SSC device at 0xc489c000 (irq 19)
ssc f0008000.ssc: failed to auto-setup ssc for audio
at24 0-0051: 8192 byte 24c64 EEPROM, writable, 32 bytes/write
at24 0-0050: 256 byte 24c02 EEPROM, writable, 16 bytes/write
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] No driver support for vblank timestamp query.
atmel-hlcdc-display-controller atmel-hlcdc-dc: failed to create HLCDC outputs: -517
atmel-hlcdc-display-controller atmel-hlcdc-dc: failed to initialize mode setting
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-atmel: EHCI Atmel driver
atmel_usba_udc 500000.gadget: MMIO registers at 0xf8030000 mapped at c48ac000
atmel_usba_udc 500000.gadget: FIFO at 0x00500000 mapped at c4900000
g_serial gadget: Gadget Serial v2.4
g_serial gadget: g_serial ready
at91_rtc fffffeb0.rtc: registered as rtc0
at91_rtc fffffeb0.rtc: AT91 Real Time Clock driver.
i2c /dev entries driver
AT91: Starting after wakeup
atmel_mci f0000000.mmc: version: 0x505
atmel_mci f0000000.mmc: using dma0chan2 for DMA transfers
atmel_mci f0000000.mmc: Atmel MCI controller at 0xf0000000 irq 18, 1 slots
atmel_aes f8038000.aes: version: 0x135
atmel_aes f8038000.aes: Atmel AES - Using dma1chan0, dma1chan1 for DMA transfers
atmel_sha f8034000.sha: version: 0x410
atmel_sha f8034000.sha: using dma1chan2 for DMA transfers
atmel_sha f8034000.sha: Atmel SHA1/SHA256/SHA224/SHA384/SHA512
atmel_tdes f803c000.tdes: version: 0x701
atmel_tdes f803c000.tdes: using dma1chan3, dma1chan4 for DMA transfers
atmel_tdes f803c000.tdes: Atmel DES/TDES
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xac
nand: Micron MT29F4G08ABBDAHC
nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
Bad block table found at page 262080, version 0x01
Bad block table found at page 262016, version 0x01
7 cmdlinepart partitions found on MTD device atmel_nand
Creating 7 MTD partitions on "atmel_nand":
0x000000000000-0x000000040000 : "at91bootstrap"
0x000000040000-0x0000000a0000 : "barebox"
0x0000000c0000-0x000000100000 : "bareboxenv"
0x000000100000-0x000000140000 : "bareboxenv2"
0x000000180000-0x0000001a0000 : "oftree"
0x000000200000-0x000000700000 : "kernel"
0x000000800000-0x000020000000 : "rootfs"
gpio-mux mux-controller: 8-way mux-controller registered
NET: Registered protocol family 10
Segment Routing with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered protocol family 17
Loading compiled-in X.509 certificates
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] No driver support for vblank timestamp query.
atmel-hlcdc-display-controller atmel-hlcdc-dc: fb0:  frame buffer device
[drm] Initialized atmel-hlcdc 1.0.0 20141504 for atmel-hlcdc-dc on minor 0
i2c i2c-0: Added multiplexed i2c bus 3
i2c i2c-0: Added multiplexed i2c bus 4
i2c i2c-0: Added multiplexed i2c bus 5
i2c i2c-0: Added multiplexed i2c bus 6
i2c i2c-0: Added multiplexed i2c bus 7
i2c i2c-0: Added multiplexed i2c bus 8
i2c i2c-0: Added multiplexed i2c bus 9
i2c i2c-0: Added multiplexed i2c bus 10
i2c-mux-gpmux i2c-mux: 8-port mux on AT91 adapter
ubi0: attaching mtd6
random: crng init done
ubi0: scanning is finished
gluebi (pid 1): gluebi_resized: got update notification for unknown UBI device 0 volume 0
ubi0: volume 0 ("rootfs") re-sized from 232 to 3948 LEBs
ubi0: attached mtd6 (name "rootfs", size 504 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 4028, bad PEBs: 4, corrupted PEBs: 0
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image sequence number: 1841681945
ubi0: available PEBs: 0, total reserved PEBs: 4028, PEBs reserved for bad PEB handling: 76
ubi0: background thread "ubi_bgt0d" started, PID 638
input: gpio-keys as /devices/platform/gpio-keys/input/input0
at91_rtc fffffeb0.rtc: setting system clock to 2007-01-01 00:00:10 UTC (1167609610)
atmel_usart ffffee00.serial: using dma1chan5 for rx DMA transfers
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 650
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
UBIFS (ubi0:0): FS size: 258650112 bytes (246 MiB, 2037 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
UBIFS (ubi0:0): media format: w4/r0 (latest is w5/r0), UUID EE0CFC57-BFC0-42A6-A803-2411C6488ED6, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:14.


When on the offending commit, I this bad boot log:


CPU: ARMv7 Processor [410fc051] revision 1 (ARMv7), cr=10c53c7d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
OF: fdt: Machine model: Axentia Linea-Nattis v2 Natte v2
Memory policy: Data cache writeback
CPU: All CPU(s) started in SVC mode.
random: fast init done
Built 1 zonelists, mobility grouping on.  Total pages: 16256
Kernel command line: console=ttyS0,115200 rw consoleblank=0 ip=none root=ubi0:rootfs ubi.mtd=6 rootfstype=ubifs noinitrd mtdparts=atmel_nand:256k(at91bootstrap),384k(barebox)ro,256k@768k(bareboxenv),256k(bareboxenv2),128k@1536k(oftree),5M@2M(kernel),-@8M(rootfs)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 56252K/65536K available (5120K kernel code, 182K rwdata, 1052K rodata, 1024K init, 109K bss, 9284K reserved, 0K cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0xc4800000 - 0xff800000   ( 944 MB)
    lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
      .text : 0xc0008000 - 0xc0600000   (6112 kB)
      .init : 0xc0800000 - 0xc0900000   (1024 kB)
      .data : 0xc0900000 - 0xc092da8c   ( 183 kB)
       .bss : 0xc092da8c - 0xc0948f8c   ( 110 kB)
NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
clocksource: pit: mask: 0xfffffff max_cycles: 0xfffffff, max_idle_ns: 14479245754 ns
sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every 21474836475000000ns
Console: colour dummy device 80x30
Calibrating delay loop... 351.43 BogoMIPS (lpj=1757184)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
Setting up static identity map for 0x20100000 - 0x20100060
devtmpfs: initialized
VFP support v0.3: implementor 41 architecture 2 part 30 variant 5 rev 1
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
futex hash table entries: 256 (order: -1, 3072 bytes)
pinctrl core: initialized pinctrl subsystem
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
AT91: PM: standby: standby, suspend: ulp0
No ATAGs?
gpio-at91 fffff200.gpio: at address c485a200
gpio-at91 fffff400.gpio: at address c485c400
gpio-at91 fffff600.gpio: at address c485e600
gpio-at91 fffff800.gpio: at address c4881800
gpio-at91 fffffa00.gpio: at address c4883a00
pinctrl-at91 ahb:apb:pinctrl@fffff200: initialized AT91 pinctrl driver
clocksource: tcb_clksrc: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 115833966437 ns
at_hdmac ffffe600.dma-controller: Atmel AHB DMA Controller ( cpy set slave ), 8 channels
at_hdmac ffffe800.dma-controller: Atmel AHB DMA Controller ( cpy set slave ), 8 channels
AT91: Detected SoC family: sama5d3
AT91: Detected SoC: sama5d31, revision 2
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
at91_i2c f0014000.i2c: using dma0chan0 (tx) and dma0chan1 (rx) for DMA transfers
sx150x-pinctrl 0-0020: reg
at91_i2c f0014000.i2c: AT91 i2c bus driver (hw version: 0x402).
clocksource: Switched to clocksource tcb_clksrc
NET: Registered protocol family 2
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
Initialise system trusted keyrings
workingset: timestamp_bits=30 max_order=14 bucket_order=0
Key type asymmetric registered
Asymmetric key parser 'x509' registered
io scheduler noop registered (default)
io scheduler mq-deadline registered
io scheduler kyber registered
f001c000.serial: ttyS1 at MMIO 0xf001c000 (irq = 22, base_baud = 4125000) is a ATMEL_SERIAL
ffffee00.serial: ttyS0 at MMIO 0xffffee00 (irq = 30, base_baud = 8250000) is a ATMEL_SERIAL
console [ttyS0] enabled
loop: module loaded
ssc f0008000.ssc: Atmel SSC device at 0xc489c000 (irq 19)
ssc f0008000.ssc: failed to auto-setup ssc for audio
at24 0-0051: 8192 byte 24c64 EEPROM, writable, 32 bytes/write
at24 0-0050: 256 byte 24c02 EEPROM, writable, 16 bytes/write
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] No driver support for vblank timestamp query.
atmel-hlcdc-display-controller atmel-hlcdc-dc: failed to create HLCDC outputs: -517
atmel-hlcdc-display-controller atmel-hlcdc-dc: failed to initialize mode setting
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-atmel: EHCI Atmel driver
atmel_usba_udc 500000.gadget: MMIO registers at 0xf8030000 mapped at c48ac000
atmel_usba_udc 500000.gadget: FIFO at 0x00500000 mapped at c4900000
g_serial gadget: Gadget Serial v2.4
g_serial gadget: g_serial ready
at91_rtc fffffeb0.rtc: registered as rtc0
at91_rtc fffffeb0.rtc: AT91 Real Time Clock driver.
i2c /dev entries driver
AT91: Starting after wakeup
atmel_mci f0000000.mmc: version: 0x505
atmel_mci f0000000.mmc: using dma0chan2 for DMA transfers
atmel_mci f0000000.mmc: Atmel MCI controller at 0xf0000000 irq 18, 1 slots
atmel_aes f8038000.aes: version: 0x135
atmel_aes f8038000.aes: Atmel AES - Using dma1chan0, dma1chan1 for DMA transfers
atmel_sha f8034000.sha: version: 0x410
atmel_sha f8034000.sha: using dma1chan2 for DMA transfers
atmel_sha f8034000.sha: Atmel SHA1/SHA256/SHA224/SHA384/SHA512
atmel_tdes f803c000.tdes: version: 0x701
atmel_tdes f803c000.tdes: using dma1chan3, dma1chan4 for DMA transfers
atmel_tdes f803c000.tdes: Atmel DES/TDES
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xac
nand: Micron MT29F4G08ABBDAHC
nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
Bad block table found at page 262080, version 0x01
Bad block table found at page 262016, version 0x01
7 cmdlinepart partitions found on MTD device atmel_nand
Creating 7 MTD partitions on "atmel_nand":
0x000000000000-0x000000040000 : "at91bootstrap"
0x000000040000-0x0000000a0000 : "barebox"
0x0000000c0000-0x000000100000 : "bareboxenv"
0x000000100000-0x000000140000 : "bareboxenv2"
0x000000180000-0x0000001a0000 : "oftree"
0x000000200000-0x000000700000 : "kernel"
0x000000800000-0x000020000000 : "rootfs"
gpio-mux mux-controller: failed to get gpios: -517
NET: Registered protocol family 10
Segment Routing with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered protocol family 17
Loading compiled-in X.509 certificates
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] No driver support for vblank timestamp query.
atmel-hlcdc-display-controller atmel-hlcdc-dc: fb0:  frame buffer device
[drm] Initialized atmel-hlcdc 1.0.0 20141504 for atmel-hlcdc-dc on minor 0
gpio-mux mux-controller: failed to get gpios: -517
ubi0: attaching mtd6
random: crng init done
ubi0: scanning is finished
gluebi (pid 1): gluebi_resized: got update notification for unknown UBI device 0 volume 0
ubi0: volume 0 ("rootfs") re-sized from 232 to 3948 LEBs
ubi0: attached mtd6 (name "rootfs", size 504 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 4028, bad PEBs: 4, corrupted PEBs: 0
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image sequence number: 1841681945
ubi0: available PEBs: 0, total reserved PEBs: 4028, PEBs reserved for bad PEB handling: 76
ubi0: background thread "ubi_bgt0d" started, PID 589
input: gpio-keys as /devices/platform/gpio-keys/input/input0
at91_rtc fffffeb0.rtc: setting system clock to 2007-01-01 00:00:09 UTC (1167609609)
gpio-mux mux-controller: failed to get gpios: -517
atmel_usart ffffee00.serial: using dma1chan5 for rx DMA transfers
UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 601
UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
UBIFS (ubi0:0): FS size: 258650112 bytes (246 MiB, 2037 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
UBIFS (ubi0:0): media format: w4/r0 (latest is w5/r0), UUID EE0CFC57-BFC0-42A6-A803-2411C6488ED6, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:14.


diff between the two:

--- bootlog.good	2018-01-16 22:39:29.196022434 +0100
+++ bootlog.bad	2018-01-16 22:39:51.474264534 +0100
@@ -118,7 +118,7 @@
 0x000000180000-0x0000001a0000 : "oftree"
 0x000000200000-0x000000700000 : "kernel"
 0x000000800000-0x000020000000 : "rootfs"
-gpio-mux mux-controller: 8-way mux-controller registered
+gpio-mux mux-controller: failed to get gpios: -517
 NET: Registered protocol family 10
 Segment Routing with IPv6
 sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
@@ -128,15 +128,7 @@
 [drm] No driver support for vblank timestamp query.
 atmel-hlcdc-display-controller atmel-hlcdc-dc: fb0:  frame buffer device
 [drm] Initialized atmel-hlcdc 1.0.0 20141504 for atmel-hlcdc-dc on minor 0
-i2c i2c-0: Added multiplexed i2c bus 3
-i2c i2c-0: Added multiplexed i2c bus 4
-i2c i2c-0: Added multiplexed i2c bus 5
-i2c i2c-0: Added multiplexed i2c bus 6
-i2c i2c-0: Added multiplexed i2c bus 7
-i2c i2c-0: Added multiplexed i2c bus 8
-i2c i2c-0: Added multiplexed i2c bus 9
-i2c i2c-0: Added multiplexed i2c bus 10
-i2c-mux-gpmux i2c-mux: 8-port mux on AT91 adapter
+gpio-mux mux-controller: failed to get gpios: -517
 ubi0: attaching mtd6
 random: crng init done
 ubi0: scanning is finished
@@ -150,11 +142,12 @@
 ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
 ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image sequence number: 1841681945
 ubi0: available PEBs: 0, total reserved PEBs: 4028, PEBs reserved for bad PEB handling: 76
-ubi0: background thread "ubi_bgt0d" started, PID 638
+ubi0: background thread "ubi_bgt0d" started, PID 589
 input: gpio-keys as /devices/platform/gpio-keys/input/input0
-at91_rtc fffffeb0.rtc: setting system clock to 2007-01-01 00:00:10 UTC (1167609610)
+at91_rtc fffffeb0.rtc: setting system clock to 2007-01-01 00:00:09 UTC (1167609609)
+gpio-mux mux-controller: failed to get gpios: -517
 atmel_usart ffffee00.serial: using dma1chan5 for rx DMA transfers
-UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 650
+UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 601
 UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "rootfs"
 UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
 UBIFS (ubi0:0): FS size: 258650112 bytes (246 MiB, 2037 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)


Cheers,
Peter
