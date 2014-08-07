From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control bulk changes for the v3.17 cycle
Date: Thu, 7 Aug 2014 12:23:17 +0200
Message-ID: <CACRpkda+pZewCMp8BzkGcEvgDL0ZbwW6OujEOCVZW2pQtNghvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:59808 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754265AbaHGKXS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Aug 2014 06:23:18 -0400
Received: by mail-oa0-f46.google.com with SMTP id m1so2763684oag.19
        for <linux-gpio@vger.kernel.org>; Thu, 07 Aug 2014 03:23:17 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here is the bulk of the pin control changes for v3.17. I intended to
send the GPIO tree first, but it needs some icing on top to I need
to have it boiled in linux-next another night.

The information is in the tag as usual. I test-merged this branch
without problems on your master so it should be painless. Some
minor transient warnings from ignored return values may appear
on obscure drivers until the merge of the patch removing the
__must_check attribute from the gpiochip_remove() function appear
from the GPIO trees. Sorry for that, but would be unwise to rebase
the tree for that warning alone.

Please pull this in!

Yours,
Linus Walleij

The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626=
b38f:

  Linux 3.16-rc1 (2014-06-15 17:45:28 -1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.gi=
t
tags/pinctrl-v3.17-1

for you to fetch changes up to e1ee5c578fb1fa24b7ccaf1a11237a2bd70b6f9a=
:

  pinctrl: baytrail: Convert to use gpiolib irqchip (2014-07-28 12:21:0=
0 +0200)

----------------------------------------------------------------
This is the bulk pin control changes for the v3.17 merge
development cycle:

- Get rid of the .disable() callback from the driver callback
  vtable. This callback was abused and counterintuitive since
  a pin or group of pins can be said to always be in some
  setting, and never really disabled. We now only enable a
  certain muxing, and move between some certain muxings, we
  never "disable" a mux setting.

- Some janitorial moving the MSM, Samsung and Nomadik and
  drivers to their own subdirectories for a clearer view in
  the subsystem. This will continue.

- Kill off the use of the return value from gpiochip_remove(),
  this will be done in parallel in the GPIO subsystem and
  hopefully not trigger too many unchecked return value
  warnings before we get rid of this altogether.

- A huge set of changes and improvements to the Allwinner
  sunxi drivers especially for their latest A23 and A31 SoCs,
  and some ground work for the new sun8i platform family.

- A large set of Rockchip driver improvements adding support
  for the RK3288 SoC.

- Advances in migration of older Freescale platforms to pin
  control, especially i.MX1.

- Samsung and Exynos improvements.

- Support for the Qualcomm MSM8960 SoC.

- Use the gpiolib irqchip helpers for the ST SPEAr and
  Intel Baytrail drivers.

- A bunch of nice janitorial work done with cppcheck.

----------------------------------------------------------------
Alexander Shiyan (3):
      pinctrl: Add i.MX1 pincontrol driver
      pinctrl: i.MX27: Remove unused structure definition
      pinctrl: i.MX27: Remove nonexistent pad definitions

Andrey Utkin (1):
      pinctrl: msm: drop negativity check on unsigned value

Andy Gross (1):
      pinctrl: qcom: Add BUS_HOLD pin bias

Bjorn Andersson (2):
      pinctrl: msm: Add msm8960 definitions
      pinctrl: qcom: Make muxing of gpio function explicit

Chen-Yu Tsai (7):
      pinctrl: sunxi: Add IRQCHIP_SKIP_SET_WAKE flag for pinctrl irq ch=
ip
      pinctrl: sunxi: Fix multi bank interrupt support in gpio_to_irq
      pinctrl: sunxi: Remove gpio_out function from sun5i-a13 PG0/1/2 p=
ins
      pinctrl: sunxi: Add A23 PIO controller support
      pinctrl: sunxi: Add A23 R_PIO controller support
      pinctrl: sunxi: use gpiolib API to mark a GPIO used as an IRQ
      pinctrl: sunxi: number gpio ranges starting from 0

David PARIS (1):
      pinctrl: st: add IRQCHIP_SKIP_SET_WAKE flag

Eric Ernst (1):
      pinctrl: baytrail: Warn if direct IRQ GPIO set to output

=46an Wu (1):
      pinctrl: avoid duplicated calling enable_pinmux_setting for a pin

Geert Uytterhoeven (1):
      sh-pfc: Add renesas,pfc-r8a7791 to binding documentation

Hans de Goede (3):
      pinctrl: sunxi: Move setting of mux to irq type
      pinctrl: sunxi: Properly handle level triggered gpio interrupts
      pinctrl: sunxi: Define enable / disable irq callbacks

Heiko St=C3=BCbner (9):
      pinctrl: rockchip: generalize bank-quirks
      pinctrl: rockchip: precalculate iomux offsets
      pinctrl: rockchip: add support for 4bit wide iomux settings
      pinctrl: rockchip: enable iomuxes from pmu space
      pinctrl: rockchip: support unrouted iomuxes per bank
      pinctrl: rockchip: add support for rk3288 pin-controller
      pinctrl: rockchip: set is_generic in pinconf_ops
      pinctrl: rockchip: add separate type for rk3288
      pinctrl: rockchip: add drive-strength control for rk3288

Himangi Saraogi (1):
      sh-pfc: sh73a0: Introduce the use of devm_regulator_register

Linus Walleij (3):
      pinctrl: spear: switch plgpio to irqchip helpers
      pinctrl: msm: move all qualcomm drivers to subdir
      pinctrl: nomadik: move all Nomadik drivers to subdir

Maxime Ripard (6):
      pinctrl: sunxi: Remove irq_mask_ack and use irq_ack instead
      pinctrl: sunxi: Add macro definition for pinctrl with more than
one interrupt
      pinctrl: sunxi: Declare the number of interrupt banks in the desc=
riptor
      pinctrl: sunxi: Declare the interrupt function for the A31
      pinctrl: sunxi: Implement multiple interrupt banks support
      pinctrl: sunxi: Remove PINCTRL_SUNXI

Mika Westerberg (1):
      pinctrl: baytrail: Convert to use gpiolib irqchip

Nobuhiro Iwamatsu (1):
      pinctrl: sh-pfc: r8a7791: Add HSCIF pin support

Rickard Strandqvist (9):
      pinctrl: pinctrl-at91.c: Cleaning up if unsigned is less than zer=
o
      pinctrl: pinctrl-imx.c: Cleaning up if unsigned is less than zero
      pinctrl: pinctrl-imx1-core.c: Cleaning up if unsigned is less tha=
n zero
      pinctrl: pinctrl-st.c: Cleaning up if unsigned is less than zero
      pinctrl: pinctrl-at91.c: Cleaning up values that are never used
      pinctrl: pinctrl-single.c: Cleaning up values that are never used
      pinctrl: pinctrl-adi2.c: Cleaning up wrong format string usage
      pinctrl: pinctrl-single.c: Cleaning up wrong format string usage
      pinctrl: pinctrl-st.c: Cleaning up values that are never used

Sachin Kamat (2):
      pinctrl: bcm281xx: Staticize bcm281xx_pinctrl_probe
      pinctrl: samsung: Group all drivers in a sub-dir

Sergei Shtylyov (1):
      sh-pfc: r8a7791: add CAN pin groups

Tomasz Figa (5):
      pinctrl: samsung: Decouple direction setting from pinctrl
      pinctrl: samsung: Handle GPIO request and free using pinctrl help=
ers
      pinctrl: exynos: Consolidate irq_chips of GPIO and WKUP EINTs
      pinctrl: samsung: Allow grouping multiple pinmux/pinconf nodes
      pinctrl: samsung: Allow pin value to be initialized using pinfunc

Uwe Kleine-K=C3=B6nig (1):
      pinctrl: hide CONFIG_PINMUX and CONFIG_PINCONF

abdoulaye berthe (1):
      pinctrl: remove all usage of gpio_remove ret val in driver/pinctl

 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    2 +
 .../bindings/pinctrl/qcom,apq8064-pinctrl.txt      |    2 +-
 .../bindings/pinctrl/qcom,ipq8064-pinctrl.txt      |    2 +-
 .../bindings/pinctrl/qcom,msm8960-pinctrl.txt      |  181 +++
 .../bindings/pinctrl/qcom,msm8974-pinctrl.txt      |    2 +-
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 .../bindings/pinctrl/rockchip,pinctrl.txt          |    4 +-
 .../bindings/pinctrl/samsung-pinctrl.txt           |   24 +-
 arch/arm/boot/dts/imx27-pinfunc.h                  |   46 -
 arch/arm/mach-sunxi/Kconfig                        |    1 -
 drivers/pinctrl/Kconfig                            |  117 +-
 drivers/pinctrl/Makefile                           |   24 +-
 drivers/pinctrl/core.c                             |   24 +-
 drivers/pinctrl/nomadik/Kconfig                    |   51 +
 drivers/pinctrl/nomadik/Makefile                   |   10 +
 drivers/pinctrl/{ =3D> nomadik}/pinctrl-ab8500.c     |    0
 drivers/pinctrl/{ =3D> nomadik}/pinctrl-ab8505.c     |    0
 drivers/pinctrl/{ =3D> nomadik}/pinctrl-ab8540.c     |    0
 drivers/pinctrl/{ =3D> nomadik}/pinctrl-ab9540.c     |    0
 drivers/pinctrl/{ =3D> nomadik}/pinctrl-abx500.c     |   19 +-
 drivers/pinctrl/{ =3D> nomadik}/pinctrl-abx500.h     |    0
 .../pinctrl/{ =3D> nomadik}/pinctrl-nomadik-db8500.c |    0
 .../pinctrl/{ =3D> nomadik}/pinctrl-nomadik-db8540.c |    0
 .../{ =3D> nomadik}/pinctrl-nomadik-stn8815.c        |    0
 drivers/pinctrl/{ =3D> nomadik}/pinctrl-nomadik.c    |   18 +-
 drivers/pinctrl/{ =3D> nomadik}/pinctrl-nomadik.h    |    0
 drivers/pinctrl/pinctrl-adi2.c                     |   41 +-
 drivers/pinctrl/pinctrl-as3722.c                   |   11 +-
 drivers/pinctrl/pinctrl-at91.c                     |   27 +-
 drivers/pinctrl/pinctrl-baytrail.c                 |  103 +-
 drivers/pinctrl/pinctrl-bcm281xx.c                 |    2 +-
 drivers/pinctrl/pinctrl-bcm2835.c                  |   11 -
 drivers/pinctrl/pinctrl-coh901.c                   |   10 +-
 drivers/pinctrl/pinctrl-imx.c                      |    2 +-
 drivers/pinctrl/pinctrl-imx1-core.c                |    2 +-
 drivers/pinctrl/pinctrl-imx1.c                     |  279 +++++
 drivers/pinctrl/pinctrl-imx27.c                    |   52 -
 drivers/pinctrl/pinctrl-rockchip.c                 |  401 ++++--
 drivers/pinctrl/pinctrl-single.c                   |   61 +-
 drivers/pinctrl/pinctrl-st.c                       |   15 +-
 drivers/pinctrl/pinctrl-tb10x.c                    |   17 -
 drivers/pinctrl/pinctrl-tegra.c                    |   13 -
 drivers/pinctrl/pinctrl-tz1090-pdc.c               |   28 -
 drivers/pinctrl/pinctrl-tz1090.c                   |   58 -
 drivers/pinctrl/pinctrl-u300.c                     |   14 -
 drivers/pinctrl/pinmux.c                           |    4 -
 drivers/pinctrl/qcom/Kconfig                       |   42 +
 drivers/pinctrl/qcom/Makefile                      |    6 +
 drivers/pinctrl/{ =3D> qcom}/pinctrl-apq8064.c       |   19 +-
 drivers/pinctrl/{ =3D> qcom}/pinctrl-ipq8064.c       |   17 +-
 drivers/pinctrl/{ =3D> qcom}/pinctrl-msm.c           |   42 +-
 drivers/pinctrl/{ =3D> qcom}/pinctrl-msm.h           |    0
 drivers/pinctrl/qcom/pinctrl-msm8960.c             | 1282 ++++++++++++=
++++++++
 drivers/pinctrl/{ =3D> qcom}/pinctrl-msm8x74.c       |   29 +-
 drivers/pinctrl/samsung/Kconfig                    |   28 +
 drivers/pinctrl/samsung/Makefile                   |    7 +
 drivers/pinctrl/{ =3D> samsung}/pinctrl-exynos.c     |  307 +----
 drivers/pinctrl/{ =3D> samsung}/pinctrl-exynos.h     |    0
 drivers/pinctrl/{ =3D> samsung}/pinctrl-exynos5440.c |   10 +-
 drivers/pinctrl/{ =3D> samsung}/pinctrl-s3c24xx.c    |    0
 drivers/pinctrl/{ =3D> samsung}/pinctrl-s3c64xx.c    |    0
 drivers/pinctrl/{ =3D> samsung}/pinctrl-samsung.c    |  728 ++++++----=
-
 drivers/pinctrl/{ =3D> samsung}/pinctrl-samsung.h    |   18 +-
 drivers/pinctrl/sh-pfc/gpio.c                      |    9 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |  417 +++++++
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c                |   11 +-
 drivers/pinctrl/sh-pfc/pinctrl.c                   |   22 -
 drivers/pinctrl/sirf/pinctrl-sirf.c                |   10 -
 drivers/pinctrl/spear/Kconfig                      |    1 +
 drivers/pinctrl/spear/pinctrl-plgpio.c             |   84 +-
 drivers/pinctrl/spear/pinctrl-spear.c              |    7 -
 drivers/pinctrl/sunxi/Kconfig                      |   24 +-
 drivers/pinctrl/sunxi/Makefile                     |    2 +
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c          |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun5i-a10s.c         |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun5i-a13.c          |    4 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31-r.c        |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c          |  217 ++--
 drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c          |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c        |  142 +++
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23.c          |  593 +++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |  187 ++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |   44 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c               |   21 +-
 include/linux/pinctrl/pinmux.h                     |    2 -
 85 files changed, 4411 insertions(+), 1604 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt
 create mode 100644 drivers/pinctrl/nomadik/Kconfig
 create mode 100644 drivers/pinctrl/nomadik/Makefile
 rename drivers/pinctrl/{ =3D> nomadik}/pinctrl-ab8500.c (100%)
 rename drivers/pinctrl/{ =3D> nomadik}/pinctrl-ab8505.c (100%)
 rename drivers/pinctrl/{ =3D> nomadik}/pinctrl-ab8540.c (100%)
 rename drivers/pinctrl/{ =3D> nomadik}/pinctrl-ab9540.c (100%)
 rename drivers/pinctrl/{ =3D> nomadik}/pinctrl-abx500.c (98%)
 rename drivers/pinctrl/{ =3D> nomadik}/pinctrl-abx500.h (100%)
 rename drivers/pinctrl/{ =3D> nomadik}/pinctrl-nomadik-db8500.c (100%)
 rename drivers/pinctrl/{ =3D> nomadik}/pinctrl-nomadik-db8540.c (100%)
 rename drivers/pinctrl/{ =3D> nomadik}/pinctrl-nomadik-stn8815.c (100%=
)
 rename drivers/pinctrl/{ =3D> nomadik}/pinctrl-nomadik.c (99%)
 rename drivers/pinctrl/{ =3D> nomadik}/pinctrl-nomadik.h (100%)
 create mode 100644 drivers/pinctrl/pinctrl-imx1.c
 create mode 100644 drivers/pinctrl/qcom/Kconfig
 create mode 100644 drivers/pinctrl/qcom/Makefile
 rename drivers/pinctrl/{ =3D> qcom}/pinctrl-apq8064.c (95%)
 rename drivers/pinctrl/{ =3D> qcom}/pinctrl-ipq8064.c (95%)
 rename drivers/pinctrl/{ =3D> qcom}/pinctrl-msm.c (96%)
 rename drivers/pinctrl/{ =3D> qcom}/pinctrl-msm.h (100%)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8960.c
 rename drivers/pinctrl/{ =3D> qcom}/pinctrl-msm8x74.c (95%)
 create mode 100644 drivers/pinctrl/samsung/Kconfig
 create mode 100644 drivers/pinctrl/samsung/Makefile
 rename drivers/pinctrl/{ =3D> samsung}/pinctrl-exynos.c (79%)
 rename drivers/pinctrl/{ =3D> samsung}/pinctrl-exynos.h (100%)
 rename drivers/pinctrl/{ =3D> samsung}/pinctrl-exynos5440.c (99%)
 rename drivers/pinctrl/{ =3D> samsung}/pinctrl-s3c24xx.c (100%)
 rename drivers/pinctrl/{ =3D> samsung}/pinctrl-s3c64xx.c (100%)
 rename drivers/pinctrl/{ =3D> samsung}/pinctrl-samsung.c (71%)
 rename drivers/pinctrl/{ =3D> samsung}/pinctrl-samsung.h (93%)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-a23.c
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
