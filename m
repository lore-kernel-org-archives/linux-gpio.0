From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] Bulk GPIO changes for v4.12
Date: Thu, 4 May 2017 10:55:43 +0200
Message-ID: <CACRpkdaofBhXvx7oQXnFOQZch7bxShcZKtycR1BbrBb0FGQ+vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

this is the bulk of GPIO changes for the v4.12 kernel cycle.
Nothing really exciting goes on here this time, the most exciting
for me is the same as for pin control: realtime is advancing thanks
so Julia Cartwright.

There are some ACPI-induced changes in other subsystems, and
those are ACKed by the maintainers.

Details in the signed tag as usual.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.12-1

for you to fetch changes up to b86c86aa9805b25ee70071d084e618b2c40641b5:

  gpio: f7188x: Add a missing break (2017-04-28 10:09:16 +0200)

----------------------------------------------------------------
This is the bulk of GPIO changes for the v4.12 kernel cycle:

Core changes

- Return NULL from gpiod_get_optional() when GPIOLIB is disabled.
  This was a much discussed change. It affects use cases where people
  write drivers that might or might not be using GPIO resources.
  I have decided that this is the lesser evil right now.

- Make gpiod_count() behave consistently across different hardware
  descriptions.

- Fix the syntax around open drain/open source to not infer active
  high/low semantics.

New drivers

- A new single-register fixed-direction framework driver for hardware
  that have lines controlled by a single register that just work in
  one direction (out or in), including IRQ support.

- Support the Fintek F71889A GPIO SuperIO controller.

- Support the National NI 169445 MMIO GPIO.

- Support for the X-Gene derivative of the DWC GPIO controller

- Support for the Rohm BD9571MWV-M PMIC GPIO controller.

- Refactor the Gemini GPIO driver to a generic Faraday FTGPIO driver
  and replace both the Gemini and the Moxa ART custom drivers with
  this driver.

Driver improvements

- A whole slew of drivers have their spinlocks chaned to raw spinlocks
  as they provide irqchips, and thus we are progressing on realtime
  compliance.

- Use devm_irq_alloc_descs() in a slew of drivers, getting managed
  resources.

- Support for the embedded PWM controller inside the MVEBU driver.

- Debounce, open source and open drain support for the Aspeed driver.

- Misc smaller fixes like spelling and syntax and whatnot.

----------------------------------------------------------------
Anders Darander (2):
      gpio: move tca9554 from pcf857x to pca953x
      gpio: DT bindings, move tca9554 from pcf857x to pca953x

Andrew Jeffery (4):
      gpio: aspeed: dt: Fix description alignment in bindings document
      gpio: aspeed: dt: Add optional clocks property
      gpio: aspeed: Add debounce support
      gpio: aspeed: Add open-source and open-drain support

Andrew Lunn (1):
      gpio: mvebu: Add limited PWM support

Andy Shevchenko (11):
      gpiolib: Fix spelling of 'successful'
      gpio: acpi: Add managed variant of acpi_dev_add_driver_gpios()
      gpio: acpi: Don't return 0 on acpi_gpio_count()
      gpio: of: Don't return 0 on dt_gpio_count()
      platform/x86: surface3_button: Propagate error from gpiod_count()
      Input: soc_button_array - Propagate error from gpiod_count()
      gpio: pca953x: Introduce a long awaited ->get_direction()
      gpio: pca953x: Sort headers alphabetically
      gpio: pca953x: Expand comment for "reset" GPIO in ACPI case
      usb: dwc3: pci: Switch to devm_acpi_dev_add_driver_gpios()
      gpio: merrifield: Don't use GPIOF_DIR_IN / GPIOF_DIR_OUT

Axel Lin (1):
      gpio: exar: Set proper output level in exar_direction_output

Bartosz Golaszewski (12):
      gpio: mockup: use devm_irq_alloc_descs()
      gpio: twl4030: use devm_irq_alloc_descs()
      gpio: omap: use devm_irq_alloc_descs()
      gpio: pch: use resource management for irqs
      gpio: ml-ioh: use resource management for irqs
      gpio: xlp: use resource management for irqs
      gpio: pxa: use devm_irq_alloc_descs()
      gpio: davinci: use devm_irq_alloc_descs()
      gpio: sodaville: use resource management for irqs
      gpio: mxc: use devm_irq_alloc_descs()
      gpio: mxs: use devm_irq_alloc_descs()
      gpio: sta2x11: use resource management for irqs

Charles Keepax (2):
      gpio: arizona: Correct handling for reading input GPIOs
      gpio: arizona: Correct check whether the pin is an input

Dan Carpenter (1):
      gpio: f7188x: Add a missing break

David Daney (1):
      dt-bindings: gpio: Add binding documentation for gpio-thunderx

David Rivshin (1):
      gpio: omap: return error if requested debounce time is not possible

Dmitry Torokhov (1):
      gpio: return NULL from gpiod_get_optional when GPIOLIB is disabled

Hans de Goede (1):
      gpio: acpi: Ignore -EPROBE_DEFER for unselected gpioints

Hoan Tran (1):
      gpio: dwapb: Add support for next generation of X-Gene SoC

Jayachandran C (1):
      gpio: xlp: Update for ARCH_THUNDER2

Jisheng Zhang (1):
      gpio: dwapb: use dwapb_read instead of readl_relaxed

Julia Cartwright (11):
      gpio: altera: make use of raw_spinlock variants
      gpio: 104-dio-48e: make use of raw_spinlock variants
      gpio: bcm-kona: make use of raw_spinlock variants
      gpio: ath79: make use of raw_spinlock variants
      gpio: etraxfs: make use of raw_spinlock variants
      gpio: pl061: make use of raw_spinlock variants
      gpio: ws16c48: make use of raw_spinlock variants
      gpio: zx: make use of raw_spinlock variants
      gpio: 104-idio-16: make use of raw_spinlock variants
      gpio: pci-idio-16: make use of raw_spinlock variants
      gpio: 104-idi-48: make use of raw_spinlock variants

Kuppuswamy Sathyanarayanan (2):
      gpio: gpio-wcove: fix irq pending status bit width
      gpio: gpio-wcove: fix GPIO IRQ status mask

Laxman Dewangan (1):
      gpio: core: Decouple open drain/source flag with active low/high

Linus Walleij (3):
      gpio: gemini: augment DT bindings
      gpio: gemini: rename to match Faraday IP
      gpio: moxart: Switch to using the FTGPIO010 driver

Marek Vasut (1):
      gpio: Add ROHM BD9571MWV-M PMIC GPIO driver

Marty Plummer (1):
      gpio: f7188x: Add F71889A GPIO support.

Nandor Han (2):
      dt-bindings: add exar to vendor prefixes list
      gpio: Add XRA1403 DTS binding documentation

Nathan Sullivan (1):
      gpio: mmio: add support for NI 169445 NAND GPIO

Ralph Sennhauser (7):
      gpio: mvebu: checkpatch: block comment fixes
      gpio: mvebu: start multiline block comments with blank line
      gpio: mvebu: checkpatch: unsigned int fixes
      gpio: mvebu: checkpatch: whitespace fixes
      gpio: mvebu: extra whitespace fixes
      gpio: mvebu: let the compiler inline
      gpio: mvebu: use BIT macro instead of bit shifting

Russell King (5):
      gpio: sa1100: use sa11x0_gpio_set_wake()
      gpio: sa1100: convert to use IO accessors
      gpio: sa1100: implement get_direction method
      gpio: add generic single-register fixed-direction GPIO driver
      gpio: gpio-reg: add irq mapping for gpio-reg users

Thierry Reding (1):
      gpio: Use unsigned int for interrupt numbers

William Breathitt Gray (1):
      gpio: pc104: Mask PC/104 drivers via PC104 Kconfig option

 ...rtina,gemini-gpio.txt => faraday,ftgpio010.txt} |   9 +-
 .../devicetree/bindings/gpio/gpio-aspeed.txt       |   3 +-
 .../devicetree/bindings/gpio/gpio-mvebu.txt        |  32 ++
 .../devicetree/bindings/gpio/gpio-pca953x.txt      |   1 +
 .../devicetree/bindings/gpio/gpio-pcf857x.txt      |   1 -
 .../devicetree/bindings/gpio/gpio-thunderx.txt     |  27 ++
 .../devicetree/bindings/gpio/gpio-xra1403.txt      |  46 +++
 .../devicetree/bindings/gpio/moxa,moxart-gpio.txt  |  19 -
 .../bindings/gpio/ni,169445-nand-gpio.txt          |  38 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 Documentation/gpio/consumer.txt                    |   6 +
 MAINTAINERS                                        |   2 +
 drivers/gpio/Kconfig                               |  46 ++-
 drivers/gpio/Makefile                              |   5 +-
 drivers/gpio/devres.c                              |   2 +-
 drivers/gpio/gpio-104-dio-48e.c                    |  38 +-
 drivers/gpio/gpio-104-idi-48.c                     |  18 +-
 drivers/gpio/gpio-104-idio-16.c                    |  24 +-
 drivers/gpio/gpio-altera.c                         |  24 +-
 drivers/gpio/gpio-arizona.c                        |  30 +-
 drivers/gpio/gpio-aspeed.c                         | 285 +++++++++++++-
 drivers/gpio/gpio-ath79.c                          |  28 +-
 drivers/gpio/gpio-bcm-kona.c                       |  48 +--
 drivers/gpio/gpio-bd9571mwv.c                      | 144 +++++++
 drivers/gpio/gpio-davinci.c                        |   2 +-
 drivers/gpio/gpio-dwapb.c                          |  93 ++++-
 drivers/gpio/gpio-etraxfs.c                        |  24 +-
 drivers/gpio/gpio-exar.c                           |  23 +-
 drivers/gpio/gpio-f7188x.c                         |  24 +-
 drivers/gpio/{gpio-gemini.c => gpio-ftgpio010.c}   |  72 ++--
 drivers/gpio/gpio-merrifield.c                     |   2 +-
 drivers/gpio/gpio-ml-ioh.c                         |  28 +-
 drivers/gpio/gpio-mmio.c                           |   1 +
 drivers/gpio/gpio-mockup.c                         |  16 +-
 drivers/gpio/gpio-moxart.c                         |  84 ----
 drivers/gpio/gpio-mvebu.c                          | 435 ++++++++++++++++++---
 drivers/gpio/gpio-mxc.c                            |   6 +-
 drivers/gpio/gpio-mxs.c                            |   6 +-
 drivers/gpio/gpio-omap.c                           |  26 +-
 drivers/gpio/gpio-pca953x.c                        |  38 +-
 drivers/gpio/gpio-pcf857x.c                        |   2 -
 drivers/gpio/gpio-pch.c                            |  14 +-
 drivers/gpio/gpio-pci-idio-16.c                    |  28 +-
 drivers/gpio/gpio-pl061.c                          |  28 +-
 drivers/gpio/gpio-pxa.c                            |   2 +-
 drivers/gpio/gpio-reg.c                            | 185 +++++++++
 drivers/gpio/gpio-sa1100.c                         | 216 ++++++----
 drivers/gpio/gpio-sodaville.c                      |  28 +-
 drivers/gpio/gpio-sta2x11.c                        |  17 +-
 drivers/gpio/gpio-twl4030.c                        |   3 +-
 drivers/gpio/gpio-wcove.c                          |   8 +-
 drivers/gpio/gpio-ws16c48.c                        |  46 +--
 drivers/gpio/gpio-xlp.c                            |   9 +-
 drivers/gpio/gpio-zx.c                             |  24 +-
 drivers/gpio/gpiolib-acpi.c                        |  53 ++-
 drivers/gpio/gpiolib-of.c                          |   2 +-
 drivers/gpio/gpiolib.c                             |  16 +-
 drivers/input/misc/soc_button_array.c              |   5 +-
 drivers/platform/x86/surface3_button.c             |   5 +-
 drivers/usb/dwc3/dwc3-pci.c                        |   5 +-
 include/dt-bindings/gpio/gpio.h                    |  12 +-
 include/linux/acpi.h                               |  11 +
 include/linux/gpio/consumer.h                      |  12 +-
 include/linux/gpio/driver.h                        |   6 +-
 include/linux/gpio/gpio-reg.h                      |  13 +
 include/linux/of_gpio.h                            |   1 +
 66 files changed, 1860 insertions(+), 648 deletions(-)
 rename Documentation/devicetree/bindings/gpio/{cortina,gemini-gpio.txt
=> faraday,ftgpio010.txt} (70%)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/moxa,moxart-gpio.txt
 create mode 100644
Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
 create mode 100644 drivers/gpio/gpio-bd9571mwv.c
 rename drivers/gpio/{gpio-gemini.c => gpio-ftgpio010.c} (73%)
 delete mode 100644 drivers/gpio/gpio-moxart.c
 create mode 100644 drivers/gpio/gpio-reg.c
 create mode 100644 include/linux/gpio/gpio-reg.h
