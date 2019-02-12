From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] qcom: spmi-gpio: Fix boundary conditions IRQ domain translate
Date: Mon, 11 Feb 2019 19:52:05 -0800
Message-ID: <20190212035205.23477-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

GPIOs on the SPMI PMIC are numbered 1..ngpio, so the boundary check in
pmic_gpio_domain_translate() is off by one, correct this.

Fixes: ca69e2d165eb ("qcom: spmi-gpio: add support for hierarchical IRQ chip")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index e01a556ac586..cb512c7a5251 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -962,7 +962,8 @@ static int pmic_gpio_domain_translate(struct irq_domain *domain,
 						     struct pmic_gpio_state,
 						     chip);
 
-	if (fwspec->param_count != 2 || fwspec->param[0] >= state->chip.ngpio)
+	if (fwspec->param_count != 2 ||
+	    fwspec->param[0] < 1 || fwspec->param[0] > state->chip.ngpio)
 		return -EINVAL;
 
 	*hwirq = fwspec->param[0] - PMIC_GPIO_PHYSICAL_OFFSET;
-- 
2.18.0
