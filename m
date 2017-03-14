From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] pinctrl: qcom: Don't clear status bit on irq_unmask
Date: Tue, 14 Mar 2017 08:23:26 -0700
Message-ID: <20170314152326.9424-1-bjorn.andersson@linaro.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Timur Tabi <timur@codeaurora.org>, stable@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

Clearing the status bit on irq_unmask will discard any pending interrupt
that did arrive after the irq_ack, i.e. while the IRQ handler function
was executing.

Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
Cc: stable@vger.kernel.org
Cc: Stephen Boyd <sboyd@codeaurora.org>
Reported-by: Timur Tabi <timur@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f8e9e1c2b2f6..faf038978650 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -594,10 +594,6 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = readl(pctrl->regs + g->intr_status_reg);
-	val &= ~BIT(g->intr_status_bit);
-	writel(val, pctrl->regs + g->intr_status_reg);
-
 	val = readl(pctrl->regs + g->intr_cfg_reg);
 	val |= BIT(g->intr_enable_bit);
 	writel(val, pctrl->regs + g->intr_cfg_reg);
-- 
2.12.0
