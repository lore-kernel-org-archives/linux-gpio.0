From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] bulk GPIO changes for the v4.1 cycle
Date: Fri, 17 Apr 2015 11:50:46 +0200
Message-ID: <CACRpkdYT9ojt4_-Nyuo6=R__Sf3G-n1HAd90ZewbaL3meEK_Bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

this is the bulk of GPIO changes queued for v4.1.

It's quite a lot of change for being GPIO, tested in linux-next
plus I also took a few extra rounds of allmod compilation after
the debacle with pin control (which is fixed, by the way).
The details are in the signed tag.

As you noticed Kconfig is not always my friend so just beat me
up if I got something wrong, I'm trying my best.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.1-1

for you to fetch changes up to 03daa6f82f2b634019fe8261698f6af3c133497f:

  Revert "gpio: sch: use uapi/linux/pci_ids.h directly" (2015-04-10
11:35:45 +0200)

----------------------------------------------------------------
This is the bulk of GPIO changes for the v4.1 development
cycle:

- A new GPIO hogging mechanism has been added. This can
  be used on boards that want to drive some GPIO line high,
  low, or set it as input on boot and then never touch it
  again. For some embedded systems this is bliss and
  simplifies things to a great extent.

- Some API cleanup and closure: gpiod_get_array() and
  gpiod_put_array() has been added to get and put GPIOs
  in bulk as was possible with the non-descriptor API.

- Encapsulate cross-calls to the pin control subsystem in
  <linux/gpio/driver.h>. Now this should be the only header
  any GPIO driver needs to include or something is wrong.
  Cleanups restricting drivers to this include are welcomed
  if tested.

- Sort the GPIO Kconfig and split it into submenus, as
  it was becoming and unstructured, illogical and
  unnavigatable mess. I hope this is easier to follow.
  Menus that require a certain subsystem like I2C can
  now be hidden nicely for example, still working on
  others.

- New drivers:

    - New driver for the Altera Soft GPIO.

    - The F7188x driver now handles the F71869 and
      F71869A variants.

    - The MIPS Loongson driver has been moved to
      drivers/gpio for consolidation and cleanup.

- Cleanups:

   - The MAX732x is converted to use the GPIOLIB_IRQCHIP
     infrastructure.

   - The PCF857x is converted to use the GPIOLIB_IRQCHIP
     infrastructure.

   - Radical cleanup of the OMAP driver.

- Misc:

   - Enable the DWAPB GPIO for all architectures. This is
     a "hard IP" block from Synopsys which has started to
     turn up in so diverse architectures as X86 Quark, ARC
     and a slew of ARM systems. So even though it's not an
     expander, it's generic enough to be available for all.

   - We add a mock GPIO on Crystalcove PMIC after a long
     discussion with Daniel Vetter et al, tracing back to
     the shootout at the kernel summit where DRM drivers
     and sub-componentization was discussed. In this case
     a mock GPIO is assumed to be the best compromise
     gaining some reuse of infrastructure without making
     DRM drivers overly complex at the same time. Let's
     see.

----------------------------------------------------------------
Aaron Sierra (1):
      gpio: ich: Implement get_direction function

Andreas Bofjall (3):
      gpio: f7188x: correct spelling of "Fintek"
      gpio: f7188x: add GPIO support for F71869
      gpio: f7188x: add GPIO support for F71869A

Andy Shevchenko (1):
      gpio: dwapb: enable for Quark

Axel Lin (2):
      gpio: mb86s70: Return error if requesting an already assigned gpio
      gpio: vf610: Replaces comma between expression statements by semicolon

Benoit Parrot (2):
      gpio: add GPIO hogging mechanism
      gpio: Document GPIO hogging mechanism

Dmitry Torokhov (1):
      gpio: gpio-tb10x: remove incorrect __exit markup

Geert Uytterhoeven (5):
      gpio: pcf857x: Switch to use gpiolib irqchip helpers
      gpio: pcf857x: Propagate wake-up setting to parent irq controller
      gpio: rcar: Use local variable gpio_chip in gpio_rcar_probe()
      gpio: rcar: Add more register documentation
      gpio: rcar: Prevent module clock disable when wake-up is enabled

Gregory CLEMENT (1):
      gpio: mvebu: Fix mask/unmask managment per irq chip type

Grygorii Strashko (9):
      gpio: omap: irq_shutdown: remove unnecessary call of
gpiochip_unlock_as_irq
      gpio: omap: convert omap_gpio_is_input() to use gpio offset
      gpio: omap: simplify omap_set_gpio_dataout_x()
      gpio: omap: convert debounce functions switch to use gpio offset
      gpio: omap: drop 'gpio' param from omap_gpio_init_irq()
      gpio: omap: convert gpio irq functions to use GPIO offset
      gpio: omap: get rid of GPIO_BIT() macro
      gpio: omap: get rid of omap_irq_to_gpio()
      gpio: omap: get rid of GPIO_INDEX() macro

Huacai Chen (3):
      MIPS: Cleanup Loongson-2F's gpio driver
      MIPS: Move Loongson GPIO driver to drivers/gpio
      gpio: loongson: Add Loongson-3A/3B GPIO driver support

Josh Wu (1):
      gpio: mrvl: documentation: trivial: fix typo

Kefeng Wang (1):
      gpio: dwapb: re-enable GPIO_DWAPB for arm64

Linus Walleij (12):
      gpio: max732x: convert to GPIOLIB_IRQCHIP
      gpio: fix constconst in devres
      gpio: move pincontrol calls to <linux/gpio/driver.h>
      gpio: arrange Kconfig symbols alphabetically
      gpio: arrange I2C Kconfig symbols alphabetically
      gpio: arrange PCI GPIO controllers alphabetically
      gpio: arrange SPI Kconfig symbols alphabetically
      gpio: move BCM Kona Kconfig option
      gpio: move MFD GPIO drivers under their own comment
      gpio: split GPIO drivers in submenus
      gpio: dwapb: remove dependencies
      Revert "gpio: sch: use uapi/linux/pci_ids.h directly"

Michael S. Tsirkin (1):
      gpio: sch: use uapi/linux/pci_ids.h directly

Olliver Schinagl (1):
      gpio: add parameter to allow the use named gpios

Rafael J. Wysocki (2):
      gpio / ACPI: Avoid unnecessary checks in __gpiod_get_index()
      gpio / ACPI: Use local variable instead of ACPI_HANDLE()

Rob Herring (1):
      gpio: pxa: simplify BANK_OFF macro offset calculation

Rojhalat Ibrahim (4):
      gpiolib: define gpio suffixes globally
      gpiolib: add gpiod_get_array and gpiod_put_array functions
      gpiolib: add devm_gpiod_get_array and devm_gpiod_put_array functions
      extend documentation for gpiod_set_array() functions

Shobhit Kumar (1):
      gpio/crystalcove: Add additional GPIO for Panel control

Tien Hock Loh (2):
      drivers/gpio: Altera soft IP GPIO driver
      drivers/gpio: Altera soft IP GPIO driver device tree binding

Varka Bhadram (5):
      gpio: use devm_kzalloc
      gpio: max7300: remove 'ret' variable
      gpio: arizona: drop owner assignment from platform_drivers
      gpio: use (!foo) instead of (foo == NULL)
      gpio: removing kfree remove functionality

Vineet Gupta (1):
      gpio: dwapb: enable for ARC

Vladimir Zapolskiy (1):
      gpio: x-gene: fix devm_ioremap_resource() check

kbuild test robot (1):
      altera_gpio_probe() can be static

 .../devicetree/bindings/gpio/gpio-altera.txt       |  43 ++
 Documentation/devicetree/bindings/gpio/gpio.txt    |  30 +
 .../devicetree/bindings/gpio/mrvl-gpio.txt         |   2 +-
 Documentation/gpio/consumer.txt                    |  65 +-
 MAINTAINERS                                        |   6 +
 arch/mips/Kconfig                                  |   1 +
 arch/mips/configs/lemote2f_defconfig               |   1 +
 arch/mips/configs/loongson3_defconfig              |   1 +
 arch/mips/include/asm/mach-loongson/gpio.h         |  15 +-
 arch/mips/loongson/common/Makefile                 |   1 -
 drivers/gpio/Kconfig                               | 724 +++++++++++----------
 drivers/gpio/Makefile                              |   2 +
 drivers/gpio/devres.c                              | 107 ++-
 drivers/gpio/gpio-adp5588.c                        |   8 +-
 drivers/gpio/gpio-altera.c                         | 374 +++++++++++
 drivers/gpio/gpio-arizona.c                        |   3 +-
 drivers/gpio/gpio-crystalcove.c                    |   7 +-
 drivers/gpio/gpio-da9052.c                         |   2 +-
 drivers/gpio/gpio-da9055.c                         |   2 +-
 drivers/gpio/gpio-f7188x.c                         |  47 +-
 drivers/gpio/gpio-ich.c                            |   6 +
 drivers/gpio/gpio-kempld.c                         |   2 +-
 .../common/gpio.c => drivers/gpio/gpio-loongson.c  | 120 ++--
 drivers/gpio/gpio-max7300.c                        |   4 +-
 drivers/gpio/gpio-max732x.c                        | 134 ++--
 drivers/gpio/gpio-mb86s7x.c                        |   5 +
 drivers/gpio/gpio-mc33880.c                        |   2 +-
 drivers/gpio/gpio-mcp23s08.c                       |   9 +-
 drivers/gpio/gpio-mvebu.c                          |  24 +-
 drivers/gpio/gpio-omap.c                           | 131 ++--
 drivers/gpio/gpio-pcf857x.c                        | 134 ++--
 drivers/gpio/gpio-pxa.c                            |   3 +-
 drivers/gpio/gpio-rcar.c                           |  63 +-
 drivers/gpio/gpio-tb10x.c                          |   2 +-
 drivers/gpio/gpio-vf610.c                          |  16 +-
 drivers/gpio/gpio-xgene-sb.c                       |   2 +-
 drivers/gpio/gpiolib-acpi.c                        |  86 ++-
 drivers/gpio/gpiolib-of.c                          | 111 ++++
 drivers/gpio/gpiolib.c                             | 299 ++++++++-
 drivers/gpio/gpiolib.h                             |  13 +
 drivers/input/keyboard/gpio_keys_polled.c          |   2 +-
 drivers/leds/leds-gpio.c                           |   2 +-
 include/asm-generic/gpio.h                         |  48 --
 include/linux/gpio/consumer.h                      |  77 +++
 include/linux/gpio/driver.h                        |  48 ++
 45 files changed, 1952 insertions(+), 832 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera.txt
 create mode 100644 drivers/gpio/gpio-altera.c
 rename arch/mips/loongson/common/gpio.c => drivers/gpio/gpio-loongson.c (52%)
