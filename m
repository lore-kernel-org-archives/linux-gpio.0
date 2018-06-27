From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 4/5] pinctrl: ingenic: Implement pinmux callback .gpio_get_direction
Date: Wed, 27 Jun 2018 13:49:03 +0200
Message-ID: <20180627114904.10890-5-paul@crapouillou.net>
References: <20180627114904.10890-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180627114904.10890-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: linux-gpio@vger.kernel.org

This will allow the GPIO driver to use the previously introduced
pinctrl_gpio_get_direction function to implement its .get_direction
callback.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 6a1b6058b991..2dab52cf119b 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -543,12 +543,25 @@ static int ingenic_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int ingenic_pinmux_gpio_get_direction(struct pinctrl_dev *pctldev,
+		struct pinctrl_gpio_range *range,
+		unsigned int pin)
+{
+	struct ingenic_pinctrl *jzpc = pinctrl_dev_get_drvdata(pctldev);
+
+	if (jzpc->version >= ID_JZ4770)
+		return ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PAT1);
+	else
+		return !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_DIR);
+}
+
 static const struct pinmux_ops ingenic_pmxops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
 	.set_mux = ingenic_pinmux_set_mux,
 	.gpio_set_direction = ingenic_pinmux_gpio_set_direction,
+	.gpio_get_direction = ingenic_pinmux_gpio_get_direction,
 };
 
 static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
-- 
2.11.0
