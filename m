From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control changes for the v4.4 kernel cycle
Date: Mon, 2 Nov 2015 11:24:38 +0100
Message-ID: <CACRpkdafSs4Y1vAZHsH2xBk+enCq-1sAagsMp3-pHZwS0WZN3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:36761 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753464AbbKBKYj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 05:24:39 -0500
Received: by obdgf3 with SMTP id gf3so27123379obd.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2015 02:24:39 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, Geert Uytterhoeven <geert+renesas@glider.be>

Hi Linus,

here is the big pull request for v4.4-targeted pin control changes.
The details are in the signed tag.

Development pace is high in pin control again this merge window.
28 contributors, 83 patches.

It hits a few sites outside the pin control subsystem:

- Device tree bindings in Documentation (as usual)
- MAINTAINERS
- drivers/base/* for the "init" state handling by Doug Anderson.
  This has been ACKed by Greg.
- drivers/usb/renesas_usbhs/rcar2.c, for a dependent Renesas
  change in the USB subsystem. This has been ACKed by both
  Greg and Felipe.
- arch/arm/boot/dts/sama5d2.dtsi - this should ideally have
  gone through the ARM SoC tree but ended up here. May cause
  a conflict that was spotted in -next, but it is trivial. I should hav=
e
  seen this earlier, mea culpa.

This time I am using Geert Uytterhoeven as submaintainer for SH PFC
since the are three-four people working in parallel with new Renesas
ASICs.

Please pull this in!

Yours,
Linus Walleij


The following changes since commit 1f93e4a96c9109378204c147b3eec0d0e810=
0fde:

  Linux 4.3-rc2 (2015-09-20 14:32:34 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.gi=
t
tags/pinctrl-v4.4-1

for you to fetch changes up to d99c8053fc2473115f506782822cb7c33c687513=
:

  pinctrl: pinconf: remove needless loop (2015-10-31 22:13:07 +0100)

----------------------------------------------------------------
This is the big bulk of pin control changes for the
v4.4 kernel development cycle:

Infrastructure:
- Doug Anderson wrote a patch adding an "init" state
  different from the "default" state for pin control
  state handling in the core framework. This is applied
  before the driver's probe() call if defined and takes
  precedence over "default". If both are defined, "init"
  will be applied *before* probe() and "default" will be
  applied *after* probe().

Significant subdriver improvements:
- SH PFC is switched to getting GPIO ranges from the
  device tree ranges property on DT platforms.
- Got rid of CONFIG_ARCH_SHMOBILE_LEGACY, we are all
  modernized.
- Got rid of SH PFC hardcoded IRQ numbers.
- Allwinner sunxi external interrupt through the "r"
  controller.
- Moved the Cygnus driver to use DT-provided GPIO
  ranges.

New drivers:
- Atmel PIO4 pin controller for the SAMA4D2 family

New subdrivers:
- Rockchip RK3036 subdriver
- Renesas SH PFC R8A7795 subdriver
- Allwinner sunxi A83T PIO subdriver
- Freescale i.MX7d iomux lpsr subdriver
- Marvell Berlin BG4CT subdriver
- SiRF Atlas 7 step B SoC subdriver
- Intel Broxton SoC subdriver

Apart from this, the usual slew if syntactic and semantic
fixes.

----------------------------------------------------------------
Adrian Alonso (4):
      pinctrl: freescale: imx: allow mux_reg offset zero
      pinctrl: freescale: imx: add shared input select reg support
      pinctrl: freescale: imx7d: support iomux lpsr controller
      pinctrl: freescale: imx: imx7d iomuxc-lpsr devicetree bindings

Antoine Tenart (2):
      pinctrl: berlin: select the pinctrl driver according to the SoC u=
sed
      pinctrl: berlin: add explicit dependency on OF

Antoine T=C3=A9nart (1):
      pinctrl: berlin: fix my family name spelling

Douglas Anderson (1):
      drivers/pinctrl: Add the concept of an "init" state

Geert Uytterhoeven (12):
      pinctrl: sh-pfc: Stop calling gpiochip_add_pin_range() on DT plat=
forms
      pinctrl: sh-pfc: Remove empty gpio_function_free()
      pinctrl: sh-pfc: Confine legacy function GPIOs to SH
      pinctrl: sh-pfc: r8a7794: Remove bogus SCIF0 SCK pin data
      pinctrl: sh-pfc: r8a7791/r8a7793: Correct SCIFB1_B SCK MOD_SEL va=
lue
      pinctrl: sh-pfc: Get rid of CONFIG_ARCH_SHMOBILE_LEGACY
      pinctrl: sh-pfc: r8a7795: add SCIFx support
      pinctrl: sh-pfc: Rename .gpio_data[] to .pinmux_data[]
      usb: renesas_usbhs: Remove unneeded #include
<linux/platform_data/gpio-rcar.h>
      pinctrl: sh-pfc: Stop including <linux/platform_data/gpio-rcar.h>
      pinctrl: sh-pfc: Remove obsolete r8a7779 platform_device_id entry
      pinctrl: sh-pfc: Remove obsolete r8a7778 platform_device_id entry

Hans de Goede (2):
      pinctrl: sunxi: Fix irq_of_xlate for the r_pio pinctrl block
      pinctrl: sunxi: Add irq pinmuxing to sun6i "r" pincontroller

Javier Martinez Canillas (7):
      pinctrl: mediatek: Consistently use the BIT() macro
      pinctrl: tz1090: Remove unneded semicolons
      pinctrl: tz1090-pdc: Remove unneded semicolons
      pinctrl: mxs: Remove unneded semicolon
      pinctrl: sunxi: Remove unneeded semicolon
      pinctrl: mediatek: Remove unneded semicolon
      pinctrl: samsung: Remove unneded semicolon

Jisheng Zhang (4):
      pinctrl: berlin: introduce berlin_pinctrl_probe_regmap()
      pinctrl: berlin: Make berlin pinctrl driver visible if COMPILE_TE=
ST=3Dy
      pinctrl: berlin: add the berlin4ct pinctrl driver
      pinctrl: dt-binding: document berlin4ct SoC pinctrl

Jon Hunter (1):
      pinctrl: tegra-xusb: Correct lane mux options

Jonas Gorski (1):
      pinctrl: qcom: ssbi: fix compilation with DEBUG_FS=3Dn

Julia Lawall (1):
      pinctrl: at91: add missing of_node_put

Koji Matsuoka (1):
      pinctrl: sh-pfc: r8a7794: Add VIN pin groups

Kuninori Morimoto (10):
      pinctrl: sh-pfc: modify PINMUX_IPSR_MSEL() macro order
      pinctrl: sh-pfc: sh7734: use PINMUX_IPSR_MSEL()
      pinctrl: sh-pfc: r8a7794: use PINMUX_IPSR_MSEL()
      pinctrl: sh-pfc: r8a7791: use PINMUX_IPSR_MSEL()
      pinctrl: sh-pfc: r8a7790: use PINMUX_IPSR_MSEL()
      pinctrl: sh-pfc: r8a7779: use PINMUX_IPSR_MSEL()
      pinctrl: sh-pfc: remove unused PINMUX_IPSR_MODSEL_DATA()
      pinctrl: sh-pfc: r8a7795: add I2C pin support
      pinctrl: sh-pfc: r8a7795: add Audio clock pin support
      pinctrl: sh-pfc: r8a7795: add Audio SSI pin support

Laurent Meunier (1):
      pinctrl: pinconf: remove needless loop

Laurent Pinchart (1):
      pinctrl: sh-pfc: Remove hardcoded IRQ numbers

Linus Walleij (3):
      Merge branch 'sh-pfc-for-v4.4' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge branch 'sh-pfc-for-v4.4' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      pinctrl: zynq: fix UTF-8 errors

Ludovic Desroches (7):
      pinctrl: introduce driver for Atmel PIO4 controller
      pinctrl: dt-binding: Add DT binding documentation for Atmel PIO4
      MAINTAINERS: Add an entry for pinctrl-at91-pio4
      ARM: at91/dt: sama5d2: add pio controller node
      pinctrl: at91-pio4: add PM stuff
      pinctrl: at91-pio4: use irq_set_handler_locked
      pinctrl: at91-pio4: irq argument as been removed from irq flow ha=
ndlers

Masahiro Yamada (5):
      pinctrl: uniphier: add SD card pinmux settings
      pinctrl: pinconf-generic: sort pin configuration params alphabeti=
cally
      pinctrl: pinconf-generic: add "input-schmitt" DT property
      pinctrl: uniphier: set input-enable before pin-muxing
      pinctrl: uniphier: guard uniphier directory with CONFIG_PINCTRL_U=
NIPHIER

Mika Westerberg (5):
      pinctrl: intel: Fix compilation warning when !CONFIG_PM_SLEEP
      pinctrl: baytrail: Fix compilation warnings when !CONFIG_PM
      pinctrl: intel: Add support for multiple GPIO chips sharing the i=
nterrupt
      pinctrl: intel: Allow requesting pins which are in ACPI mode as G=
PIOs
      pinctrl: intel: Add Intel Broxton pin controller support

Mike Looijmans (1):
      pinctrl: zynq: Initialize early

Pramod Kumar (3):
      pinctrl: cygnus: Optional DT property to support pin mappings
      pinctrl: cygnus: Remove GPIO to Pinctrl pin mapping from driver
      pinctrl: cygnus: Add new compatible string for gpio controller dr=
iver

Robin Gong (1):
      pinctrl: freescale: imx: fix system crash if enable two pinctl in=
stances

Sergei Shtylyov (1):
      pinctrl: sh-pfc: r8a779[01]: Move 'union vin_data' to shared head=
er file

Takeshi Kihara (2):
      pinctrl: sh-pfc: Initial R8A7795 PFC support
      pinctrl: sh-pfc: r8a7795: add EtherAVB support

Thomas Hebb (1):
      pinctrl: berlin: fix BG2CD field widths

Ulrich Hecht (2):
      pinctrl: sh-pfc: Add macros defining GP ports with config flags
      pinctrl: sh-pfc: r8a7778: Add bias (pull-up) pinconf support

Vishnu Patekar (1):
      pinctrl: sunxi: add allwinner A83T PIO controller support

Wei Chen (1):
      pinctrl: atlas7: support atlas7 step B changes

Xing Zheng (1):
      pinctrl: rockchip: add support for the rk3036

 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    1 +
 .../bindings/pinctrl/atmel,at91-pio4-pinctrl.txt   |   90 +
 .../devicetree/bindings/pinctrl/berlin,pinctrl.txt |    5 +-
 .../bindings/pinctrl/brcm,cygnus-gpio.txt          |   16 +-
 .../bindings/pinctrl/fsl,imx7d-pinctrl.txt         |   63 +-
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 MAINTAINERS                                        |    7 +
 arch/arm/boot/dts/sama5d2.dtsi                     |   14 +
 drivers/base/dd.c                                  |    2 +
 drivers/base/pinctrl.c                             |   15 +-
 drivers/pinctrl/Kconfig                            |   13 +
 drivers/pinctrl/Makefile                           |    3 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c          |  131 +-
 drivers/pinctrl/berlin/Kconfig                     |   16 +-
 drivers/pinctrl/berlin/Makefile                    |    1 +
 drivers/pinctrl/berlin/berlin-bg2.c                |    4 +-
 drivers/pinctrl/berlin/berlin-bg2cd.c              |   66 +-
 drivers/pinctrl/berlin/berlin-bg2q.c               |    4 +-
 drivers/pinctrl/berlin/berlin-bg4ct.c              |  503 ++++
 drivers/pinctrl/berlin/berlin.c                    |   28 +-
 drivers/pinctrl/berlin/berlin.h                    |    6 +-
 drivers/pinctrl/core.c                             |   32 +
 drivers/pinctrl/freescale/pinctrl-imx.c            |   36 +-
 drivers/pinctrl/freescale/pinctrl-imx.h            |    2 +
 drivers/pinctrl/freescale/pinctrl-imx7d.c          |   30 +
 drivers/pinctrl/freescale/pinctrl-mxs.c            |    2 +-
 drivers/pinctrl/intel/Kconfig                      |    8 +
 drivers/pinctrl/intel/Makefile                     |    1 +
 drivers/pinctrl/intel/pinctrl-baytrail.c           |    2 +
 drivers/pinctrl/intel/pinctrl-broxton.c            | 1065 ++++++++
 drivers/pinctrl/intel/pinctrl-intel.c              |  108 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |    4 +-
 drivers/pinctrl/pinconf-generic.c                  |   35 +-
 drivers/pinctrl/pinconf.c                          |   13 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                | 1094 ++++++++
 drivers/pinctrl/pinctrl-at91.c                     |    5 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |   17 +
 drivers/pinctrl/pinctrl-tegra-xusb.c               |    9 -
 drivers/pinctrl/pinctrl-tz1090-pdc.c               |    4 +-
 drivers/pinctrl/pinctrl-tz1090.c                   |    4 +-
 drivers/pinctrl/pinctrl-zynq.c                     |   16 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |    2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |    2 +-
 drivers/pinctrl/samsung/pinctrl-exynos5440.c       |    2 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |   16 +-
 drivers/pinctrl/sh-pfc/core.h                      |    3 +
 drivers/pinctrl/sh-pfc/gpio.c                      |   37 +-
 drivers/pinctrl/sh-pfc/pfc-emev2.c                 |    4 +-
 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c               |  124 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c               |   68 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |  266 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c               |  425 ++-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               | 1062 ++++----
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               | 1103 ++++----
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               | 1035 ++++---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 2816 ++++++++++++=
++++++++
 drivers/pinctrl/sh-pfc/pfc-sh7203.c                |    4 +-
 drivers/pinctrl/sh-pfc/pfc-sh7264.c                |    4 +-
 drivers/pinctrl/sh-pfc/pfc-sh7269.c                |    4 +-
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c                |   68 +-
 drivers/pinctrl/sh-pfc/pfc-sh7720.c                |    4 +-
 drivers/pinctrl/sh-pfc/pfc-sh7722.c                |    4 +-
 drivers/pinctrl/sh-pfc/pfc-sh7723.c                |    4 +-
 drivers/pinctrl/sh-pfc/pfc-sh7724.c                |    4 +-
 drivers/pinctrl/sh-pfc/pfc-sh7734.c                |  782 +++---
 drivers/pinctrl/sh-pfc/pfc-sh7757.c                |    4 +-
 drivers/pinctrl/sh-pfc/pfc-sh7785.c                |    4 +-
 drivers/pinctrl/sh-pfc/pfc-sh7786.c                |    4 +-
 drivers/pinctrl/sh-pfc/pfc-shx3.c                  |    4 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   93 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c              | 1828 +++++++++++-=
-
 drivers/pinctrl/sunxi/Kconfig                      |    4 +
 drivers/pinctrl/sunxi/Makefile                     |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31-r.c        |   24 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c         |  603 +++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |    8 +-
 drivers/pinctrl/uniphier/Kconfig                   |   14 +-
 drivers/pinctrl/uniphier/Makefile                  |    2 +-
 drivers/pinctrl/uniphier/pinctrl-ph1-ld4.c         |    5 +
 drivers/pinctrl/uniphier/pinctrl-ph1-ld6b.c        |    5 +
 drivers/pinctrl/uniphier/pinctrl-ph1-pro4.c        |   11 +
 drivers/pinctrl/uniphier/pinctrl-ph1-pro5.c        |    5 +
 drivers/pinctrl/uniphier/pinctrl-ph1-sld8.c        |    5 +
 drivers/pinctrl/uniphier/pinctrl-proxstream2.c     |    5 +
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c   |   10 +-
 drivers/usb/renesas_usbhs/rcar2.c                  |    1 -
 include/linux/pinctrl/devinfo.h                    |   10 +
 include/linux/pinctrl/pinconf-generic.h            |   64 +-
 include/linux/pinctrl/pinctrl-state.h              |    8 +
 91 files changed, 11047 insertions(+), 3000 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
 create mode 100644 drivers/pinctrl/berlin/berlin-bg4ct.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-broxton.c
 create mode 100644 drivers/pinctrl/pinctrl-at91-pio4.c
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a7795.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
