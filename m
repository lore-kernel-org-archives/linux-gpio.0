Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707446;
	b=cJfI0hsir11/EgGffON+HxRKlvmqDzuX6tLCPLmgHMJTZnlo/hH+jpVREox9n2y93y3p
	 5VBnHodXty8auabdlG+XYubkFwbYmqRJ0al6BNC2eccOTy09pGACLUWLTmU2J3KkuGEUf
	 62XVSY/NRnLlM/kaoWG6L3kOnyp8bUAU1RkcDi9sMmKtPNpWQFq+cYgaKqv5jvApJZOOX
	 9QyVSqfOX8asVoqVlYivgkjXTrrjUGPfFPxkf+IUPhSfEIRqAF+SWAVriSwljPmgAYE0r
	 zzHem21SmUIyw9EZJCJpechk38HHULhYx9cvjv7s37J+jx8b8AX6ahgxkc1YGwlR5bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707446;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6aWFArraryo4kDUbjuVi9QjJ1vszKtwqrwVm4DY0rO4=;
	b=ofK6ut5DTzA8OodUVRktOG08/0ayo/Gd75mA6O1YCKRU/3qnGcm0w+gy0g7IMTeXT4WU
	 6Fp/8NBBlz/f17mOg/RJ8ilxPwtVycqt6ceEA5KVcM53RuWoHcplJ/owvgqNyHcz7xbt0
	 tT2XDLdZRIGOy5tLUq6pZJpj08NWKWj+ANraWB7OWVbAavlRiGkk484Tl4NkPX943Ucyu
	 w3AEsrmm918+dh9VheDwFK0OV+t4P1/DMfDsFmAFpWTr+l184ruITIorxkl9ws/kSqhs2
	 HsswAUG9vnWV4wP6hmdJQECGXtVekqvFUWlpTwu4MshyBclxLm04j1+Rl6gMqArb3Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjjQ7Ape;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C977606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjjQ7Ape
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108851F000D8;
	Thu, 26 Nov 2026 15:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707445;
	bh=6aWFArraryo4kDUbjuVi9QjJ1vszKtwqrwVm4DY0rO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SjjQ7ApeZlV1zYF/opz2ne8dfgDWRfBzOQabr+k48rZUsLf+ggDy3uugGyc/Rsz2o
	 RyhGK5wVeZeZNRfuhJe9NsXYLAhG3tUI7cgMYuUatjEK95Hgeyq3BYU3ytpbdzsUaL
	 YW20fz41Z5KUxAnRj3/ANdeIKZC5CL46qWM7U0niu3gTzEYgBAIytgVUQSdkLeVE7P
	 A55ZtrqNh9no93wTtq1UZauHgRxH4+IRHYnx41rYDlqqZ+BmU7DCPNShBWoHRj1lmB
	 kQ3MxsU7B5RSO+9wGs3cqIWWs0HxU91SIozIITAIZIwC/WR8VYQiAj9+EkvOkjMBAm
	 F+1f9UquBtW8Q==
From: Michael Walle <mwalle@kernel.org>
To: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	Joseph Telaak <joseph@telaak.dev>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFT PATCH 05/13] gpio: regmap: add a helper to add a regmap-irq chip
Date: Thu, 26 Nov 2026 16:35:16 +0100
Message-ID: <20261126153600.299724-6-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126153600.299724-1-mwalle@kernel.org>
References: <20261126153600.299724-1-mwalle@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The most common use-case is to use regmap-irq together with gpio-regmap.
To make life easier for that and to avoid code duplication, add a helper
to create and attach a regmap-irq domain. That helper is intended to be
called by the new .create_irq_domain() callback.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-regmap.c  | 43 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/regmap.h | 15 +++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index e8c13434ea5b..99a86efe8deb 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -407,6 +407,49 @@ static void __maybe_unused gpio_regmap_irq_relres(void *irq_drv_data, irq_hw_num
 	gpio_regmap_relres_irq(irq_drv_data, hwirq);
 }
 
+#ifdef CONFIG_REGMAP_IRQ
+/**
+ * gpio_regmap_add_irq_chip() - Add a regmap-irq chip for the GPIO lines
+ * @gpio: gpio_regmap device
+ * @irq: the parent interrupt
+ * @irq_flags: the IRQF_ flags to use for @irq
+ * @chip: the regmap-irq chip description
+ *
+ * Add a regmap-irq chip on the regmap of @gpio. Should be called from
+ * create_irq_domain() callback.
+ *
+ * The regmap-irq chip is automatically removed when the gpio_regmap is
+ * unregistered.
+ *
+ * Return: irq_domain or an ERR_PTR() error value.
+ */
+struct irq_domain *gpio_regmap_add_irq_chip(struct gpio_regmap *gpio, int irq,
+					    int irq_flags,
+					    struct regmap_irq_chip *chip)
+{
+	int ret;
+
+	/* shouldn't be called more than once */
+	if (WARN_ON(gpio->irq_chip_data))
+		return ERR_PTR(-EBUSY);
+
+	chip->irq_reqres = gpio_regmap_irq_reqres;
+	chip->irq_relres = gpio_regmap_irq_relres;
+	chip->irq_drv_data = gpio;
+
+	ret = regmap_add_irq_chip_fwnode(dev_fwnode(gpio->parent), gpio->regmap,
+					 irq, irq_flags, 0, chip,
+					 &gpio->irq_chip_data);
+	if (ret)
+		return ERR_PTR(ret);
+
+	gpio->regmap_irq_line = irq;
+
+	return regmap_irq_get_domain(gpio->irq_chip_data);
+}
+EXPORT_SYMBOL_GPL(gpio_regmap_add_irq_chip);
+#endif
+
 void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
 {
 	return gpio->driver_data;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index eba0620c63d6..7f578b9a82e6 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -3,6 +3,7 @@
 #ifndef _LINUX_GPIO_REGMAP_H
 #define _LINUX_GPIO_REGMAP_H
 
+#include <linux/err.h>
 #include <linux/types.h>
 
 struct device;
@@ -11,6 +12,7 @@ struct gpio_regmap;
 struct gpio_chip;
 struct irq_domain;
 struct regmap;
+struct regmap_irq_chip;
 
 #define GPIO_REGMAP_ADDR_ZERO ((unsigned int)(-1))
 #define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
@@ -180,4 +182,17 @@ void gpio_regmap_relres_irq(struct gpio_regmap *gpio, unsigned int offset);
 void gpio_regmap_enable_irq(struct gpio_regmap *gpio, irq_hw_number_t hwirq);
 void gpio_regmap_disable_irq(struct gpio_regmap *gpio, irq_hw_number_t hwirq);
 
+#ifdef CONFIG_REGMAP_IRQ
+struct irq_domain *gpio_regmap_add_irq_chip(struct gpio_regmap *gpio, int irq,
+					    int irq_flags,
+					    struct regmap_irq_chip *chip);
+#else
+static inline struct irq_domain *
+gpio_regmap_add_irq_chip(struct gpio_regmap *gpio, int irq, int irq_flags,
+			 struct regmap_irq_chip *chip)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+#endif
+
 #endif /* _LINUX_GPIO_REGMAP_H */
-- 
2.47.3

