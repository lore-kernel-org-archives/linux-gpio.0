From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] bulk GPIO changes for v4.13
Date: Fri, 7 Jul 2017 11:47:06 +0200
Message-ID: <CACRpkdbz9-xP4+PnMkvKOAeV6aBrYwrOAnamRatMXQKBE0yjmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:37408 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750938AbdGGJrI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jul 2017 05:47:08 -0400
Received: by mail-it0-f52.google.com with SMTP id m84so30319255ita.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jul 2017 02:47:08 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, Greg KH <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Linus,

here is the big GPIO pull request for v4.13. The details
are in the signed tag as usual.

Some administrativa:

I have a slew of 8250 serial patches and the new IOT2040
serial+GPIO driver coming in through this tree, along with a
whole bunch of Exar 8250 fixes. These are ACKed by Greg
and also hit drivers/platform/* where they are ACKed by
Andy Shevchenko.

Speaking about drivers/platform/* there is also a bunch of
ACPI stuff coming through that route, again ACKed by Andy.

The MCP23S08 changes are coming in here as well. You already
have the commits in your tree, so this is just a result of sharing
an immutable branch between pin control and GPIO.

Then there is one merge conflict. I resisted pulling in a
release candidate to resolve it because I think that was
messy for no major reason. The conflict is in:

drivers/gpio/gpio-mvebu.c

<<<<<<< HEAD
    writel_relaxed(set, mvebu_gpioreg_blink_counter_select(mvchip));
=3D=3D=3D=3D=3D=3D=3D
    regmap_write(mvchip->regs,
             GPIO_BLINK_CNT_SELECT_OFF + mvchip->offset, 0);
>>>>>>> 65b69a94f4130143bfb8d4e995b875ae35d993f3

It should be resolved like this:

    regmap_write(mvchip->regs,
             GPIO_BLINK_CNT_SELECT_OFF + mvchip->offset, set);

So the second line with the "0" argument switched to "set".

It is a result of fixes on the rc's followed by a conversion to regmap
on the main development branch.

Apart from this it should all be fine.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 08332893e37af6ae779367e78e444f8f9571511d=
:

  Linux 4.12-rc2 (2017-05-21 19:30:23 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.13-1

for you to fetch changes up to 413058df4331ce29f9934a5870d582c7e71fe15f:

  serial: exar: Add support for IOT2040 device (2017-07-03 08:33:20 +0200)

----------------------------------------------------------------
This is the bulk of GPIO changes for the v4.13 series:

Core:
- Export add/remove for lookup tables so that modules can export GPIO
  descriptor tables.
- Handle GPIO sleep states: it is now possible to flag that a GPIO line
  may loose its state during suspend/resume of the system to save
  power. This is used in the Wolfson Micro Arizona driver.
- ACPI-based GPIO was tightened up a lot around the edges.
- Use bitmap_fill() to speed up a loop.

New drivers:
- Exar XRA1403 SPI-based GPIO.
- MVEBU driver now supports Armada 7K and 8K.
- LP87565 PMIC GPIO.
- Renesas R-CAR R8A7743 (RZ/G1M).
- The new IOT2040 8250 serial/GPIO also comes in through this
  changeset.

Substantial driver changes:
- Seriously fix the Exar 8250 GPIO portions to work.
- The MCP23S08 was moved out to a pin control driver.
- Convert MEVEBU to use regmap for register access.
- Drop Vulcan support from the Broadcom driver.
- Serious cleanup and improvement of the mockup driver, giving us a
  better test coverage.

Misc:
- Lots of janitorial clean up.
- A bunch of documentation fixes.

----------------------------------------------------------------
Anatolij Gustschin (1):
      gpio: export add/remove lookup table functions

Andy Shevchenko (14):
      gpiolib: Export gpiod_configure_flags() to internal users
      gpio: acpi: Align acpi_find_gpio() with DT version
      gpio: acpi: Do sanity check for GpioInt in acpi_find_gpio()
      gpio: acpi: Even more tighten up ACPI GPIO lookups
      gpio: acpi: Synchronize acpi_find_gpio() and acpi_gpio_count()
      gpio: acpi: Explain how to get GPIO descriptors in ACPI case
      gpio: acpi: Factor out acpi_gpio_to_gpiod_flags() helper
      gpio: acpi: Override GPIO initialization flags
      gpio: acpi: Split out acpi_gpio_get_irq_resource() helper
      PNP / ACPI: join strings back for better maintenance
      PNP / ACPI: remove FSF address
      gpiolib: Re-use bitmap_fill() instead of open coded loop
      gpio: merrifield: Remove unused header
      MAINTAINERS: Take maintainership for GPIO ACPI support

Arnd Bergmann (2):
      gpiolib: remove unused variable
      gpio: xra1403: select REGMAP_SPI

Arvind Yadav (1):
      gpio: davinci: Handle return value of clk_prepare_enable

Bartosz Golaszewski (15):
      gpio: mockup: fix direction values
      gpio: mockup: add prefixes to the direction enum
      gpio: mockup: be quiet unless something goes wrong
      gpio: mockup: support irqmask and irqunmask
      gpio: pch: check the return value of irq_alloc_generic_chip()
      gpio: sta2x11: check the return value of irq_alloc_generic_chip()
      gpio: ml-ioh: check the return value of irq_alloc_generic_chip()
      gpio: mockup: improve the debugfs input sanitization
      gpio: mockup: tweak gpio_mockup_event_write()
      gpio: mockup: refuse to accept an odd number of GPIO ranges
      gpio: mockup: improve readability
      gpio: mockup: don't return magic numbers from probe()
      gpio: mockup: improve the error message
      gpio: mockup: add myself as author
      gpio: mockup: use devm_kcalloc() where applicable

Biju Das (1):
      gpio: rcar: Add R8A7743 (RZ/G1M) support

Charles Keepax (4):
      gpio: of: Reflect decoupling of open collector and active low/high
      gpio: Add new flags to control sleep status of GPIOs
      gpio: arizona: Add support for GPIOs that need to be maintained
      gpio: of: Add documentation of new sleep standard GPIO specifiers

Geert Uytterhoeven (1):
      gpio: of: Spelling: s/retures/returns/

Gregory CLEMENT (5):
      gpio: mvebu: sort header include
      gpio: mvebu: allow building driver for Armada 7K/8K
      gpio: mvebu: Select REGMAP_MMIO now that regmap is used
      gpio: mvebu: fix regmap_update_bits usage
      gpio: mvebu: Add support for the Armada 7K/8K SoCs

Jagadish Krishnamoorthy (1):
      PNP / ACPI: add support for GpioInt resource type

Jan Kiszka (11):
      gpio-exar/8250-exar: Fix passing in of parent PCI device
      gpio: exar: Allocate resources on behalf of the platform device
      gpio: exar: Fix reading of directions and values
      serial: uapi: Add support for bus termination
      gpio-exar/8250-exar: Do not even instantiate a GPIO device for
Commtech cards
      gpio: exar: Fix iomap request
      gpio-exar/8250-exar: Rearrange gpiochip parenthood
      serial: exar: Factor out platform hooks
      platform: Accept const properties
      gpio-exar/8250-exar: Make set of exported GPIOs configurable
      serial: exar: Add support for IOT2040 device

Jayachandran C (1):
      gpio: xlp: update GPIO_XLP dependency

Keerthy (2):
      MAINTAINERS: gpio: gpio-davinci: Add entry for gpio-davinci driver
      gpio: lp87565: Add support for GPIO

Kuppuswamy Sathyanarayanan (1):
      gpio: gpio-wcove: Fix GPIO control register offset calculation

Linus Walleij (1):
      Merge branch 'mcp23s08' of /home/linus/linux-pinctrl into devel

Masahiro Yamada (1):
      gpio: zynq: remove unneeded (void *) casts in of_match_table

Nandor Han (2):
      gpio: xra1403: Add EXAR XRA1403 SPI GPIO expander driver
      gpio: xra1403: Add XRA1403 support to MAINTAINERS file

Sebastian Reichel (14):
      gpio: mcp23s08: move to pinctrl
      pinctrl: mcp23s08: add pinconf support
      pinctrl: mcp23s08: drop pullup config from pdata
      pinctrl: mcp23s08: switch to regmap caching
      pinctrl: mcp23s08: drop OF_GPIO dependency
      pinctrl: mcp23s08: irq mapping is already done
      pinctrl: mcp23s08: use managed kzalloc for mcp
      pinctrl: mcp23s08: switch to devm_gpiochip_add_data
      pinctrl: mcp23s08: simplify i2c pdata handling
      pinctrl: mcp23s08: simplify spi pdata handling
      pinctrl: mcp23s08: generalize irq property handling
      pinctrl: mcp23s08: simplify spi_present_mask handling
      pinctrl: mcp23s08: drop comment about missing irq support
      pinctrl: mcp23s08: fix comment for mcp23s08_platform_data.base

Soren Brinkmann (1):
      gpio: zynq: Clarify quirk and provide helper function

Thomas Petazzoni (1):
      gpio: mvebu: switch to regmap for register access

Uwe Kleine-K=C3=B6nig (1):
      gpio: fix description for gpio-ranges example

Wolfram Sang (3):
      gpio: max732x: move header file out of I2C realm
      gpio: pcf857x: move header file out of I2C realm
      gpio: adp5588: move header file out of I2C realm

Xiaoguang Chen (1):
      gpio: dwapb: fix missing first irq for edgeboth irq type

 Documentation/acpi/gpio-properties.txt             |  65 +++
 Documentation/devicetree/bindings/gpio/gpio.txt    |  13 +-
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |   1 +
 MAINTAINERS                                        |  24 +
 arch/arm/configs/lpc32xx_defconfig                 |   2 +-
 arch/arm/mach-davinci/board-da830-evm.c            |   2 +-
 arch/arm/mach-davinci/board-dm644x-evm.c           |   2 +-
 arch/arm/mach-davinci/board-dm646x-evm.c           |   2 +-
 arch/arm/mach-pxa/balloon3.c                       |   2 +-
 arch/arm/mach-pxa/littleton.c                      |   2 +-
 arch/arm/mach-pxa/stargate2.c                      |   2 +-
 arch/blackfin/configs/BF609-EZKIT_defconfig        |   2 +-
 arch/blackfin/mach-bf527/boards/tll6527m.c         |   8 +-
 arch/blackfin/mach-bf537/boards/stamp.c            |   2 +-
 arch/blackfin/mach-bf609/boards/ezkit.c            |   4 +-
 arch/mips/ath79/mach-pb44.c                        |   2 +-
 drivers/base/platform.c                            |   2 +-
 drivers/gpio/Kconfig                               |  37 +-
 drivers/gpio/Makefile                              |   3 +-
 drivers/gpio/gpio-adp5588.c                        |   2 +-
 drivers/gpio/gpio-arizona.c                        |  35 +-
 drivers/gpio/gpio-davinci.c                        |  11 +-
 drivers/gpio/gpio-dwapb.c                          |   3 +-
 drivers/gpio/gpio-exar.c                           |  79 +--
 drivers/gpio/gpio-lp87565.c                        | 190 ++++++
 drivers/gpio/gpio-max732x.c                        |   2 +-
 drivers/gpio/gpio-merrifield.c                     |   1 -
 drivers/gpio/gpio-ml-ioh.c                         |  16 +-
 drivers/gpio/gpio-mockup.c                         |  98 ++--
 drivers/gpio/gpio-mvebu.c                          | 540 ++++++++++-------
 drivers/gpio/gpio-pcf857x.c                        |   2 +-
 drivers/gpio/gpio-pch.c                            |  15 +-
 drivers/gpio/gpio-rcar.c                           |   4 +
 drivers/gpio/gpio-sta2x11.c                        |  12 +-
 drivers/gpio/gpio-wcove.c                          |  75 ++-
 drivers/gpio/gpio-xra1403.c                        | 237 ++++++++
 drivers/gpio/gpio-zynq.c                           |  26 +-
 drivers/gpio/gpiolib-acpi.c                        | 185 +++---
 drivers/gpio/gpiolib-of.c                          |   5 +-
 drivers/gpio/gpiolib.c                             |  31 +-
 drivers/gpio/gpiolib.h                             |  18 +-
 drivers/input/keyboard/adp5588-keys.c              |   2 +-
 drivers/pinctrl/Kconfig                            |  13 +
 drivers/pinctrl/Makefile                           |   1 +
 .../gpio-mcp23s08.c =3D> pinctrl/pinctrl-mcp23s08.c} | 647 +++++++++++++--=
------
 drivers/pnp/pnpacpi/rsparser.c                     |  38 +-
 drivers/tty/serial/8250/8250_exar.c                | 173 +++++-
 include/dt-bindings/gpio/gpio.h                    |   4 +
 include/linux/acpi.h                               |   7 +
 include/linux/gpio/driver.h                        |   3 +
 include/linux/gpio/machine.h                       |   2 +
 include/linux/of_gpio.h                            |   1 +
 include/linux/{i2c =3D> platform_data}/adp5588.h     |   0
 include/linux/{i2c =3D> platform_data}/max732x.h     |   0
 include/linux/{i2c =3D> platform_data}/pcf857x.h     |   0
 include/linux/platform_device.h                    |   2 +-
 include/linux/spi/mcp23s08.h                       |  38 +-
 include/uapi/linux/serial.h                        |   3 +
 58 files changed, 1933 insertions(+), 765 deletions(-)
 create mode 100644 drivers/gpio/gpio-lp87565.c
 create mode 100644 drivers/gpio/gpio-xra1403.c
 rename drivers/{gpio/gpio-mcp23s08.c =3D> pinctrl/pinctrl-mcp23s08.c} (64%=
)
 rename include/linux/{i2c =3D> platform_data}/adp5588.h (100%)
 rename include/linux/{i2c =3D> platform_data}/max732x.h (100%)
 rename include/linux/{i2c =3D> platform_data}/pcf857x.h (100%)
