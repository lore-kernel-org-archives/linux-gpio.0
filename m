From: Paul Osmialowski <pawelo@king.net.pl>
Subject: [PATCH 0/9] [New BSP] Add initial support for Freescale Kinetis TWR-K70F120M development kit
Date: Tue, 23 Jun 2015 23:19:38 +0200
Message-ID: <1435094387-20146-1-git-send-email-pawelo__45673.3772335157$1435096377$gmane$org@king.net.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fish.king.net.pl ([79.190.246.46]:37015 "EHLO king.net.pl"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S934066AbbFWVu4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 23 Jun 2015 17:50:56 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Anson Huang <b20788@freescale.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Frank Li <Frank.Li@freescale.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingchang Lu <jingchang.lu@freescale.com>, Jiri Slaby <jslaby@suse.cz>, Kees Cook <keescook@chromium.org>, Kumar Gala <galak@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm+renesas@opensource.se>, Michael Turquette <mturquette@baylibre.com>, Nathan Lynch <nathan_lynch@mentor.com>, Nicolas
Cc: Paul Osmialowski <pawelo@king.net.pl>, Yuri Tikhonov <yur@emcraft.com>, Sergei Poselenov <sposelenov@emcraft.com>, Dmitry Cherkassov <d_cherkasov@emcraft.com>, Alexander Potashev <aspotashev@emcraft.com>

This patchset adds a very basic initial support for TWR-K70F120M
development kit which is based on ARM Cortex-M4 Freescale Kinetis K70 SoC.

I've found this a very lovely piece of equipment which allowed me to
explore mysterious world of noMMU Linux. Therefore I think it deserves
proper support from upstream Linux kernel side.

I based my work on K70 Sub-Family Reference Manual Rev. 3,
K70P256M150SF3RM.pdf and commits published on Emcraft git repo:

https://github.com/EmcraftSystems/linux-emcraft.git

The BSP published by Emcraft is based on Linux 2.6.33, does not use
OF Device Tree and implements its own NVIC, clock source, IOMUX and DMA
controller support routines. I wrote clear remarks whenever I'd used parts
of the code from their repository.

I decided to make use of recent additions to linux-next whenever it was
suitable, i.e.:

o all devices are configured in .dts files
o for NVIC I used in-tree driver
o for systick I used recently added arm,armv7m-systick driver
o for clock sources I implemented drivers that in shape are similar
      to efm32gg drivers (another ARM Cortex-M4 based platform - already
      supported by upstream kernel so I could use it as a reference on how
      things should possibly be done)
o for IOMUX I implemented very simplified pinctrl OF-friendly driver
  (which is sufficient for now, at least to configure UART pins)
o for DMA I extended existing Freescale eDMA driver
o for UART I also extended existing Freescale lpuart driver

You may find the first three patches a bit controversial. They intrude into
sensitive parts of ARM support in kernel tree. You may not like it, but
that's how it started to work for me. I tried to minimize the impact as
much as I could, however any better proposals are more than welcome.

Note that U-boot on my TWR-K70F120M is a bit modest and does not support
DTBs. Therefore the only option for having bootable uImage is zImage with
DTB attached at the end. In short it can be done like this:

make uImage                  (this creates normal uImage along with zImage)
make kinetis-twr-k70f120m.dtb
cat arch/arm/boot/zImage arch/arm/boot/dts/kinetis-twr-k70f120m.dtb >Image
mkimage -A arm -O linux -C none -T kernel -a 0x08008000 -e 0x08008001 \
        -n 'Linux-next-with-dtb' -d Image uImage

I'm booting this image over local network using TFTP. The userspace resides
in initramfs and consists of busybox and a few very basic command line
tools.

This initial support is just a beginning. My TWR-K70F120M is equipped with
many interesting features to which many drivers can be written.

During my work I was using Segger J-Link PRO JTAG which works nicely with
this development board - I can't imagine myself doing all this stuff
without it.

Paul Osmialowski (9):
  arm: select different compiler flags for ARM CortexM3
  arm: do not place huge encoder tables on stack when it is too small
  arm: add call to CPU idle quirks handler
  arm: allow copying of vector table to internal SRAM memory
  arm: twr-k70f120m: basic support for Kinetis TWR-K70F120M
  arm: twr-k70f120m: clock source drivers for Kinetis SoC
  arm: twr-k70f120m: IOMUX driver for Kinetis SoC
  arm: twr-k70f120m: extend Freescale eDMA driver with ability to
    support Kinetis SoC
  arm: twr-k70f120m: extend Freescale lpuart driver with ability to
    support Kinetis SoC

 Documentation/devicetree/bindings/arm/fsl.txt      |   6 +
 .../devicetree/bindings/clock/kinetis-clock.txt    |  25 +
 Documentation/devicetree/bindings/dma/fsl-edma.txt |  38 +-
 .../bindings/pinctrl/fsl,kinetis-pinctrl.txt       |  31 ++
 .../devicetree/bindings/serial/fsl-lpuart.txt      |   6 +-
 .../bindings/timer/fsl,kinetis-pit-timer.txt       |  18 +
 arch/arm/Kconfig                                   |  29 +-
 arch/arm/Kconfig-nommu                             |  16 +
 arch/arm/Makefile                                  |   2 +
 arch/arm/boot/dts/kinetis-twr-k70f120m.dts         |  43 ++
 arch/arm/boot/dts/kinetis.dtsi                     | 215 +++++++++
 arch/arm/kernel/entry-v7m.S                        |   3 +
 arch/arm/kernel/process.c                          |   7 +
 arch/arm/mach-kinetis/Kconfig                      |  15 +
 arch/arm/mach-kinetis/Makefile                     |   5 +
 arch/arm/mach-kinetis/Makefile.boot                |   3 +
 arch/arm/mach-kinetis/include/mach/idle.h          |  33 ++
 arch/arm/mach-kinetis/include/mach/kinetis.h       | 170 +++++++
 arch/arm/mach-kinetis/include/mach/memory.h        |  61 +++
 arch/arm/mach-kinetis/include/mach/power.h         |  83 ++++
 arch/arm/mach-kinetis/kinetis_platform.c           |  61 +++
 arch/arm/mm/Kconfig                                |  12 +-
 arch/arm/mm/proc-v7m.S                             |  11 +
 arch/arm/tools/mach-types                          |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-kinetis.c                          | 297 ++++++++++++
 drivers/clocksource/Kconfig                        |   5 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-kinetis.c                | 294 ++++++++++++
 drivers/dma/fsl-edma.c                             |  81 +++-
 drivers/pinctrl/freescale/Kconfig                  |   8 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-kinetis.c        | 529 +++++++++++++++++++++
 drivers/tty/serial/fsl_lpuart.c                    |  90 +++-
 include/dt-bindings/clock/kinetis-mcg.h            |  25 +
 lib/zlib_inflate/inflate.c                         |   5 +
 36 files changed, 2210 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/kinetis-clock.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,kinetis-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,kinetis-pit-timer.txt
 create mode 100644 arch/arm/boot/dts/kinetis-twr-k70f120m.dts
 create mode 100644 arch/arm/boot/dts/kinetis.dtsi
 create mode 100644 arch/arm/mach-kinetis/Kconfig
 create mode 100644 arch/arm/mach-kinetis/Makefile
 create mode 100644 arch/arm/mach-kinetis/Makefile.boot
 create mode 100644 arch/arm/mach-kinetis/include/mach/idle.h
 create mode 100644 arch/arm/mach-kinetis/include/mach/kinetis.h
 create mode 100644 arch/arm/mach-kinetis/include/mach/memory.h
 create mode 100644 arch/arm/mach-kinetis/include/mach/power.h
 create mode 100644 arch/arm/mach-kinetis/kinetis_platform.c
 create mode 100644 drivers/clk/clk-kinetis.c
 create mode 100644 drivers/clocksource/timer-kinetis.c
 create mode 100644 drivers/pinctrl/freescale/pinctrl-kinetis.c
 create mode 100644 include/dt-bindings/clock/kinetis-mcg.h

-- 
2.3.6

