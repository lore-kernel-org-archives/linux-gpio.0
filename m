From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 1/2] pinctrl: stm32: add suspend/resume management
Date: Fri, 10 May 2019 09:42:29 +0200
Message-ID: <1557474150-19618-2-git-send-email-alexandre.torgue@st.com>
References: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com
List-Id: linux-gpio@vger.kernel.org

During power sequence, GPIO hardware registers could be lost if the power
supply is switched off. Each device using pinctrl API is in charge of
managing pins during suspend/resume sequences. But for pins used as gpio or
irq stm32 pinctrl driver has to save the hardware configuration.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 2317ccf..335aea5 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -44,6 +44,18 @@
 #define STM32_GPIO_AFRL		0x20
 #define STM32_GPIO_AFRH		0x24
 
+/* custom bitfield to backup pin status */
+#define STM32_GPIO_BKP_MODE_SHIFT	0
+#define STM32_GPIO_BKP_MODE_MASK	GENMASK(1, 0)
+#define STM32_GPIO_BKP_ALT_SHIFT	2
+#define STM32_GPIO_BKP_ALT_MASK		GENMASK(5, 2)
+#define STM32_GPIO_BKP_SPEED_SHIFT	6
+#define STM32_GPIO_BKP_SPEED_MASK	GENMASK(7, 6)
+#define STM32_GPIO_BKP_PUPD_SHIFT	8
+#define STM32_GPIO_BKP_PUPD_MASK	GENMASK(9, 8)
+#define STM32_GPIO_BKP_TYPE		10
+#define STM32_GPIO_BKP_VAL		11
+
 #define STM32_GPIO_PINS_PER_BANK 16
 #define STM32_GPIO_IRQ_LINE	 16
 
@@ -79,6 +91,7 @@ struct stm32_gpio_bank {
 	struct irq_domain *domain;
 	u32 bank_nr;
 	u32 bank_ioport_nr;
+	u32 pin_backup[STM32_GPIO_PINS_PER_BANK];
 };
 
 struct stm32_pinctrl {
@@ -133,11 +146,50 @@ static inline u32 stm32_gpio_get_alt(u32 function)
 	return 0;
 }
 
+static void stm32_gpio_backup_value(struct stm32_gpio_bank *bank,
+				    u32 offset, u32 value)
+{
+	bank->pin_backup[offset] &= ~BIT(STM32_GPIO_BKP_VAL);
+	bank->pin_backup[offset] |= value << STM32_GPIO_BKP_VAL;
+}
+
+static void stm32_gpio_backup_mode(struct stm32_gpio_bank *bank, u32 offset,
+				   u32 mode, u32 alt)
+{
+	bank->pin_backup[offset] &= ~(STM32_GPIO_BKP_MODE_MASK |
+				      STM32_GPIO_BKP_ALT_MASK);
+	bank->pin_backup[offset] |= mode << STM32_GPIO_BKP_MODE_SHIFT;
+	bank->pin_backup[offset] |= alt << STM32_GPIO_BKP_ALT_SHIFT;
+}
+
+static void stm32_gpio_backup_driving(struct stm32_gpio_bank *bank, u32 offset,
+				      u32 drive)
+{
+	bank->pin_backup[offset] &= ~BIT(STM32_GPIO_BKP_TYPE);
+	bank->pin_backup[offset] |= drive << STM32_GPIO_BKP_TYPE;
+}
+
+static void stm32_gpio_backup_speed(struct stm32_gpio_bank *bank, u32 offset,
+				    u32 speed)
+{
+	bank->pin_backup[offset] &= ~STM32_GPIO_BKP_SPEED_MASK;
+	bank->pin_backup[offset] |= speed << STM32_GPIO_BKP_SPEED_SHIFT;
+}
+
+static void stm32_gpio_backup_bias(struct stm32_gpio_bank *bank, u32 offset,
+				   u32 bias)
+{
+	bank->pin_backup[offset] &= ~STM32_GPIO_BKP_PUPD_MASK;
+	bank->pin_backup[offset] |= bias << STM32_GPIO_BKP_PUPD_SHIFT;
+}
+
 /* GPIO functions */
 
 static inline void __stm32_gpio_set(struct stm32_gpio_bank *bank,
 	unsigned offset, int value)
 {
+	stm32_gpio_backup_value(bank, offset, value);
+
 	if (!value)
 		offset += STM32_GPIO_PINS_PER_BANK;
 
@@ -620,6 +672,8 @@ static int stm32_pmx_set_mode(struct stm32_gpio_bank *bank,
 	if (pctl->hwlock)
 		hwspin_unlock(pctl->hwlock);
 
+	stm32_gpio_backup_mode(bank, pin, mode, alt);
+
 unlock:
 	spin_unlock_irqrestore(&bank->lock, flags);
 	clk_disable(bank->clk);
@@ -732,6 +786,8 @@ static int stm32_pconf_set_driving(struct stm32_gpio_bank *bank,
 	if (pctl->hwlock)
 		hwspin_unlock(pctl->hwlock);
 
+	stm32_gpio_backup_driving(bank, offset, drive);
+
 unlock:
 	spin_unlock_irqrestore(&bank->lock, flags);
 	clk_disable(bank->clk);
@@ -784,6 +840,8 @@ static int stm32_pconf_set_speed(struct stm32_gpio_bank *bank,
 	if (pctl->hwlock)
 		hwspin_unlock(pctl->hwlock);
 
+	stm32_gpio_backup_speed(bank, offset, speed);
+
 unlock:
 	spin_unlock_irqrestore(&bank->lock, flags);
 	clk_disable(bank->clk);
@@ -836,6 +894,8 @@ static int stm32_pconf_set_bias(struct stm32_gpio_bank *bank,
 	if (pctl->hwlock)
 		hwspin_unlock(pctl->hwlock);
 
+	stm32_gpio_backup_bias(bank, offset, bias);
+
 unlock:
 	spin_unlock_irqrestore(&bank->lock, flags);
 	clk_disable(bank->clk);
@@ -1369,3 +1429,75 @@ int stm32_pctl_probe(struct platform_device *pdev)
 
 	return 0;
 }
+
+static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
+					struct stm32_pinctrl *pctl, u32 pin)
+{
+	const struct pin_desc *desc = pin_desc_get(pctl->pctl_dev, pin);
+	u32 val, alt, mode, offset = stm32_gpio_pin(pin);
+	struct pinctrl_gpio_range *range;
+	struct stm32_gpio_bank *bank;
+	bool pin_is_irq;
+	int ret;
+
+	range = pinctrl_find_gpio_range_from_pin(pctl->pctl_dev, pin);
+	if (!range)
+		return 0;
+
+	pin_is_irq = gpiochip_line_is_irq(range->gc, offset);
+
+	if (!desc || (!pin_is_irq && !desc->gpio_owner))
+		return 0;
+
+	bank = gpiochip_get_data(range->gc);
+
+	alt = bank->pin_backup[offset] & STM32_GPIO_BKP_ALT_MASK;
+	alt >>= STM32_GPIO_BKP_ALT_SHIFT;
+	mode = bank->pin_backup[offset] & STM32_GPIO_BKP_MODE_MASK;
+	mode >>= STM32_GPIO_BKP_MODE_SHIFT;
+
+	ret = stm32_pmx_set_mode(bank, offset, mode, alt);
+	if (ret)
+		return ret;
+
+	if (mode == 1) {
+		val = bank->pin_backup[offset] & BIT(STM32_GPIO_BKP_VAL);
+		val = val >> STM32_GPIO_BKP_VAL;
+		__stm32_gpio_set(bank, offset, val);
+	}
+
+	val = bank->pin_backup[offset] & BIT(STM32_GPIO_BKP_TYPE);
+	val >>= STM32_GPIO_BKP_TYPE;
+	ret = stm32_pconf_set_driving(bank, offset, val);
+	if (ret)
+		return ret;
+
+	val = bank->pin_backup[offset] & STM32_GPIO_BKP_SPEED_MASK;
+	val >>= STM32_GPIO_BKP_SPEED_SHIFT;
+	ret = stm32_pconf_set_speed(bank, offset, val);
+	if (ret)
+		return ret;
+
+	val = bank->pin_backup[offset] & STM32_GPIO_BKP_PUPD_MASK;
+	val >>= STM32_GPIO_BKP_PUPD_SHIFT;
+	ret = stm32_pconf_set_bias(bank, offset, val);
+	if (ret)
+		return ret;
+
+	if (pin_is_irq)
+		regmap_field_write(pctl->irqmux[offset], bank->bank_ioport_nr);
+
+	return 0;
+}
+
+int __maybe_unused stm32_pinctrl_resume(struct device *dev)
+{
+	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
+	struct stm32_pinctrl_group *g = pctl->groups;
+	int i;
+
+	for (i = g->pin; i < g->pin + pctl->ngroups; i++)
+		stm32_pinctrl_restore_gpio_regs(pctl, i);
+
+	return 0;
+}
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index de5e701..ec0d34c 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -65,5 +65,7 @@ struct stm32_gpio_bank;
 int stm32_pctl_probe(struct platform_device *pdev);
 void stm32_pmx_get_mode(struct stm32_gpio_bank *bank,
 			int pin, u32 *mode, u32 *alt);
+int stm32_pinctrl_resume(struct device *dev);
+
 #endif /* __PINCTRL_STM32_H */
 
-- 
2.7.4
