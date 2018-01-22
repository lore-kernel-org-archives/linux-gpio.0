From: Srinivas Ramana <sramana@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: Add irq_enable callback for msm gpio
Date: Mon, 22 Jan 2018 18:33:28 +0530
Message-ID: <1516626208-5655-1-git-send-email-sramana@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, linus.walleij@linaro.org, timur@codeaurora.org, sboyd@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Ramana <sramana@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

Introduce the irq_enable callback which will be same as irq_unmask
except that it will also clear the status bit before unmask.

This will help in clearing any erroneous interrupts that would
have got latched when the interrupt is not in use.

There may be devices like UART which can use the same gpio line
for data rx as well as a wakeup gpio when in suspend. The data that
was flowing on the line may latch the interrupt and when we enable
the interrupt before going to suspend, this would trigger the
unexpected interrupt. This change helps clearing the interrupt
so that these unexpected interrupts gets cleared.

Signed-off-by: Srinivas Ramana <sramana@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 7a960590ecaa..de7c65c15f9e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -610,6 +610,36 @@ static void msm_gpio_irq_mask(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
+static void msm_gpio_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+	const struct msm_pingroup *g;
+	unsigned long flags;
+	u32 val;
+
+	g = &pctrl->soc->groups[d->hwirq];
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+
+	/*
+	 * clear the interrupt status bit before unmask to avoid
+	 * any erroneous interrupts that would have got latched
+	 * when the intterupt is not in use.
+	 */
+	val = readl(pctrl->regs + g->intr_status_reg);
+	val &= ~BIT(g->intr_status_bit);
+	writel(val, pctrl->regs + g->intr_status_reg);
+
+	val = readl(pctrl->regs + g->intr_cfg_reg);
+	val |= BIT(g->intr_enable_bit);
+	writel(val, pctrl->regs + g->intr_cfg_reg);
+
+	set_bit(d->hwirq, pctrl->enabled_irqs);
+
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+}
+
 static void msm_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -767,6 +797,7 @@ static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 
 static struct irq_chip msm_gpio_irq_chip = {
 	.name           = "msmgpio",
+	.irq_enable	= msm_gpio_irq_enable,
 	.irq_mask       = msm_gpio_irq_mask,
 	.irq_unmask     = msm_gpio_irq_unmask,
 	.irq_ack        = msm_gpio_irq_ack,
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., 
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
