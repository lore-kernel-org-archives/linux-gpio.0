From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH 1/3] pinctrl: qcom-spmi-gpio: Fix output type configuration
Date: Thu,  9 Apr 2015 18:18:35 +0300
Message-ID: <1428592717-21706-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Arnd Bergmann <arnd@arndb.de>, Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

GPIO output type configuration was incorrectly overwritten
by strength value. Fix this.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index b2d2221..4b21aac 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -417,7 +417,7 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		return ret;

 	val = pad->buffer_type << PMIC_GPIO_REG_OUT_TYPE_SHIFT;
-	val = pad->strength << PMIC_GPIO_REG_OUT_STRENGTH_SHIFT;
+	val |= pad->strength << PMIC_GPIO_REG_OUT_STRENGTH_SHIFT;

 	ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_DIG_OUT_CTL, val);
 	if (ret < 0)
--
1.9.1
