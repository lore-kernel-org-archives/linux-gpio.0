From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO bulk changes for the v4.11 kernel cycle
Date: Thu, 23 Feb 2017 10:36:45 +0100
Message-ID: <CACRpkdb-i5n1uzasKu2QR+G30N4FUmfAHaM4ET1VK9c9diPbfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:38163 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751070AbdBWJgs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Feb 2017 04:36:48 -0500
Received: by mail-it0-f48.google.com with SMTP id y135so9957514itc.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2017 01:36:47 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

this is the bulk of the GPIO changes for the v4.11 kernel cycle.
The details are in the signed tag as usual. Here some merge mechanics:

- As expected an immutable branch with changes shared with the pin
  control subsystem was pulled into the GPIO tree as well, making a slew
  of changes appear in drivers/pinctrl also in this pull request. The hashe=
s
  are the same, all should be fine.

- I have added an API preserving fix to keep the new ST serial driver
  compiling and will iron out the API change in -rc2 or so. All should be
  fine, Greg suggested this fix and test merges+builds confirm
  it works smooth.

- Changes to other subsystems have been ACKed and a test merge
  confirmed all is merging cleanly this morning to your tree.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77=
:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.11-1

for you to fetch changes up to 3498d8694d41af701c51289e7caf3ffefc7bfb6b:

  gpio: reintroduce devm_get_gpiod_from_child() (2017-02-21 14:19:45 +0100)

----------------------------------------------------------------
This is the bulk of GPIO changes for the v4.11 cycle

Core changes:

- Augment fwnode_get_named_gpiod() to configure the GPIO pin
  immediately after requesting it like all other APIs do.
  This is a treewide change also updating all users.

- Pass a GPIO label down to gpiod_request() from
  fwnode_get_named_gpiod(). This makes debugfs and the userspace
  ABI correctly reflect the current in-kernel consumer of a pin
  taken using this abstraction. This is a treewide change also
  updating all users.

- Rename devm_get_gpiod_from_child() to
  devm_fwnode_get_gpiod_from_child() to reflect the fact that this
  function is operating on a fwnode object. This is a treewide
  change also updating all users.

- Make it possible to take multiple GPIOs in a single hog of device
  tree hogs.

- The refactorings switching GPIO chips to use the .set_config()
  callback using standard pin control properties and providing
  a backend into the pin control subsystem that were also merged
  into the pin control tree naturally appear here too.

Testing instrumentation:

- A whole slew of cleanups and improvements to the mockup GPIO
  driver. We now have an extended userspace test exercising the
  subsystem, and we can inject interrupts etc from userspace
  to fully test the core GPIO functionality.

New drivers:

- New driver for the Cortina Systems Gemini GPIO controller.

- New driver for the Exar XR17V352/354/358 chips.

- New driver for the ACCES PCI-IDIO-16 PCI GPIO card.

Driver changes:

- RCAR: set the irqchip parent device, add fine-grained runtime
  PM support.

- pca953x: support optional RESET control line on the chip.

- DaVinci: cleanups and simplifications. Add support for multiple
  instances.

- .set_multiple() and naming of lines on more or less all of the
  ISA/PCI GPIO controllers.

- mcp23s08: refactored to use regmap as a first step to further
  rewrites and modernizations.

----------------------------------------------------------------
Alexander Stein (1):
      gpio: Pass GPIO label down to gpiod_request

Andy Shevchenko (4):
      gpio: devres: Use global array of gpio suffixes
      gpiolib: Switch to for_each_set_bit()
      gpiolib: Update documentation of struct acpi_gpio_info
      gpiolib: Convert fwnode_get_named_gpiod() to configure GPIO

Augusto Mecking Caringi (1):
      gpio: intel-mid: Fix build warning when !CONFIG_PM

Axel Lin (1):
      gpio: mcp23s08: Select REGMAP/REGMAP_I2C to fix build error

Bartosz Golaszewski (8):
      gpio: mockup: make pins_name_start static
      gpio: mockup: dynamically allocate memory for chip name
      gpio: mockup: coding style fixes
      gpio: mockup: readability tweaks
      gpio: mockup: code shrink
      gpio: mockup: implement naming the lines
      gpio: mockup: add a dummy irqchip
      gpio: mockup: implement event injecting over debugfs

Boris Brezillon (2):
      gpio: Rename devm_get_gpiod_from_child()
      gpio: Add the devm_fwnode_get_index_gpiod_from_child() helper

Christophe JAILLET (1):
      gpiolib: Fix a WARN_ON that can never trigger

Geert Uytterhoeven (2):
      gpio: rcar: Fine-grained Runtime PM support
      gpio: of: Add support for multiple GPIOs in a single GPIO hog

John Crispin (1):
      gpio: update my email address

Keerthy (6):
      gpio: davinci: Remove redundant members davinci_gpio_controller stuct
      gpio: davinci: Remove gpio2regs function
      gpio: davinci: Remove unwanted blank line
      gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip
      gpio: davinci: Add support for multiple GPIO controllers
      gpio: davinci: Remove custom .xlate

Linus Walleij (7):
      gpio: add DT bindings for Cortina Gemini GPIO
      gpio: Add a driver for Cortina Systems Gemini GPIO
      Merge branch 'ib-gpiod-flags' into devel
      Merge branch 'ib-pinctrl-genprops' of /home/linus/linux-pinctrl into =
devel
      gpio: random documentation update
      Merge branch 'ib-gpiod-flags' into devel
      gpio: reintroduce devm_get_gpiod_from_child()

Mika Westerberg (3):
      pinctrl: Widen the generic pinconf argument from 16 to 24 bits
      pinctrl: Allow configuration of pins from gpiolib based drivers
      pinctrl / gpio: Introduce .set_config() callback for GPIO chips

Niklas S=C3=B6derlund (1):
      gpio: rcar: set IRQ chip parent_device

Russell King (1):
      gpio: mvebu: fix warning when building on 64-bit

Sebastian Reichel (1):
      gpio: mcp23s08: use regmap

Shuah Khan (1):
      gpio: tools: add .gitignore for generated files

Stephen Boyd (1):
      gpio: Remove impossible checks on container_of() result

Steve Longerbeam (1):
      gpio: pca953x: Add optional reset gpio control

Sudip Mukherjee (1):
      gpio: exar: add gpio for exar cards

Uwe Kleine-K=C3=B6nig (1):
      gpio-hammer: fix make consumer_label suitable to work on gpio-nails

William Breathitt Gray (22):
      gpio: 104-dio-48e: Add set_multiple callback function support
      gpio: 104-idio-16: Add set_multiple callback function support
      gpio: gpio-mm: Add set_multiple callback function support
      gpio: ws16c48: Add set_multiple callback function support
      gpio: 104-dio-48e: Utilize devm_ functions in driver probe callback
      gpio: 104-idi-48: Utilize devm_ functions in driver probe callback
      gpio: 104-idio-16: Utilize devm_ functions in driver probe callback
      gpio: gpio-mm: Utilize devm_ functions in driver probe callback
      gpio: ws16c48: Utilize devm_ functions in driver probe callback
      gpio: 104-dio-48e: Remove unnecessary driver_data set
      gpio: 104-idi-48: Remove unnecessary driver_data set
      gpio: 104-idio-16: Remove unnecessary driver_data set
      gpio: gpio-mm: Remove unnecessary driver_data set
      gpio: ws16c48: Remove unnecessary driver_data set
      gpio: 104-dio-48e: Add support for GPIO names
      gpio: 104-idi-48: Add support for GPIO names
      gpio: 104-idio-16: Add support for GPIO names
      gpio: gpio-mm: Add support for GPIO names
      gpio: ws16c48: Add support for GPIO names
      gpio: Add GPIO support for the ACCES PCI-IDIO-16
      gpio: pci-idio-16: Fix PCI device ID code
      gpio: pci-idio-16: Fix PCI BAR index

 .../bindings/gpio/cortina,gemini-gpio.txt          |  24 ++
 .../devicetree/bindings/gpio/gpio-pca953x.txt      |   4 +
 Documentation/devicetree/bindings/gpio/gpio.txt    |   8 +-
 Documentation/gpio/driver.txt                      |  64 +++-
 MAINTAINERS                                        |   6 +
 drivers/gpio/Kconfig                               |  29 ++
 drivers/gpio/Makefile                              |   3 +
 drivers/gpio/devres.c                              |  32 +-
 drivers/gpio/gpio-104-dio-48e.c                    |  91 +++--
 drivers/gpio/gpio-104-idi-48.c                     |  45 ++-
 drivers/gpio/gpio-104-idio-16.c                    |  60 ++--
 drivers/gpio/gpio-bcm-kona.c                       |  14 +-
 drivers/gpio/gpio-davinci.c                        | 177 +++++-----
 drivers/gpio/gpio-dln2.c                           |  12 +-
 drivers/gpio/gpio-dwapb.c                          |  14 +-
 drivers/gpio/gpio-ep93xx.c                         |  11 +-
 drivers/gpio/gpio-exar.c                           | 200 +++++++++++
 drivers/gpio/gpio-f7188x.c                         |  19 +-
 drivers/gpio/gpio-gemini.c                         | 236 +++++++++++++
 drivers/gpio/gpio-gpio-mm.c                        |  68 +++-
 drivers/gpio/gpio-intel-mid.c                      |   2 +-
 drivers/gpio/gpio-lp873x.c                         |  14 +-
 drivers/gpio/gpio-max77620.c                       |  20 +-
 drivers/gpio/gpio-mcp23s08.c                       | 320 +++++++----------
 drivers/gpio/gpio-menz127.c                        |  34 +-
 drivers/gpio/gpio-merrifield.c                     |  14 +-
 drivers/gpio/gpio-mm-lantiq.c                      |   2 +-
 drivers/gpio/gpio-mockup.c                         | 377 ++++++++++++++++-=
----
 drivers/gpio/gpio-mvebu.c                          |   2 +-
 drivers/gpio/gpio-omap.c                           |  14 +-
 drivers/gpio/gpio-pca953x.c                        |   9 +
 drivers/gpio/gpio-pci-idio-16.c                    | 349 +++++++++++++++++=
++
 drivers/gpio/gpio-rcar.c                           |  21 +-
 drivers/gpio/gpio-stp-xway.c                       |   2 +-
 drivers/gpio/gpio-tc3589x.c                        |  15 +-
 drivers/gpio/gpio-tegra.c                          |  14 +-
 drivers/gpio/gpio-tps65218.c                       |  14 +-
 drivers/gpio/gpio-vx855.c                          |  13 +-
 drivers/gpio/gpio-wcove.c                          |  13 +-
 drivers/gpio/gpio-wm831x.c                         |  21 +-
 drivers/gpio/gpio-wm8994.c                         |  13 +-
 drivers/gpio/gpio-ws16c48.c                        |  90 +++--
 drivers/gpio/gpiolib-acpi.c                        |   5 +-
 drivers/gpio/gpiolib-of.c                          |  31 +-
 drivers/gpio/gpiolib.c                             | 111 +++---
 drivers/gpio/gpiolib.h                             |   3 +-
 drivers/input/keyboard/gpio_keys.c                 |  12 +-
 drivers/input/keyboard/gpio_keys_polled.c          |  14 +-
 drivers/leds/leds-gpio.c                           |  14 +-
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             |   6 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |   2 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |   6 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             |   6 +-
 drivers/pinctrl/core.c                             |  29 ++
 drivers/pinctrl/intel/pinctrl-cherryview.c         |   4 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |  14 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |   2 -
 drivers/pinctrl/pinconf.c                          |  12 +
 drivers/pinctrl/pinconf.h                          |   9 +
 drivers/pinctrl/pinctrl-amd.c                      |  14 +-
 drivers/pinctrl/pinctrl-da850-pupd.c               |   2 -
 drivers/pinctrl/pinctrl-lpc18xx.c                  |  10 +-
 drivers/pinctrl/pinctrl-max77620.c                 |   2 +-
 drivers/pinctrl/pinctrl-palmas.c                   |   2 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |   2 +-
 drivers/pinctrl/pinctrl-single.c                   |   2 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |  55 +--
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |   3 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   2 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c   |   4 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c               |   2 +-
 drivers/rtc/rtc-omap.c                             |   2 +-
 drivers/staging/greybus/gpio.c                     |  15 +-
 drivers/usb/serial/cp210x.c                        |  13 +-
 drivers/video/fbdev/amba-clcd-nomadik.c            |  19 +-
 include/linux/gpio/consumer.h                      |  55 ++-
 include/linux/gpio/driver.h                        |  37 +-
 include/linux/pinctrl/consumer.h                   |   6 +
 include/linux/pinctrl/pinconf-generic.h            |  52 +--
 include/linux/platform_data/gpio-davinci.h         |  15 +-
 tools/gpio/.gitignore                              |   4 +
 tools/gpio/gpio-hammer.c                           |   2 +-
 82 files changed, 2234 insertions(+), 856 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/gpio/cortina,gemini-gpio.txt
 create mode 100644 drivers/gpio/gpio-exar.c
 create mode 100644 drivers/gpio/gpio-gemini.c
 create mode 100644 drivers/gpio/gpio-pci-idio-16.c
 create mode 100644 tools/gpio/.gitignore
