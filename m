From: fenglinw@codeaurora.org
Subject: [PATCH V1] pinctrl: qcom: spmi-gpio: Correct power_source range check
Date: Wed, 19 Jul 2017 14:39:55 +0800
Message-ID: <20170719064121.13948-1-fenglinw@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, kgunda@codeaurora.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

From: Fenglin Wu <fenglinw@codeaurora.org>

Power source selection in DIG_VIN_CTL is indexed from 0, in the range
check it shouldn't be equal to the total number of power sources.

Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 664b641..8b77c04 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -375,7 +375,7 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			pad->is_enabled = false;
 			break;
 		case PIN_CONFIG_POWER_SOURCE:
-			if (arg > pad->num_sources)
+			if (arg >= pad->num_sources)
 				return -EINVAL;
 			pad->power_source = arg;
 			break;
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
