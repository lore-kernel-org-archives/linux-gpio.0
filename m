From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control bulk changes for the v3.20 cycle
Date: Wed, 11 Feb 2015 16:11:34 +0800
Message-ID: <CACRpkdYyN2qsyX5aRUgGY5BxSiU=-_0LVbopWATDbDBKGnEMmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:40676 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751061AbbBKILf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Feb 2015 03:11:35 -0500
Received: by mail-ob0-f173.google.com with SMTP id uy5so1831650obc.4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2015 00:11:34 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here is the pin control big pull request for the v3.20 series.
A lot of action, two new drivers and two deleted subdrivers.
Details on the changes are in the signed tag as usual.

I merged in v3.19-rc6 some time back to get rid of some
pointless conflicts.

Please pull it in.

Yours,
Linus Walleij

The following changes since commit 26bc420b59a38e4e6685a73345a0def46113=
6dce:

  Linux 3.19-rc6 (2015-01-25 20:04:41 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.gi=
t
tags/pinctrl-v3.20-1

for you to fetch changes up to f724e05baaf0677151c339c0249a05876c779a1d=
:

  sh-pfc: emev2 - Fix mangled author name (2015-02-05 14:51:34 +0100)

----------------------------------------------------------------
This is the bulk of pin control changes for the v3.20 cycle:

- Framework changes and enhancements:
  - Passing -DDEBUG recursively to subdir drivers so we get
    debug messages properly turned on.
  - Infer map type from DT property in the groups parsing code
    in the generic pinconfig code.
  - Support for custom parameter passing in generic pin config.
    This is used when you are using the generic pin config, but
    want to add a few custom properties that no other driver
    will use.

- New drivers:
  - Driver for the Xilinx Zynq
  - Driver for the AmLogic Meson SoCs

- New features in drivers:
  - Sleep support (suspend/resume) for the Cherryview driver
  - mvebeu a38x can now mux a UART on pins MPP19 and MPP20
  - Migrated the qualcomm driver to generic pin config handling
    of extended config options in the core code.
  - Support BUS1 and AUDIO in the Exynos pin controller.
  - Add some missing functions in the sun6i driver.
  - Add support for the A31S variant in the sun6i driver.
  - EMEv2 support in the Renesas PFC driver.
  - Ass support for Qualcomm MSM8916 in the qcom driver.

- Deleted features
  - Drop support for the SiRF Marco that was never released to
    the market.
  - Drop SH7372 support as the support for this platform is
    removed from the kernel.

----------------------------------------------------------------
Andreas F=C3=A4rber (1):
      pinctrl: zynq: Fix usb0 pins

Anjana Sasindran (1):
      staging: drivers: pinctrl: Fixed checkpatch.pl warnings

Arnd Bergmann (1):
      pinctrl: hide PCONFDUMP in #ifdef

Barry Song (1):
      pinctrl: sirf: drop marco support

Beniamino Galvani (1):
      pinctrl: add driver for Amlogic Meson SoCs

Doug Anderson (1):
      pinctrl: rockchip: Only mask interrupts; never disable

Geert Uytterhoeven (1):
      sh-pfc: emev2 - Fix mangled author name

Hans de Goede (2):
      pinctrl: sun6i: Add some missing functions
      pinctrl: sun6i: Add A31s pinctrl support

Joonwoo Park (2):
      pinctrl: qcom: increase variable size for register offsets
      pinctrl: qcom: Add msm8916 pinctrl driver

Krzysztof Kozlowski (2):
      pinctrl: dove: Constify struct regmap_config and of_device_id
      pinctrl: bcm281xx: Constify struct regmap_config

Linus Walleij (4):
      pinctrl: nomadik:fix up device tree bindings
      pinctrl: pass -DDEBUG in subdirs
      pinctrl: pinconf-generic: loose DT dependence
      Merge tag 'v3.19-rc6' into devel

Magnus Damm (2):
      pinctrl: sh-pfc: sh7372: Remove PFC support
      pinctrl: sh-pfc: sh7372: Remove DT binding documentation

Maxime Ripard (1):
      pinctrl: mvebu: a38x: Add UART1 muxing options

Mika Westerberg (2):
      pinctrl: cherryview: Save and restore pin configs over system sle=
ep
      pinctrl: cherryview: Configure HiZ pins to be input when
requested as GPIOs

Niklas S=C3=B6derlund (2):
      sh-pfc: add macro to define pinmux without function
      sh-pfc: Add emev2 pinmux support

Padmavathi Venna (1):
      pinctrl: exynos: Add AUDIO pin controller for exynos7

Sergei Shtylyov (3):
      sh-pfc: r8a7791: fix typo in MLB_CLK
      sh-pfc: r8a7791: add MLB+ pin group
      sh-pfc: r8a7790: add MLB+ pin group

Soren Brinkmann (5):
      pinctrl: pinconf-generic: Infer map type from DT property
      pinctrl: pinconf-generic: Allow driver to specify DT params
      pinctrl: zynq: Document DT binding
      pinctrl: Add driver for Zynq
      pinctrl: qcom-spmi-gpio: Migrate to pinconf-generic

Stanimir Varbanov (2):
      DT: pinctrl: Document Qualcomm MSM8916 pinctrl binding
      pinctrl: qcom: delete pin_config_get/set pinconf operations

Uwe Kleine-K=C3=B6nig (2):
      pinctrl: pinctrl-imx: don't use invalid value of conf_reg
      pinctrl: imx25: fix numbering for pins

Vivek Gautam (2):
      Documentation: dt-bindings: Add aliases information for Exynos7
pin controllers
      pinctrl: exynos: Add BUS1 pin controller for exynos7

Wolfram Sang (2):
      pinctrl: intel: drop owner assignment from platform_drivers
      pinctrl: consumer: use correct retval for placeholder functions

 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    1 +
 .../bindings/pinctrl/qcom,msm8916-pinctrl.txt      |  186 ++
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    9 +-
 .../bindings/pinctrl/samsung-pinctrl.txt           |   12 +
 .../devicetree/bindings/pinctrl/ste,nomadik.txt    |   35 +-
 .../bindings/pinctrl/xlnx,zynq-pinctrl.txt         |  104 +
 drivers/pinctrl/Kconfig                            |   18 +-
 drivers/pinctrl/Makefile                           |    4 +-
 drivers/pinctrl/freescale/pinctrl-imx.c            |    2 +-
 drivers/pinctrl/freescale/pinctrl-imx25.c          |  276 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |  122 +-
 drivers/pinctrl/meson/Makefile                     |    2 +
 drivers/pinctrl/meson/pinctrl-meson.c              |  761 ++++++
 drivers/pinctrl/meson/pinctrl-meson.h              |  209 ++
 drivers/pinctrl/meson/pinctrl-meson8.c             | 1089 ++++++++
 drivers/pinctrl/mvebu/pinctrl-armada-38x.c         |    6 +-
 drivers/pinctrl/mvebu/pinctrl-dove.c               |    4 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |    2 +-
 drivers/pinctrl/pinconf-generic.c                  |  206 +-
 drivers/pinctrl/pinconf.c                          |    4 +-
 drivers/pinctrl/pinconf.h                          |   22 +-
 drivers/pinctrl/pinctrl-bcm281xx.c                 |    4 +-
 drivers/pinctrl/pinctrl-falcon.c                   |    3 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |   50 +-
 drivers/pinctrl/pinctrl-tz1090-pdc.c               |    2 +-
 drivers/pinctrl/pinctrl-tz1090.c                   |    2 +-
 drivers/pinctrl/pinctrl-zynq.c                     | 1180 +++++++++
 drivers/pinctrl/qcom/Kconfig                       |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   17 -
 drivers/pinctrl/qcom/pinctrl-msm.h                 |   10 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c             | 1005 ++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |  129 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   29 +
 drivers/pinctrl/sh-pfc/Kconfig                     |   10 +-
 drivers/pinctrl/sh-pfc/Makefile                    |    2 +-
 drivers/pinctrl/sh-pfc/core.c                      |   18 +-
 drivers/pinctrl/sh-pfc/core.h                      |    2 +-
 drivers/pinctrl/sh-pfc/pfc-emev2.c                 | 1711 ++++++++++++=
+
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               |   13 +
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |   21 +-
 drivers/pinctrl/sh-pfc/pfc-sh7372.c                | 2645 ------------=
--------
 drivers/pinctrl/sh-pfc/pinctrl.c                   |    2 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    2 +
 drivers/pinctrl/sirf/pinctrl-sirf.c                |   51 +-
 drivers/pinctrl/sirf/pinctrl-sirf.h                |    1 -
 drivers/pinctrl/sunxi/Kconfig                      |    4 +
 drivers/pinctrl/sunxi/Makefile                     |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c          |    5 +
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31s.c         |  815 ++++++
 include/dt-bindings/gpio/meson8-gpio.h             |  157 ++
 include/linux/pinctrl/consumer.h                   |    6 +-
 include/linux/pinctrl/pinconf-generic.h            |   29 +
 include/linux/pinctrl/pinctrl.h                    |   12 +
 54 files changed, 7863 insertions(+), 3158 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.txt
 create mode 100644 drivers/pinctrl/meson/Makefile
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson.h
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson8.c
 create mode 100644 drivers/pinctrl/pinctrl-zynq.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8916.c
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-emev2.c
 delete mode 100644 drivers/pinctrl/sh-pfc/pfc-sh7372.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun6i-a31s.c
 create mode 100644 include/dt-bindings/gpio/meson8-gpio.h
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
