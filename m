From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] pinctrl: qcom: spmi-gpio: Reorder debug print
Date: Tue, 19 Feb 2019 11:12:53 -0800
Message-ID: <20190219191253.21712-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

It's reasonable to expect that people turn to the "gpio" debugfs file to
first and foremost learn about the direction and value of a gpio, and
second to that about it's pinconf. So reorder the value so each line
reads:

gpioN: direction value ...

This also makes it consistent with the TLMM pinctrl driver's output in
the same dump.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index cb512c7a5251..76e57ae2f6e8 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -675,11 +675,11 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
 		else
 			seq_printf(s, " %-4s",
 					pad->output_enabled ? "out" : "in");
+		seq_printf(s, " %-4s", pad->out_value ? "high" : "low");
 		seq_printf(s, " %-7s", pmic_gpio_functions[function]);
 		seq_printf(s, " vin-%d", pad->power_source);
 		seq_printf(s, " %-27s", biases[pad->pullup]);
 		seq_printf(s, " %-10s", buffer_types[pad->buffer_type]);
-		seq_printf(s, " %-4s", pad->out_value ? "high" : "low");
 		seq_printf(s, " %-7s", strengths[pad->strength]);
 		seq_printf(s, " atest-%d", pad->atest);
 		seq_printf(s, " dtest-%d", pad->dtest_buffer);
-- 
2.18.0
