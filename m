From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 2/2] pinctrl: stm32: return error upon hwspinlock failure
Date: Thu, 14 Feb 2019 17:54:25 +0100
Message-ID: <1550163266-19975-3-git-send-email-alexandre.torgue@st.com>
References: <1550163266-19975-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550163266-19975-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com
List-Id: linux-gpio@vger.kernel.org

Return error to the caller when the hwspinlock can't get locked.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index f6279c8..0b9ff5a 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -583,8 +583,8 @@ static int stm32_pmx_get_func_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static void stm32_pmx_set_mode(struct stm32_gpio_bank *bank,
-		int pin, u32 mode, u32 alt)
+static int stm32_pmx_set_mode(struct stm32_gpio_bank *bank,
+			      int pin, u32 mode, u32 alt)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
 	u32 val;
@@ -620,6 +620,8 @@ static void stm32_pmx_set_mode(struct stm32_gpio_bank *bank,
 unlock:
 	spin_unlock_irqrestore(&bank->lock, flags);
 	clk_disable(bank->clk);
+
+	return err;
 }
 
 void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode,
@@ -676,9 +678,7 @@ static int stm32_pmx_set_mux(struct pinctrl_dev *pctldev,
 	mode = stm32_gpio_get_mode(function);
 	alt = stm32_gpio_get_alt(function);
 
-	stm32_pmx_set_mode(bank, pin, mode, alt);
-
-	return 0;
+	return stm32_pmx_set_mode(bank, pin, mode, alt);
 }
 
 static int stm32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
@@ -688,9 +688,7 @@ static int stm32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	struct stm32_gpio_bank *bank = gpiochip_get_data(range->gc);
 	int pin = stm32_gpio_pin(gpio);
 
-	stm32_pmx_set_mode(bank, pin, !input, 0);
-
-	return 0;
+	return stm32_pmx_set_mode(bank, pin, !input, 0);
 }
 
 static const struct pinmux_ops stm32_pmx_ops = {
@@ -704,8 +702,8 @@ static const struct pinmux_ops stm32_pmx_ops = {
 
 /* Pinconf functions */
 
-static void stm32_pconf_set_driving(struct stm32_gpio_bank *bank,
-	unsigned offset, u32 drive)
+static int stm32_pconf_set_driving(struct stm32_gpio_bank *bank,
+				   unsigned offset, u32 drive)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
 	unsigned long flags;
@@ -734,6 +732,8 @@ static void stm32_pconf_set_driving(struct stm32_gpio_bank *bank,
 unlock:
 	spin_unlock_irqrestore(&bank->lock, flags);
 	clk_disable(bank->clk);
+
+	return err;
 }
 
 static u32 stm32_pconf_get_driving(struct stm32_gpio_bank *bank,
@@ -754,8 +754,8 @@ static u32 stm32_pconf_get_driving(struct stm32_gpio_bank *bank,
 	return (val >> offset);
 }
 
-static void stm32_pconf_set_speed(struct stm32_gpio_bank *bank,
-	unsigned offset, u32 speed)
+static int stm32_pconf_set_speed(struct stm32_gpio_bank *bank,
+				 unsigned offset, u32 speed)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
 	unsigned long flags;
@@ -784,6 +784,8 @@ static void stm32_pconf_set_speed(struct stm32_gpio_bank *bank,
 unlock:
 	spin_unlock_irqrestore(&bank->lock, flags);
 	clk_disable(bank->clk);
+
+	return err;
 }
 
 static u32 stm32_pconf_get_speed(struct stm32_gpio_bank *bank,
@@ -804,8 +806,8 @@ static u32 stm32_pconf_get_speed(struct stm32_gpio_bank *bank,
 	return (val >> (offset * 2));
 }
 
-static void stm32_pconf_set_bias(struct stm32_gpio_bank *bank,
-	unsigned offset, u32 bias)
+static int stm32_pconf_set_bias(struct stm32_gpio_bank *bank,
+				unsigned offset, u32 bias)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
 	unsigned long flags;
@@ -834,6 +836,8 @@ static void stm32_pconf_set_bias(struct stm32_gpio_bank *bank,
 unlock:
 	spin_unlock_irqrestore(&bank->lock, flags);
 	clk_disable(bank->clk);
+
+	return err;
 }
 
 static u32 stm32_pconf_get_bias(struct stm32_gpio_bank *bank,
@@ -896,22 +900,22 @@ static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
 
 	switch (param) {
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		stm32_pconf_set_driving(bank, offset, 0);
+		ret = stm32_pconf_set_driving(bank, offset, 0);
 		break;
 	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		stm32_pconf_set_driving(bank, offset, 1);
+		ret = stm32_pconf_set_driving(bank, offset, 1);
 		break;
 	case PIN_CONFIG_SLEW_RATE:
-		stm32_pconf_set_speed(bank, offset, arg);
+		ret = stm32_pconf_set_speed(bank, offset, arg);
 		break;
 	case PIN_CONFIG_BIAS_DISABLE:
-		stm32_pconf_set_bias(bank, offset, 0);
+		ret = stm32_pconf_set_bias(bank, offset, 0);
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
-		stm32_pconf_set_bias(bank, offset, 1);
+		ret = stm32_pconf_set_bias(bank, offset, 1);
 		break;
 	case PIN_CONFIG_BIAS_PULL_DOWN:
-		stm32_pconf_set_bias(bank, offset, 2);
+		ret = stm32_pconf_set_bias(bank, offset, 2);
 		break;
 	case PIN_CONFIG_OUTPUT:
 		__stm32_gpio_set(bank, offset, arg);
-- 
2.7.4
