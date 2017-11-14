From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] GPIO bulk changes for the v4.15 kernel cycle
Date: Tue, 14 Nov 2017 14:58:29 +0100
Message-ID: <CACRpkdY=KoSGWFhS1wYi2_hNhB6G3NiWmb2GMvfWFcNZ4OVwOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:53900 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752887AbdKNN6a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Nov 2017 08:58:30 -0500
Received: by mail-io0-f195.google.com with SMTP id 189so24421499iow.10
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2017 05:58:30 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Lukas Wunner <lukas@wunner.de>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Hi Linus,

here is the bulk of GPIO changes for the v4.15 kernel cycle.

Conflicts ahoy!

There will be a conflict in drivers/pinctrl/bcm/pinctrl-bcm2835.c.

This one is a bit silly really, as Thierry developed the patches
on top of linux-next where his patches applied cleanly and then
I applied them on my v4.14-rc1-based tree and solved the
conflict. So since the conflicty thing was already upstream, maybe
I should have just merged in another -rc...

Anyway it looks like this:

++<<<<<<< HEAD
 +              generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irqdomain,
++=======
+               /* FIXME: no clue why the code looks up the type here */
+               type = pc->irq_type[gpio];
+
+               generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irq.domain,
++>>>>>>> 24f0966c3e3f52a96e888504d60810d9df5b2d42

The end result should simply be: no comment, delete the type = business,
and keep that oneline:

generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irq.domain,

Then Stepgen R reports a build-time conflict with changes from
the IRQchip core from the tip tree, requireing the following
fixup patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 2 Nov 2017 16:10:46 +1100
Subject: [PATCH] gpio: uniphier: merge fix for "Update
 irq_domain_ops.activate() signature"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpio/gpio-uniphier.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index d62cea4ed6b7..d0069202ade3 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -300,13 +300,15 @@ static int uniphier_gpio_irq_domain_alloc(struct
irq_domain *domain,
  return irq_domain_alloc_irqs_parent(domain, virq, 1, &parent_fwspec);
 }

-static void uniphier_gpio_irq_domain_activate(struct irq_domain *domain,
-      struct irq_data *data)
+static int uniphier_gpio_irq_domain_activate(struct irq_domain *domain,
+      struct irq_data *data,
+      bool early)
 {
  struct uniphier_gpio_priv *priv = domain->host_data;
  struct gpio_chip *chip = &priv->chip;

  gpiochip_lock_as_irq(chip, data->hwirq + UNIPHIER_GPIO_IRQ_OFFSET);
+ return 0;
 }

 static void uniphier_gpio_irq_domain_deactivate(struct irq_domain *domain,
-- 
2.14.1

This patch should be available in linux-next.
The patch submitter has sent a similar patch.

I guess it's simple enough for you to either edit in or pick from
linux-next, or propose a line of fixing that fits better with your flow.

Those two should be all! I hope I didn't break anything else.

There is a patch hitting <linux/bitops.h> and it is ACKed by Andrew
Morton.

This also hits this file:
 drivers/md/dm-mpath.c                              |  22 +-

Which is the siter where we factored out the nice little assign_bit()
function. It's nice to have this available globally.

Please pull this in and fix the above smallish things! (Or tell me what
else to do.)

Yours,
Linus Walleij


The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v4.15-1

for you to fetch changes up to 24f0966c3e3f52a96e888504d60810d9df5b2d42:

  gpio: tegra186: Remove tegra186_gpio_lock_class (2017-11-13 11:43:10 +0100)

----------------------------------------------------------------
This is the bulk of GPIO changes for the v4.15 kernel cycle:

CORE:
- Fix the semantics of raw GPIO to actually be raw. No
  inversion semantics as before, but also no open draining,
  and allow the raw operations to affect lines used for
  interrupts as the caller supposedly knows what they are
  doing if they are getting the big hammer.

- Rewrote the __inner_function() notation calls to names that
  make more sense. I just find this kind of code disturbing.

- Drop the .irq_base() field from the gpiochip since now all
  IRQs are mapped dynamically. This is nice.

- Support for .get_multiple() in the core driver API. This
  allows us to read several GPIO lines with a single
  register read. This has high value for some usecases: it
  can be used to create oscilloscopes and signal analyzers
  and other things that rely on reading several lines at
  exactly the same instant. Also a generally nice
  optimization. This uses the new assign_bit() macro from
  the bitops lib that was ACKed by Andrew Morton and
  is implemented for two drivers, one of them being the
  generic MMIO driver so everyone using that will be able
  to benefit from this.

- Do not allow requests of Open Drain and Open Source
  setting of a GPIO line simultaneously. If the hardware
  actually supports enabling both at the same time the
  electrical result would be disastrous.

- A new interrupt chip core helper. This will be helpful
  to deal with "banked" GPIOs, which means GPIO controllers
  with several logical blocks of GPIO inside them. This
  is several gpiochips per device in the device model, in
  contrast to the case when there is a 1-to-1 relationship
  between a device and a gpiochip.

NEW DRIVERS:

- Maxim MAX3191x industrial serializer, a very interesting
  piece of professional I/O hardware.

- Uniphier GPIO driver. This is the GPIO block from the
  recent Socionext (ex Fujitsu and Panasonic) platform.

- Tegra 186 driver. This is based on the new banked GPIO
  infrastructure.

OTHER IMPROVEMENTS:

- Some documentation improvements.

- Wakeup support for the DesignWare DWAPB GPIO controller.

- Reset line support on the DesignWare DWAPB GPIO controller.

- Several non-critical bug fixes and improvements for the
  Broadcom BRCMSTB driver.

- Misc non-critical bug fixes like exotic errorpaths, removal
  of dead code etc.

- Explicit comments on fall-through switch() statements.

----------------------------------------------------------------
Alan Tull (1):
      gpio: gpio-dwapb: add optional reset

Andrew Jeffery (1):
      gpio: Fix loose spelling

Ard Biesheuvel (2):
      gpio: mb86s7x: share with other SoCs as module
      gpio: mb86s70: Revert "Return error if requesting an already
assigned gpio"

Arnd Bergmann (1):
      pinctrl: armada-37xx: remove unused variable

Arvind Yadav (2):
      gpio: brcmstb: Handle return value of devm_kasprintf
      gpio: tb10x: Handle return value of devm_kasprintf

Axel Lin (1):
      gpio: tegra186: Remove tegra186_gpio_lock_class

Bartosz Golaszewski (2):
      gpiolib: only check line handle flags once
      gpiolib: don't allow OPEN_DRAIN & OPEN_SOURCE flags for input

Doug Berger (6):
      gpio: brcmstb: allow all instances to be wakeup sources
      gpio: brcmstb: release the bgpio lock during irq handlers
      gpio: brcmstb: switch to handle_level_irq flow
      gpio: brcmstb: correct the configuration of level interrupts
      gpio: brcmstb: consolidate interrupt domains
      gpio: brcmstb: implement suspend/resume/shutdown

Geert Uytterhoeven (1):
      gpio: rcar: Use of_device_get_match_data() helper

Grygorii Strashko (1):
      gpiolib: drop irq_base field from gpio_chip struct

Gustavo A. R. Silva (1):
      gpio: mark expected switch fall-throughs

Hoan Tran (2):
      gpio: dwapb: Add wakeup source support
      MAINTAINERS: Add entry for Synopsys DesignWare APB GPIO driver

Jacopo Mondi (1):
      tools: gpio: Print error string on IOCTL failures

Linus Walleij (12):
      gpio: Clarify consumer stubs use-cases
      gpio: Get rid of _prefix and __prefixes
      gpio: Alter semantics of *raw* operations to actually be raw
      gpio: dwapb: fix bgpio usage
      gpio: loongson1: fix bgpio usage
      gpio: grgpio: Do not use gc->pin2mask()
      gpio: brcmstb: Do not use gc->pin2mask()
      gpio: mpc8xxx: Do not reverse bits using bgpio
      gpio: mmio: Make pin2mask() a private business
      gpio-mmio: Use the new .get_multiple() callback
      gpio: Fix undefined lock_dep_class
      pinctrl: bcm2835: Fix some merge fallout

Lukas Wunner (5):
      bitops: Introduce assign_bit()
      gpio: Introduce ->get_multiple callback
      dt-bindings: Document common property for daisy-chained devices
      dt-bindings: gpio: max3191x: Document new driver
      gpio: Add driver for Maxim MAX3191x industrial serializer

Markus Elfring (1):
      gpio-adnp: Use common error handling code in adnp_gpio_dbg_show()

Martin Kaiser (1):
      gpiolib: clear irq handler and data in one go

Masahiro Yamada (3):
      gpio: thunderx: remove unused .map() hook from irq_domain_ops
      dt-bindings: gpio: uniphier: add UniPhier GPIO binding
      gpio: uniphier: add UniPhier GPIO controller driver

Robin Murphy (1):
      gpio: xgene-sb: Tidy up fwnode usage

Sergei Shtylyov (2):
      gpio-rcar: document R8A77970 bindings
      gpio-rcar: use devm_ioremap_resource()

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

Yoshihiro Shimoda (1):
      gpio: rcar: Add r8a77995 (R-Car D3) support

 Documentation/ABI/obsolete/sysfs-gpio              |   2 +-
 .../devicetree/bindings/common-properties.txt      |  26 +
 .../devicetree/bindings/gpio/gpio-max3191x.txt     |  59 ++
 .../devicetree/bindings/gpio/gpio-uniphier.txt     |  52 ++
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |   2 +
 .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |   1 +
 Documentation/gpio/consumer.txt                    |  63 ++-
 Documentation/gpio/driver.txt                      |   6 +-
 MAINTAINERS                                        |   9 +
 drivers/bcma/driver_gpio.c                         |   2 +-
 drivers/gpio/Kconfig                               |  32 +-
 drivers/gpio/Makefile                              |   3 +
 drivers/gpio/gpio-104-dio-48e.c                    |   2 +-
 drivers/gpio/gpio-104-idi-48.c                     |   2 +-
 drivers/gpio/gpio-104-idio-16.c                    |   2 +-
 drivers/gpio/gpio-adnp.c                           |  31 +-
 drivers/gpio/gpio-altera.c                         |   4 +-
 drivers/gpio/gpio-aspeed.c                         |   9 +-
 drivers/gpio/gpio-ath79.c                          |   3 +-
 drivers/gpio/gpio-brcmstb.c                        | 422 ++++++++++----
 drivers/gpio/gpio-crystalcove.c                    |   2 +-
 drivers/gpio/gpio-dln2.c                           |   2 +-
 drivers/gpio/gpio-dwapb.c                          |  36 +-
 drivers/gpio/gpio-ftgpio010.c                      |   2 +-
 drivers/gpio/gpio-grgpio.c                         |   6 +-
 drivers/gpio/gpio-ingenic.c                        |   2 +-
 drivers/gpio/gpio-intel-mid.c                      |   2 +-
 drivers/gpio/gpio-loongson1.c                      |   7 +-
 drivers/gpio/gpio-lynxpoint.c                      |   2 +-
 drivers/gpio/gpio-max3191x.c                       | 492 ++++++++++++++++
 drivers/gpio/gpio-max732x.c                        |   2 +-
 drivers/gpio/gpio-mb86s7x.c                        |  12 +-
 drivers/gpio/gpio-merrifield.c                     |   2 +-
 drivers/gpio/gpio-mmio.c                           | 130 ++++-
 drivers/gpio/gpio-mpc8xxx.c                        |  23 +-
 drivers/gpio/gpio-omap.c                           |   2 +-
 drivers/gpio/gpio-pca953x.c                        |   2 +-
 drivers/gpio/gpio-pcf857x.c                        |   2 +-
 drivers/gpio/gpio-pci-idio-16.c                    |   2 +-
 drivers/gpio/gpio-pl061.c                          |   2 +-
 drivers/gpio/gpio-rcar.c                           |  24 +-
 drivers/gpio/gpio-reg.c                            |   4 +-
 drivers/gpio/gpio-stmpe.c                          |  10 +-
 drivers/gpio/gpio-tb10x.c                          |   3 +
 drivers/gpio/gpio-tc3589x.c                        |   2 +-
 drivers/gpio/gpio-tegra186.c                       | 620 +++++++++++++++++++++
 drivers/gpio/gpio-thunderx.c                       |  13 -
 drivers/gpio/gpio-uniphier.c                       | 507 +++++++++++++++++
 drivers/gpio/gpio-vf610.c                          |   2 +-
 drivers/gpio/gpio-wcove.c                          |   2 +-
 drivers/gpio/gpio-ws16c48.c                        |   2 +-
 drivers/gpio/gpio-xgene-sb.c                       |  15 +-
 drivers/gpio/gpio-xlp.c                            |   2 +-
 drivers/gpio/gpio-zx.c                             |   2 +-
 drivers/gpio/gpio-zynq.c                           |   2 +-
 drivers/gpio/gpiolib-of.c                          |   4 +-
 drivers/gpio/gpiolib.c                             | 582 +++++++++++++------
 drivers/gpio/gpiolib.h                             |   6 +-
 drivers/md/dm-mpath.c                              |  22 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |   4 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |   2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c           |   6 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |   6 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |   2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |   6 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |   4 +-
 drivers/pinctrl/pinctrl-amd.c                      |   2 +-
 drivers/pinctrl/pinctrl-at91.c                     |   2 +-
 drivers/pinctrl/pinctrl-coh901.c                   |   2 +-
 drivers/pinctrl/pinctrl-mcp23s08.c                 |   2 +-
 drivers/pinctrl/pinctrl-oxnas.c                    |   2 +-
 drivers/pinctrl/pinctrl-pic32.c                    |   2 +-
 drivers/pinctrl/pinctrl-pistachio.c                |   2 +-
 drivers/pinctrl/pinctrl-st.c                       |   2 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |   2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   2 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c              |   2 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c                |   2 +-
 drivers/pinctrl/spear/pinctrl-plgpio.c             |   2 +-
 drivers/platform/x86/intel_int0002_vgpio.c         |   6 +-
 include/dt-bindings/gpio/gpio.h                    |   2 +-
 include/dt-bindings/gpio/uniphier-gpio.h           |  18 +
 include/linux/bitops.h                             |  24 +
 include/linux/gpio/consumer.h                      |  43 ++
 include/linux/gpio/driver.h                        | 215 +++++--
 include/linux/gpio/machine.h                       |   2 +-
 include/linux/of_gpio.h                            |   2 +-
 tools/gpio/gpio-utils.c                            |  17 +-
 88 files changed, 3157 insertions(+), 516 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
 create mode 100644 drivers/gpio/gpio-max3191x.c
 create mode 100644 drivers/gpio/gpio-tegra186.c
 create mode 100644 drivers/gpio/gpio-uniphier.c
 create mode 100644 include/dt-bindings/gpio/uniphier-gpio.h
