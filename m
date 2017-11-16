From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control bulk changes for v4.15
Date: Thu, 16 Nov 2017 11:19:33 +0100
Message-ID: <CACRpkdYk_X0z2s_EDVZiJSWh0b5NKmd=HrmunoYgwJMWsGS=7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

here is the pin control big pull request for the v4.15 kernel cycle.

The essence of the changes should be stated in the signed tag.

There is a whole lot of GPIO noise in the diffstat due to cross-sharing
branches with the GPIO tree, and the bad taste of yours truly
to base a gpio rework, also affecting pin control, on a random
commit in the GPIO tree. The commit IDs should be the same
though. The biggest part of it is the change of irqchip infrastructure
that touches more or less every driver also supporting GPIO.

I did the experiment to simply rebase this onto your HEAD and
shortlog, it is much more reasonable/readable. But the pull
request based on v4.14-rc1 gives the right development history
so I naturally prefer this over any rebasing. (If you prefer this
method I can do it.)

A bunch of Blackfin patches lack ACKs. I don't know what to do
about that, I guess the arch could use an active and responsive
maintainer. I see most refactorings now go in without ACKs.
I try my best not to break anything atleast.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.15-1

for you to fetch changes up to eeb690bceb1eb95f6c1c526079e1315dd459855e:

  pinctrl: gemini: Fix missing pad descriptions (2017-11-13 22:36:12 +0100)

----------------------------------------------------------------
This is the bulk of pin control changes for the v4.15
kernel cycle:

Core:

- The pin control Kconfig entry PINCTRL is now turned into
  a menuconfig option. This obviously has the implication of
  making the subsystem menu visible in menuconfig. This is
  happening because of two things:

  - Intel have started to deploy and depend on pin controllers
    in a way that is affecting users directly. This happens
    on the highly integrated laptop chipsets named after
    geographical places: baytrail, broxton, cannonlake,
    cedarfork, cherryview, denverton, geminilake, lewisburg,
    merrifield, sunrisepoint... It started a while back and
    now it is ever more evident that this is crucial
    infrastructure for x86 laptops and not an embedded
    obscurity anymore. Users need to be aware.

  - Pin control expanders on I2C and SPI that are
    arch-agnostic. Currently Semtech SX150X and Microchip
    MCP28x08 but more are expected. Users will have to be
    able to configure these in directly for their set-up.

- Just go and select GPIOLIB now that we made sure that
  GPIOLIB is a very vanilla subsystem. Do not depend on
  it, if we need it, select it.

- Exposing the pin control subsystem in menuconfig uncovered
  a bunch of obscure bugs that are now hopefully fixed,
  all more or less pertaining to Blackfin.

- Unified namespace for cross-calls between pin control and
  GPIO.

- New support for clock skew/delay generic DT bindings
  and generic pin config options for this.

- Minor documentation improvements.

Various:

- The Renesas SH-PFC pin controller has evolved a lot. It seems
  Renesas are churning out new SoCs by the minute.

- A bunch of non-critical fixes for the Rockchip driver.

- Improve the use of library functions instead of open coding.

- Support the MCP28018 variant in the MCP28x08 driver.

- Static constifying.

----------------------------------------------------------------
Alan Tull (1):
      gpio: gpio-dwapb: add optional reset

Andrew Jeffery (1):
      gpio: Fix loose spelling

Ard Biesheuvel (2):
      gpio: mb86s7x: share with other SoCs as module
      gpio: mb86s70: Revert "Return error if requesting an already
assigned gpio"

Arnd Bergmann (2):
      pinctrl: armada-37xx: remove unused variable
      pinctrl: samsung/s3c24xx: add CONFIG_OF dependency

Arvind Yadav (2):
      gpio: brcmstb: Handle return value of devm_kasprintf
      gpio: tb10x: Handle return value of devm_kasprintf

Bartosz Golaszewski (2):
      gpiolib: only check line handle flags once
      gpiolib: don't allow OPEN_DRAIN & OPEN_SOURCE flags for input

Biju Das (1):
      pinctrl: sh-pfc: r8a7745: Implement voltage switching for SDHI

Chris Brandt (2):
      pinctrl: rza1: Add support for RZ/A1L
      dt-bindings: pinctrl: Add support for RZ/A1M and RZ/A1L

Chris Gorman (1):
      pinctrl: cherryview fixed typo in comment

Colin Ian King (6):
      pinctrl: uniphier: make arrays static, reduces object code size
      pinctrl/amd: make functions amd_gpio_suspend and amd_gpio_resume static
      pinctrl: single: make two arrays static const, reduces object code size
      pinctrl: ingenic: make function ingenic_pinctrl_probe static
      pinctrl: sx150x: make struct sx150x_regmap_config static
      pinctrl: ti-iodelay: remove redundant unused variable dev

David Wu (2):
      pinctrl: rockchip: Fix the rk3399 gpio0 and gpio1 banks'
drv_offset at pmu grf
      pinctrl: rockchip: rk3328: Fix the correct routing config

Dirk Behme (1):
      pinctrl: sh-pfc: r8a7795: Re-add DRIF support

Doug Berger (6):
      gpio: brcmstb: allow all instances to be wakeup sources
      gpio: brcmstb: release the bgpio lock during irq handlers
      gpio: brcmstb: switch to handle_level_irq flow
      gpio: brcmstb: correct the configuration of level interrupts
      gpio: brcmstb: consolidate interrupt domains
      gpio: brcmstb: implement suspend/resume/shutdown

Fenglin Wu (1):
      pinctrl: qcom: spmi-gpio: Update GPIO EN_CTL when setting pin config

Geert Uytterhoeven (20):
      pinctrl: sh-pfc: r8a7795-es1: Restore sort order
      pinctrl: sh-pfc: r8a7795: Restore sort order
      MAINTAINERS: Add git repository to Renesas pinctrl driver section
      gpio: rcar: Use of_device_get_match_data() helper
      pinctrl: sh-pfc: r8a7795: Add INTC-EX pins, groups and function
      pinctrl: sh-pfc: r8a77995: Remove USB0_IDIN and USB0_IDPU pins
      pinctrl: sh-pfc: Remove matching on plain sh-pfc platform device
      pinctrl: sh-pfc: Drop width parameter of sh_pfc_{read,write}_reg()
      pinctrl: sh-pfc: Add generic bias register description
      pinctrl: sh-pfc: Add sh_pfc_pin_to_bias_reg() helper
      pinctrl: sh-pfc: r8a7795-es1: Use generic bias register description
      pinctrl: sh-pfc: r8a7795: Use generic bias register description
      pinctrl: sh-pfc: r8a7796: Use generic bias register description
      pinctrl: sh-pfc: r8a7778: Use generic bias register description
      pinctrl: sh-pfc: Remove obsolete sh_pfc_pin_to_bias_info()
      pinctrl: sh-pfc: Add generic IOCTRL register description
      pinctrl: sh-pfc: r8a7795-es1: Use generic IOCTRL register description
      pinctrl: sh-pfc: r8a7795: Use generic IOCTRL register description
      pinctrl: sh-pfc: r8a7796: Use generic IOCTRL register description
      pinctrl: sh-pfc: Save/restore registers for PSCI system suspend

Grygorii Strashko (1):
      gpiolib: drop irq_base field from gpio_chip struct

Gustavo A. R. Silva (1):
      gpio: mark expected switch fall-throughs

Heiko Stuebner (1):
      pinctrl: rockchip: Add iomux-route switching support for rk3288

Hoan Tran (2):
      gpio: dwapb: Add wakeup source support
      MAINTAINERS: Add entry for Synopsys DesignWare APB GPIO driver

Jacopo Mondi (1):
      tools: gpio: Print error string on IOCTL failures

Jerome Brunet (9):
      pinctrl: meson: fix incorrect usage of ENOSYS
      pinctrl: meson: remove offset from pinctrl
      pinctrl: meson: get rid of pin_base
      pinctrl: meson-gx: TEST_N belongs to the AO controller
      pinctrl: meson-gxbb: add missing GPIOX_22 pin
      pinctrl: meson-gx: add TEST_N i2s pinmux
      pinctrl: meson: remove unused pin_base
      pinctrl: meson: separate soc drivers
      pinctrl: meson: rework pinmux ops

Ken Ma (1):
      pinctrl: armada-37xx: Add edge both type gpio irq support

Kuninori Morimoto (4):
      pinctrl: sh-pfc: r8a7795: Add Audio clock pin support
      pinctrl: sh-pfc: r8a7795: Add Audio SSI pin support
      pinctrl: sh-pfc: r8a77995: Add Audio clock pin support
      pinctrl: sh-pfc: r8a77995: Add Audio SSI pin support

Lars Poeschel (2):
      dt-bindings: pinctrl: Move mcp23s08 from gpio
      dt-bindings: pinctrl: mcp23s08 update binding doc

Linus Walleij (31):
      gpio: Clarify consumer stubs use-cases
      pinctrl/gpio: Unify namespace for cross-calls
      gpio: Get rid of _prefix and __prefixes
      gpio: Alter semantics of *raw* operations to actually be raw
      pinctrl: bcm: nsp: Use library functions
      pinctrl: meson: Use library functions
      gpio: pxa: Use library functions
      Merge branch 'pinconf-rename' into devel
      Merge tag 'sh-pfc-for-v4.15-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      pinctrl: Do not depend in GPIOLIB, select it
      pinctrl: gemini: Add missing functions
      gpio: Cut old SX150X Kconfig option
      pinctrl: adi2: Fix Kconfig build problem
      blackfin: Fix local <asm/gpio.h> includes
      Merge tag 'sh-pfc-for-v4.15-tag2' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      gpio: dwapb: fix bgpio usage
      gpio: loongson1: fix bgpio usage
      gpio: grgpio: Do not use gc->pin2mask()
      gpio: brcmstb: Do not use gc->pin2mask()
      gpio: mpc8xxx: Do not reverse bits using bgpio
      gpio: mmio: Make pin2mask() a private business
      gpio-mmio: Use the new .get_multiple() callback
      pinctrl: Add skew-delay pin config and bindings
      pinctrl: gemini: Use generic DT parser
      pinctrl: gemini: Implement clock skew/delay config
      pinctrl: gemini: Fix GMAC groups
      gpio: Fix undefined lock_dep_class
      pinctrl: bcm2835: Fix some merge fallout
      Merge branch 'gpio-irqchip-rework' of /home/linus/linux-gpio into devel
      pinctrl: Add some depends on HAS_IOMEM
      pinctrl: gemini: Fix missing pad descriptions

Lukas Wunner (5):
      bitops: Introduce assign_bit()
      gpio: Introduce ->get_multiple callback
      dt-bindings: Document common property for daisy-chained devices
      dt-bindings: gpio: max3191x: Document new driver
      gpio: Add driver for Maxim MAX3191x industrial serializer

Markus Elfring (2):
      gpio-adnp: Use common error handling code in adnp_gpio_dbg_show()
      pinctrl: max77620: Use common error handling code in
max77620_pinconf_set()

Martin Kaiser (1):
      gpiolib: clear irq handler and data in one go

Masahiro Yamada (4):
      gpio: thunderx: remove unused .map() hook from irq_domain_ops
      dt-bindings: gpio: uniphier: add UniPhier GPIO binding
      gpio: uniphier: add UniPhier GPIO controller driver
      pinctrl: uniphier: remove eMMC hardware reset pin-mux

Maxime Ripard (3):
      pinctrl: sunxi: Introduce the strict flag
      pinctrl: sunxi: Disable strict mode for old pinctrl drivers
      pinctrl: sunxi: Enforce the strict mode by default

Mika Westerberg (2):
      pinctrl: intel: Make offset to interrupt status register configurable
      pinctrl: intel: Add Intel Cedar Fork PCH pin controller support

Miquel Raynal (1):
      pinctrl: dt-bindings: Fix A37xx uart2 group name

Phil Reid (4):
      pinctrl: change Kconfig PINCTRL variable to a menuconfig
      dt-bindings: pinctrl: add mcp23018 to mcp23s08 documentation
      pinctrl: mcp23s08: remove unused variables from pinconf_set
      gpio: mcp23s08: add support for mcp23018

Rajendra Nayak (1):
      pinctrl: qcom: spmi-gpio: Add pmi8994 gpio support

Robin Murphy (1):
      gpio: xgene-sb: Tidy up fwnode usage

Sergei Shtylyov (2):
      gpio-rcar: document R8A77970 bindings
      gpio-rcar: use devm_ioremap_resource()

Takeshi Kihara (6):
      pinctrl: sh-pfc: r8a7795: Add SDHI0-3 support
      pinctrl: sh-pfc: r8a77995: Add USB2.0 host support
      pinctrl: sh-pfc: r8a7795-es1: Add USB3.0 host support
      pinctrl: sh-pfc: r8a7795: Add USB3.0 host support
      pinctrl: sh-pfc: r8a77995: Add PWM pins, groups and functions
      pinctrl: sh-pfc: r8a7796: Add support for INTC-EX IRQ pins

Thierry Reding (16):
      pinctrl: armada-37xx: Stop using struct gpio_chip.irq_base
      gpio: Introduce struct gpio_irq_chip
      gpio: Move irqchip into struct gpio_irq_chip
      gpio: Move irqdomain into struct gpio_irq_chip
      gpio: Move irq_handler to struct gpio_irq_chip
      gpio: Move irq_default_type to struct gpio_irq_chip
      gpio: Move irq_chained_parent to struct gpio_irq_chip
      gpio: Move irq_nested into struct gpio_irq_chip
      gpio: Move irq_valid_mask into struct gpio_irq_chip
      gpio: Move lock_key into struct gpio_irq_chip
      gpio: Implement tighter IRQ chip integration
      gpio: Export gpiochip_irq_{map,unmap}()
      gpio: Add Tegra186 support
      gpio: Disambiguate struct gpio_irq_chip.nested
      gpio: Introduce struct gpio_irq_chip.first
      gpio: Automatically add lockdep keys

Tom Saeger (1):
      Documentation: fix ref to gpio.txt

Wolfram Sang (5):
      pinctrl: sh-pfc: r8a7795: Add I2C pin support
      pinctrl: sh-pfc: r8a7795: Add HSCIF pins, groups, and functions
      pinctrl: sh-pfc: r8a7795: Fix trivial typo in comment
      pinctrl: sh-pfc: r8a7795-es1: Fix trivial typo in comment
      pinctrl: sh-pfc: r8a7796: Fix trivial typo in comment

Yoshihiro Shimoda (1):
      pinctrl: sh-pfc: r8a77995: Add EthernetAVB pins, groups and functions

 Documentation/ABI/obsolete/sysfs-gpio              |    2 +-
 .../devicetree/bindings/common-properties.txt      |   26 +
 .../devicetree/bindings/gpio/gpio-max3191x.txt     |   59 +
 .../devicetree/bindings/gpio/gpio-uniphier.txt     |   52 +
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |    1 +
 .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |    1 +
 .../bindings/pinctrl/cortina,gemini-pinctrl.txt    |   10 +-
 .../pinctrl/marvell,armada-37xx-pinctrl.txt        |    4 +-
 .../bindings/pinctrl/pinctrl-bindings.txt          |    4 +
 .../pinctrl-mcp23s08.txt}                          |   59 +
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |    2 +
 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      |    6 +-
 Documentation/driver-api/pinctl.rst                |    6 +-
 Documentation/gpio/consumer.txt                    |   63 +-
 Documentation/gpio/driver.txt                      |    6 +-
 Documentation/gpio/gpio-legacy.txt                 |   10 +-
 Documentation/translations/zh_CN/gpio.txt          |    6 +-
 MAINTAINERS                                        |   10 +
 arch/blackfin/Kconfig                              |    7 +-
 arch/blackfin/Kconfig.debug                        |    1 +
 arch/blackfin/include/asm/gpio.h                   |   20 +
 arch/blackfin/kernel/bfin_gpio.c                   |    3 +
 arch/blackfin/kernel/debug-mmrs.c                  |    2 +-
 arch/blackfin/mach-common/ints-priority.c          |    2 +-
 arch/blackfin/mach-common/pm.c                     |    2 +-
 drivers/bcma/driver_gpio.c                         |    2 +-
 drivers/gpio/Kconfig                               |   41 +-
 drivers/gpio/Makefile                              |    3 +
 drivers/gpio/gpio-104-dio-48e.c                    |    2 +-
 drivers/gpio/gpio-104-idi-48.c                     |    2 +-
 drivers/gpio/gpio-104-idio-16.c                    |    2 +-
 drivers/gpio/gpio-adnp.c                           |   31 +-
 drivers/gpio/gpio-altera.c                         |    4 +-
 drivers/gpio/gpio-aspeed.c                         |   13 +-
 drivers/gpio/gpio-ath79.c                          |    3 +-
 drivers/gpio/gpio-brcmstb.c                        |  422 ++++-
 drivers/gpio/gpio-crystalcove.c                    |    2 +-
 drivers/gpio/gpio-dln2.c                           |    2 +-
 drivers/gpio/gpio-dwapb.c                          |   36 +-
 drivers/gpio/gpio-em.c                             |    4 +-
 drivers/gpio/gpio-ftgpio010.c                      |    2 +-
 drivers/gpio/gpio-grgpio.c                         |    6 +-
 drivers/gpio/gpio-ingenic.c                        |    2 +-
 drivers/gpio/gpio-intel-mid.c                      |    2 +-
 drivers/gpio/gpio-loongson1.c                      |    7 +-
 drivers/gpio/gpio-lynxpoint.c                      |    2 +-
 drivers/gpio/gpio-max3191x.c                       |  492 +++++
 drivers/gpio/gpio-max732x.c                        |    2 +-
 drivers/gpio/gpio-mb86s7x.c                        |   12 +-
 drivers/gpio/gpio-merrifield.c                     |    2 +-
 drivers/gpio/gpio-mmio.c                           |  130 +-
 drivers/gpio/gpio-mpc8xxx.c                        |   23 +-
 drivers/gpio/gpio-omap.c                           |    2 +-
 drivers/gpio/gpio-pca953x.c                        |    2 +-
 drivers/gpio/gpio-pcf857x.c                        |    2 +-
 drivers/gpio/gpio-pci-idio-16.c                    |    2 +-
 drivers/gpio/gpio-pl061.c                          |    2 +-
 drivers/gpio/gpio-pxa.c                            |   14 +-
 drivers/gpio/gpio-rcar.c                           |   28 +-
 drivers/gpio/gpio-reg.c                            |    4 +-
 drivers/gpio/gpio-stmpe.c                          |   10 +-
 drivers/gpio/gpio-tb10x.c                          |    3 +
 drivers/gpio/gpio-tc3589x.c                        |    2 +-
 drivers/gpio/gpio-tegra.c                          |    4 +-
 drivers/gpio/gpio-tegra186.c                       |  623 +++++++
 drivers/gpio/gpio-thunderx.c                       |   13 -
 drivers/gpio/gpio-tz1090.c                         |    4 +-
 drivers/gpio/gpio-uniphier.c                       |  507 ++++++
 drivers/gpio/gpio-vf610.c                          |    2 +-
 drivers/gpio/gpio-wcove.c                          |    2 +-
 drivers/gpio/gpio-ws16c48.c                        |    2 +-
 drivers/gpio/gpio-xgene-sb.c                       |   15 +-
 drivers/gpio/gpio-xlp.c                            |    2 +-
 drivers/gpio/gpio-zx.c                             |    2 +-
 drivers/gpio/gpio-zynq.c                           |    2 +-
 drivers/gpio/gpiolib-of.c                          |    4 +-
 drivers/gpio/gpiolib.c                             |  586 ++++--
 drivers/gpio/gpiolib.h                             |    6 +-
 drivers/md/dm-mpath.c                              |   22 +-
 drivers/pinctrl/Kconfig                            |   32 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |    4 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |    6 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             |   21 +-
 drivers/pinctrl/core.c                             |   12 +-
 drivers/pinctrl/core.h                             |    2 +-
 drivers/pinctrl/intel/Kconfig                      |   11 +-
 drivers/pinctrl/intel/Makefile                     |    1 +
 drivers/pinctrl/intel/pinctrl-baytrail.c           |    6 +-
 drivers/pinctrl/intel/pinctrl-cedarfork.c          |  375 ++++
 drivers/pinctrl/intel/pinctrl-cherryview.c         |    8 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |   22 +-
 drivers/pinctrl/intel/pinctrl-intel.h              |    3 +
 drivers/pinctrl/meson/Kconfig                      |   41 +
 drivers/pinctrl/meson/Makefile                     |    9 +-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |  892 ++++-----
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |  852 ++++-----
 drivers/pinctrl/meson/pinctrl-meson.c              |  200 +-
 drivers/pinctrl/meson/pinctrl-meson.h              |   47 +-
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c         |  108 ++
 drivers/pinctrl/meson/pinctrl-meson8-pmx.h         |   48 +
 drivers/pinctrl/meson/pinctrl-meson8.c             |  992 +++++-----
 drivers/pinctrl/meson/pinctrl-meson8b.c            |  808 +++++----
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |   70 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |    4 +-
 drivers/pinctrl/pinconf-generic.c                  |    2 +
 drivers/pinctrl/pinctrl-amd.c                      |    6 +-
 drivers/pinctrl/pinctrl-at91.c                     |    2 +-
 drivers/pinctrl/pinctrl-coh901.c                   |    2 +-
 drivers/pinctrl/pinctrl-gemini.c                   |  333 +++-
 drivers/pinctrl/pinctrl-ingenic.c                  |    2 +-
 drivers/pinctrl/pinctrl-max77620.c                 |   21 +-
 drivers/pinctrl/pinctrl-mcp23s08.c                 |   22 +-
 drivers/pinctrl/pinctrl-oxnas.c                    |    2 +-
 drivers/pinctrl/pinctrl-pic32.c                    |    2 +-
 drivers/pinctrl/pinctrl-pistachio.c                |    2 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |   43 +-
 drivers/pinctrl/pinctrl-rza1.c                     |  134 ++
 drivers/pinctrl/pinctrl-single.c                   |    4 +-
 drivers/pinctrl/pinctrl-st.c                       |    2 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |    4 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |    2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    6 +
 drivers/pinctrl/samsung/Kconfig                    |    2 +-
 drivers/pinctrl/sh-pfc/core.c                      |  131 +-
 drivers/pinctrl/sh-pfc/core.h                      |   11 +-
 drivers/pinctrl/sh-pfc/gpio.c                      |    4 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c               |  403 +++--
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c               |    1 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |  542 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               | 1904 +++++++++++++++++---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  573 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              |  394 +++-
 drivers/pinctrl/sh-pfc/pinctrl.c                   |   12 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   24 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |    6 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c                |    6 +-
 drivers/pinctrl/spear/pinctrl-plgpio.c             |    8 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |    4 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c          |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun5i.c              |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31-r.c        |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c          |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c        |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23.c          |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c          |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3-r.c         |    3 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c           |    3 +-
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c        |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c          |    1 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   13 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |    1 +
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            |    4 -
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c   |   14 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c   |    4 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c   |    4 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c   |    4 +-
 drivers/platform/x86/intel_int0002_vgpio.c         |    6 +-
 include/dt-bindings/gpio/gpio.h                    |    2 +-
 include/dt-bindings/gpio/meson-gxbb-gpio.h         |    2 +-
 include/dt-bindings/gpio/meson-gxl-gpio.h          |    2 +-
 include/dt-bindings/gpio/uniphier-gpio.h           |   18 +
 include/linux/bitops.h                             |   24 +
 include/linux/gpio/consumer.h                      |   43 +
 include/linux/gpio/driver.h                        |  215 ++-
 include/linux/gpio/machine.h                       |    2 +-
 include/linux/of_gpio.h                            |    2 +-
 include/linux/pinctrl/consumer.h                   |    8 +-
 include/linux/pinctrl/pinconf-generic.h            |    5 +
 tools/gpio/gpio-utils.c                            |   17 +-
 169 files changed, 9400 insertions(+), 3677 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
 rename Documentation/devicetree/bindings/{gpio/gpio-mcp23s08.txt =>
pinctrl/pinctrl-mcp23s08.txt} (66%)
 create mode 100644 drivers/gpio/gpio-max3191x.c
 create mode 100644 drivers/gpio/gpio-tegra186.c
 create mode 100644 drivers/gpio/gpio-uniphier.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-cedarfork.c
 create mode 100644 drivers/pinctrl/meson/Kconfig
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson8-pmx.c
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson8-pmx.h
 create mode 100644 include/dt-bindings/gpio/uniphier-gpio.h
