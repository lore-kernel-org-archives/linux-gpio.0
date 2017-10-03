From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] pinctrl: cherryview: fix issues caused by dynamic gpio irqs mapping
Date: Tue, 3 Oct 2017 12:00:49 -0500
Message-ID: <20171003170049.24480-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Chris Gorman <chrisjohgorman@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

New GPIO IRQs are allocated and mapped dynamically by default when
GPIO IRQ infrastructure is used by cherryview-pinctrl driver.
This causes issues on some Intel platforms [1][2] with broken BIOS which
hardcodes Linux IRQ numbers in their ACPI tables.

On such platforms cherryview-pinctrl driver should allocate and map all
GPIO IRQs at probe time.
Side effect - "Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n"
can be seen at boot log.

NOTE. It still may fail if boot sequence will changed and some interrupt
controller will be probed before cherryview-pinctrl which will shift Linux IRQ
numbering (expected with CONFIG_SPARCE_IRQ enabled).

[1] https://bugzilla.kernel.org/show_bug.cgi?id=194945
[2] https://lkml.org/lkml/2017/9/28/153
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Chris Gorman <chrisjohgorman@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com> 
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
Reported-by: Chris Gorman <chrisjohgorman@gmail.com>
Reported-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 04e929f..fadbca9 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1577,6 +1577,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	struct gpio_chip *chip = &pctrl->chip;
 	bool need_valid_mask = !dmi_check_system(chv_no_valid_mask);
 	int ret, i, offset;
+	int irq_base;
 
 	*chip = chv_gpio_chip;
 
@@ -1622,7 +1623,18 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	/* Clear all interrupts */
 	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
 
-	ret = gpiochip_irqchip_add(chip, &chv_gpio_irqchip, 0,
+	if (!need_valid_mask) {
+		irq_base = devm_irq_alloc_descs(pctrl->dev, -1, 0,
+						chip->ngpio, NUMA_NO_NODE);
+		if (irq_base < 0) {
+			dev_err(pctrl->dev, "Failed to allocate IRQ numbers\n");
+			return irq_base;
+		}
+	} else {
+		irq_base = 0;
+	}
+
+	ret = gpiochip_irqchip_add(chip, &chv_gpio_irqchip, irq_base,
 				   handle_bad_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to add IRQ chip\n");
-- 
2.10.1
