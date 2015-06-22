From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO bulk changes for v4.2
Date: Mon, 22 Jun 2015 11:07:22 +0200
Message-ID: <CACRpkdaPhrVaEG5uVyBDv3-KfQG=DgSn=Loo3E2GXq29UT23=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:33657 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752521AbbFVJHX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2015 05:07:23 -0400
Received: by obpn3 with SMTP id n3so26121281obp.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2015 02:07:22 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

Hi Linus,

this is the big bulk of GPIO changes for the v4.2 kernel series.
Details are in the signed tag as always.

The included I2C changes have been ACKed by the I2C
maintainer.

Please pull this in!

Yours,
Linus Walleij

The following changes since commit 030bbdbf4c833bc69f502eae58498bc5572db736:

  Linux 4.1-rc3 (2015-05-10 15:12:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.2-1

for you to fetch changes up to 38e003f4b5dc405158b9ce625d8cc2b336d45497:

  gpio: Fix checkpatch.pl issues (2015-06-16 11:00:06 +0200)

----------------------------------------------------------------
This is the big bulk of GPIO changes queued for the v4.2
kernel series:

- A big set of cleanups to the aged sysfs interface from
  Johan Hovold. To get these in, v4.1-rc3 was merged into
  the tree as the first patch in that series had to go
  into stable. This makes the locking much more fine-grained
  (get rid of the "big GPIO lock(s)" and store states in the
  GPIO descriptors.

- Rename gpiod_[g|s]et_array() to gpiod_[g|s]et_array_value()
  to avoid confusions.

- New drivers for:
  - NXP LPC18xx (currently LPC1850)
  - NetLogic XLP
  - Broadcom STB SoC's
  - Axis ETRAXFS
  - Zynq Ultrascale+ (subdriver)

- ACPI:
  - Make it possible to retrieve GpioInt resources from
    a GPIO device using acpi_dev_gpio_irq_get()
  - Merge some dependent I2C changes exploiting this.
  - Support the ARM X-Gene GPIO standby driver.

- Make it possible for the generic GPIO driver to read
  back the value set registers to reflect current
  status.

- Loads of OMAP IRQ handling fixes.

- Incremental improvements to Kona, max732x, OMAP, MXC, RCAR,
  PCA953x, STP-XWAY, PCF857x, Crystalcove, TB10x.

- Janitorial (contification, checkpatch cleanups)

----------------------------------------------------------------
Aaron Lu (1):
      gpio: crystalcove: set IRQCHIP_SKIP_SET_WAKE for the irqchip

Anurag Kumar Vulisha (1):
      gpio: Added support to Zynq Ultrascale+ MPSoC

Axel Lin (3):
      gpio: bcm-kona: Implement get_direction callback
      gpio: xlp: Add missing .owner and .label settings for gpio_chip
      gpio: tb10x: Drop unneeded free_irq() call

Christophe Jaillet (1):
      gpio: x-gene: Remove a useless memset

Colin Cronin (1):
      Drivers: gpio: Fix spelling errors

Daniel Lockyer (1):
      gpio: Fix checkpatch.pl issues

Dmitry Eremin-Solenikov (1):
      gpiolib: cleanup chained handler and data

Geert Uytterhoeven (2):
      gpio: rcar: Check for irq_set_irq_wake() failures
      gpio: pcf857x: Check for irq_set_irq_wake() failures

Gregory Fong (2):
      dt-bindings: add brcmstb-gpio GPIO binding
      gpio: Add GPIO support for Broadcom STB SoCs

Grygorii Strashko (6):
      gpio: omap: fix omap_gpio_free to not clean up irq configuration
      gpio: omap: fix error handling in omap_gpio_irq_type
      gpio: omap: rework omap_x_irq_shutdown to touch only irqs
specific registers
      gpio: omap: rework omap_gpio_request to touch only gpio specific registers
      gpio: omap: rework omap_gpio_irq_startup to handle current pin
state properly
      gpio: pcf857x: handle only enabled irqs

Hanjun Guo (1):
      GPIO / ACPI: export acpi_gpiochip_request(free)_interrupts for module use

Joachim Eastwood (2):
      gpio: add lpc18xx gpio driver
      gpio: add DT bindings for lpc1850-gpio driver

Johan Hovold (23):
      gpio: clean up gpiochip_remove
      gpio: sysfs: fix redundant lock-as-irq handling
      gpio: sysfs: preparatory clean ups
      gpio: sysfs: reduce gpiochip-export locking scope
      gpio: sysfs: clean up chip class-device handling
      gpio: sysfs: rename gpiochip registration functions
      gpio: remove gpiod_sysfs_set_active_low
      gpio: sysfs: use DEVICE_ATTR macros
      gpio: sysfs: release irq after class-device deregistration
      gpio: sysfs: remove redundant export tests
      gpio: sysfs: add gpiod class-device data
      gpio: sysfs: remove redundant gpio-descriptor parameters
      gpio: sysfs: clean up interrupt-interface implementation
      gpio: sysfs: only call irq helper if needed
      gpio: sysfs: split irq allocation and deallocation
      gpio: sysfs: clean up edge_store
      gpio: sysfs: clean up gpiod_export_link locking
      gpio: sysfs: use per-gpio locking
      gpio: sysfs: fix race between gpiod export and unexport
      gpio: sysfs: rename active-low helper
      gpio: sysfs: remove FLAG_SYSFS_DIR
      gpio: sysfs: move irq trigger flags to class-device data
      gpio: dln2: fix build breakage

Joshua Scott (1):
      gpio: Prevent an integer overflow in the pca953x driver

Kamlakant Patel (2):
      gpio: Add Netlogic XLP GPIO devicetree bindings documentation
      gpio: xlp: GPIO controller for Netlogic XLP SoCs

Krzysztof Kozlowski (1):
      gpio: Constify platform_device_id

Linus Walleij (4):
      Merge tag 'v4.1-rc3' into devel
      gpio: discourage passing base to gpio_chip
      gpio: promote own request failure to pr_err()
      gpio: improve error reporting on own descriptors

Martin Blumenstingl (2):
      gpio-stp-xway: Fix enabling the highest bit of the PHY LEDs
      gpio: stp-xway: Use the of_property_read_u32 helper

Michal Simek (1):
      gpio: xilinx: Fix kernel-doc warnings

Mika Westerberg (4):
      gpio / ACPI: Add support for retrieving GpioInt resources from a device
      i2c / ACPI: Use 0 to indicate that device does not have interrupt assigned
      i2c / ACPI: Assign IRQ for devices that have GpioInt automatically
      gpio / ACPI: Return -EPROBE_DEFER if the gpiochip was not found

Paul Gortmaker (1):
      drivers/gpio: include <module.h> for modular crystalcove code

Rabin Vincent (1):
      gpio: add ETRAXFS GPIO driver

Rojhalat Ibrahim (2):
      gpiolib: rename gpiod_set_array to gpiod_set_array_value
      fix documentation after renaming gpiod_set_array to gpiod_set_array_value

Semen Protsenko (3):
      gpio: max732x: Propagate wake-up setting to parent irq controller
      gpio: max732x: Add IRQF_SHARED to irq flags
      gpio: max732x: Fix irq-events handler

Tony Lindgren (1):
      gpio: omap: Allow building as a loadable module

Vladimir Zapolskiy (3):
      gpio: gpio-generic: add flag to read out output value from reg_set
      gpio: moxart: get value of output gpio from generic driver
      gpio: mxc: read output value from GPIO_DR register

Y Vo (1):
      gpio: xgene: add ACPI support for APM X-Gene GPIO standby driver

 .../devicetree/bindings/gpio/brcm,brcmstb-gpio.txt |  65 +++
 .../devicetree/bindings/gpio/gpio-etraxfs.txt      |  21 +
 .../devicetree/bindings/gpio/gpio-xlp.txt          |  47 ++
 .../devicetree/bindings/gpio/gpio-zynq.txt         |   2 +-
 .../devicetree/bindings/gpio/nxp,lpc1850-gpio.txt  |  39 ++
 Documentation/gpio/consumer.txt                    |  28 +-
 Documentation/gpio/gpio-legacy.txt                 |   9 -
 Documentation/gpio/sysfs.txt                       |   8 -
 Documentation/zh_CN/gpio.txt                       |   8 -
 MAINTAINERS                                        |   7 +
 drivers/gpio/Kconfig                               |  39 +-
 drivers/gpio/Makefile                              |   4 +
 drivers/gpio/gpio-altera.c                         |   3 +-
 drivers/gpio/gpio-bcm-kona.c                       |  26 +-
 drivers/gpio/gpio-brcmstb.c                        | 252 +++++++++
 drivers/gpio/gpio-crystalcove.c                    |   5 +-
 drivers/gpio/gpio-dln2.c                           |   1 -
 drivers/gpio/gpio-etraxfs.c                        | 176 +++++++
 drivers/gpio/gpio-f7188x.c                         |   4 +-
 drivers/gpio/gpio-generic.c                        |  22 +-
 drivers/gpio/gpio-it8761e.c                        |   2 +-
 drivers/gpio/gpio-lpc18xx.c                        | 180 +++++++
 drivers/gpio/gpio-lynxpoint.c                      |   2 +-
 drivers/gpio/gpio-max732x.c                        |  21 +-
 drivers/gpio/gpio-moxart.c                         |  17 +-
 drivers/gpio/gpio-mxc.c                            |   5 +-
 drivers/gpio/gpio-mxs.c                            |   2 +-
 drivers/gpio/gpio-omap.c                           |  83 ++-
 drivers/gpio/gpio-pca953x.c                        |  23 +-
 drivers/gpio/gpio-pcf857x.c                        |  56 +-
 drivers/gpio/gpio-rcar.c                           |  13 +-
 drivers/gpio/gpio-stp-xway.c                       |  29 +-
 drivers/gpio/gpio-tb10x.c                          |   1 -
 drivers/gpio/gpio-tegra.c                          |   2 +-
 drivers/gpio/gpio-ts5500.c                         |   2 +-
 drivers/gpio/gpio-xgene-sb.c                       |  22 +-
 drivers/gpio/gpio-xilinx.c                         |   4 +-
 drivers/gpio/gpio-xlp.c                            | 427 ++++++++++++++++
 drivers/gpio/gpio-zynq.c                           | 193 ++++---
 drivers/gpio/gpiolib-acpi.c                        |  40 +-
 drivers/gpio/gpiolib-of.c                          |   2 +-
 drivers/gpio/gpiolib-sysfs.c                       | 567 ++++++++++-----------
 drivers/gpio/gpiolib.c                             | 112 ++--
 drivers/gpio/gpiolib.h                             |  16 +-
 drivers/i2c/i2c-core.c                             |  12 +-
 drivers/net/phy/mdio-mux-gpio.c                    |   3 +-
 drivers/tty/serial/serial_mctrl_gpio.c             |   2 +-
 include/asm-generic/gpio.h                         |   5 -
 include/linux/acpi.h                               |   7 +
 include/linux/basic_mmio_gpio.h                    |   1 +
 include/linux/gpio.h                               |   7 -
 include/linux/gpio/consumer.h                      |  43 +-
 include/linux/gpio/driver.h                        |  13 +-
 include/linux/platform_data/gpio-omap.h            |  12 +-
 54 files changed, 2047 insertions(+), 645 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-etraxfs.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xlp.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.txt
 create mode 100644 drivers/gpio/gpio-brcmstb.c
 create mode 100644 drivers/gpio/gpio-etraxfs.c
 create mode 100644 drivers/gpio/gpio-lpc18xx.c
 create mode 100644 drivers/gpio/gpio-xlp.c
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
