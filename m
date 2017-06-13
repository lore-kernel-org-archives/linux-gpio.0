From: fenglinw@codeaurora.org
Subject: [PATCH V1 3/3] pinctrl: qcom: spmi-gpio: Correct power_source range check
Date: Tue, 13 Jun 2017 14:16:05 +0800
Message-ID: <20170613061707.13892-4-fenglinw@codeaurora.org>
References: <20170613061707.13892-1-fenglinw@codeaurora.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:34248 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752694AbdFMGVs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2017 02:21:48 -0400
In-Reply-To: <20170613061707.13892-1-fenglinw@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: collinsd@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com, Fenglin Wu <fenglinw@codeaurora.org>

From: Fenglin Wu <fenglinw@codeaurora.org>

Power source selection in DIG_VIN_CTL is indexed from 0, in the range
check it shouldn't be equal to the total number of power sources.

Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 581309d..1fd677c 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -500,7 +500,7 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
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

