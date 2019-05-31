From: Tengfei Fan <tengfeif@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: Clear status bit on irq_unmask
Date: Fri, 31 May 2019 14:51:52 +0800
Message-ID: <1559285512-27784-1-git-send-email-tengfeif@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, linus.walleij@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Tengfei Fan <tengfeif@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

The gpio interrupt status bit is getting set after the
irq is disabled and causing an immediate interrupt after
enablling the irq, so clear status bit on irq_unmask.

Signed-off-by: Tengfei Fan <tengfeif@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index ee81198..7283c50 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -740,6 +740,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
 static void msm_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	uint32_t irqtype = irqd_get_trigger_type(d);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct msm_pingroup *g;
 	unsigned long flags;
@@ -749,6 +750,12 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
+	if (irqtype & (IRQF_TRIGGER_HIGH | IRQF_TRIGGER_LOW)) {
+		val = readl_relaxed(pctrl->regs + g->intr_status_reg);
+		val &= ~BIT(g->intr_status_bit);
+		 writel_relaxed(val, pctrl->regs + g->intr_status_reg);
+	}
+
 	val = msm_readl_intr_cfg(pctrl, g);
 	val |= BIT(g->intr_raw_status_bit);
 	val |= BIT(g->intr_enable_bit);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
