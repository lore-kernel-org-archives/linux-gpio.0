From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH] pinctrl: stm32: add lock mechanism for irqmux selection
Date: Fri, 10 May 2019 09:43:03 +0200
Message-ID: <1557474183-19719-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com
List-Id: linux-gpio@vger.kernel.org

GPIOs are split between several banks (A, B, ...) and each bank can have
up to 16 lines. Those GPIOs could be used as interrupt lines thanks to
exti lines. As there are only 16 exti lines, a mux is used to select which
gpio line is connected to which exti line. Mapping is done as follow:

-A0, B0, C0.. -->exti_line_0 (X0 selected by mux_0)
-A1, B1, C1.. -->exti_line_1 (X1 selected by mux_1)
...

This patch adds a protection to avoid overriding on mux_n for exti_line_n.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 2317ccf..99e4149 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -98,6 +98,8 @@ struct stm32_pinctrl {
 	struct stm32_desc_pin *pins;
 	u32 npins;
 	u32 pkg;
+	u16 irqmux_map;
+	spinlock_t irqmux_lock;
 };
 
 static inline int stm32_gpio_pin(int gpio)
@@ -307,9 +309,53 @@ static int stm32_gpio_domain_activate(struct irq_domain *d,
 {
 	struct stm32_gpio_bank *bank = d->host_data;
 	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	unsigned long flags;
+	int ret = 0;
+
+	/*
+	 * gpio irq mux is shared between several banks, a lock has to be done
+	 * to avoid overriding.
+	 */
+	spin_lock_irqsave(&pctl->irqmux_lock, flags);
+	if (pctl->hwlock)
+		ret = hwspin_lock_timeout(pctl->hwlock, HWSPINLOCK_TIMEOUT);
+
+	if (ret) {
+		dev_err(pctl->dev, "Can't get hwspinlock\n");
+		goto unlock;
+	}
+
+	if (pctl->irqmux_map & BIT(irq_data->hwirq)) {
+		dev_err(pctl->dev, "irq line %ld already requested.\n",
+			irq_data->hwirq);
+		ret = -EBUSY;
+		if (pctl->hwlock)
+			hwspin_unlock(pctl->hwlock);
+		goto unlock;
+	} else {
+		pctl->irqmux_map |= BIT(irq_data->hwirq);
+	}
 
 	regmap_field_write(pctl->irqmux[irq_data->hwirq], bank->bank_ioport_nr);
-	return 0;
+
+	if (pctl->hwlock)
+		hwspin_unlock(pctl->hwlock);
+
+unlock:
+	spin_unlock_irqrestore(&pctl->irqmux_lock, flags);
+	return ret;
+}
+
+static void stm32_gpio_domain_deactivate(struct irq_domain *d,
+					 struct irq_data *irq_data)
+{
+	struct stm32_gpio_bank *bank = d->host_data;
+	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	unsigned long flags;
+
+	spin_lock_irqsave(&pctl->irqmux_lock, flags);
+	pctl->irqmux_map &= ~BIT(irq_data->hwirq);
+	spin_unlock_irqrestore(&pctl->irqmux_lock, flags);
 }
 
 static int stm32_gpio_domain_alloc(struct irq_domain *d,
@@ -338,6 +384,7 @@ static const struct irq_domain_ops stm32_gpio_domain_ops = {
 	.alloc          = stm32_gpio_domain_alloc,
 	.free           = irq_domain_free_irqs_common,
 	.activate	= stm32_gpio_domain_activate,
+	.deactivate	= stm32_gpio_domain_deactivate,
 };
 
 /* Pinctrl functions */
@@ -1290,6 +1337,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		pctl->hwlock = hwspin_lock_request_specific(hwlock_id);
 	}
 
+	spin_lock_init(&pctl->irqmux_lock);
+
 	pctl->dev = dev;
 	pctl->match_data = match->data;
 
-- 
2.7.4
