From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3] pinctrl: baytrail: lock IRQs when starting them
Date: Fri,  6 Dec 2013 15:03:12 +0100
Message-ID: <1386338592-1088-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

This uses the new API for tagging GPIO lines as in use by
IRQs. This enforces a few semantic checks on how the underlying
GPIO line is used.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Use irq_data_get_irq_chip_data() to get the right data
  pointer.
ChangeLog v1->v2:
- Actually make the change compile, doh.
---
 drivers/pinctrl/pinctrl-baytrail.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-baytrail.c b/drivers/pinctrl/pinctrl-baytrail.c
index 1174ea86b6e9..5888066d80c2 100644
--- a/drivers/pinctrl/pinctrl-baytrail.c
+++ b/drivers/pinctrl/pinctrl-baytrail.c
@@ -372,11 +372,33 @@ static void byt_irq_mask(struct irq_data *d)
 {
 }
 
+static unsigned int byt_irq_startup(struct irq_data *d)
+{
+	struct byt_gpio *vg = irq_data_get_irq_chip_data(d);
+
+	if (gpio_lock_as_irq(&vg->chip, irqd_to_hwirq(d)))
+		dev_err(vg->chip.dev,
+			"unable to lock HW IRQ %lu for IRQ\n",
+			irqd_to_hwirq(d));
+	byt_irq_unmask(d);
+	return 0;
+}
+
+static void byt_irq_shutdown(struct irq_data *d)
+{
+	struct byt_gpio *vg = irq_data_get_irq_chip_data(d);
+
+	byt_irq_mask(d);
+	gpio_unlock_as_irq(&vg->chip, irqd_to_hwirq(d));
+}
+
 static struct irq_chip byt_irqchip = {
 	.name = "BYT-GPIO",
 	.irq_mask = byt_irq_mask,
 	.irq_unmask = byt_irq_unmask,
 	.irq_set_type = byt_irq_type,
+	.irq_startup = byt_irq_startup,
+	.irq_shutdown = byt_irq_shutdown,
 };
 
 static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
-- 
1.8.3.1
