From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO changes for the v4.4 kernel cycle
Date: Mon, 2 Nov 2015 11:49:18 +0100
Message-ID: <CACRpkdYuBEz87VP3s0rJ=_N_OgBW3r92Z2whLNMcuiLJtpV7kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is the bulk of GPIO changes for the v4.4 development cycle.
The details are in the signed tag as usual.

The only changes hitting outside drivers/gpio are in the pin control
subsystem and these seem to have settled nicely in linux-next.

Development mistakes and catfights are nicely documented in the
reverts as you can see. The outcome of the ABI fight is that we're
working on a chardev ABI for GPIO now, where hope to show results
for the v4.5 kernel.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 1f93e4a96c9109378204c147b3eec0d0e810=
0fde:

  Linux 4.3-rc2 (2015-09-20 14:32:34 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.4-1

for you to fetch changes up to 0963670aeaec2287aa263daa0d41384d4dcd5292=
:

  gpio: fix up SPI submenu (2015-11-01 10:50:19 +0100)

----------------------------------------------------------------
This is the bulk of GPIO changes for v4.4:

GPIO core:
- Define and handle flags for open drain/open collector
  and open source/open emitter, also know as "single-ended"
  configurations.
- Generic request/free operations that handle calling out
  to the (optional) pin control backend.
- Some refactoring related to an ABI change that did not
  happen, yet provide useful.
- Added a real-time compliance checklist. Many GPIO chips
  have irqchips, and need to think this over with the RT
  patches going upstream.
- Restructure, fix and clean up Kconfig menus a bit.

New drivers:
- New driver for AMD Promony.
- New driver for ACCES 104-IDIO-16, a port-mapped I/O
  card, ISA-style. Very retro.

Subdriver changes:
- OMAP changes to handle real time requirements.
- Handle trigger types for edge and level IRQs on PL061
  properly. As this hardware is very common it needs to
  set a proper example for others to follow.
- Some container_of() cleanups.
- Delete the unused MSM driver in favor of the driver that
  is embedded inside the pin control driver.
- Cleanup of the ath79 GPIO driver used by many, many
  OpenWRT router targets.
- A consolidated IT87xx driver replacing the earlier
  very specific IT8761e driver.
- Handle the TI TCA9539 in the PCA953x driver. Also
  handle ACPI devices in this subdriver.
- Drop xilinx arch dependencies as these FPGAs seem to
  profilate over a few different architectures. MIPS and
  ARM come to mind.

----------------------------------------------------------------
Alban Bedel (2):
      gpio: ath79: Convert to the state container design pattern
      gpio: MAINTAINERS: Add an entry for the ATH79 GPIO driver

Andy Shevchenko (2):
      gpio: pca953x: store driver_data for future use
      gpio: pca953x: support ACPI devices found on Galileo Gen2

Dan Carpenter (1):
      gpio: pl061: returning with lock held in pl061_irq_type()

Diego Elio Petten=C3=B2 (1):
      gpio: add GPIO support for IT87xx, replacing gpio-it8761e

Dirk Behme (1):
      gpio: gpiolib: don't compare an unsigned for >=3D 0

Grygorii Strashko (4):
      gpio: omap: move pm runtime in irq_chip.irq_bus_lock/sync_unlock
      gpio: omap: convert to use generic irq handler
      gpio: omap: fix static checker warning
      gpio: add a real time compliance notes

Guenter Roeck (1):
      gpio: generic: Revert to old error handling in bgpio_map

Heiner Kallweit (3):
      gpio: generic: improve error handling in bgpio_map
      gpio: generic: modernize remapping
      gpio: generic: use error pointers

Jonas Gorski (5):
      gpiolib: provide generic request/free implementations
      gpio: replace trivial implementations of request/free with generi=
c one
      gpio: gpio-xz: use the generic request/free implementations
      gpio: pl061: use the generic request/free implementations
      pinctrl: replace trivial implementations of gpio_chip request/fre=
e

Julia Lawall (1):
      gpio: max730x: eliminate double free

Kamlakant Patel (1):
      gpio: xlp: Convert to use gpiolib irqchip helpers

Laurent Pinchart (2):
      gpiolib: Split GPIO flags parsing and GPIO configuration
      gpiolib: Add and use OF_GPIO_SINGLE_ENDED flag

Linus Walleij (17):
      gpio: keep the GPIO line names internal
      gpio: pl061: detail IRQ trigger handling
      gpio: etraxfs: use container_of() to get state container
      gpio: altera: use container_of() to get state container
      gpio: sx150x: use container_of() to get state container
      gpio: vf610: use container_of() to get state container
      gpio: zynq: use container_of() to get state container
      gpio: add DT bindings for existing consumer flags
      Revert "gpio-sysfs: Use gpio descriptor name instead of gpiochip
names array"
      gpio: pl061: assign the apropriate handler for irqs
      gpio: add a real time compliance checklist
      Revert "gpio: add a real time compliance checklist"
      gpio: group port-mapped I/O drivers in a menu
      gpio: dt-bindings: document the official use of "ngpios"
      gpio: drop surplus X86 dependencies
      gpio: drop surplus I2C dependencies
      gpio: fix up SPI submenu

Markus Pargmann (5):
      gpiolib-of: Rename gpio_hog functions to be generic
      gpio: Introduce gpio descriptor 'name'
      gpiolib: Use GPIO name from names array for gpio descriptor
      gpio-sysfs: Use gpio descriptor name instead of gpiochip names ar=
ray
      gpiolib: Add gpio name information to /sys/kernel/debug/gpio

Mika Westerberg (1):
      gpio / ACPI: Allow shared GPIO event to be read via operation reg=
ion

Nicholas Krause (1):
      gpio: Fix error checking in the function device_pca957x_init

Richard Fitzgerald (1):
      gpio: arizona: add support for WM8998 and WM1814

Soren Brinkmann (2):
      gpio: xilinx: Drop architecture dependencies
      gpio: zynq: Document interrupt-controller DT binding

Stephen Boyd (1):
      gpio: msm: Remove unused driver

Thierry Reding (1):
      gpio: pca953x: Add TI TCA9539 support

William Breathitt Gray (2):
      gpio: Add GPIO support for the ACCES 104-IDIO-16
      gpio: Add ACCES 104-IDIO-16 driver maintainer entry

YD Tseng (1):
      gpio: driver for AMD Promontory

Zubair Lutfullah Kakakhel (1):
      gpio/xilinx: enable for MIPS

 .../devicetree/bindings/gpio/gpio-msm.txt          |  26 --
 .../devicetree/bindings/gpio/gpio-pca953x.txt      |   1 +
 .../devicetree/bindings/gpio/gpio-zynq.txt         |   9 +
 Documentation/devicetree/bindings/gpio/gpio.txt    |  41 +-
 Documentation/gpio/driver.txt                      |  80 ++++
 MAINTAINERS                                        |  14 +
 drivers/gpio/Kconfig                               | 196 ++++-----
 drivers/gpio/Makefile                              |   5 +-
 drivers/gpio/gpio-104-idio-16.c                    | 216 ++++++++++
 drivers/gpio/gpio-altera.c                         |  15 +-
 drivers/gpio/gpio-amdpt.c                          | 261 ++++++++++++
 drivers/gpio/gpio-arizona.c                        |   2 +
 drivers/gpio/gpio-ath79.c                          | 119 +++---
 drivers/gpio/gpio-etraxfs.c                        |  23 +-
 drivers/gpio/gpio-generic.c                        |  58 +--
 drivers/gpio/gpio-it87.c                           | 411 +++++++++++++=
++++++
 drivers/gpio/gpio-it8761e.c                        | 230 -----------
 drivers/gpio/gpio-lpc18xx.c                        |  14 +-
 drivers/gpio/gpio-max730x.c                        |   1 -
 drivers/gpio/gpio-moxart.c                         |  14 +-
 drivers/gpio/gpio-msm-v2.c                         | 453 -------------=
--------
 drivers/gpio/gpio-mvebu.c                          |  14 +-
 drivers/gpio/gpio-omap.c                           |  82 ++--
 drivers/gpio/gpio-pca953x.c                        |  45 +-
 drivers/gpio/gpio-pl061.c                          | 112 +++--
 drivers/gpio/gpio-sx150x.c                         |  31 +-
 drivers/gpio/gpio-tb10x.c                          |  14 +-
 drivers/gpio/gpio-tz1090-pdc.c                     |  14 +-
 drivers/gpio/gpio-vf610.c                          |  43 +-
 drivers/gpio/gpio-xlp.c                            |  21 +-
 drivers/gpio/gpio-zx.c                             |  28 +-
 drivers/gpio/gpio-zynq.c                           |  32 +-
 drivers/gpio/gpiolib-acpi.c                        |  21 +-
 drivers/gpio/gpiolib-legacy.c                      |   8 +-
 drivers/gpio/gpiolib-of.c                          |  20 +-
 drivers/gpio/gpiolib.c                             | 175 ++++++--
 drivers/gpio/gpiolib.h                             |   3 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |  14 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |  14 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |  14 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |  14 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |  18 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |  22 +-
 drivers/pinctrl/pinctrl-adi2.c                     |  14 +-
 drivers/pinctrl/pinctrl-as3722.c                   |  14 +-
 drivers/pinctrl/pinctrl-at91.c                     |  26 +-
 drivers/pinctrl/pinctrl-coh901.c                   |  22 +-
 drivers/pinctrl/pinctrl-digicolor.c                |  14 +-
 drivers/pinctrl/pinctrl-pistachio.c                |  14 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |  14 +-
 drivers/pinctrl/pinctrl-st.c                       |  14 +-
 drivers/pinctrl/pinctrl-xway.c                     |  18 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |  16 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |  14 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |  14 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |  14 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |  14 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c               |  14 +-
 include/dt-bindings/gpio/gpio.h                    |  12 +
 include/linux/gpio/consumer.h                      |   1 +
 include/linux/gpio/driver.h                        |   3 +
 include/linux/of_gpio.h                            |   1 +
 62 files changed, 1728 insertions(+), 1473 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-msm.txt
 create mode 100644 drivers/gpio/gpio-104-idio-16.c
 create mode 100644 drivers/gpio/gpio-amdpt.c
 create mode 100644 drivers/gpio/gpio-it87.c
 delete mode 100644 drivers/gpio/gpio-it8761e.c
 delete mode 100644 drivers/gpio/gpio-msm-v2.c
