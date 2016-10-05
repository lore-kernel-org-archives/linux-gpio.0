From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control bulk changes for v4.9
Date: Wed, 5 Oct 2016 13:21:26 +0200
Message-ID: <CACRpkdaZXD7HdBwGGwY9JUJSm7HKnK=S5NcZCThk=10EcbCggw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:36017 "EHLO
        mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750774AbcJELV1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2016 07:21:27 -0400
Received: by mail-oi0-f49.google.com with SMTP id m72so96354265oik.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Oct 2016 04:21:27 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

this is the bulk of pin control changes for the v4.9 cycle.
Most of the details are in the signed tag as usual.

Mergewise, I have pulled an immutable branch from GPIO
in here so that the Cherryview driver can support masking off
BIOS-used IRQs properly.

We touch the file drivers/base/pinctrl.c but Greg has said that
that file is "mine" so I just merge the change in here.

All changes have been tested in -next for some time.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 9395452b4aab7bc2475ef8935b4a4fb99d778d70=
:

  Linux 4.8-rc6 (2016-09-11 20:02:25 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.9-1

for you to fetch changes up to 6bcf3f63394b9c4f133e4499349d786d7f531473:

  pinctrl: qcom: fix masking of pinmux functions (2016-10-04 00:36:20 +0200=
)

----------------------------------------------------------------
General improvements:

- Nicer debugfs output with one pin/config pair per line.

- Continued efforts to strictify module vs bool.

- Constification and similar from Coccinelle engineers.

- Return error from pinctrl_bind_pins()

- Pulling in the ability to selectively disable mapping of
  unusable IRQs from the GPIO subsystem.

New drivers:

- New driver for the Aspeed pin controller family: AST2400 (G4)
  and AST2500 (G5) are supported. These are used by OpenBMC
  on the IBM Witherspoon platform.

- New subdriver for the Allwinner sunxi GR8.

Driver improvements:

- Drop default IRQ trigger types assigned during IRQ mapping on
  AT91 and Nomadik. This error was identified by improvements in
  the IRQ core by Marc Zyngier.

- Active high/low types on the GPIO IRQs for the ST pin
  controller.

- IRQ support on GPIOs on the STM32 pin controller.

- Renesas Super-H/ARM sh-pfc: continued massive developments.

- Misc MXC improvements.

- SPDIF on the Allwiner A31 SoC

- IR remote and SPI NOR flash, NAND flash, I2C pins on the
  AMLogic SoC.

- PWM pins on the Meson.

- Do not map unusable IRQs (taken by BIOS) on the Intel Cherryview.

- Add GPIO IRQ wakeup support to the Intel driver so we can wake up
  from button pushes.

Deprecation:

- Deleted the obsolete STiH415/6 SoC support.

----------------------------------------------------------------
Agrawal, Nitesh-kumar (2):
      pinctrl/amd: Configure GPIO register using BIOS settings
      pinctrl/amd: switch to using a bool for level

Alexandre TORGUE (3):
      pinctrl: Add IRQ related DT properties of STM32 pinctrl
      pinctrl: Add IRQ support to STM32 gpios
      pinctrl: Fix "st,syscfg" definition for STM32 pinctrl

Andrew Jeffery (4):
      pinctrl: dt-bindings: Add documentation for Aspeed pin controllers
      pinctrl: Add core support for Aspeed SoCs
      pinctrl: Add pinctrl-aspeed-g4 driver
      pinctrl: Add pinctrl-aspeed-g5 driver

Arnd Bergmann (2):
      pinctrl: aspeed: fix regmap error handling
      pinctrl: stm32: add IRQ_DOMAIN_HIERARCHY dependency

Beniamino Galvani (1):
      pinctrl: meson: get rid of unneeded domain structures

Daniel Gl=C3=B6ckner (1):
      pinctrl: zynq: fix typo in sdio1_3_grp pin list

Deepak (1):
      driver: base: pinctrl: return error from pinctrl_bind_pins()

Geert Uytterhoeven (1):
      pinctrl: sh-pfc: r8a7795: Correct header from R-Car Gen3 to R8A7795

Jerome Brunet (3):
      pinctrl: amlogic: gxbb: add spi nor pins
      pinctrl: amlogic: gxbb: add nand pins
      pinctrl: amlogic: gxbb: add i2c pins

John Crispin (1):
      pinctrl: qcom: fix masking of pinmux functions

Julia Lawall (6):
      pinctrl: nomadik: use of_property_read_bool
      pinctrl: ns2: constify pinctrl_ops and pinmux_ops structures
      pinctrl: nsp: constify pinctrl_ops and pinmux_ops structures
      pinctrl: bcm281xx: constify pinctrl_ops and pinmux_ops structures
      pinctrl: stm32: constify gpio_chip structures
      pinctrl: mediatek: constify gpio_chip structures

LABBE Corentin (1):
      pinctrl: palmas: fix a possible NULL dereference

Laurent Pinchart (1):
      pinctrl: sh-pfc: r8a7795: Add DU support

Linus Walleij (7):
      Merge tag 'sh-pfc-for-v4.9-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge tag 'sh-pfc-for-v4.9-tag2' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge tag 'sh-pfc-for-v4.9-tag3' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      pinctrl: nomadik: don't default-flag IRQs as falling
      Merge branch 'gpio-irq-validmask' into devel
      Merge tag 'v4.8-rc6' into devel
      Merge branch 'fixes' into devel

Marc Zyngier (1):
      pinctrl/at91: Don't provide a default trigger type

Marcus Cooper (1):
      pinctrl: sun6i: add SPDIF to pin description.

Martin Blumenstingl (3):
      pinctrl: amlogic: gxbb: add the IR remote input pin
      pinctrl: meson-gxbb: add the pins for the SDIO/sd_emmc_a controller
      pinctrl: meson-gxbb: add the missing SDIO interrupt pin

Mika Westerberg (3):
      gpiolib: Make it possible to exclude GPIOs from IRQ domain
      pinctrl: cherryview: Do not add all southwest and north GPIOs to
IRQ domain
      pinctrl: cherryview: Convert to use devm_gpiochip_add_data()

Milo Kim (1):
      pinctrl: sunxi: Remove unsupported PWM channel pinmux in H3

Myl=C3=A8ne Josserand (1):
      pinctrl: sunxi: Add GR8 controller support

Neil Armstrong (1):
      pinctrl: meson-gxbb: add pins for PWM

Niklas S=C3=B6derlund (1):
      pinctrl: sh-pfc: Return pinconf with arguments in packed format

Nilesh Bacchewar (1):
      pinctrl: intel: Configure GPIO chip IRQ as wakeup interrupts

Patrice Chotard (1):
      pinctrl: st: Use second parameter to gpio specifier

Paul Gortmaker (6):
      pinctrl: mediatek: make mtk-common explicitly non-modular
      pinctrl: nomadik: make abx500 explicitly non-modular
      pinctrl: nomadik: make core support explicitly non-modular
      pinctrl: rockchip: make it explicitly non-modular
      pinctrl: sirf: make atlas7 explicitly non-modular
      pinctrl: sirf: make core support explicitly non-modular

Peter Griffin (2):
      pinctrl: st: Remove STiH415/6 SoC pinctrl driver support.
      pinctrl: st: Remove obsolete platforms from pinctrl-st dt doc

Sergei Shtylyov (9):
      pinctrl: sh-pfc: Fix overly long lines
      pinctrl: sh-pfc: Add R8A7792 PFC support
      pinctrl: sh-pfc: r8a7792: Add EtherAVB pin groups
      pinctrl: sh-pfc: r8a7792: Add SDHI pin groups
      pinctrl: sh-pfc: r8a7792: Add CAN pin groups
      pinctrl: sh-pfc: r8a7792: Add VIN pin groups
      pinctrl: sh-pfc: r8a7792: Add DU pin groups
      pinctrl: sh-pfc: r8a7792: Add QSPI pin groups
      pinctrl: sh-pfc: r8a7792: Add MSIOF pin groups

Simon Horman (4):
      pinctrl: sh-pfc: r8a7796: Add voltage switch operations for SDHI
      pinctrl: sh-pfc: Add PORT_GP_24 helper macro
      pinctrl: sh-pfc: r8a7791: Implement voltage switching for SDHI
      pinctrl: sh-pfc: r8a7794: Implement voltage switching for SDHI

Stephen Boyd (1):
      pinctrl: qcom: Add generic ssbi and spmi GPIO/MPP bindings

Sylwester Nawrocki (1):
      pinctrl: samsung: Remove an always false dev->of_node test

Takeshi Kihara (3):
      pinctrl: sh-pfc: Initial R8A7796 PFC support
      pinctrl: sh-pfc: r8a7796: Add SCIF pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Add SDHI pins, groups and functions

Ulrich Hecht (1):
      pinctrl: sh-pfc: r8a7795: Add bias pinconf support

Vincent Stehl=C3=A9 (1):
      pinctrl: intel: merrifield: fix dup size in probe

Vladimir Zapolskiy (4):
      pinctrl: imx: output one pin/config pair per line in pinconf-groups
      pinctrl: imx: accept gpio request/free from pinctrl
      gpio: mxc: shift gpio_mxc_init() to subsys_initcall level
      gpio: mxc: add generic gpio request/free callbacks to pinctrl

perr perr (1):
      pinctrl: exynos: remove duplicate calls in irq handler

 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    1 +
 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |   65 +
 .../devicetree/bindings/pinctrl/pinctrl-st.txt     |   39 +-
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |    5 +-
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  |    5 +-
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    2 +
 .../bindings/pinctrl/st,stm32-pinctrl.txt          |    5 +
 Documentation/gpio/driver.txt                      |    6 +
 drivers/base/pinctrl.c                             |   12 +-
 drivers/gpio/gpio-mxc.c                            |    7 +-
 drivers/gpio/gpiolib.c                             |   66 +-
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/aspeed/Kconfig                     |   24 +
 drivers/pinctrl/aspeed/Makefile                    |    6 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         | 1231 +++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  808 ++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  498 ++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  569 ++++
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             |    4 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |    4 +-
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c              |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx.c            |    6 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |   55 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |   33 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c         |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |    7 +-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |  199 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |  222 +-
 drivers/pinctrl/meson/pinctrl-meson.h              |   52 +-
 drivers/pinctrl/meson/pinctrl-meson8.c             |   24 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c            |   24 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |    8 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |   13 +-
 drivers/pinctrl/pinctrl-amd.c                      |   14 +
 drivers/pinctrl/pinctrl-at91.c                     |    2 +-
 drivers/pinctrl/pinctrl-palmas.c                   |    4 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |    7 +-
 drivers/pinctrl/pinctrl-st.c                       |   93 +-
 drivers/pinctrl/pinctrl-zynq.c                     |    2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |    2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    1 +
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |    1 +
 drivers/pinctrl/samsung/pinctrl-exynos.c           |    6 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   10 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |   10 +
 drivers/pinctrl/sh-pfc/Makefile                    |    2 +
 drivers/pinctrl/sh-pfc/core.c                      |   12 +
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |   29 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c               | 2739 ++++++++++++++++=
++++
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               |   28 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  356 ++-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               | 2671 ++++++++++++++++=
+++
 drivers/pinctrl/sh-pfc/pinctrl.c                   |    8 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |  113 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |    5 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c                |   12 +-
 drivers/pinctrl/stm32/Kconfig                      |    5 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  165 +-
 drivers/pinctrl/sunxi/Kconfig                      |    4 +
 drivers/pinctrl/sunxi/Makefile                     |    1 +
 drivers/pinctrl/sunxi/pinctrl-gr8.c                |  541 ++++
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c          |   12 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c           |    1 -
 include/linux/gpio/driver.h                        |    6 +
 65 files changed, 10354 insertions(+), 516 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-aspee=
d.txt
 create mode 100644 drivers/pinctrl/aspeed/Kconfig
 create mode 100644 drivers/pinctrl/aspeed/Makefile
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed.c
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed.h
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a7792.c
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a7796.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-gr8.c
