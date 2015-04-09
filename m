From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH 2/3] pinctrl: qcom-spmi-gpio: Fix input value report
Date: Thu,  9 Apr 2015 18:18:36 +0300
Message-ID: <1428592717-21706-2-git-send-email-ivan.ivanov@linaro.org>
References: <1428592717-21706-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428592717-21706-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Arnd Bergmann <arnd@arndb.de>, Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Read input buffer when input is enabled, not when it is
disabled. Also fix interpretation of the pmic_gpio_read()
return code, negative value means an error.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 4b21aac..e8b74c6 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -466,12 +466,13 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
 		seq_puts(s, " ---");
 	} else {

-		if (!pad->input_enabled) {
+		if (pad->input_enabled) {
 			ret = pmic_gpio_read(state, pad, PMIC_MPP_REG_RT_STS);
-			if (!ret) {
-				ret &= PMIC_MPP_REG_RT_STS_VAL_MASK;
-				pad->out_value = ret;
-			}
+			if (ret < 0)
+				return;
+
+			ret &= PMIC_MPP_REG_RT_STS_VAL_MASK;
+			pad->out_value = ret;
 		}

 		seq_printf(s, " %-4s", pad->output_enabled ? "out" : "in");
--
1.9.1
