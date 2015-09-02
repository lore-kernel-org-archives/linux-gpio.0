From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] bulk GPIO changes for the v4.3 kernel cycle
Date: Wed, 2 Sep 2015 23:56:50 +0200
Message-ID: <CACRpkdbo45_8-r_pBdrWPxjQjzSKc4ang_LdHn-vb+RwJyUg7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34591 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755200AbbIBV4u convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Sep 2015 17:56:50 -0400
Received: by obcts10 with SMTP id ts10so20331202obc.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2015 14:56:50 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

there is quite a lot going on in the GPIO subsystem this merge
window, so the main matter is decribed in the signed tag.

The hits in other subsystems when making the GPIO flags
optional are all ACKed by their respective subsystem
maintainers.

The development cycle was a bit rough, I had to merge in
-rc4 to get rid of some conflicts and revert a patch that was
messing up a later patch. Watch out if you get merge
conflicts (tested on your HEAD earlier and it worked fine,
but you never know).

Please pull this in!

Yours,
Linus Walleij


The following changes since commit cbfe8fa6cd672011c755c3cd85c9ffd4e2d1=
0a6f:

  Linux 4.2-rc4 (2015-07-26 12:26:21 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.3-1

for you to fetch changes up to 01e2dae991771adb1257eb5cd3cecfda1aa09ba9=
:

  Revert "gpio: extraxfs: fix returnvar.cocci warnings" (2015-08-31
08:56:04 +0200)

----------------------------------------------------------------
This is the bulk of GPIO changes for the v4.3 kernel cycle:

Core changes:

- Root out the wrapper devm_gpiod_get() and gpiod_get() etc
  versions of the descriptor calls that did not use the flags
  argument on the end. This was around for too long and eventually
  Uwe Kleine-K=C3=B6nig took the time to clean it out and the last
  users are removed along with the macros in this tag. In several
  cases the use of flags simplifies the code. For this reason we
  have (ACKed) patches hitting in DRM, IIO, media, NFC, USB+PHY
  up until we hammer in the nail with removing the macros.

- Add a fat document describing how much ready-made GPIO stuff
  we have i the kernel to discourage people from reinventing
  a square wheel in userspace, as so often happens.

- Create a separate lockdep class for each instance of a GPIO
  IRQ chip instead of using one class for all chips, as the current
  code will not work with systems with several GPIO chips doing
  lockdep debugging.

- Protect against driver unloading also when a GPIO line is only
  used as IRQ for the GPIOLIB_IRQCHIP helpers.

- If the GPIO chip has no designated owner, assign the parent
  device driver owner as owner.

- Consolidation of chained IRQ handler install/remove replacing
  all call sites where irq_set_handler_data() and
  irq_set_chained_handler() were done in succession with a
  combined call to irq_set_chained_handler_and_data(). This
  series was created by Thomas Gleixner after the problem was
  observed by Russell King.

- Tglx also made another series of patches switching
  __irq_set_handler_locked() for irq_set_handler_locked() which
  is way cleaner.

- Tglx and Jiang Liu wrote a good bunch of patches to make use of
  irq_desc_get_xxx() accessors and avoid looking up irq_descs
  from IRQ numbers. The goal is to get rid of the irq number
  from the handlers in the IRQ flow which is nice.

- Rob Herring killed off the set_irq_flags() for all GPIO
  drivers. This was an ARM specific function that is replaced
  with the generic irq_modify_status() where special flags
  are actually needed.

- When an OF node has a pin range for its GPIOs, return
  -EPROBE_DEFER if the pin controller isn't available.
  Pretty logical, yet needed to be fixed.

- If a driver using GPIOLIB_IRQCHIP has its own
  irq_*_resources call back, then call these instead of the
  defaults provided by the GPIOLIB.

- Fix an undocumented ABI hole: named GPIOs were not
  properly documented.

Driver improvements:

- Add get_direction() support to the generic GPIO driver, it's
  strange that we didn't have that before.

- Make it possible to have input-only GPIO chips using the
  generic GPIO driver.

- Clean out platform data support from the Emma Mobile (EM)
  driver

- Finegrained runtime PM support for the RCAR driver.

- Support r8a7795 (R-car H3) in the RCAR driver.

- Support interrupts on GPIOs 16 thru 31 in the DaVinci driver.

- Some consolidation and new support in the MPC8xxx driver,
  we now support MPC5125.

- Preempt-RT-friendly patches: the OMAP, MPC8xxx, drivers uses raw
  spinlocks making it work better with the realime patches.

- Interrupt support for the EXTRAXFS GPIO driver.

- Make the ETRAXFS GPIO driver support also ARTPEC-3.

- Interrupt and wakeup support for the BRCMSTB driver, also for
  wakeup from S5 cold boot.

- Mask MXC IRQs during suspend.

- Improve OMAP2 GPIO set_debounce() to work according to spec.

- The VF610 driver handles IRQs properly.

New drivers:

- ZTE ZX GPIO driver.

----------------------------------------------------------------
Alexander Stein (1):
      gpio: mpc8xxx: Convert mpc8xxx_gpio_chip.lock to raw_spinlock

Alexandre Courbot (1):
      gpio/grgpio: fix deadlock in grgpio_irq_unmap()

Axel Lin (1):
      gpio: omap: Fix missing raw locks conversion

Dirk Behme (2):
      gpio: mxc: fix section mismatch warning
      Documentation: gpio: consumer: describe active low property

Geert Uytterhoeven (2):
      gpio: em: Remove obsolete platform data support
      gpio: rcar: Fine-grained Runtime PM support

Gregory Fong (3):
      dt-bindings: brcmstb-gpio: document properties for wakeup
      gpio: brcmstb: Add interrupt and wakeup source support
      gpio: brcmstb: support wakeup from S5 cold boot

Grygorii Strashko (10):
      gpio: pcf857x: get rid of slock spinlock
      gpiolib: irqchip: prevent driver unloading if gpio is used as irq=
 only
      gpiolib: assign chip owner to dev->driver->owner if not set
      gpiolib: irqchip: use different lockdep class for each gpio irqch=
ip
      gpiolib: add description for gpio irqchip fields in struct gpio_c=
hip
      gpio: omap: remove wrong irq_domain_remove usage in probe
      gpio: omap: switch to use platform_get_irq
      gpio: omap: fix omap2_set_gpio_debounce
      gpio: omap: protect regs access in omap_gpio_irq_handler
      gpio: omap: fix clk_prepare/unprepare usage

Jiang Liu (2):
      gpio/davinci: Use accessor function irq_data_get_irq_handler_data=
()
      gpio: Use irq_desc_get_xxx() to avoid redundant lookup of irq_des=
c

Julia Lawall (2):
      gpio: extraxfs: fix returnvar.cocci warnings
      gpio: xlp: fix error return code

Jun Nie (2):
      gpio: Document ZTE zx296702 GPIO DT binding
      gpio: zx: Add ZTE zx296702 GPIO support

Krzysztof Kozlowski (1):
      gpio: etraxfs: Fix devm_ioremap_resource return value check

Laurent Navet (1):
      gpiolib: remove unneeded assignation

Linus Walleij (7):
      Merge tag 'gpiod-flags-for-4.3' of
git://git.pengutronix.de/git/ukl/linux into devel
      Merge branch 'queue/irq/gpio' of
git://git.kernel.org/.../tip/tip into devel
      gpio: document interaction with other subsystems
      gpio/ABI: document what is already the case
      Merge tag 'v4.2-rc4' into devel
      gpio: tc3589x: use static container helper
      Revert "gpio: extraxfs: fix returnvar.cocci warnings"

Masahiro Yamada (7):
      gpio: zynq: add missing module_exit function
      gpio: altera: kill bogus dependency on GPIO_GENERIC
      gpio: altera: fix return value of altera_gpio_remove()
      gpio: altera: use of_mm_gpiochip_remove() to fix memory leak
      gpio: mvebu: kill bogus dependency on GPIO_GENERIC
      gpio: of: remove unnecessary variable in of_get_gpio_hog()
      gpio: remove unneeded initializer in gpiochip_add_to_list()

Nicholas Krause (2):
      gpio: 74xx: Fix build warning about void to integer cast
      gpio: max732x: Fix error handling in probe()

Philipp Zabel (1):
      gpio: generic: add get_direction support

Rabin Vincent (5):
      gpio: etraxfs: fix set register flag
      gpio: generic: support input-only chips
      gpio: etraxfs: add support for ARTPEC-3
      gpio: don't override irq_*_resources() callbacks
      gpio: etraxfs: add interrupt support

Rob Herring (1):
      gpio: kill off set_irq_flags usage

Sebastian Andrzej Siewior (1):
      gpio: omap: use raw locks for locking

Stefan Agner (1):
      gpio: vf610: handle level IRQ's properly

Thomas Gleixner (18):
      gpio/mpc8xxx: Consolidate chained IRQ handler install/remove
      gpio/mvebu: Consolidate chained IRQ handler install/remove
      gpio/timberdale: Consolidate chained IRQ handler install/remove
      gpio/tz1090: Consolidate chained IRQ handler install/remove
      gpiolib: Consolidate chained IRQ handler install/remove
      gpio/zynq: Use irq_set_chip_handler_name_locked()
      gpio/ep93xx: Use irq_set_handler_locked()
      gpio/msm-v2: Use irq_set_handler_locked()
      gpio/omap: Use irq_set_handler_locked()
      gpio/pch: Use irq_set_handler_locked()
      gpio/gpio-tegra: Use irq_set_handler_locked()
      gpio/davinci: Prepare gpio_irq_handler for irq argument removal
      gpio/ep93xx: Prepare ep93xx_gpio_f_irq_handler for irq argument r=
emoval
      gpio/mvebu: Prepare mvebu_gpio_irq_handler for irq argument remov=
al
      gpio/sa1100: Prepare sa1100_gpio_handler for irq argument removal
      gpio/msm-v2: Avoid redundant lookup of irq_data
      gpio/davinci: Avoid redundant lookup of irq_data
      gpio/davinci: Fix race in installing chained irq handler

Tomeu Vizoso (2):
      gpiolib: Fix docs for gpiochip_add_pingroup_range
      gpio: defer probe if pinctrl cannot be found

Ulises Brindis (1):
      gpio/mxc: mask gpio interrupts in suspend

Ulrich Hecht (1):
      gpio: rcar: Add r8a7795 (R-Car H3) support

Uwe Kleine-K=C3=B6nig (14):
      drm/msm/dp: use flags argument of devm_gpiod_get to set direction
      drm/tilcdc: panel: make better use of gpiod API
      iio: light: stk3310: use flags argument of devm_gpiod_get
      iio: magn: bmc150: use flags argument of devm_gpiod_get
      media: i2c/adp1653: set enable gpio to output
      NFC: nxp-nci_i2c: use flags argument of devm_gpiod_get_index
      phy: tusb1210: make better use of gpiod API
      usb: dwc3: pci: make better use of gpiod API
      usb: pass flags parameter to gpiod_get functions
      gpio: make flags mandatory for gpiod_get functions
      gpio: mpc8xxx: constify of_device_id
      gpio: mpc8xxx: handle differences between incarnations at a singl=
e place
      gpio: mpc8xxx: add support for MPC5125
      dt-bindings: gpio: document bindings supported by gpio-mpc8xxx.c

Vitaly Andrianov (1):
      gpio/davinci: add interrupt support for GPIOs 16-31

 Documentation/ABI/testing/sysfs-gpio               |   3 +-
 .../devicetree/bindings/gpio/brcm,brcmstb-gpio.txt |  35 ++-
 .../devicetree/bindings/gpio/gpio-etraxfs.txt      |   3 +-
 .../devicetree/bindings/gpio/gpio-mpc8xxx.txt      |  22 ++
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |   1 +
 .../devicetree/bindings/gpio/zx296702-gpio.txt     |  24 ++
 Documentation/gpio/00-INDEX                        |   3 +
 Documentation/gpio/consumer.txt                    |  33 +++
 Documentation/gpio/drivers-on-gpio.txt             |  95 ++++++
 Documentation/gpio/sysfs.txt                       |   9 +-
 drivers/gpio/Kconfig                               |  10 +-
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/devres.c                              |  18 +-
 drivers/gpio/gpio-74xx-mmio.c                      |   2 +-
 drivers/gpio/gpio-adp5588.c                        |  10 +-
 drivers/gpio/gpio-altera.c                         |   4 +-
 drivers/gpio/gpio-bcm-kona.c                       |  17 +-
 drivers/gpio/gpio-brcmstb.c                        | 306 +++++++++++++=
+++++-
 drivers/gpio/gpio-davinci.c                        |  16 +-
 drivers/gpio/gpio-dwapb.c                          |   2 +-
 drivers/gpio/gpio-em.c                             |  35 +--
 drivers/gpio/gpio-ep93xx.c                         |   8 +-
 drivers/gpio/gpio-etraxfs.c                        | 329 +++++++++++++=
+++++++-
 drivers/gpio/gpio-generic.c                        |  41 ++-
 drivers/gpio/gpio-grgpio.c                         |  23 +-
 drivers/gpio/gpio-max732x.c                        |  11 +-
 drivers/gpio/gpio-mcp23s08.c                       |   4 -
 drivers/gpio/gpio-mpc8xxx.c                        | 121 +++++---
 drivers/gpio/gpio-msm-v2.c                         |  23 +-
 drivers/gpio/gpio-mvebu.c                          |   8 +-
 drivers/gpio/gpio-mxc.c                            |   9 +-
 drivers/gpio/gpio-mxs.c                            |   2 +-
 drivers/gpio/gpio-omap.c                           | 156 +++++-----
 drivers/gpio/gpio-pcf857x.c                        |  14 +-
 drivers/gpio/gpio-pch.c                            |   4 +-
 drivers/gpio/gpio-pxa.c                            |   8 +-
 drivers/gpio/gpio-rcar.c                           |  24 +-
 drivers/gpio/gpio-sa1100.c                         |   6 +-
 drivers/gpio/gpio-sta2x11.c                        |   2 +-
 drivers/gpio/gpio-tc3589x.c                        |  10 +-
 drivers/gpio/gpio-tegra.c                          |   9 +-
 drivers/gpio/gpio-timberdale.c                     |  12 +-
 drivers/gpio/gpio-tz1090.c                         |   4 +-
 drivers/gpio/gpio-vf610.c                          |  11 +-
 drivers/gpio/gpio-xlp.c                            |   2 +-
 drivers/gpio/gpio-zx.c                             | 324 +++++++++++++=
+++++++
 drivers/gpio/gpio-zynq.c                           |  12 +-
 drivers/gpio/gpiolib-of.c                          |  34 ++-
 drivers/gpio/gpiolib.c                             |  84 +++---
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 |  17 +-
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |  22 +-
 drivers/iio/light/stk3310.c                        |   6 +-
 drivers/iio/magnetometer/bmc150_magn.c             |   6 +-
 drivers/media/i2c/adp1653.c                        |   2 +-
 drivers/nfc/nxp-nci/i2c.c                          |  10 +-
 drivers/phy/phy-tusb1210.c                         |  30 +-
 drivers/usb/dwc3/dwc3-pci.c                        |  26 +-
 drivers/usb/gadget/udc/pxa27x_udc.c                |   2 +-
 drivers/usb/phy/phy-generic.c                      |   6 +-
 include/linux/basic_mmio_gpio.h                    |   1 +
 include/linux/gpio/consumer.h                      |  82 ++---
 include/linux/gpio/driver.h                        |  37 ++-
 include/linux/of_gpio.h                            |   4 +-
 include/linux/platform_data/gpio-em.h              |  11 -
 64 files changed, 1683 insertions(+), 523 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mpc8xxx=
=2Etxt
 create mode 100644 Documentation/devicetree/bindings/gpio/zx296702-gpi=
o.txt
 create mode 100644 Documentation/gpio/drivers-on-gpio.txt
 create mode 100644 drivers/gpio/gpio-zx.c
 delete mode 100644 include/linux/platform_data/gpio-em.h
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
