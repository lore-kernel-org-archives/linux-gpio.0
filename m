From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH] pinctrl: qcom-spmi: Fix pin direction configuration
Date: Fri, 17 Apr 2015 17:50:49 +0300
Message-ID: <1429282249-30450-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Soren Brinkmann <soren.brinkmann@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Pin direction configuration was incorrectly overwritten
by output and function values in set_mux(). Fix this.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index e8b74c6..ae4115e 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -260,6 +260,7 @@ static int pmic_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 			val = 1;
 	}

+	val = val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
 	val |= pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
 	val |= pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 8f6c7be..211b942 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -370,6 +370,7 @@ static int pmic_mpp_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 		}
 	}

+	val = val << PMIC_MPP_REG_MODE_DIR_SHIFT;
 	val |= pad->function << PMIC_MPP_REG_MODE_FUNCTION_SHIFT;
 	val |= pad->out_value & PMIC_MPP_REG_MODE_VALUE_MASK;

--
1.9.1
