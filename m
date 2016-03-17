From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO bulk changes for kernel v4.6
Date: Thu, 17 Mar 2016 09:59:07 +0100
Message-ID: <CACRpkdbGkfJ9bW1db64msMeQjue+=y+op5EmSx62FWOWDOJwWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:33752 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932285AbcCQI7I (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Mar 2016 04:59:08 -0400
Received: by mail-ob0-f174.google.com with SMTP id fz5so77312861obc.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2016 01:59:08 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>

Hi Linus,

here is the big bulk of changes for kernel v4.6. There is quite a lot
of interesting stuff going on.

NOTE: tree was a bit dirty and I realized it too late: Laxmans
devm_gpiochip_add() branch was based on my for-next branch rather
than my devel branch, making some commits appear twice and
a file named README.md "Share upstreaming patches" appear and
then get reverted out by me.

The end result should be clean but the history is a bit messy.

If you prefer that I rebase the tree and remove the noise, just tell me
and I'll do that and send an updated pull request. I didn't want to
unnecessarily disturb the tested tree at this point. Maybe I'm doing
the wrong thing, tell me.

On top of this I pulled an immutable branch from Lee Jones, so
an MFD and regulator driver may first appear through this tree
or already be in your tree, a bit of race to the line as usual with
these cross-subsystem things. I guess it would need to be
re-pulled if I rebase, etc, sigh.

The patches to other subsystems and arch-wide are ACKed as far
as possible, though I consider things like per-arch <asm/gpio.h> as
essentially a part of the GPIO subsystem so it should not be needed.

The meat of the new stuff is in the signed tag.
Greg gave a nod to the new device/chardev code:
http://marc.info/?l=linux-gpio&m=144564661321472&w=2

Please pull it in, or tell me to go rebase my stuff.

Yours,
Linus Walleij

The following changes since commit 36f90b0a2ddd60823fe193a85e60ff1906c2a9b3:

  Linux 4.5-rc2 (2016-01-31 18:12:16 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.6-1

for you to fetch changes up to ccbd805aa934dd1b863ef115a9c55f119b2388cf:

  Revert "Share upstreaming patches" (2016-03-17 09:36:09 +0100)

----------------------------------------------------------------
This is the bulk of GPIO changes for kernel v4.6:

Core changes:

- The gpio_chip is now a *real device*. Until now the gpio chips
  were just piggybacking the parent device or (gasp) floating in
  space outside of the device model. We now finally make GPIO chips
  devices. The gpio_chip will create a gpio_device which contains
  a struct device, and this gpio_device struct is kept private.
  Anything that needs to be kept private from the rest of the kernel
  will gradually be moved over to the gpio_device.

- As a result of making the gpio_device a real device, we have added
  resource management, so devm_gpiochip_add_data() will cut down on
  overhead and reduce code lines. A huge slew of patches convert
  almost all drivers in the subsystem to use this.

- Building on making the GPIO a real device, we add the first step
  of a new userspace ABI: the GPIO character device. We take small
  steps here, so we first add a pure *information* ABI and the tool
  "lsgpio" that will list all GPIO devices on the system and all
  lines on these devices. We can now discover GPIOs properly from
  userspace. We still have not come up with a way to actually *use*
  GPIOs from userspace.

- To encourage people to use the character device for the future,
  we have it always-enabled when using GPIO. The old sysfs ABI is
  still opt-in (and can be used in parallel), but is marked as
  deprecated. We will keep it around for the foreseeable future,
  but it will not be extended to cover ever more use cases.

Cleanup:

- Bjorn Helgaas removed a whole slew of per-architecture <asm/gpio.h>
  includes. This dates back to when GPIO was an opt-in feature and
  no shared library even existed: just a header file with proper
  prototypes was provided and all semantics were up to the arch to
  implement. These patches make the GPIO chip even more a proper
  device and cleans out leftovers of the old in-kernel API here
  and there. Still some cruft is left but it's very little now.

- There is still some clamping of return values for .get() going
  on, but we now return sane values in the vast majority of drivers
  and the errorpath is sanitized. Some patches for powerpc, blackfin
  and unicore still drop in.

- We continue to switch the ARM, MIPS, blackfin, m68k local GPIO
  implementations to use gpiochip_add_data() and cut down on code
  lines.

- MPC8xxx is converted to use the generic GPIO helpers.

- ATH79 is converted to use the generic GPIO helpers.

New drivers:

- WinSystems WS16C48

- Acces 104-DIO-48E

- F81866 (a F7188x variant)

- Qoric (a MPC8xxx variant)

- TS-4800

- SPI serializers (pisosr): simple 74xx shift registers connected
  to SPI to obtain a dirt-cheap output-only GPIO expander.

- Texas Instruments TPIC2810

- Texas Instruments TPS65218

- Texas Instruments TPS65912

- X-Gene (ARM64) standby GPIO controller

----------------------------------------------------------------
Alban Bedel (5):
      gpio: ath79: Move to the generic GPIO driver
      gpio: ath79: Allow building in compile tests
      gpio: ath79: Make the driver removable
      gpio: ath79: Add support for the interrupt controller
      gpio: ath79: Update the copyright notice

Amitoj Kaur Chawla (1):
      gpio: timberdale: Switch to devm_ioremap_resource()

Andreas Werner (1):
      gpio: add driver for MEN 16Z127 GPIO controller

Andrew F. Davis (8):
      gpio: Add driver for SPI serializers
      gpio: Add driver for TI TPIC2810
      Documentation: tps65912: Add DT bindings for the TPS65912 PMIC
      mfd: tps65912: Remove old driver in preparation for new driver
      mfd: tps65912: Add driver for the TPS65912 PMIC
      regulator: tps65912: Add regulator driver for the TPS65912 PMIC
      gpio: tps65912: Add GPIO driver for the TPS65912 PMIC
      gpio: Add generic serializer DT binding

Andrzej Hajda (2):
      gpio: xgene: fix type of variable containing error codes
      gpio: xgene: fix type of variable containing error codes

Arnd Bergmann (3):
      gpio: remove broken irq_to_gpio() interface
      gpio: ks8695: remove irq_to_gpio function
      gpio: allow setting ARCH_NR_GPIOS from Kconfig

Axel Lin (18):
      gpio: tpic2810: Make tpic2810_direction_output set proper output level
      gpio: tps65218: Make tps65218_gpio_output set proper output level
      gpio: ath79: Check valid gpio count for both DT and non-DT cases
      gpio: brcmstb: Use list_for_each_entry at appropriate places
      gpio: ts4800: Drop redundant code to set already initialized
gpio_chip fields
      gpio: pisosr: Use devm_gpiod_get_optional for gpio->load_gpio
      gpio: ath79: Check valid gpio count for both DT and non-DT cases
      gpio: brcmstb: Use list_for_each_entry at appropriate places
      gpio: ts4800: Drop redundant code to set already initialized
gpio_chip fields
      gpio: pisosr: Use devm_gpiod_get_optional for gpio->load_gpio
      gpio: pisosr: Use gpiod_set_value_cansleep in pisosr_gpio_refresh()
      gpio: mb86s7x: Allow compile test build
      gpio: moxart: Drop redundant code to set already initialized
gpio_chip fields
      gpio: moxart: Allow compile test build
      gpio: lp3943: Drop pin_used and lp3943_gpio_request/lp3943_gpio_free
      gpio: mpc8xxx: Fixup setting gpio direction output
      gpio: mpc8xxx: Remove *read_reg and *write_reg from struct
mpc8xxx_gpio_chip
      gpio: mpc8xxx: Slightly update the code for better readability

Bamvor Jian Zhang (3):
      gpiolib: fix crash when gpiochip removed
      gpio: fix abi regression in sysfs
      gpiolib: rewrite gpiodev_add_to_list

Bjorn Helgaas (2):
      gpio: Include linux/gpio.h instead of asm/gpio.h
      gpio: Remove unused asm/gpio.h files

Gabor Juhos (1):
      gpio: documenatation: fix GPIO_LOOKUP{,_IDX} documentation

Geert Uytterhoeven (4):
      gpio: Propagate all errors in devm_get_gpiod_from_child()
      gpio: rcar: Add Runtime PM handling for interrupts
      gpio: pca953x: Fix pca953x_gpio_set_multiple() on 64-bit
      gpiolib: Fix comment referring to gpio_*() in gpiod_*()

Geliang Tang (1):
      gpio: davinci: use irq_data_get_chip_type

Grygorii Strashko (1):
      gpio: omap: drop dev field from gpio_bank structure

Insu Yun (1):
      gpio-mcp23s08: correctly handling failed allocation

Josh Cartwright (1):
      gpio: use kzalloc to allocate gpio_device

Julien Grossholtz (4):
      gpio: add bindings for TS-4800 gpio controller
      gpio: add TS-4800 fpga GPIO support
      gpio: TS-4800: remove useless bgpio_init flags
      gpio: ts4800: Add IMX51 dependency

Keerthy (1):
      gpio: davinci: Add the missing of-node pointer

Laxman Dewangan (60):
      Merge remote-tracking branch 'linusw-gpio/for-next' into devm_gpiochip
      gpio: Add devm_ apis for gpiochip_add_data and gpiochip_remove
      gpio: Add resource management devm_gpio_chip_{add_data,remove}
      gpio: Add missing devm_gpio_ wrapper in devres.txt
      gpio: 74xx-mmio: Use devm_gpiochip_add_data() for gpio registration
      gpio: adnp: Use devm_gpiochip_add_data() for gpio registration
      gpio: adp5520: Use devm_gpiochip_add_data() for gpio registration
      gpio: adp5588: Use devm_gpiochip_add_data() for gpio registration
      gpio: arizona: Use devm_gpiochip_add_data() for gpio registration
      gpio: bcm-kona: Use devm_gpiochip_add_data() for gpio registration
      gpio: clps711x: Use devm_gpiochip_add_data() for gpio registration
      gpio: crystalcove: Use devm_gpiochip_add_data() for gpio registration
      gpio: cs5535: Use devm_gpiochip_add_data() for gpio registration
      gpio: da9052: Use devm_gpiochip_add_data() for gpio registration
      gpio: da9055: Use devm_gpiochip_add_data() for gpio registration
      gpio: dln2: Use devm_gpiochip_add_data() for gpio registration
      gpio: ep93xx: Use devm_gpiochip_add_data() for gpio registration
      gpio: f7188x: Use devm_gpiochip_add_data() for gpio registration
      gpio: ge: Use devm_gpiochip_add_data() for gpio registration
      gpio: generic: Use devm_gpiochip_add_data() for gpio registration
      gpio: iop: Use devm_gpiochip_add_data() for gpio registration
      gpio: janz-ttl: Use devm_gpiochip_add_data() for gpio registration
      gpio: kempld: Use devm_gpiochip_add_data() for gpio registration
      gpio: lp3943: Use devm_gpiochip_add_data() for gpio registration
      gpio: lpc32xx: Use devm_gpiochip_add_data() for gpio registration
      gpio: lynxpoint: Use devm_gpiochip_add_data() for gpio registration
      gpio: mc9s08dz60: Use devm_gpiochip_add_data() for gpio registration
      gpio: moxart: Use devm_gpiochip_add_data() for gpio registration
      gpio: mvebu: Use devm_gpiochip_add_data() for gpio registration
      gpio: mxc: Use devm_gpiochip_add_data() for gpio registration
      gpio: octeon: Use devm_gpiochip_add_data() for gpio registration
      gpio: pca953x: Use devm_gpiochip_add_data() for gpio registration
      gpio: pcf857x: Use devm_gpiochip_add_data() for gpio registration
      gpio: palmas: Use devm_gpiochip_add_data() for gpio registration
      gpio: rc5t583: Use devm_gpiochip_add_data() for gpio registration
      gpio: rdc321x: Use devm_gpiochip_add_data() for gpio registration
      gpio: sch: Use devm_gpiochip_add_data() for gpio registration
      gpio: spear-spics: Use devm_gpiochip_add_data() for gpio registration
      gpio: sta2x11: Use devm_gpiochip_add_data() for gpio registration
      gpio: stp-xway: Use devm_gpiochip_add_data() for gpio registration
      gpio: sx150x: Use devm_gpiochip_add_data() for gpio registration
      gpio: syscon: Use devm_gpiochip_add_data() for gpio registration
      gpio: tb10x: Use devm_gpiochip_add_data() for gpio registration
      gpio: tc3589x: Use devm_gpiochip_add_data() for gpio registration
      gpio: tegra: Use devm_gpiochip_add_data() for gpio registration
      gpio: timberdale Use devm_gpiochip_add_data() for gpio registration
      gpio: tps6586x: Use devm_gpiochip_add_data() for gpio registration
      gpio: tps65910: Use devm_gpiochip_add_data() for gpio registration
      gpio: tps65912: Use devm_gpiochip_add_data() for gpio registration
      gpio: ts4800: Use devm_gpiochip_add_data() for gpio registration
      gpio: ts5500: Use devm_gpiochip_add_data() for gpio registration
      gpio: twl6040: Use devm_gpiochip_add_data() for gpio registration
      gpio: ucb1400: Use devm_gpiochip_add_data() for gpio registration
      gpio: viperboard: Use devm_gpiochip_add_data() for gpio registration
      gpio: vx855: Use devm_gpiochip_add_data() for gpio registration
      gpio: wm8350: Use devm_gpiochip_add_data() for gpio registration
      gpio: wm8350: Use devm_gpiochip_add_data() for gpio registration
      gpio: wm8994: Use devm_gpiochip_add_data() for gpio registration
      gpio: xgene-sb: Use devm_gpiochip_add_data() for gpio registration
      gpio: xgene: Use devm_gpiochip_add_data() for gpio registration

Linus Walleij (57):
      blackfin: gpio: Be sure to clamp return value
      powerpc: ppc4cc/gpio: Be sure to clamp return value
      powerpc: qe_lib/gpio: Be sure to clamp return value
      powerpc: simple_gpio: Be sure to clamp return value
      unicore: gpio: Be sure to clamp return value
      Merge branch 'error-return-from-get' into devel
      gpio: make the gpiochip a real device
      gpio: refer to gpio device in prints and debugfs
      gpio: add a userspace chardev ABI for GPIOs
      tools/gpio: create GPIO tools
      gpio: add a userspace character device ABI
      gpio: ABI: mark the sysfs ABI as obsolete
      Merge branch 'chardev' into devel
      gpio: remember to finally free gpio_device
      gpio: move sysfs mock device to the gpio_device
      gpio: move descriptors into gpio_device
      gpio/pinctrl: sunxi: stop poking around in private vars
      gpio: reflect base and ngpio into gpio_device
      gpio: reference count the gpio device for each desc
      pinctrl: sirf/atlas7: stop poking around in GPIO internals
      gpio: move the pin ranges into gpio_device
      gpio: move the subdriver data pointer into gpio_device
      gpio: create an API to detect open drain/source on lines
      gpio: tps65218: remove unused #include
      gpio: store reflect the label to userspace
      gpio: add userspace ABI for GPIO line information
      pinctrl: cygnus-gpio: use gpiochip data pointer
      ARM: scoop: use gpiochip data pointer
      ARM: gemini: switch to gpiochip_add_data()
      ARM: imx: switch to gpiochip_add_data()
      ARM: ixp4xx: switch to gpiochip_add_data()
      ARM: s3c24xx: switch to gpiochip_add_data()
      ARM: simpad: switch to gpiochip_add_data()
      ARM: w90x900: use gpiochip data pointer
      ARM: plat-orion: use gpiochip data pointer
      blackfin: gpio: switch to gpiochip_add_data()
      blackfin: extgpio: switch to gpiochip_add_data()
      m68k: gpio: switch to gpiochip_add_data()
      MIPS: alchemy: switch to gpiochip_add_data()
      MIPS: ar7: use gpiochip data pointer
      MIPS: bcm63xx: switch to gpiochip_add_data()
      MIPS: jz4740: use gpiochip data pointer
      MIPS: txx9: switch to gpiochip_add_data()
      MIPS: rb532: use gpiochip data pointer
      MIPS: txx9: iocled: use gpiochip data pointer
      MIPS: txx9: rbtx4938: switch to gpiochip_add_data()
      Revert "gpio: remove broken irq_to_gpio() interface"
      gpio: fixup line flags for userspace ABI
      Merge branch 'devel' into for-next
      Merge branch 'devm_gpiochip' of
https://github.com/ldewangan/linux-upstream into
devm-gpiochip-add-data
      gpio: present the consumer of a line to userspace
      Merge branch 'devm-gpiochip-add-data' into devel
      Merge branch 'ib-mfd-regulator-gpio-4.6' of
git://git.kernel.org/.../lee/mfd into devel
      Revert "gpio: lp3943: Drop pin_used and
lp3943_gpio_request/lp3943_gpio_free"
      gpio: tps65912: fix bad merge
      gpio: uapi: use 0xB4 as ioctl() major
      Revert "Share upstreaming patches"

Liu Gang (2):
      gpio/qoriq: Add qoriq platforms support
      drivers/gpio: Switch gpio-mpc8xxx to use gpio-generic

Lokesh Vutla (1):
      gpio: davinci: Fix the number of controllers allocated

Marek Vasut (1):
      dt-bindings: gpio: altera: Fix altr,interrupt-type property

Markus Pargmann (1):
      tools: gpio: Small updates for output format

Matthias Brugger (1):
      gpio: xgene: Fix kconfig for standby GIPO contoller

Nicholas Krause (1):
      gpio: davinci: Fix possible NULL pointer deference

Nicolas Saenz Julienne (1):
      gpio: add tps65218 gpio

Peter Hung (1):
      gpio-f7188x: Add F81866 GPIO supports

Phil Reid (3):
      gpio: gpio-altera: Remove gpiochip on probe failure.
      gpio: mcp23s08: Add support for mcp23s18
      gpio: mcp23s08: Fix clearing of interrupt.

Quan Nguyen (2):
      gpio: xgene: Enable X-Gene standby GPIO as interrupt controller
      gpio: X-Gene standby GPIO controller DTS binding

Ralf Baechle (1):
      MIPS: jz4740: Fix surviving instance of irq_to_gpio()

Simon Horman (2):
      gpio: rcar: Use ARCH_RENESAS
      gpio: rcar: Use ARCH_RENESAS

Sudip Mukherjee (1):
      gpio: pisosr: add missing unlock

William Breathitt Gray (11):
      gpio: 104-idi-48: Allow IRQ sharing
      gpio: Add GPIO support for the WinSystems WS16C48
      gpio: Add GPIO support for the ACCES 104-DIO-48E
      gpio: misc: Pass correct license string to MODULE_LICENSE
      gpio: 104-dio-48e: Use devm_request_region
      gpio: 104-idi-48: Use devm_request_region
      gpio: 104-idio-16: Use devm_request_region
      gpio: amd8111: Use devm_request_region
      gpio: ich: Use devm_request_region
      gpio: sch311x: Use devm_request_region
      gpio: ws16c48: Use devm_request_region

ldewangan (1):
      Share upstreaming patches

 Documentation/ABI/{testing => obsolete}/sysfs-gpio |   4 +-
 Documentation/ABI/testing/gpio-cdev                |  26 +
 .../devicetree/bindings/gpio/gpio-altera.txt       |   4 +-
 .../devicetree/bindings/gpio/gpio-mcp23s08.txt     |   4 +-
 .../devicetree/bindings/gpio/gpio-pisosr.txt       |  34 +
 .../devicetree/bindings/gpio/gpio-ts4800.txt       |  20 +
 .../devicetree/bindings/gpio/gpio-xgene-sb.txt     |  47 +-
 Documentation/devicetree/bindings/mfd/tps65912.txt |  50 ++
 Documentation/driver-model/devres.txt              |   5 +
 Documentation/gpio/board.txt                       |  11 +-
 Documentation/ioctl/ioctl-number.txt               |   1 +
 MAINTAINERS                                        |  16 +
 arch/alpha/include/asm/gpio.h                      |   4 -
 arch/arm/common/scoop.c                            |  10 +-
 arch/arm/mach-gemini/gpio.c                        |   4 +-
 arch/arm/mach-imx/mach-mx27ads.c                   |   4 +-
 arch/arm/mach-ixp4xx/common.c                      |   4 +-
 arch/arm/mach-s3c24xx/mach-h1940.c                 |   2 +-
 arch/arm/mach-sa1100/simpad.c                      |   4 +-
 arch/arm/mach-w90x900/gpio.c                       |  13 +-
 arch/arm/plat-orion/gpio.c                         |  24 +-
 arch/avr32/boards/merisc/setup.c                   |   1 -
 arch/avr32/mach-at32ap/pio.c                       |   2 +-
 arch/blackfin/kernel/bfin_gpio.c                   |   6 +-
 arch/blackfin/kernel/debug-mmrs.c                  |   2 +-
 arch/blackfin/mach-bf538/boards/ezkit.c            |   2 +-
 arch/blackfin/mach-bf538/ext-gpio.c                |   8 +-
 arch/blackfin/mach-bf548/boards/cm_bf548.c         |   2 +-
 arch/blackfin/mach-bf548/boards/ezkit.c            |   2 +-
 arch/blackfin/mach-bf609/boards/ezkit.c            |   2 +-
 arch/blackfin/mach-common/ints-priority.c          |   2 +-
 arch/blackfin/mach-common/pm.c                     |   2 +-
 arch/ia64/include/asm/gpio.h                       |   4 -
 arch/m68k/coldfire/gpio.c                          |   2 +-
 arch/metag/include/asm/gpio.h                      |   4 -
 arch/microblaze/include/asm/gpio.h                 |   4 -
 arch/mips/alchemy/common/gpiolib.c                 |   8 +-
 arch/mips/ar7/gpio.c                               |  26 +-
 arch/mips/bcm63xx/gpio.c                           |   4 +-
 arch/mips/jz4740/gpio.c                            |  12 +-
 arch/mips/kernel/gpio_txx9.c                       |   4 +-
 arch/mips/rb532/gpio.c                             |  12 +-
 arch/mips/txx9/generic/setup.c                     |  10 +-
 arch/mips/txx9/rbtx4938/setup.c                    |   3 +-
 arch/openrisc/include/asm/gpio.h                   |   4 -
 arch/powerpc/include/asm/gpio.h                    |   4 -
 arch/powerpc/sysdev/ppc4xx_gpio.c                  |   2 +-
 arch/powerpc/sysdev/simple_gpio.c                  |   2 +-
 arch/sh/include/mach-common/mach/magicpanelr2.h    |   2 +-
 arch/sparc/include/asm/gpio.h                      |   4 -
 arch/unicore32/kernel/gpio.c                       |   2 +-
 arch/x86/include/asm/gpio.h                        |   4 -
 arch/xtensa/include/asm/gpio.h                     |   4 -
 drivers/ata/pata_at91.c                            |   3 +-
 drivers/ata/pata_bf54x.c                           |   2 +-
 drivers/gpio/Kconfig                               |  85 ++-
 drivers/gpio/Makefile                              |   9 +-
 drivers/gpio/devres.c                              |   2 +-
 drivers/gpio/gpio-104-dio-48e.c                    | 430 +++++++++++
 drivers/gpio/gpio-104-idi-48.c                     |  30 +-
 drivers/gpio/gpio-104-idio-16.c                    |  27 +-
 drivers/gpio/gpio-74xx-mmio.c                      |  11 +-
 drivers/gpio/gpio-adnp.c                           |  11 +-
 drivers/gpio/gpio-adp5520.c                        |  13 +-
 drivers/gpio/gpio-adp5588.c                        |   4 +-
 drivers/gpio/gpio-altera.c                         |   5 +-
 drivers/gpio/gpio-amd8111.c                        |   7 +-
 drivers/gpio/gpio-arizona.c                        |  12 +-
 drivers/gpio/gpio-ath79.c                          | 264 +++++--
 drivers/gpio/gpio-bcm-kona.c                       |   2 +-
 drivers/gpio/gpio-brcmstb.c                        |  13 +-
 drivers/gpio/gpio-clps711x.c                       |  11 +-
 drivers/gpio/gpio-crystalcove.c                    |   9 +-
 drivers/gpio/gpio-cs5535.c                         |  20 +-
 drivers/gpio/gpio-da9052.c                         |  11 +-
 drivers/gpio/gpio-da9055.c                         |  16 +-
 drivers/gpio/gpio-davinci.c                        |  12 +-
 drivers/gpio/gpio-dln2.c                           |  16 +-
 drivers/gpio/gpio-ep93xx.c                         |   2 +-
 drivers/gpio/gpio-f7188x.c                         |  53 +-
 drivers/gpio/gpio-ge.c                             |   2 +-
 drivers/gpio/gpio-generic.c                        |  11 +-
 drivers/gpio/gpio-ich.c                            |  51 +-
 drivers/gpio/gpio-iop.c                            |   2 +-
 drivers/gpio/gpio-janz-ttl.c                       |  12 +-
 drivers/gpio/gpio-kempld.c                         |  11 +-
 drivers/gpio/gpio-ks8695.c                         |  12 -
 drivers/gpio/gpio-lp3943.c                         |  12 +-
 drivers/gpio/gpio-lpc32xx.c                        |   2 +-
 drivers/gpio/gpio-lynxpoint.c                      |   4 +-
 drivers/gpio/gpio-mc9s08dz60.c                     |  13 +-
 drivers/gpio/gpio-mcp23s08.c                       |  25 +-
 drivers/gpio/gpio-menz127.c                        | 200 +++++
 drivers/gpio/gpio-moxart.c                         |   5 +-
 drivers/gpio/gpio-mpc5200.c                        |   1 -
 drivers/gpio/gpio-mpc8xxx.c                        | 255 +++----
 drivers/gpio/gpio-mvebu.c                          |  11 +-
 drivers/gpio/gpio-mxc.c                            |   6 +-
 drivers/gpio/gpio-octeon.c                         |  10 +-
 drivers/gpio/gpio-omap.c                           |  57 +-
 drivers/gpio/gpio-palmas.c                         |  12 +-
 drivers/gpio/gpio-pca953x.c                        |  10 +-
 drivers/gpio/gpio-pcf857x.c                        |  10 +-
 drivers/gpio/gpio-pisosr.c                         | 183 +++++
 drivers/gpio/gpio-rc5t583.c                        |  12 +-
 drivers/gpio/gpio-rcar.c                           |  42 ++
 drivers/gpio/gpio-rdc321x.c                        |  13 +-
 drivers/gpio/gpio-sch.c                            |  11 +-
 drivers/gpio/gpio-sch311x.c                        |   8 +-
 drivers/gpio/gpio-spear-spics.c                    |   2 +-
 drivers/gpio/gpio-sta2x11.c                        |   2 +-
 drivers/gpio/gpio-stp-xway.c                       |   2 +-
 drivers/gpio/gpio-sx150x.c                         |  18 +-
 drivers/gpio/gpio-syscon.c                         |  11 +-
 drivers/gpio/gpio-tb10x.c                          |  22 +-
 drivers/gpio/gpio-tc3589x.c                        |  13 +-
 drivers/gpio/gpio-tegra.c                          |   2 +-
 drivers/gpio/gpio-timberdale.c                     |  25 +-
 drivers/gpio/gpio-tpic2810.c                       | 170 +++++
 drivers/gpio/gpio-tps65218.c                       | 222 ++++++
 drivers/gpio/gpio-tps6586x.c                       |  12 +-
 drivers/gpio/gpio-tps65910.c                       |  12 +-
 drivers/gpio/gpio-tps65912.c                       | 174 +++--
 drivers/gpio/gpio-ts4800.c                         |  81 ++
 drivers/gpio/gpio-ts5500.c                         |   9 +-
 drivers/gpio/gpio-twl6040.c                        |   9 +-
 drivers/gpio/gpio-ucb1400.c                        |   3 +-
 drivers/gpio/gpio-viperboard.c                     |  24 +-
 drivers/gpio/gpio-vx855.c                          |  12 +-
 drivers/gpio/gpio-wm831x.c                         |  12 +-
 drivers/gpio/gpio-wm8350.c                         |  12 +-
 drivers/gpio/gpio-wm8994.c                         |  17 +-
 drivers/gpio/gpio-ws16c48.c                        | 427 +++++++++++
 drivers/gpio/gpio-xgene-sb.c                       | 266 ++++++-
 drivers/gpio/gpio-xgene.c                          |  11 +-
 drivers/gpio/gpiolib-acpi.c                        |  18 +-
 drivers/gpio/gpiolib-sysfs.c                       |  51 +-
 drivers/gpio/gpiolib.c                             | 822 +++++++++++++++------
 drivers/gpio/gpiolib.h                             |  79 +-
 drivers/mfd/Kconfig                                |  20 +-
 drivers/mfd/Makefile                               |   3 +-
 drivers/mfd/menelaus.c                             |   2 +-
 drivers/mfd/tps65912-core.c                        | 240 +++---
 drivers/mfd/tps65912-i2c.c                         | 162 ++--
 drivers/mfd/tps65912-irq.c                         | 217 ------
 drivers/mfd/tps65912-spi.c                         | 160 ++--
 drivers/mtd/onenand/omap2.c                        |   2 +-
 drivers/pcmcia/bfin_cf_pcmcia.c                    |   2 +-
 drivers/pcmcia/pxa2xx_vpac270.c                    |   1 -
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |  33 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |  18 -
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   4 +-
 drivers/regulator/Kconfig                          |   2 +-
 drivers/regulator/tps65912-regulator.c             | 613 +++------------
 drivers/soc/fsl/qe/gpio.c                          |   2 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c            |   2 -
 drivers/usb/host/ohci-at91.c                       |   2 -
 drivers/video/fbdev/atmel_lcdfb.c                  |   2 -
 drivers/video/fbdev/omap/lcd_h3.c                  |   2 +-
 drivers/video/fbdev/omap/lcd_osk.c                 |   3 +-
 drivers/video/fbdev/omap/lcd_palmtt.c              |   2 +-
 include/asm-generic/gpio.h                         |   4 +
 include/linux/gpio/driver.h                        |  39 +-
 include/linux/mfd/tps65912.h                       | 209 +++---
 include/uapi/linux/Kbuild                          |   1 +
 include/uapi/linux/gpio.h                          |  58 ++
 tools/Makefile                                     |   8 +-
 tools/gpio/Makefile                                |  12 +
 tools/gpio/gpio-utils.c                            |  11 +
 tools/gpio/gpio-utils.h                            |  27 +
 tools/gpio/lsgpio.c                                | 195 +++++
 171 files changed, 4455 insertions(+), 2669 deletions(-)
 rename Documentation/ABI/{testing => obsolete}/sysfs-gpio (88%)
 create mode 100644 Documentation/ABI/testing/gpio-cdev
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pisosr.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-ts4800.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt
 delete mode 100644 arch/alpha/include/asm/gpio.h
 delete mode 100644 arch/ia64/include/asm/gpio.h
 delete mode 100644 arch/metag/include/asm/gpio.h
 delete mode 100644 arch/microblaze/include/asm/gpio.h
 delete mode 100644 arch/openrisc/include/asm/gpio.h
 delete mode 100644 arch/powerpc/include/asm/gpio.h
 delete mode 100644 arch/sparc/include/asm/gpio.h
 delete mode 100644 arch/x86/include/asm/gpio.h
 delete mode 100644 arch/xtensa/include/asm/gpio.h
 create mode 100644 drivers/gpio/gpio-104-dio-48e.c
 create mode 100644 drivers/gpio/gpio-menz127.c
 create mode 100644 drivers/gpio/gpio-pisosr.c
 create mode 100644 drivers/gpio/gpio-tpic2810.c
 create mode 100644 drivers/gpio/gpio-tps65218.c
 create mode 100644 drivers/gpio/gpio-ts4800.c
 create mode 100644 drivers/gpio/gpio-ws16c48.c
 delete mode 100644 drivers/mfd/tps65912-irq.c
 create mode 100644 include/uapi/linux/gpio.h
 create mode 100644 tools/gpio/Makefile
 create mode 100644 tools/gpio/gpio-utils.c
 create mode 100644 tools/gpio/gpio-utils.h
 create mode 100644 tools/gpio/lsgpio.c
