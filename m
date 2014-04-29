From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] RFT: pinctrl: msm: switch to using generic GPIO irqchip helpers
Date: Tue, 29 Apr 2014 11:06:34 -0700
Message-ID: <1398794794-28920-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Boyd <sboyd@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

This switches the Qualcomm MSM pin control driver over to using
the generic GPIO irqchip helpers.

Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Josh Cartwright <joshc@codeaurora.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Stephen: you may get the lockdep warnings back if you use this
with the pinctrl tree only, but the GPIO tree also has this patch:
http://marc.info/?l=3Dlinux-gpio&m=3D139817061114511&w=3D2

Bj=C3=B6rn: you may see the HW setup happening for each interrupt, but
the GPIO tree also has this patch:
http://marc.info/?l=3Dlinux-gpio&m=3D139826462511107&w=3D2
---
 drivers/pinctrl/Kconfig       |  1 +
 drivers/pinctrl/pinctrl-msm.c | 99 ++++++++++++-----------------------=
--------
 2 files changed, 28 insertions(+), 72 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 934fd89978d3..4f7b8397e0af 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -224,6 +224,7 @@ config PINCTRL_MSM
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
+	select GPIOLIB_IRQCHIP
=20
 config PINCTRL_APQ8064
 	tristate "Qualcomm APQ8064 pin controller driver"
diff --git a/drivers/pinctrl/pinctrl-msm.c b/drivers/pinctrl/pinctrl-ms=
m.c
index 5fa9341cc589..df6dda4ce803 100644
--- a/drivers/pinctrl/pinctrl-msm.c
+++ b/drivers/pinctrl/pinctrl-msm.c
@@ -13,7 +13,6 @@
  */
=20
 #include <linux/err.h>
-#include <linux/irqdomain.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -26,8 +25,6 @@
 #include <linux/slab.h>
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/irqchip/chained_irq.h>
 #include <linux/spinlock.h>
=20
 #include "core.h"
@@ -41,7 +38,6 @@
  * struct msm_pinctrl - state for a pinctrl-msm device
  * @dev:            device handle.
  * @pctrl:          pinctrl handle.
- * @domain:         irqdomain handle.
  * @chip:           gpiochip handle.
  * @irq:            parent irq for the TLMM irq_chip.
  * @lock:           Spinlock to protect register resources as well
@@ -55,7 +51,6 @@
 struct msm_pinctrl {
 	struct device *dev;
 	struct pinctrl_dev *pctrl;
-	struct irq_domain *domain;
 	struct gpio_chip chip;
 	int irq;
=20
@@ -68,6 +63,11 @@ struct msm_pinctrl {
 	void __iomem *regs;
 };
=20
+static inline struct msm_pinctrl *to_msm_pinctrl(struct gpio_chip *gc)
+{
+	return container_of(gc, struct msm_pinctrl, chip);
+}
+
 static int msm_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct msm_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
@@ -480,13 +480,6 @@ static void msm_gpio_set(struct gpio_chip *chip, u=
nsigned offset, int value)
 	spin_unlock_irqrestore(&pctrl->lock, flags);
 }
=20
-static int msm_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
-{
-	struct msm_pinctrl *pctrl =3D container_of(chip, struct msm_pinctrl, =
chip);
-
-	return irq_find_mapping(pctrl->domain, offset);
-}
-
 static int msm_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
 	int gpio =3D chip->base + offset;
@@ -556,7 +549,6 @@ static struct gpio_chip msm_gpio_template =3D {
 	.direction_output =3D msm_gpio_direction_output,
 	.get              =3D msm_gpio_get,
 	.set              =3D msm_gpio_set,
-	.to_irq           =3D msm_gpio_to_irq,
 	.request          =3D msm_gpio_request,
 	.free             =3D msm_gpio_free,
 	.dbg_show         =3D msm_gpio_dbg_show,
@@ -608,12 +600,12 @@ static void msm_gpio_update_dual_edge_pos(struct =
msm_pinctrl *pctrl,
=20
 static void msm_gpio_irq_mask(struct irq_data *d)
 {
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl =3D to_msm_pinctrl(gc);
 	const struct msm_pingroup *g;
-	struct msm_pinctrl *pctrl;
 	unsigned long flags;
 	u32 val;
=20
-	pctrl =3D irq_data_get_irq_chip_data(d);
 	g =3D &pctrl->soc->groups[d->hwirq];
=20
 	spin_lock_irqsave(&pctrl->lock, flags);
@@ -629,12 +621,12 @@ static void msm_gpio_irq_mask(struct irq_data *d)
=20
 static void msm_gpio_irq_unmask(struct irq_data *d)
 {
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl =3D to_msm_pinctrl(gc);
 	const struct msm_pingroup *g;
-	struct msm_pinctrl *pctrl;
 	unsigned long flags;
 	u32 val;
=20
-	pctrl =3D irq_data_get_irq_chip_data(d);
 	g =3D &pctrl->soc->groups[d->hwirq];
=20
 	spin_lock_irqsave(&pctrl->lock, flags);
@@ -654,12 +646,12 @@ static void msm_gpio_irq_unmask(struct irq_data *=
d)
=20
 static void msm_gpio_irq_ack(struct irq_data *d)
 {
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl =3D to_msm_pinctrl(gc);
 	const struct msm_pingroup *g;
-	struct msm_pinctrl *pctrl;
 	unsigned long flags;
 	u32 val;
=20
-	pctrl =3D irq_data_get_irq_chip_data(d);
 	g =3D &pctrl->soc->groups[d->hwirq];
=20
 	spin_lock_irqsave(&pctrl->lock, flags);
@@ -681,12 +673,12 @@ static void msm_gpio_irq_ack(struct irq_data *d)
=20
 static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type=
)
 {
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl =3D to_msm_pinctrl(gc);
 	const struct msm_pingroup *g;
-	struct msm_pinctrl *pctrl;
 	unsigned long flags;
 	u32 val;
=20
-	pctrl =3D irq_data_get_irq_chip_data(d);
 	g =3D &pctrl->soc->groups[d->hwirq];
=20
 	spin_lock_irqsave(&pctrl->lock, flags);
@@ -775,11 +767,10 @@ static int msm_gpio_irq_set_type(struct irq_data =
*d, unsigned int type)
=20
 static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 {
-	struct msm_pinctrl *pctrl;
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl =3D to_msm_pinctrl(gc);
 	unsigned long flags;
=20
-	pctrl =3D irq_data_get_irq_chip_data(d);
-
 	spin_lock_irqsave(&pctrl->lock, flags);
=20
 	irq_set_irq_wake(pctrl->irq, on);
@@ -789,25 +780,6 @@ static int msm_gpio_irq_set_wake(struct irq_data *=
d, unsigned int on)
 	return 0;
 }
=20
-static int msm_gpio_irq_reqres(struct irq_data *d)
-{
-	struct msm_pinctrl *pctrl =3D irq_data_get_irq_chip_data(d);
-
-	if (gpio_lock_as_irq(&pctrl->chip, d->hwirq)) {
-		dev_err(pctrl->dev, "unable to lock HW IRQ %lu for IRQ\n",
-			d->hwirq);
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static void msm_gpio_irq_relres(struct irq_data *d)
-{
-	struct msm_pinctrl *pctrl =3D irq_data_get_irq_chip_data(d);
-
-	gpio_unlock_as_irq(&pctrl->chip, d->hwirq);
-}
-
 static struct irq_chip msm_gpio_irq_chip =3D {
 	.name           =3D "msmgpio",
 	.irq_mask       =3D msm_gpio_irq_mask,
@@ -815,14 +787,13 @@ static struct irq_chip msm_gpio_irq_chip =3D {
 	.irq_ack        =3D msm_gpio_irq_ack,
 	.irq_set_type   =3D msm_gpio_irq_set_type,
 	.irq_set_wake   =3D msm_gpio_irq_set_wake,
-	.irq_request_resources =3D msm_gpio_irq_reqres,
-	.irq_release_resources =3D msm_gpio_irq_relres,
 };
=20
 static void msm_gpio_irq_handler(unsigned int irq, struct irq_desc *de=
sc)
 {
+	struct gpio_chip *gc =3D irq_desc_get_handler_data(desc);
 	const struct msm_pingroup *g;
-	struct msm_pinctrl *pctrl =3D irq_desc_get_handler_data(desc);
+	struct msm_pinctrl *pctrl =3D to_msm_pinctrl(gc);
 	struct irq_chip *chip =3D irq_get_chip(irq);
 	int irq_pin;
 	int handled =3D 0;
@@ -839,7 +810,7 @@ static void msm_gpio_irq_handler(unsigned int irq, =
struct irq_desc *desc)
 		g =3D &pctrl->soc->groups[i];
 		val =3D readl(pctrl->regs + g->intr_status_reg);
 		if (val & BIT(g->intr_status_bit)) {
-			irq_pin =3D irq_find_mapping(pctrl->domain, i);
+			irq_pin =3D irq_find_mapping(gc->irqdomain, i);
 			generic_handle_irq(irq_pin);
 			handled++;
 		}
@@ -852,19 +823,10 @@ static void msm_gpio_irq_handler(unsigned int irq=
, struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
=20
-/*
- * This lock class tells lockdep that GPIO irqs are in a different
- * category than their parents, so it won't report false recursion.
- */
-static struct lock_class_key gpio_lock_class;
-
 static int msm_gpio_init(struct msm_pinctrl *pctrl)
 {
 	struct gpio_chip *chip;
-	int irq;
 	int ret;
-	int i;
-	int r;
 	unsigned ngpio =3D pctrl->soc->ngpios;
=20
 	if (WARN_ON(ngpio > MAX_NR_GPIO))
@@ -890,23 +852,18 @@ static int msm_gpio_init(struct msm_pinctrl *pctr=
l)
 		return ret;
 	}
=20
-	pctrl->domain =3D irq_domain_add_linear(pctrl->dev->of_node, chip->ng=
pio,
-					      &irq_domain_simple_ops, NULL);
-	if (!pctrl->domain) {
-		dev_err(pctrl->dev, "Failed to register irq domain\n");
-		r =3D gpiochip_remove(&pctrl->chip);
+	ret =3D gpiochip_irqchip_add(chip,
+				   &msm_gpio_irq_chip,
+				   0,
+				   handle_edge_irq,
+				   IRQ_TYPE_NONE);
+	if (ret) {
+		dev_err(pctrl->dev, "Failed to add irqchip to gpiochip\n");
 		return -ENOSYS;
 	}
=20
-	for (i =3D 0; i < chip->ngpio; i++) {
-		irq =3D irq_create_mapping(pctrl->domain, i);
-		irq_set_lockdep_class(irq, &gpio_lock_class);
-		irq_set_chip_and_handler(irq, &msm_gpio_irq_chip, handle_edge_irq);
-		irq_set_chip_data(irq, pctrl);
-	}
-
-	irq_set_handler_data(pctrl->irq, pctrl);
-	irq_set_chained_handler(pctrl->irq, msm_gpio_irq_handler);
+	gpiochip_set_chained_irqchip(chip, &msm_gpio_irq_chip, pctrl->irq,
+				     msm_gpio_irq_handler);
=20
 	return 0;
 }
@@ -974,8 +931,6 @@ int msm_pinctrl_remove(struct platform_device *pdev=
)
 		return ret;
 	}
=20
-	irq_set_chained_handler(pctrl->irq, NULL);
-	irq_domain_remove(pctrl->domain);
 	pinctrl_unregister(pctrl->pctrl);
=20
 	return 0;
--=20
1.9.0
