From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] bulk GPIO changes for v4.8
Date: Mon, 25 Jul 2016 10:02:26 +0200
Message-ID: <CACRpkdZrwcNX5AKarfZ6GJFig3DtizmC+ZDpDGC1Pg+aPcKyXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:33987 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751968AbcGYIC2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2016 04:02:28 -0400
Received: by mail-oi0-f49.google.com with SMTP id l65so241279730oib.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2016 01:02:28 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

Hi Linus,

here is the bulk of the GPIO changes for the v4.8 kernel cycle. The big
news is the completion of the chardev ABI which I'm very happy about
and apart from that it's an ordinary, quite busy cycle. The details are
in the signed tag.

The patches are tested in linux-next for some time, patches to other
subsystem mostly have ACKs.

I got overly ambitious with configureing lines as input for IRQ lines b=
ut
it turns out that some controllers have their interrupt-enable and
input-enabling in orthogonal settings so the assumption that all IRQ
lines are input lines does not hold. Oh well, revert and back to the
drawing board with that.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit af8c34ce6ae32addda3788d54a7e340cad22=
516b:

  Linux 4.7-rc2 (2016-06-05 14:31:26 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.8-1

for you to fetch changes up to 224f9e6d538c4cfb2fa8dc4206fceb9431271388=
:

  MAINTAINERS: Add INTEL MERRIFIELD GPIO entry (2016-07-22 15:30:43 +02=
00)

----------------------------------------------------------------
This is the bulk of GPIO changes for the v4.8 kernel cycle.

Core changes:

- The big item is of course the completion of the character
  device ABI. It has now replaced and surpassed the former
  unmaintainable sysfs ABI: we can now hammer (bitbang)
  individual lines or sets of lines and read individual lines
  or sets of lines from userspace, and we can also register
  to listen to GPIO events from userspace. As a tie-in we
  have two new tools in tools/gpio: gpio-hammer and
  gpio-event-mon that illustrate the proper use of the new
  ABI. As someone said: the wild west days of GPIO are now
  over.

- Continued to remove the pointless
  ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB Kconfig symbols.
  I'm patching hexagon, openrisc, powerpc, sh, unicore,
  ia64 and microblaze. These are either ACKed by their
  maintainers or patched anyways after a grace period and
  no response from maintainers. Some archs (ARM) come in from
  their trees, and others (x86) are still not fixed, so I
  might send a second pull request to root it out later in
  this merge window, or just defer to v4.9.

- The GPIO tools are moved to the tools build system.

New drivers:

- New driver for the MAX77620/MAX20024.

- New driver for the Intel Merrifield.

- Enabled PCA953x for the TI PCA9536.

- Enabled PCA953x for the Intel Edison.

- Enabled R8A7792 in the RCAR driver.

Driver improvements:

- The STMPE and F7188x now supports the .get_direction()
  callback.

- The Xilinx driver supports setting multiple lines at
  once.

- ACPI support for the Vulcan GPIO controller.

- The MMIO GPIO driver supports device tree probing.

- The Acer One 10 is supported through the _DEP ACPI
  attribute.

Cleanups:

- A major cleanup of the OF/DT support code. It is way
  easier to read and understand now, probably this improves
  performance too.

- Drop a few redundant .owner assignments.

- Remove CLPS711x boardfile support: we are 100% DT.

----------------------------------------------------------------
Alexander Shiyan (3):
      gpio: clps711x: Change the compatibility string
      gpio: syscon: Change the compatibility string
      gpio: clps711x: Remove board support

Andrew F. Davis (1):
      gpio: Only descend into gpio directory when CONFIG_GPIOLIB is set

Andrew Jeffery (1):
      gpio: Fix paths to GPIO driver source files

Andy Shevchenko (13):
      gpio: pca953x: remove redundant assignments
      gpio: pca953x: enfore type for i2c_smbus_write_word_data()
      gpio: pca953x: enable driver on Intel Edison
      gpio: intel-mid: switch to devm_gpiochip_add_data()
      tools/gpio: move to tools buildsystem
      tools/gpio: add install section
      gpio: lynxpoint: avoid potential warning on error path
      gpio: intel-mid: Remove potentially harmful code
      gpio: intel-mid: Sort header block alphabetically
      gpio: intel-mid: Make it depend to X86_INTEL_MID
      gpio: merrifield: Introduce GPIO driver to support Merrifield
      gpio: merrifield: Protect irq_ack() and gpio_set() by lock
      MAINTAINERS: Add INTEL MERRIFIELD GPIO entry

Arnd Bergmann (1):
      gpiolib: avoid uninitialized data in gpio kfifo

Ben Dooks (1):
      gpiolib: make lineevent_irq_thread static

Christian Lamparter (1):
      gpio: mmio: add MyBook Live GPIO support

Geert Uytterhoeven (1):
      gpio: 74x164: Use spi_write() helper instead of open coding

Iban Rodriguez (1):
      gpio: xilinx: Add support to set multiple GPIO at once

Kamlakant Patel (2):
      gpio: xlp: Fix vulcan IRQ descriptor allocation
      gpio: Add ACPI support for XLP GPIO controller

Keerthy (1):
      gpio: tps65218: Add platform_device_id table

Kishon Vijay Abraham I (1):
      gpio: pcf857x: restore the initial line state of all pcf lines

Lars-Peter Clausen (1):
      gpiolib: of_find_gpio(): Don't discard errors

Laxman Dewangan (4):
      gpio: add DT binding doc for gpio of PMIC max77620/max20024
      gpio: max77620: add gpio driver for MAX77620/MAX20024
      gpio: max77620: Configure interrupt trigger level
      gpio: max77620: use the new open drain callback

Linus Walleij (17):
      gpio: stmpe: implement .get_direction()
      hexagon: update TODO list
      pinctrl: xway: use devm_gpiochip_add_data()
      openrisc: do away with ARCH_REQUIRE_GPIOLIB
      powerpc: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
      sh: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB
      unicore: do away with ARCH_REQUIRE_GPIOLIB
      ia64: remove ARCH_WANT_OPTIONAL_GPIOLIB
      microblaze: remove ARCH_WANT_OPTIONAL_GPIOLIB
      gpio: userspace ABI for reading/writing GPIO lines
      tools/gpio: add the gpio-hammer tool
      gpio: userspace ABI for reading GPIO line events
      tools/gpio: add the gpio-event-mon tool
      gpio: make the iterator point to last handle
      gpio: convince line to become input in irq helper
      gpio: free handles in fringe cases
      Revert "gpio: convince line to become input in irq helper"

Masahiro Yamada (7):
      gpio: of: add missing of_node_put() to of_gpiochip_add_pin_range(=
)
      gpio: remove redundant owner assignments of drivers
      gpio: of: optimize "gpios" property parsing of of_parse_own_gpio(=
)
      gpio: of: drop needless gpio_chip look-up in of_parse_own_gpio()
      gpio: of: move chip->of_gpio_n_cells checking to of_gpiochip_add(=
)
      gpio: of: remove of_gpiochip_and_xlate() and struct gg_data
      gpio: of: factor out common code to a new helper function

Paul Gortmaker (1):
      gpio: lpc18xx: convert GPIO_LPC18XX from bool to tristate

Rui Zhang (1):
      gpio: acpi: add _DEP support for Acer One 10

Sergei Shtylyov (1):
      gpio: rcar: add R8A7792 support

Thierry Reding (1):
      gpio: of: Allow overriding the device node

Venkat Reddy Talla (1):
      gpio: max77620: get gpio value based on direction

Vignesh R (2):
      gpio: pca953x: Add support for TI PCA9536
      gpio: pca953x: Fix NBANK calculation for PCA9536

Wei Yongjun (2):
      gpiolib: remove duplicated include from gpiolib.c
      gpio: dwapb: add missing fwnode_handle_put() in dwapb_gpio_get_pd=
ata()

plr.vincent@gmail.com (1):
      gpio: f7188x: Implement get_direction.

=C3=81lvaro Fern=C3=A1ndez Rojas (1):
      gpio: mmio: add DT support for memory-mapped GPIOs

 .../bindings/gpio/cirrus,clps711x-mctrl-gpio.txt   |   4 +-
 .../devicetree/bindings/gpio/gpio-clps711x.txt     |   4 +-
 .../devicetree/bindings/gpio/gpio-max77620.txt     |  25 +
 .../devicetree/bindings/gpio/gpio-pca953x.txt      |   1 +
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |   1 +
 Documentation/gpio/drivers-on-gpio.txt             |  13 +-
 MAINTAINERS                                        |   6 +
 arch/hexagon/Kconfig                               |   3 +-
 arch/ia64/Kconfig                                  |   1 -
 arch/microblaze/Kconfig                            |   1 -
 arch/openrisc/Kconfig                              |   2 +-
 arch/powerpc/Kconfig                               |   1 -
 arch/powerpc/platforms/40x/Kconfig                 |   2 +-
 arch/powerpc/platforms/44x/Kconfig                 |   2 +-
 arch/powerpc/platforms/512x/Kconfig                |   1 -
 arch/powerpc/platforms/83xx/Kconfig                |   3 -
 arch/powerpc/platforms/85xx/Kconfig                |   4 +-
 arch/powerpc/platforms/86xx/Kconfig                |   7 +-
 arch/powerpc/platforms/8xx/Kconfig                 |   2 +-
 arch/powerpc/platforms/Kconfig                     |   8 +-
 arch/sh/Kconfig                                    |  11 +-
 arch/sh/boards/Kconfig                             |  17 +-
 arch/sh/boards/mach-highlander/Kconfig             |   2 +-
 arch/sh/boards/mach-rsk/Kconfig                    |   6 +-
 arch/unicore32/Kconfig                             |   2 +-
 drivers/Makefile                                   |   2 +-
 drivers/gpio/Kconfig                               |  24 +-
 drivers/gpio/Makefile                              |   2 +
 drivers/gpio/gpio-74x164.c                         |   9 +-
 drivers/gpio/gpio-clps711x.c                       |  10 +-
 drivers/gpio/gpio-dwapb.c                          |   1 +
 drivers/gpio/gpio-f7188x.c                         |  22 +
 drivers/gpio/gpio-intel-mid.c                      |  37 +-
 drivers/gpio/gpio-lynxpoint.c                      |   1 -
 drivers/gpio/gpio-max77620.c                       | 315 +++++++++++++
 drivers/gpio/gpio-menz127.c                        |   1 -
 drivers/gpio/gpio-merrifield.c                     | 444 +++++++++++++=
+++++
 drivers/gpio/gpio-mmio.c                           |  51 +-
 drivers/gpio/gpio-palmas.c                         |   1 -
 drivers/gpio/gpio-pca953x.c                        |  23 +-
 drivers/gpio/gpio-pcf857x.c                        |   9 +
 drivers/gpio/gpio-rcar.c                           |   3 +
 drivers/gpio/gpio-rdc321x.c                        |   1 -
 drivers/gpio/gpio-sch311x.c                        |   1 -
 drivers/gpio/gpio-stmpe.c                          |  18 +-
 drivers/gpio/gpio-syscon.c                         |   4 +-
 drivers/gpio/gpio-tc3589x.c                        |   1 -
 drivers/gpio/gpio-tps65218.c                       |   7 +
 drivers/gpio/gpio-tps6586x.c                       |   1 -
 drivers/gpio/gpio-tps65910.c                       |   1 -
 drivers/gpio/gpio-viperboard.c                     |   1 -
 drivers/gpio/gpio-wm831x.c                         |   1 -
 drivers/gpio/gpio-wm8350.c                         |   1 -
 drivers/gpio/gpio-wm8994.c                         |   1 -
 drivers/gpio/gpio-xilinx.c                         |  48 ++
 drivers/gpio/gpio-xlp.c                            |  52 ++-
 drivers/gpio/gpiolib-acpi.c                        |   1 +
 drivers/gpio/gpiolib-of.c                          | 127 +++--
 drivers/gpio/gpiolib.c                             | 511 +++++++++++++=
+++++++-
 drivers/pinctrl/pinctrl-xway.c                     |   5 +-
 include/uapi/linux/gpio.h                          | 105 ++++-
 tools/Makefile                                     |   7 +-
 tools/gpio/Build                                   |   3 +
 tools/gpio/Makefile                                |  75 ++-
 tools/gpio/gpio-event-mon.c                        | 192 ++++++++
 tools/gpio/gpio-hammer.c                           | 189 ++++++++
 66 files changed, 2207 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max7762=
0.txt
 create mode 100644 drivers/gpio/gpio-max77620.c
 create mode 100644 drivers/gpio/gpio-merrifield.c
 create mode 100644 tools/gpio/Build
 create mode 100644 tools/gpio/gpio-event-mon.c
 create mode 100644 tools/gpio/gpio-hammer.c
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
