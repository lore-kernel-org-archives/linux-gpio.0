From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control bulk changes for v4.12
Date: Tue, 2 May 2017 13:37:06 +0200
Message-ID: <CACRpkdan7AtkMrEWFHMC6OeZRJocrJYaXg+DoiCi=T3ZBGvf=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:32771 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751009AbdEBLhI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 May 2017 07:37:08 -0400
Received: by mail-io0-f182.google.com with SMTP id o22so24564187iod.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 May 2017 04:37:08 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

this is the big bulk of pin control changes for v4.12.

The extra week before the merge window actually resulted
in some of the type of fixes that usually arrive after the merge
window already starting to trickle in from eager developers using
-next, I'm impressed.

I have recruited a Samsung subsubsystem maintainer (Krzysztof)
to deal with the onset of Samsung patches. It works great.

Apart from that it is a boring round, just incremental updates
and fixes all over the place, no serious core changes or
anything exciting like that. The most pleasing to see is Julia
Cartwrights work to audit the irqchip-providing drivers for realtime
locking compliance. It's one of those "I should really get around
to looking into that" things that have been on my TODO list
since forever.

More details in the signed tag.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201=
:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.12-1

for you to fetch changes up to 1aa2faf52f76d49669f6613b9521618ab2bc63b2:

  pinctrl: mediatek: Add missing pinctrl bindings for mt7623
(2017-04-28 09:54:41 +0200)

----------------------------------------------------------------
This is the bulk of pin control changes for the v4.12 cycle:

Core changes:

- Add bi-directional and output-enable pin configurations to
  the generic bindings and generic pin controlling core.

New drivers or subdrivers:

- Armada 37xx SoC pin controller and GPIO support.

- Axis ARTPEC-6 SoC pin controller support.

- AllWinner A64 R_PIO controller support, and opening up the
  AllWinner sunxi driver for ARM64 use.

- Rockchip RK3328 support.

- Renesas R-Car H3 ES2.0 support.

- STM32F469 support in the STM32 driver.

- Aspeed G4 and G5 pin controller support.

Improvements:

- A whole slew of realtime improvements to drivers implementing
  irqchips: BCM, AMD, SiRF, sunxi, rockchip.

- Switch meson driver to get the GPIO ranges from the device
  tree.

- Input schmitt trigger support on the Rockchip driver.

- Enable the sunxi (AllWinner) driver to also be used on ARM64
  silicon.

- Name the Qualcomm QDF2xxx GPIO lines.

- Support GMMR GPIO regions on the Intel Cherryview. This
  fixes a serialization problem on these platforms.

- Pad retention support for the Samsung Exynos 5433.

- Handle suspend-to-ram in the AT91-pio4 driver.

- Pin configuration support in the Aspeed driver.

Cleanups:

- The final name of Rockchip RK1108 was RV1108 so rename the
  driver and variables to stay consistent.

----------------------------------------------------------------
Alexandre Belloni (1):
      pinctrl: at91-pio4: handle suspend to ram

Alexandre TORGUE (5):
      pinctrl: stm32: add possibility to use gpio-ranges to declare bank ra=
nge
      pinctrl: stm32: replace device_initcall() with arch_initcall()
      Documentation: dt: Remove ngpios from stm32-pinctrl binding
      pinctrl: stm32: Add STM32F469 MCU support
      pinctrl: Add st,stm32f469-pinctrl compatible to stm32-pinctrl

Andrew Jeffery (5):
      pinctrl: aspeed: Fix unused-const-variable warnings
      pinctrl: aspeed: Document pinconf in devicetree bindings
      pinctrl: aspeed: Add core pinconf support
      pinctrl: aspeed: g4: Add pinconf support
      pinctrl: aspeed: g5: Add pinconf support

Andy Shevchenko (2):
      pinctrl: Fix spelling typos
      pinctrl: core: Make pinctrl_init_controller() static

Andy Yan (2):
      dt-bindings: rockchip,pinctrl: rename RK1108 to RV1108
      pinctrl: rockchip: rename RK1108 to RV1108

Charles Keepax (4):
      pinctrl: Fix trivial spelling typo in a comment
      pinctrl: samsung: Remove unused local variable
      pinctrl: samsung: Register pinctrl before GPIO
      pinctrl: samsung: Use devres version of gpiochip_add_data

Colin Ian King (1):
      ARM: at91/at91-pinctrl documentation: fix spelling mistake:
"contoller" -> "controller"

Geert Uytterhoeven (7):
      pinctrl: sh-pfc: r8a7795: Fix hscif2_clk_b and hscif4_ctrl
      pinctrl: sh-pfc: r8a7795: Restore sort order
      pinctrl: sh-pfc: Update info pointer after SoC-specific init
      pinctrl: sh-pfc: r8a7795: Add support for R-Car H3 ES2.0
      pinctrl: sh-pfc: r8a7795: Add SCIF support
      pinctrl: sh-pfc: r8a7795: Add SCIF_CLK support
      pinctrl: pinmux: Fix kerneldoc for pinmux_generic_add_function()

Gregory CLEMENT (3):
      pinctrl: dt-bindings: Add documentation for Armada 37xx pin controlle=
rs
      pinctrl: armada-37xx: Add pin controller support for Armada 37xx
      pinctrl: armada-37xx: Add gpio support

Hans de Goede (1):
      pinctrl: cherryview: Add support for GMMR GPIO opregion

Icenowy Zheng (5):
      pinctrl: sunxi: refactor pinctrl choice selecting for ARM64
      dt-bindings: fix for Allwinner H5 pinctrl's compatible
      dt: bindings: add binding for Allwinner A64 R_PIO pinctrl
      pinctrl: sunxi: Add A64 R_PIO controller support
      pinctrl: sunxi: select GPIOLIB

Jacopo Mondi (2):
      Documentation: pinctrl: Add "pinmux" property
      pinctrl: generic: Add bi-directional and output-enable

Jeffy Chen (1):
      pinctrl: rockchip: add irq_enable & irq_disable ops

Jerome Brunet (4):
      pinctrl: meson: gxbb: add i2s output pins
      pinctrl: meson: gxbb: add spdif output pins
      pinctrl: meson: gxl: add i2s output pins
      pinctrl: meson: gxl: add spdif output pins

Jesper Nilsson (2):
      pinctrl: Add bindings for ARTPEC-6 pinmux
      pinctrl: Add pincontrol driver for ARTPEC-6 SoC

John Keeping (4):
      pinctrl: rockchip: remove unnecessary locking
      pinctrl: rockchip: convert to raw spinlock
      pinctrl: rockchip: split out verification of mux settings
      pinctrl: rockchip: avoid hardirq-unsafe functions in irq_chip

Julia Cartwright (4):
      pinctrl: bcm: make use of raw_spinlock variants
      pinctrl: amd: make use of raw_spinlock variants
      pinctrl: sirf: atlas7: make use of raw_spinlock variants
      pinctrl: sunxi: make use of raw_spinlock variants

Krzysztof Kozlowski (1):
      MAINTAINERS: pinctrl: Add git tree to Samsung pinctrl entry

Linus Walleij (4):
      Merge tag 'sh-pfc-for-v4.12-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge tag 'sh-pfc-for-v4.12-tag2' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge tag 'samsung-pinctrl-4.12' of
git://git.kernel.org/.../pinctrl/samsung into devel
      Merge tag 'sh-pfc-for-v4.12-tag3' of
git://git.kernel.org/.../geert/renesas-drivers into devel

Marek Szyprowski (2):
      pinctrl: samsung: Ensure that pad retention is disabled on driver ini=
t
      pinctrl: samsung: Add support for pad retention control for
Exynos5433 SoCs

Martin Blumenstingl (3):
      pinctrl: meson: gxl: add the missing PWM pin definitions
      pinctrl: meson: meson8b: fix the NAND DQS pins
      pinctrl: meson: meson8b: rename the NAND DQS pin definitions

Masahiro Yamada (2):
      pinctrl: uniphier: remove obsoleted compatibles
      pinctrl: uniphier: make drivers non-modular

Neil Armstrong (2):
      pinctrl: meson-gxl: Fix inverted registers and add missing pins
      pinctrl: meson: use gpio-ranges from DT

Paul Gortmaker (1):
      pinctrl: make artpec6 explicitly non-modular

Rick Altherr (1):
      pinctrl: aspeed: Allow disabling Port D and Port E loopback mode

Sean Wang (1):
      pinctrl: mediatek: Add missing pinctrl bindings for mt7623

Sergei Shtylyov (5):
      pinctrl: sh-pfc: r8a7791: Add missing HSCIF1 pinmux data
      pinctrl: sh-pfc: r8a7791: Add missing DVC_MUTE signal
      pinctrl: sh-pfc: r8a7791: Fix SCIF2 pinmux data
      pinctrl: sh-pfc: r8a7791: Fix IPSR comment typos
      pinctrl: sh-pfc: r8a7794: Swap ATA signals

Thierry Reding (1):
      pinctrl: tegra: xusb: Silence sparse warnings

Timur Tabi (1):
      pinctrl: qcom: qdf2xxx: add names to the gpios

Wei Yongjun (2):
      pinctrl: artpec6: Remove .owner field for driver
      pinctrl: artpec6: Fix return value check in artpec6_pmx_probe()

david.wu (5):
      pinctrl: rockchip: Add 3bit width mux support
      pinctrl: rockchip: Add mux recalculation support
      pinctrl: rockchip: Add rk3328 pinctrl support
      pinctrl: rockchip=EF=BC=9AAdd input schmitt support
      pinctrl: rockchip: Add input schmitt support for rk3328

 .../bindings/clock/armada3700-xtal-clock.txt       |    7 +-
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    3 +-
 .../bindings/pinctrl/atmel,at91-pinctrl.txt        |    2 +-
 .../bindings/pinctrl/axis,artpec6-pinctrl.txt      |   85 +
 .../pinctrl/marvell,armada-37xx-pinctrl.txt        |  183 +
 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |   40 +-
 .../bindings/pinctrl/pinctrl-bindings.txt          |   48 +-
 .../bindings/pinctrl/rockchip,pinctrl.txt          |   17 +-
 .../bindings/pinctrl/st,stm32-pinctrl.txt          |    3 +-
 MAINTAINERS                                        |    4 +
 arch/arm/boot/dts/rk1108.dtsi                      |    2 +-
 drivers/pinctrl/Kconfig                            |   11 +
 drivers/pinctrl/Makefile                           |    3 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  129 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  153 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  225 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |   28 +
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |   44 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             |   46 +-
 drivers/pinctrl/core.c                             |   10 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |   47 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |   49 +
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |  186 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |   14 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c            |   12 +-
 drivers/pinctrl/mvebu/Kconfig                      |    7 +
 drivers/pinctrl/mvebu/Makefile                     |    3 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |  748 +++
 drivers/pinctrl/pinconf-generic.c                  |    5 +-
 drivers/pinctrl/pinconf.c                          |    4 +-
 drivers/pinctrl/pinctrl-amd.c                      |   66 +-
 drivers/pinctrl/pinctrl-amd.h                      |    2 +-
 drivers/pinctrl/pinctrl-artpec6.c                  |  979 ++++
 drivers/pinctrl/pinctrl-at91-pio4.c                |   34 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |  443 +-
 drivers/pinctrl/pinmux.c                           |    2 +-
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c             |   14 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   63 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   47 +-
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    3 +
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               |   18 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               |   16 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           | 5705 ++++++++++++++++=
++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 4200 +++-----------
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    1 +
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |   44 +-
 drivers/pinctrl/stm32/Kconfig                      |    6 +
 drivers/pinctrl/stm32/Makefile                     |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  115 +-
 drivers/pinctrl/stm32/pinctrl-stm32f429.c          |    6 +-
 drivers/pinctrl/stm32/pinctrl-stm32f469.c          | 1578 ++++++
 drivers/pinctrl/stm32/pinctrl-stm32f746.c          |    7 +-
 drivers/pinctrl/stm32/pinctrl-stm32h743.c          |    6 +-
 drivers/pinctrl/sunxi/Kconfig                      |   13 +-
 drivers/pinctrl/sunxi/Makefile                     |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c       |  125 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   26 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |    2 +-
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |    4 +
 drivers/pinctrl/uniphier/Kconfig                   |   16 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c   |   48 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c   |   11 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c   |   11 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c    |   13 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c   |   13 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c   |   13 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c   |   13 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c   |   13 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c   |   13 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier.h        |   11 +-
 include/dt-bindings/pinctrl/mt7623-pinfunc.h       |   30 +-
 include/linux/pinctrl/pinconf-generic.h            |    3 +
 73 files changed, 11882 insertions(+), 3972 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
 create mode 100644 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
 create mode 100644 drivers/pinctrl/pinctrl-artpec6.c
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32f469.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c
