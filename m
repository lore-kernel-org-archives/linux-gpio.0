From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control bulk changes for the v4.11 kernel cycle
Date: Tue, 21 Feb 2017 10:05:20 +0100
Message-ID: <CACRpkda+U66SuTHoDncA=1RH_KnBB5hKNLPEx0Ec2NbtsDskhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:38304 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751086AbdBUJFW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Feb 2017 04:05:22 -0500
Received: by mail-it0-f42.google.com with SMTP id y135so42850514itc.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Feb 2017 01:05:22 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

this is the pin control bulk pull request for v4.11. As usual the details
are in the signed tag. I think it's pretty big this time.

Some merge mechanics:

- We hit some code sites in drivers/rtc and drivers/tty/serial due to
  refactoring of APIs.

- We merge an immutable branch into drivers/soc because of Samsung
  Exynos dependencies. This will appear in other pull requests too I guess.

- We merge an immutable branch from the GPIO tree that hits a whole slew
  of sites in drivers/gpio, and obviously these changes will also be visibl=
e
  in the GPIO pull request.

- I merged in the v4.10-rc2 tag because of dependencies for SH-PFC
  on fixes that were clashing with new development in linux-next.

- I merged in the v4.10-rc6 tag because of dependencies on fixes for
  Samsung Exynos that was needed for new development, and having
  that conflict in linux-next would just be too annoying because it certain=
ly
  wasn't trivial.

Still there is a smallish conflict with ARM SoC in the Exynos machine,
where they are fixing a file that was deleted and moved into pin control,
as reported by Stephen:

commit:

  b4765037fc8c ("ARM: EXYNOS: Constify list of retention registers")

from the arm-soc tree and commit:

  07731019c59c ("pinctrl: samsung: Move retention control from
mach-exynos to the pinctrl driver")

from the pinctrl tree.

Hm we should have coordinated that better I guess. Well whether ARM
SoC or this hits your tree first: the file in mach-exynos should be deleted=
.

Apart from that it should be pretty self contained and fine for merge.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 566cf877a1fcb6d6dc0126b076aad062054c2637=
:

  Linux 4.10-rc6 (2017-01-29 14:25:17 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.11-1

for you to fetch changes up to baafacab092e282c69f57a90dc2c4ed25b083e22:

  pinctrl: samsung: Fix return value check in
samsung_pinctrl_get_soc_data() (2017-02-13 15:48:18 +0100)

----------------------------------------------------------------
Pin control bulk changes for the v4.11 kernel cycle:

Core changes:

- Switch the generic pin config argument from 16 to 24 bits,
  only use 8 bits for the configuration type. We might need to
  encode more information about a certain setting than we need
  to encode different generic settings.

- Add a cross-talk API to the pin control GPIO back-end,
  utilizing pinctrl_gpio_set_config() from GPIO drivers that
  want to set up a certain pin configuration in the back-end.
  This also includes the .set_config() refactoring of the
  GPIO chips, so that they pass a generic configuration for
  things like debouncing and single ended (typically open
  drain). This change has also been merged in an immutable
  branch to the GPIO tree.

- Take hogs with a delayed work, so that we finalize probing
  a pin controller before trying to get any hogs.

- For pin controllers putting all group and function definitions
  into the device tree, we now have generic code to deal with
  this and it is used in two drivers so far.

- Simplifications of the pin request conflict check.

- Make dt_free_map() optional.

Updates to drivers:

- pinctrl-single now use the generic helpers to generate dynamic
  group and function tables from the device tree.

- Texas Instruments IOdelay configuration driver add-on to
  pinctrl-single.

- i.MX: use radix trees to store groups and functions, use the new
  generic group and function helpers to manage them.

- Intel: add support for hardware debouncing and 1K pull-down.
  New subdriver for the Gemini Lake SoC.

- Renesas SH-PFC: drive strength and bias support, CAN bus muxing,
  MSIOF, SDHI, HSCIF for r8a7796. Gyro-ADC supporton r8a7791.

- Aspeed: use syscon cross-dependencies to set up related bits in
  the LPC host controller and display controller.

- Aspeed: finalize G4 and G5 support. Fix mux configuration on
  GPIOs. Add banks Y, Z, AA, AB and AC.

- AMD: support additional GPIO.

- STM32: set this controller to strict muxing mode.
  STM32H743 MCU support.

- Allwinner sunxi: deep simplifications on how to support
  subvariants of SoCs without adding to much SoC-specific data
  for each subvariant, especially for sun5i variants. New driver
  for V3s SoCs. New driver for the H5 SoC. Support A31/A31s
  variants with the new variant framework.

- Mvebu: simplifications to use a MMIO and regmap abstraction.
  New subdrivers for the 98DX3236, 98DX5241 SoCs.

- Samsung Exynos: delete Exynos4415 support. Add crosstalk to the
  SoC driver to access regmaps. Add infrastructure for pin-bank
  retention control. Clean out the pin retention control from
  arch/arm/mach-exynos and arch/arm/mach-s5p and put it properly
  in the Samsung pin control driver(s).

- Meson: add HDMI HPD/DDC pins. Add pwm_ao_b pin.

- Qualcomm: use raw spinlock variants: this makes the qualcomm
  driver realtime-safe.

----------------------------------------------------------------
Alexander Stein (1):
      pinctrl: baytrail: Fix debugfs offset output

Alexandre TORGUE (5):
      pinctrl: stm32: fix bad location of gpiochip_lock_as_irq
      include: dt-bindings: Add STM32H7 pinctrl DT defines
      pinctrl: stm32: Add STM32H743 MCU support
      pinctrl: Add STM32 pinctrl driver DT bindings
      pinctrl: Amend bindings for STM32 pinctrl

Andreas Klinger (1):
      pinctrl: fix DT bindings for marvell,kirkwood-pinctrl

Andrew Jeffery (8):
      pinctrl: aspeed: dt: Fix compatibles for the System Control Unit
      pinctrl: aspeed: Read and write bits in LPC and GFX controllers
      pinctrl: aspeed-g4: Add mux configuration for all pins
      pinctrl: aspeed-g5: Add mux configuration for all pins
      pinctrl: aspeed: Fix kerneldoc return descriptions
      pinctrl: aspeed: g4: Fix mux configuration for GPIOs AA[4-7], AB[0-7]
      gpio: aspeed: Add banks Y, Z, AA, AB and AC
      gpio: aspeed: Remove dependence on GPIOF_* macros

Andy Shevchenko (3):
      pinctrl: baytrail: Convert to use devm_*()
      pinctrl: broxton: Rename apl-pinctrl driver
      pinctrl: broxton: No need to take pointer of a pointer

Arnd Bergmann (2):
      pinctrl: mvebu: remove unused variable
      pinctrl: samsung: mark PM functions as __maybe_unused

Bjorn Andersson (1):
      pinctrl: Drop error prints on kzalloc() failure

Chen-Yu Tsai (3):
      pinctrl: sunxi: Support A31/A31s with pinctrl variants
      pinctrl: sunxi: Remove redundant A31s pinctrl driver
      pinctrl: sunxi: Remove stray printk call in sun5i driver's probe func=
tion

Chris Paterson (2):
      pinctrl: sh-pfc: r8a7796: Add CAN support
      pinctrl: sh-pfc: r8a7796: Add CAN FD support

Christophe JAILLET (2):
      pinctrl: sirf: atlas7: Add missing 'of_node_put()'
      pinctrl: sirf: atlas7: Improve code layout

Colin Ian King (2):
      pinctrl: single: fix spelling mistakes on "Ivalid"
      pinctrl: ti-iodelay: remove redundant pin < 0 check on unsigned int

Dan Carpenter (2):
      pinctrl/amd: white space cleanups in amd_gpio_dbg_show()
      pinctrl: intel: unlock on error in intel_config_set_pull()

David Lechner (1):
      pinctrl: da850-pupd: Add to module device table

Fabio Estevam (1):
      pinctrl: imx7d-pinctrl: Fix a typo

Gabriel Fernandez (1):
      pinctrl: stm32: activate strict mux mode

Gary Bisson (4):
      pinctrl: imx: remove const qualifier of imx_pinctrl_soc_info
      pinctrl: imx: use radix trees for groups and functions
      pinctrl: imx: use generic pinctrl helpers for managing groups
      pinctrl: imx: use generic pinmux helpers for managing functions

Icenowy Zheng (2):
      pinctrl: sunxi: add driver for V3s SoC
      drivers: pinctrl: add driver for Allwinner H5 SoC

Jacopo Mondi (1):
      pinctrl: sh-pfc: r8a7791: Add ADI pinconf support

Jean Delvare (1):
      pinctrl: mediatek: Use real dependencies

Joel Stanley (1):
      gpio: aspeed: Make bank names strings

John Crispin (1):
      pinctrl: update my email address

Jon Hunter (1):
      pinctrl: Fix panic when pinctrl devices with hogs are unregistered

Julia Cartwright (1):
      pinctrl: qcom: Use raw spinlock variants

Kalyan Kinthada (1):
      pinctrl: mvebu: pinctrl driver for 98DX3236 SoC

Krzysztof Kozlowski (1):
      pinctrl: samsung: Remove support for Exynos4415 (SoC not
supported anymore)

Linus Walleij (11):
      pinctrl: add some comments to the hog/late init code
      pinctrl: stricten up generic group code
      pinctrl: qcom: msm8660: rename some SDC1->SDC4
      pinctrl: amd: fix compilation warning
      Merge tag 'sh-pfc-for-v4.11-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge branch 'ib-pinctrl-genprops' into devel
      Merge tag 'v4.10-rc2' into devel
      Merge tag 'samsung-drivers-soc-pmu-4.11' of
git://git.kernel.org/.../krzk/linux into devel
      Merge tag 'v4.10-rc6' into devel
      Merge branch 'ib-mvebu-98dx3236' into devel
      Merge tag 'sh-pfc-for-v4.11-tag2' of
git://git.kernel.org/.../geert/renesas-drivers into devel

Marek Szyprowski (13):
      soc: samsung: pmu: Provide global function to get PMU regmap
      soc: samsung: pmu: Use of_device_get_match_data helper
      soc: samsung: pmu: Remove messages for failed memory allocation
      pinctrl: samsung: Document Exynos3250 SoC support
      pinctrl: samsung: Remove messages for failed memory allocation
      pinctrl: samsung: Fix samsung_pinctrl_create_functions return value
      pinctrl: samsung: Add missing initconst annotation
      pinctrl: samsung: Use generic of_device_get_match_data helper
      pinctrl: samsung: Remove dead code
      pinctrl: samsung: Add infrastructure for pin-bank retention control
      pinctrl: samsung: Move retention control from mach-exynos to the
pinctrl driver
      pinctrl: samsung: Move retention control from mach-s5pv210 to
the pinctrl driver
      pinctrl: samsung: Replace syscore ops with standard platform device p=
m_ops

Markus Elfring (5):
      pinctrl: mvebu: Use kmalloc_array() in mvebu_pinctrl_dt_node_to_map()
      pinctrl: mvebu: Delete an error message for a failed memory
allocation in three functions
      pinctrl: mvebu: Delete an unnecessary return statement in
mvebu_pinconf_group_dbg_show()
      pinctrl: mvebu: Use seq_puts() in mvebu_pinconf_group_dbg_show()
      pinctrl: mvebu: Use seq_putc() in mvebu_pinconf_group_dbg_show()

Martin Blumenstingl (1):
      pinctrl: meson: meson-gxl: add the pwm_ao_b pin

Maxime Ripard (3):
      pinctrl: sunxi: Add pinctrl variants
      pinctrl: sunxi: Add common sun5i pinctrl driver
      pinctrl: sunxi: Remove old sun5i pinctrl drivers

Mika Westerberg (7):
      pinctrl: intel: Convert to use devm_gpiochip_add_data()
      pinctrl: Widen the generic pinconf argument from 16 to 24 bits
      pinctrl: Allow configuration of pins from gpiolib based drivers
      pinctrl / gpio: Introduce .set_config() callback for GPIO chips
      pinctrl: intel: Add support for hardware debouncer
      pinctrl: intel: Add support for 1k additional pull-down
      pinctrl: intel: Add Intel Gemini Lake pin controller support

Neil Armstrong (1):
      pinctrl: meson: Add HDMI HPD/DDC pins functions

Niklas S=C3=B6derlund (3):
      pinctrl: sh-pfc: r8a7796: Add drive strength support
      pinctrl: sh-pfc: r8a7796: Add bias pinconf support
      pinctrl: sh-pfc: r8a7795: Support none GPIO pins bias setting

Nishanth Menon (1):
      pinctrl: Introduce TI IOdelay configuration driver

Paul Gortmaker (4):
      pinctrl: sunxi: make sun5i explicitly non-modular
      pinctrl: mvebu: make bool drivers explicitly non-modular
      pinctrl: spear: make bool drivers explicitly non-modular
      pinctrl: berlin: make bool drivers explicitly non-modular

Russell King (5):
      pinctrl: mvebu: constify mvebu_mpp_ctrl structures
      pinctrl: mvebu: provide per-control private data
      pinctrl: mvebu: provide generic simple mmio-based implementation
      pinctrl: mvebu: switch drivers to generic simple mmio
      pinctrl: mvebu: add simple regmap based pinctrl implementation

Shah, Nehal-bakulchandra (1):
      pinctrl: amd: Add support for additional GPIO

Simon Horman (1):
      pinctrl: sh-pfc: r8a7793: Implement voltage switching for SDHI

Takeshi Kihara (1):
      pinctrl: sh-pfc: r8a7796: Add MSIOF pins, groups and functions

Thierry Reding (1):
      pinctrl: Initialize pinctrl_dev.node

Tony Lindgren (7):
      pinctrl: core: Use delayed work for hogs
      pinctrl: core: Add generic pinctrl functions for managing groups
      pinctrl: core: Add generic pinctrl functions for managing groups
      pinctrl: single: Use generic pinctrl helpers for managing groups
      pinctrl: single: Use generic pinmux helpers for managing functions
      pinctrl: core: Make dt_free_map optional
      pinctrl: core: Fix regression caused by delayed work for hogs

Ulrich Hecht (1):
      pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups, and functions

Vladimir Zapolskiy (1):
      pinctrl: simplify check for pin request conflicts

Wei Yongjun (2):
      pinctrl/amd: Drop pinctrl_unregister for devm_ registered device
      pinctrl: samsung: Fix return value check in samsung_pinctrl_get_soc_d=
ata()

 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    1 +
 .../bindings/pinctrl/fsl,imx7d-pinctrl.txt         |    2 +-
 .../pinctrl/marvell,armada-98dx3236-pinctrl.txt    |   46 +
 .../bindings/pinctrl/marvell,kirkwood-pinctrl.txt  |   20 +-
 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  131 +-
 .../bindings/pinctrl/samsung-pinctrl.txt           |    1 +
 .../bindings/pinctrl/st,stm32-pinctrl.txt          |   59 +-
 .../devicetree/bindings/pinctrl/ti,iodelay.txt     |   47 +
 Documentation/gpio/driver.txt                      |    9 +-
 Documentation/pinctrl.txt                          |    4 +-
 arch/arm/mach-exynos/suspend.c                     |   64 -
 arch/arm/mach-s5pv210/pm.c                         |    7 -
 arch/arm/mach-s5pv210/regs-clock.h                 |    4 -
 drivers/gpio/gpio-aspeed.c                         |  187 +-
 drivers/gpio/gpio-bcm-kona.c                       |   14 +-
 drivers/gpio/gpio-dln2.c                           |   12 +-
 drivers/gpio/gpio-dwapb.c                          |   14 +-
 drivers/gpio/gpio-ep93xx.c                         |   11 +-
 drivers/gpio/gpio-f7188x.c                         |   19 +-
 drivers/gpio/gpio-lp873x.c                         |   14 +-
 drivers/gpio/gpio-max77620.c                       |   20 +-
 drivers/gpio/gpio-menz127.c                        |   34 +-
 drivers/gpio/gpio-merrifield.c                     |   14 +-
 drivers/gpio/gpio-omap.c                           |   14 +-
 drivers/gpio/gpio-tc3589x.c                        |   15 +-
 drivers/gpio/gpio-tegra.c                          |   14 +-
 drivers/gpio/gpio-tps65218.c                       |   14 +-
 drivers/gpio/gpio-vx855.c                          |   13 +-
 drivers/gpio/gpio-wcove.c                          |   13 +-
 drivers/gpio/gpio-wm831x.c                         |   21 +-
 drivers/gpio/gpio-wm8994.c                         |   13 +-
 drivers/gpio/gpiolib.c                             |   56 +-
 drivers/pinctrl/Kconfig                            |   12 +-
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         | 1115 ++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         | 1524 ++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  165 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |   33 +-
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             |    6 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |    2 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |    6 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             |    6 +-
 drivers/pinctrl/berlin/berlin-bg2.c                |    9 +-
 drivers/pinctrl/berlin/berlin-bg2cd.c              |    9 +-
 drivers/pinctrl/berlin/berlin-bg2q.c               |    9 +-
 drivers/pinctrl/berlin/berlin-bg4ct.c              |    9 +-
 drivers/pinctrl/core.c                             |  401 +++-
 drivers/pinctrl/core.h                             |   55 +
 drivers/pinctrl/devicetree.c                       |   31 +-
 drivers/pinctrl/devicetree.h                       |   12 +-
 drivers/pinctrl/freescale/Kconfig                  |    3 +-
 drivers/pinctrl/freescale/pinctrl-imx.c            |  300 ++-
 drivers/pinctrl/freescale/pinctrl-imx.h            |   34 +-
 drivers/pinctrl/intel/Kconfig                      |    8 +
 drivers/pinctrl/intel/Makefile                     |    1 +
 drivers/pinctrl/intel/pinctrl-baytrail.c           |   19 +-
 drivers/pinctrl/intel/pinctrl-broxton.c            |    5 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |    4 +-
 drivers/pinctrl/intel/pinctrl-geminilake.c         |  512 +++++
 drivers/pinctrl/intel/pinctrl-intel.c              |  171 +-
 drivers/pinctrl/intel/pinctrl-intel.h              |    8 +-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |    1 -
 drivers/pinctrl/mediatek/Kconfig                   |   15 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c          |    2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |   14 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt7623.h      |    2 +-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |   19 +
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |   27 +
 drivers/pinctrl/meson/pinctrl-meson.c              |    2 -
 drivers/pinctrl/mvebu/pinctrl-armada-370.c         |   32 +-
 drivers/pinctrl/mvebu/pinctrl-armada-375.c         |   32 +-
 drivers/pinctrl/mvebu/pinctrl-armada-38x.c         |   32 +-
 drivers/pinctrl/mvebu/pinctrl-armada-39x.c         |   32 +-
 drivers/pinctrl/mvebu/pinctrl-armada-xp.c          |  199 +-
 drivers/pinctrl/mvebu/pinctrl-dove.c               |  113 +-
 drivers/pinctrl/mvebu/pinctrl-kirkwood.c           |   41 +-
 drivers/pinctrl/mvebu/pinctrl-mvebu.c              |  180 +-
 drivers/pinctrl/mvebu/pinctrl-mvebu.h              |   65 +-
 drivers/pinctrl/mvebu/pinctrl-orion.c              |   16 +-
 drivers/pinctrl/pinconf.c                          |   12 +
 drivers/pinctrl/pinconf.h                          |    9 +
 drivers/pinctrl/pinctrl-amd.c                      |   51 +-
 drivers/pinctrl/pinctrl-amd.h                      |    8 +-
 drivers/pinctrl/pinctrl-da850-pupd.c               |    3 +-
 drivers/pinctrl/pinctrl-falcon.c                   |    2 +-
 drivers/pinctrl/pinctrl-lantiq.c                   |    2 +-
 drivers/pinctrl/pinctrl-lantiq.h                   |    2 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  |   10 +-
 drivers/pinctrl/pinctrl-max77620.c                 |    2 +-
 drivers/pinctrl/pinctrl-palmas.c                   |    2 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |    2 +-
 drivers/pinctrl/pinctrl-single.c                   |  299 +--
 drivers/pinctrl/pinctrl-sx150x.c                   |   55 +-
 drivers/pinctrl/pinctrl-xway.c                     |    2 +-
 drivers/pinctrl/pinmux.c                           |  216 ++-
 drivers/pinctrl/pinmux.h                           |   56 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   48 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c             |    6 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |  386 ++--
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c          |   12 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |  132 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   43 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |   87 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |  450 +++--
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               | 1920 ++++++++++++++++=
++-
 drivers/pinctrl/sh-pfc/pinctrl.c                   |    4 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |   16 +-
 drivers/pinctrl/spear/pinctrl-plgpio.c             |    7 +-
 drivers/pinctrl/spear/pinctrl-spear1310.c          |   12 -
 drivers/pinctrl/spear/pinctrl-spear1340.c          |   12 -
 drivers/pinctrl/spear/pinctrl-spear300.c           |   12 -
 drivers/pinctrl/spear/pinctrl-spear310.c           |   12 -
 drivers/pinctrl/spear/pinctrl-spear320.c           |   12 -
 drivers/pinctrl/stm32/Kconfig                      |    5 +
 drivers/pinctrl/stm32/Makefile                     |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32.c              |   38 +-
 drivers/pinctrl/stm32/pinctrl-stm32h743.c          | 1980 ++++++++++++++++=
++++
 drivers/pinctrl/sunxi/Kconfig                      |   22 +-
 drivers/pinctrl/sunxi/Makefile                     |    7 +-
 drivers/pinctrl/sunxi/pinctrl-gr8.c                |  536 ------
 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c          |  558 ++++++
 drivers/pinctrl/sunxi/pinctrl-sun5i-a13.c          |  403 ----
 .../{pinctrl-sun5i-a10s.c =3D> pinctrl-sun5i.c}      |  190 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c          |  184 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31s.c         |  809 --------
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c          |  321 ++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   79 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |   32 +-
 drivers/pinctrl/ti/Kconfig                         |   10 +
 drivers/pinctrl/ti/Makefile                        |    1 +
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            |  937 +++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c   |    4 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c               |    2 +-
 drivers/rtc/rtc-omap.c                             |    2 +-
 drivers/soc/samsung/exynos-pmu.c                   |   22 +-
 drivers/staging/greybus/gpio.c                     |   15 +-
 drivers/usb/serial/cp210x.c                        |   13 +-
 include/dt-bindings/pinctrl/stm32h7-pinfunc.h      | 1612 ++++++++++++++++
 include/linux/gpio/driver.h                        |   37 +-
 include/linux/pinctrl/consumer.h                   |    6 +
 include/linux/pinctrl/pinconf-generic.h            |   52 +-
 include/linux/pinctrl/pinctrl.h                    |   15 +
 include/linux/soc/samsung/exynos-pmu.h             |   10 +
 143 files changed, 14077 insertions(+), 3931 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/marvell,armada-98dx3236-pinctrl.t=
xt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,iodelay.tx=
t
 create mode 100644 drivers/pinctrl/intel/pinctrl-geminilake.c
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32h743.c
 delete mode 100644 drivers/pinctrl/sunxi/pinctrl-gr8.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
 delete mode 100644 drivers/pinctrl/sunxi/pinctrl-sun5i-a13.c
 rename drivers/pinctrl/sunxi/{pinctrl-sun5i-a10s.c =3D> pinctrl-sun5i.c} (=
83%)
 delete mode 100644 drivers/pinctrl/sunxi/pinctrl-sun6i-a31s.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
 create mode 100644 drivers/pinctrl/ti/Kconfig
 create mode 100644 drivers/pinctrl/ti/Makefile
 create mode 100644 drivers/pinctrl/ti/pinctrl-ti-iodelay.c
 create mode 100644 include/dt-bindings/pinctrl/stm32h7-pinfunc.h
