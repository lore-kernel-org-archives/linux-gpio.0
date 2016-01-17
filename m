From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO bulk changes for the v4.5 cycle
Date: Sun, 17 Jan 2016 02:14:50 +0100
Message-ID: <CACRpkda2SFM+JNJW2serCO=CLEPyZeVqxhcy+jTMgwOHUOWfkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35660 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753134AbcAQBOw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Jan 2016 20:14:52 -0500
Received: by mail-ob0-f176.google.com with SMTP id py5so170409746obc.2
        for <linux-gpio@vger.kernel.org>; Sat, 16 Jan 2016 17:14:51 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

here is the bulk of GPIO changes for v4.5. Notably there are
big refactorings mostly by myself, aimed at getting the gpio_chip
into a shape that makes me believe I can proceed to preserve
state for a proper userspace ABI (character device) that has
already been proposed once, but resulted in the feedback that
I need to go back and restructure stuff. So I've been restructuring
stuff. On the way I ran into brokenness (return code from the
get_value() callback) and had to fix it. Also, refactored generic
GPIO to be simpler.

Some of that is still waiting to trickle down from the subsystems
all over the kernel that provide random gpio_chips, I've touched
every single GPIO driver in the kernel now, oh man I didn't know
I was responsible for so much...

Apart from that we're churning along as usual.

I took some effort to test and retest so it should merge nicely
and we shook out a couple of bugs in -next.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 4ef7675344d687a0ef5b0d7c0cee12da005870c0:

  Linux 4.4-rc6 (2015-12-20 16:06:09 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.5-1

for you to fetch changes up to c474e348778bdf5b453a2cdff4b2b1f9e000f343:

  gpio: generic: make bgpio_pdata always visible (2016-01-13 16:00:32 +0100)

----------------------------------------------------------------
GPIO bulk updates for the v4.5 kernel cycle:

Infrastructural changes:

- In struct gpio_chip, rename the .dev node to .parent to better reflect
  the fact that this is not the GPIO struct device abstraction. We will
  add that soon so this would be totallt confusing.

- It was noted that the driver .get_value() callbacks was
  sometimes reporting negative -ERR values to the gpiolib core, expecting
  them to be propagated to consumer gpiod_get_value() and gpio_get_value()
  calls. This was not happening, so as there was a mess of drivers
  returning negative errors and some returning "anything else than zero"
  to indicate that a line was active. As some would have bit 31 set to
  indicate "line active" it clashed with negative error codes. This is
  fixed by the largeish series clamping values in all drivers with
  !!value to [0,1] and then augmenting the code to propagate error codes
  to consumers. (Includes some ACKed patches in other subsystems.)

- Add a void *data pointer to struct gpio_chip. The container_of() design
  pattern is indeed very nice, but we want to reform the struct gpio_chip
  to be a non-volative, stateless business, and keep states internal to
  the gpiolib to be able to hold on to the state when adding a proper
  userspace ABI (character device) further down the road. To achieve this,
  drivers need a handle at the internal state that is not dependent on
  their struct gpio_chip() so we add gpiochip_add_data() and
  gpiochip_get_data() following the pattern of many other subsystems.
  All the "use gpiochip data pointer" patches transforms drivers to this
  scheme.

- The Generic GPIO chip header has been merged into the general
  <linux/gpio/driver.h> header, and the custom header for that removed.
  Instead of having a separate mm_gpio_chip struct for these generic
  drivers, merge that into struct gpio_chip, simplifying the code and
  removing the need for separate and confusing includes.

Misc improvements:

- Stabilize the way GPIOs are looked up from the ACPI legacy
  specification.

- Incremental driver features for PXA, PCA953X, Lantiq (patches from the
  OpenWRT community), RCAR, Zynq, PL061, 104-idi-48

New drivers:

- Add a GPIO chip to the ALSA SoC AC97 driver.

- Add a new Broadcom NSP SoC driver (this lands in the pinctrl dir, but
  the branch is merged here too to account for infrastructural changes).

- The sx150x driver now supports the sx1502.

----------------------------------------------------------------
Andrew F. Davis (2):
      gpio: tps65086: Add DT bindings for the TPS65086 GPO controller
      gpio: drop surplus PCI and USB dependencies

Arnd Bergmann (3):
      gpiolib: always initialize *flags from of_get_named_gpio_flags
      gpio: moxart: fix build regression
      gpio: generic: make bgpio_pdata always visible

Bamvor Jian Zhang (4):
      gpiolib: keep comment consistent with code
      gpiolib: improve overlap check of range of gpio
      gpiolib: do not allow to insert an empty gpiochip
      gpiolib: make comment consistent with code

Ben Dooks (2):
      gpio: pca953x: add onsemi,pca9654 id
      gpio: pca935x: fix of-only probed devices

Dan Carpenter (1):
      gpio: pxa: checking IS_ERR() instead of NULL

Dmitry Torokhov (2):
      gpiolib: tighten up ACPI legacy gpio lookups
      gpiolib: tighten up ACPI legacy gpio lookups

Florian Fainelli (2):
      gpio: brcmstb: Set endian flags for big-endian MIPS
      gpio: brcmstb: Allow building driver for BMIPS_GENERIC

Geert Uytterhoeven (5):
      gpio: 74x164: Allocate buffer with gen_74x164_chip
      gpio: 74x164: Use a single SPI transfer instead of multiple transfers
      gpio: Restore indentation of parent device setup
      gpio: rcar: Remove obsolete platform data support
      gpio: rcar: Improve clock error handling and reporting

Guenter Roeck (3):
      gpio: xilinx: Do not use gpiochip_get_data() in xgpio_save_regs()
      gpio: mm-lantiq: Do not use gpiochip_get_data() in ltq_mm_save_regs()
      gpio: mpc8xxx: Do not use gpiochip_get_data() in mpc8xxx_gpio_save_regs()

Javier Martinez Canillas (1):
      MAINTAINERS: Update OMAP GPIO driver entry

Jean Delvare (1):
      gpio: pch: Optimize pch_gpio_get()

John Crispin (1):
      pinctrl: lantiq: Implement gpio_chip.to_irq

Julien Grossholtz (1):
      gpiolib: fix chip order in gpio list

Krzysztof Kozlowski (1):
      gpio: Drop owner assignment from i2c_driver

Linus Walleij (173):
      gpio: change member .dev to .parent
      gpio: davinci: fix missed parent conversion
      Merge tag 'asoc-ac97-gpio' of
git://git.kernel.org/.../broonie/sound into devel
      ASoC: ac97: fix parent assignment
      gpio: pca953x: make inclusion of <linux/of_platform.h> unconditional
      Merge branch 'bcm-nsp' of ../linux-pinctrl into devel
      pinctrl: nsp-gpio: fix up parent attribute
      gpio: forward-declare enum gpiod_flags
      Merge branch 'for-dmitry' into devel
      gpio: pch: fix non-DT build
      Merge tag 'v4.4-rc6' into devel
      pinctrl: fixup problematic flag
      gpio: da9052: Be sure to clamp return value
      gpio: davinci: Be sure to clamp return value
      gpio: em: Be sure to clamp return value
      gpio: intel-mid: Be sure to clamp return value
      gpio: janz-ttl: Be sure to clamp return value
      gpio: kempld: Be sure to clamp return value
      gpio: lpc32xx: Be sure to clamp return value
      gpio: max732x: Be sure to clamp return value
      gpio: ml-ioh: Be sure to clamp return value
      gpio: mpc8xxx: Be sure to clamp return value
      gpio: msic: Be sure to clamp return value
      gpio: pcf857x: Be sure to clamp return value
      gpio: pch: Be sure to clamp return value
      gpio: sa1100: Be sure to clamp return value
      gpio: sta2x11: Be sure to clamp return value
      gpio: sx150x: Be sure to clamp return value
      gpio: tc3589x: Be sure to clamp return value
      gpio: twl4030: Be sure to clamp return value
      gpio: tz1090: Be sure to clamp return value
      gpio: tz1090-pdc: Be sure to clamp return value
      gpio: ucb1400: Be sure to clamp return value
      gpio: viperboard: Be sure to clamp return value
      pinctrl: baytrail: Be sure to clamp return value
      pinctrl: coh901: Be sure to clamp return value
      pinctrl: xway: Be sure to clamp return value
      pinctrl: spmi-gpio: Be sure to clamp return value
      pinctrl: spmi-mpp: Be sure to clamp return value
      pinctrl: ssbi-gpio: Be sure to clamp return value
      gpio: ssbi-mpp: Be sure to clamp return value
      pinctrl: sunxi: Be sure to clamp return value
      Revert "gpio: revert get() to non-errorprogating behaviour"
      pinctrl: qcom: fix up errorpath
      fbdev: via-gpio: Be sure to clamp return value
      gpio: generic: fix signedness bug found by cppcheck
      gpio: add a data pointer to gpio_chip
      gpio: of: provide optional of_mm_gpiochip_add_data() function
      gpio: generic: factor into gpio_chip struct
      gpio: 104-idi-48: use gpiochip data pointer
      gpio: 104-idio-16: use gpiochip data pointer
      gpio: 74x164: use gpiochip data pointer
      gpio: adnp: use gpiochip data pointer
      gpio: adp5520: use gpiochip data pointer
      gpio: adp5588: use gpiochip data pointer
      gpio: altera: use gpiochip data pointer
      gpio: amd8111: use gpiochip data pointer
      gpio: amdpt: use gpiochip data pointer
      gpio: arizona: use gpiochip data pointer
      gpio: ath79: use gpiochip data pointer
      gpio: bcm-kona: use gpiochip data pointer
      gpio: bt8xx: use gpiochip data pointer
      gpio: crystalcove: use gpiochip data pointer
      gpio: cs5535: use gpiochip data pointer
      gpio: da9052: use gpiochip data pointer
      gpio: da9055: use gpiochip data pointer
      gpio: davinci: use gpiochip data pointer
      gpio: dln2: use gpiochip data pointer
      gpio: em: use gpiochip data pointer
      gpio: f7188: use gpiochip data pointer
      gpio: intel-mid: use gpiochip data pointer
      gpio: it87: use gpiochip data pointer
      gpio: kempld: use gpiochip data pointer
      gpio: lp3943: use gpiochip data pointer
      gpio: lpc18xx: use gpiochip data pointer
      gpio: lpc32xx: use gpiochip data pointer
      gpio: lynxpoint: use gpiochip data pointer
      gpio: max730x: use gpiochip data pointer
      gpio: max732x: use gpiochip data pointer
      gpio: mb86s7x: use gpiochip data pointer
      gpio: mc33880: use gpiochip data pointer
      gpio: mc9s08dz60: use gpiochip data pointer
      gpio: mcp: use gpiochip data pointer
      gpio: ml-ioh: use gpiochip data pointer
      gpio: mm-lantiq: use gpiochip data pointer
      gpio: mpc5200: use gpiochip data pointer
      gpio: mpc8xxx: use gpiochip data pointer
      gpio: msic: use gpiochip data pointer
      gpio: mvebu: use gpiochip data pointer
      gpio: octeon: use gpiochip data pointer
      gpio: omap: use gpiochip data pointer
      gpio: palmas: use gpiochip data pointer
      gpio: pca953x: use gpiochip data pointer
      gpio: pcf857x: use gpiochip data pointer
      gpio: pch: use gpiochip data pointer
      gpio: pl061: use gpiochip data pointer
      gpio: pxa: use gpiochip data pointer
      gpio: rc5t583: use gpiochip data pointer
      gpio: rcar: use gpiochip data pointer
      gpio: rdc321x: use gpiochip data pointer
      gpio: samsung: use gpiochip data pointer
      gpio: sch: use gpiochip data pointer
      gpio: sch311x: use gpiochip data pointer
      gpio: spear-spics: use gpiochip data pointer
      gpio: sta2x11: use gpiochip data pointer
      gpio: stmpe: use gpiochip data pointer
      gpio: stp-xway: use gpiochip data pointer
      gpio: sx150x: use gpiochip data pointer
      gpio: syscon: use gpiochip data pointer
      gpio: tb10x: use gpiochip data pointer
      gpio: tc3589x: use gpiochip data pointer
      gpio: timberdale: use gpiochip data pointer
      gpio: tps6586x: use gpiochip data pointer
      gpio: tps65910: use gpiochip data pointer
      gpio: tps65912: use gpiochip data pointer
      gpio: ts5500: use gpiochip data pointer
      gpio: twl4030: use gpiochip data pointer
      gpio: tz1090-pdc: use gpiochip data pointer
      gpio: tz1090: use gpiochip data pointer
      gpio: ucb1400: use gpiochip data pointer
      gpio: vf610: use gpiochip data pointer
      gpio: viperboard: use gpiochip data pointer
      gpio: vx855: use gpiochip data pointer
      gpio: wm831x: use gpiochip data pointer
      gpio: wm8350: use gpiochip data pointer
      gpio: wm8994: use gpiochip data pointer
      gpio: xgene: use gpiochip data pointer
      gpio: xilinx: use gpiochip data pointer
      gpio: xlp: use gpiochip data pointer
      gpio: zevio: use gpiochip data pointer
      gpio: zx: use gpiochip data pointer
      gpio: zynq: use gpiochip data pointer
      gpio: convert remaining users to gpiochip_add_data()
      gpio: fix misleading comment
      pinctrl: baytrail: use gpiochip data pointer
      pinctrl: bcm2835: use gpiochip data pointer
      pinctrl: cherryview: use gpiochip data pointer
      pinctrl: intel: use gpiochip data pointer
      pinctrl: meson: use gpiochip data pointer
      pinctrl: nomadik: use gpiochip data pointer
      pinctrl: abx500: use gpiochip data pointer
      pinctrl: adi2: use gpiochip data pointer
      pinctrl: amd: use gpiochip data pointer
      pinctrl: as3722: use gpiochip data pointer
      pinctrl: at91: use gpiochip data pointer
      pinctrl: u300: use gpiochip data pointer
      pinctrl: digicolor: use gpiochip data pointer
      pinctrl: pistachio: use gpiochip data pointer
      pinctrl: rockchip: use gpiochip data pointer
      pinctrl: st: use gpiochip data pointer
      pinctrl: msm: use gpiochip data pointer
      pinctrl: spmi: use gpiochip data pointer
      pinctrl: spmi-mpp: use gpiochip data pointer
      pinctrl: ssbi-mpp: use gpiochip data pointer
      pinctrl: ssbi-gpio: use gpiochip data pointer
      pinctrl: samsung: use gpiochip data pointer
      pinctrl: sunxi: use gpiochip data pointer
      pinctrl: sh-pfc: use gpiochip data pointer
      pinctrl: sirf-atlas7: use gpiochip data pointer
      pinctrl: sirf: use gpiochip data pointer
      pinctrl: spear-plgpio: use gpiochip data pointer
      pinctrl: mediatek: use gpiochip data pointer
      pinctrl: at91-pio4: use gpiochip data pointer
      pinctrl: exynos5440: use gpiochip data pointer
      pinctrl: vt8500-wmt: use gpiochip data pointer
      pinctrl: nsp-gpio: use gpiochip data pointer
      Revert "pinctrl: lantiq: Implement gpio_chip.to_irq"
      video: fbdev: via: use gpiochip data pointer
      avr32: gpio: use gpiochip data pointer
      bcma: gpio: use gpiochip data pointer
      hid: cp2112: use gpiochip data pointer
      leds: tca6507: use gpiochip data pointer
      leds: pca9532: use gpiochip data pointer

Michal Simek (1):
      gpio: zynq: Do PM initialization earlier to support gpio hogs

Nizam Haider (1):
      gpio: use dev_get_platdata()

Paul Burton (2):
      gpio: pch: allow build on MIPS platforms
      gpio: pch: allow use from device tree

Peter Rosin (1):
      gpio: sx150x: Add support for sx1502

Phil Reid (1):
      gpio: pca953x: Add set_multiple to allow multiple bits to be set
in one write.

Robert Jarzmik (8):
      ASoC: ac97: add gpio chip
      gpio: pxa: change initcall level second attempt
      gpio: pxa: convert to one gpiochip
      gpio: pxa: convert to devm_ioremap
      gpio: pxa: change the interrupt management
      gpio: pxa: add pin control gpio direction and request
      gpio: pxa: fixes non devicetree builds
      MAINTAINERS: add my-self as maintainer of gpio pxa driver

Sudeep Holla (1):
      gpio: pl061: add support for wakeup configuration

Sudip Mukherjee (1):
      gpio: fix warning about iterator

Thierry Reding (1):
      gpio: mpc5200: Use platform_register/unregister_drivers()

Vladimir Zapolskiy (1):
      gpio: update gpiochip .get() callback description

William Breathitt Gray (6):
      gpio: Add IRQ support to ACCES 104-IDIO-16 driver
      gpio: 104-idio-16: Use lowercase symbol names for const variables
      gpio: 104-idio-16: Disable IRQ on device probe
      gpio: Add GPIO support for the ACCES 104-IDI-48
      gpio: 104-idio-16: Clear pending interrupt in IRQ handler
      gpio: 104-idi-48: Clear pending interrupt once in IRQ handler

Yendapally Reddy Dhananjaya Reddy (2):
      pinctrl: Broadcom NSP GPIO-a device tree bindings
      pinctrl: nsp: add gpio-a driver support for Broadcom NSP SoC

 .../devicetree/bindings/gpio/gpio-pca953x.txt      |   1 +
 .../devicetree/bindings/gpio/gpio-sx150x.txt       |   3 +-
 .../devicetree/bindings/gpio/gpio-tps65086.txt     |  16 +
 .../devicetree/bindings/pinctrl/brcm,nsp-gpio.txt  |  80 +++
 MAINTAINERS                                        |  15 +-
 arch/arm/mach-clps711x/board-autcpu12.c            |   2 +-
 arch/arm/mach-clps711x/board-p720t.c               |   2 +-
 arch/arm/mach-imx/mach-mx21ads.c                   |   2 +-
 arch/arm/mach-omap1/board-ams-delta.c              |   2 +-
 arch/arm/mach-s3c64xx/mach-crag6410.c              |   2 +-
 arch/avr32/mach-at32ap/pio.c                       |  14 +-
 drivers/bcma/driver_gpio.c                         |  25 +-
 drivers/gpio/Kconfig                               |  32 +-
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-104-idi-48.c                     | 343 ++++++++++
 drivers/gpio/gpio-104-idio-16.c                    | 156 ++++-
 drivers/gpio/gpio-74x164.c                         |  79 +--
 drivers/gpio/gpio-74xx-mmio.c                      |  37 +-
 drivers/gpio/gpio-adnp.c                           |  47 +-
 drivers/gpio/gpio-adp5520.c                        |  10 +-
 drivers/gpio/gpio-adp5588.c                        |  18 +-
 drivers/gpio/gpio-altera.c                         |  25 +-
 drivers/gpio/gpio-amd8111.c                        |  18 +-
 drivers/gpio/gpio-amdpt.c                          |  34 +-
 drivers/gpio/gpio-arizona.c                        |  17 +-
 drivers/gpio/gpio-ath79.c                          |  20 +-
 drivers/gpio/gpio-bcm-kona.c                       |  31 +-
 drivers/gpio/gpio-brcmstb.c                        |  95 +--
 drivers/gpio/gpio-bt8xx.c                          |  10 +-
 drivers/gpio/gpio-clps711x.c                       |  28 +-
 drivers/gpio/gpio-crystalcove.c                    |  34 +-
 drivers/gpio/gpio-cs5535.c                         |  15 +-
 drivers/gpio/gpio-da9052.c                         |  26 +-
 drivers/gpio/gpio-da9055.c                         |  17 +-
 drivers/gpio/gpio-davinci.c                        |  25 +-
 drivers/gpio/gpio-dln2.c                           |  38 +-
 drivers/gpio/gpio-dwapb.c                          |  92 ++-
 drivers/gpio/gpio-em.c                             |  10 +-
 drivers/gpio/gpio-ep93xx.c                         |  25 +-
 drivers/gpio/gpio-etraxfs.c                        |  49 +-
 drivers/gpio/gpio-f7188x.c                         |  18 +-
 drivers/gpio/gpio-ge.c                             |  24 +-
 drivers/gpio/gpio-generic.c                        | 295 ++++----
 drivers/gpio/gpio-grgpio.c                         |  73 +-
 drivers/gpio/gpio-ich.c                            |   4 +-
 drivers/gpio/gpio-intel-mid.c                      |  23 +-
 drivers/gpio/gpio-iop.c                            |   2 +-
 drivers/gpio/gpio-it87.c                           |  17 +-
 drivers/gpio/gpio-janz-ttl.c                       |  10 +-
 drivers/gpio/gpio-kempld.c                         |  21 +-
 drivers/gpio/gpio-ks8695.c                         |   2 +-
 drivers/gpio/gpio-loongson.c                       |   2 +-
 drivers/gpio/gpio-lp3943.c                         |  21 +-
 drivers/gpio/gpio-lpc18xx.c                        |  15 +-
 drivers/gpio/gpio-lpc32xx.c                        |  41 +-
 drivers/gpio/gpio-lynxpoint.c                      |  24 +-
 drivers/gpio/gpio-max7300.c                        |   1 -
 drivers/gpio/gpio-max730x.c                        |  12 +-
 drivers/gpio/gpio-max732x.c                        |  34 +-
 drivers/gpio/gpio-mb86s7x.c                        |  21 +-
 drivers/gpio/gpio-mc33880.c                        |   6 +-
 drivers/gpio/gpio-mc9s08dz60.c                     |  17 +-
 drivers/gpio/gpio-mcp23s08.c                       |  30 +-
 drivers/gpio/gpio-ml-ioh.c                         |  14 +-
 drivers/gpio/gpio-mm-lantiq.c                      |   6 +-
 drivers/gpio/gpio-moxart.c                         |  29 +-
 drivers/gpio/gpio-mpc5200.c                        |  39 +-
 drivers/gpio/gpio-mpc8xxx.c                        |  26 +-
 drivers/gpio/gpio-msic.c                           |   8 +-
 drivers/gpio/gpio-mvebu.c                          |  25 +-
 drivers/gpio/gpio-mxc.c                            |  27 +-
 drivers/gpio/gpio-mxs.c                            |  33 +-
 drivers/gpio/gpio-octeon.c                         |  14 +-
 drivers/gpio/gpio-omap.c                           |  24 +-
 drivers/gpio/gpio-palmas.c                         |  31 +-
 drivers/gpio/gpio-pca953x.c                        | 141 ++--
 drivers/gpio/gpio-pcf857x.c                        |  13 +-
 drivers/gpio/gpio-pch.c                            |  19 +-
 drivers/gpio/gpio-pl061.c                          |  41 +-
 drivers/gpio/gpio-pxa.c                            | 413 +++++++-----
 drivers/gpio/gpio-rc5t583.c                        |  21 +-
 drivers/gpio/gpio-rcar.c                           | 123 ++--
 drivers/gpio/gpio-rdc321x.c                        |  10 +-
 drivers/gpio/gpio-sa1100.c                         |   4 +-
 drivers/gpio/gpio-samsung.c                        |   4 +-
 drivers/gpio/gpio-sch.c                            |  16 +-
 drivers/gpio/gpio-sch311x.c                        |  29 +-
 drivers/gpio/gpio-sodaville.c                      |  13 +-
 drivers/gpio/gpio-spear-spics.c                    |  13 +-
 drivers/gpio/gpio-sta2x11.c                        |  14 +-
 drivers/gpio/gpio-stmpe.c                          |  31 +-
 drivers/gpio/gpio-stp-xway.c                       |  12 +-
 drivers/gpio/gpio-sx150x.c                         |  83 ++-
 drivers/gpio/gpio-syscon.c                         |  21 +-
 drivers/gpio/gpio-tb10x.c                          |  19 +-
 drivers/gpio/gpio-tc3589x.c                        |  29 +-
 drivers/gpio/gpio-tegra.c                          |   2 +-
 drivers/gpio/gpio-timberdale.c                     |  10 +-
 drivers/gpio/gpio-tps6586x.c                       |  17 +-
 drivers/gpio/gpio-tps65910.c                       |  17 +-
 drivers/gpio/gpio-tps65912.c                       |  14 +-
 drivers/gpio/gpio-ts5500.c                         |  22 +-
 drivers/gpio/gpio-twl4030.c                        |  27 +-
 drivers/gpio/gpio-twl6040.c                        |   8 +-
 drivers/gpio/gpio-tz1090-pdc.c                     |  17 +-
 drivers/gpio/gpio-tz1090.c                         |  21 +-
 drivers/gpio/gpio-ucb1400.c                        |  13 +-
 drivers/gpio/gpio-vf610.c                          |  25 +-
 drivers/gpio/gpio-viperboard.c                     |  46 +-
 drivers/gpio/gpio-vr41xx.c                         |   6 +-
 drivers/gpio/gpio-vx855.c                          |   8 +-
 drivers/gpio/gpio-wm831x.c                         |  23 +-
 drivers/gpio/gpio-wm8350.c                         |  19 +-
 drivers/gpio/gpio-wm8994.c                         |  23 +-
 drivers/gpio/gpio-xgene-sb.c                       |  40 +-
 drivers/gpio/gpio-xgene.c                          |  19 +-
 drivers/gpio/gpio-xilinx.c                         |  18 +-
 drivers/gpio/gpio-xlp.c                            |  25 +-
 drivers/gpio/gpio-xtensa.c                         |   4 +-
 drivers/gpio/gpio-zevio.c                          |  19 +-
 drivers/gpio/gpio-zx.c                             |  25 +-
 drivers/gpio/gpio-zynq.c                           |  52 +-
 drivers/gpio/gpiolib-acpi.c                        |  90 ++-
 drivers/gpio/gpiolib-of.c                          |  16 +-
 drivers/gpio/gpiolib-sysfs.c                       |   5 +-
 drivers/gpio/gpiolib.c                             | 113 ++--
 drivers/gpio/gpiolib.h                             |  10 +-
 drivers/hid/hid-cp2112.c                           |  18 +-
 drivers/input/touchscreen/ad7879.c                 |   2 +-
 drivers/leds/leds-pca9532.c                        |  14 +-
 drivers/leds/leds-tca6507.c                        |   6 +-
 drivers/media/dvb-frontends/cxd2820r_core.c        |   2 +-
 drivers/mfd/dm355evm_msp.c                         |   2 +-
 drivers/mfd/htc-egpio.c                            |   2 +-
 drivers/mfd/htc-i2cpld.c                           |   4 +-
 drivers/mfd/tps65010.c                             |   2 +-
 drivers/mfd/ucb1x00-core.c                         |   2 +-
 drivers/mfd/vexpress-sysreg.c                      |   8 +-
 drivers/pinctrl/bcm/Kconfig                        |  17 +
 drivers/pinctrl/bcm/Makefile                       |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |  12 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c          |   2 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             | 743 +++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-baytrail.c           |  36 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |  22 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |  17 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |  16 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |  19 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |  34 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |  33 +-
 drivers/pinctrl/pinctrl-adi2.c                     |  16 +-
 drivers/pinctrl/pinctrl-amd.c                      |  35 +-
 drivers/pinctrl/pinctrl-as3722.c                   |  15 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |  16 +-
 drivers/pinctrl/pinctrl-at91.c                     |  28 +-
 drivers/pinctrl/pinctrl-coh901.c                   |  35 +-
 drivers/pinctrl/pinctrl-digicolor.c                |  12 +-
 drivers/pinctrl/pinctrl-pistachio.c                |  25 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |  17 +-
 drivers/pinctrl/pinctrl-st.c                       |  23 +-
 drivers/pinctrl/pinctrl-xway.c                     |  12 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |  31 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |  23 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |  23 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |  16 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |  18 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   3 +-
 drivers/pinctrl/samsung/pinctrl-exynos5440.c       |  16 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |  17 +-
 drivers/pinctrl/sh-pfc/gpio.c                      |  18 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |  31 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c                |  31 +-
 drivers/pinctrl/spear/pinctrl-plgpio.c             |  24 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |  16 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c               |  12 +-
 drivers/platform/x86/intel_pmic_gpio.c             |   4 +-
 drivers/tty/serial/max310x.c                       |   2 +-
 drivers/tty/serial/sc16is7xx.c                     |   2 +-
 drivers/video/fbdev/via/via-gpio.c                 |  19 +-
 include/linux/basic_mmio_gpio.h                    |  80 ---
 include/linux/gpio/driver.h                        |  75 ++-
 include/linux/of_gpio.h                            |  13 +-
 include/linux/platform_data/gpio-rcar.h            |  29 -
 include/sound/ac97_codec.h                         |   3 +
 sound/soc/codecs/rt5677.c                          |   2 +-
 sound/soc/codecs/wm5100.c                          |   2 +-
 sound/soc/codecs/wm8903.c                          |   2 +-
 sound/soc/codecs/wm8962.c                          |   2 +-
 sound/soc/codecs/wm8996.c                          |   2 +-
 sound/soc/soc-ac97.c                               | 125 ++++
 190 files changed, 3706 insertions(+), 2491 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt
 create mode 100644 drivers/gpio/gpio-104-idi-48.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
 delete mode 100644 include/linux/basic_mmio_gpio.h
 delete mode 100644 include/linux/platform_data/gpio-rcar.h
