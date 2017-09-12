From: fenglinw@codeaurora.org
Subject: [PATCH V1] pinctrl: qcom: spmi-gpio: Update GPIO EN_CTL when setting pin config
Date: Tue, 12 Sep 2017 08:32:46 +0800
Message-ID: <20170912003331.3092-1-fenglinw@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, subbaram@codeaurora.org, kgunda@codeaurora.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

From: Fenglin Wu <fenglinw@codeaurora.org>

GPIO is expected to be disabled iff PIN_CONFIG_BIAS_HIGH_IMPEDANCE is
configured. Update is_enabled flag in config_set() so that it can
reflect GPIO status correctly. Also modify EN_CTL register based on
is_enabled flag in config_set() to configure the GPIO properly.

Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index c2c0bab..a0edaa8 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -453,6 +453,7 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 
 	pad = pctldev->desc->pins[pin].drv_data;
 
+	pad->is_enabled = true;
 	for (i = 0; i < nconfs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 		arg = pinconf_to_config_argument(configs[i]);
@@ -600,6 +601,10 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			return ret;
 	}
 
+	val = pad->is_enabled << PMIC_GPIO_REG_MASTER_EN_SHIFT;
+
+	ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_EN_CTL, val);
+
 	return ret;
 }
 
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
