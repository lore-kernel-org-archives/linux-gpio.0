Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791183;
	b=NXZdqEPUcJlfygKzCyKlRIE02QFaq5pjvhZFoNsMRPNsABoa17Bw9ehrQjK0cL8GkhvN
	 avkaR6PKd3iXfHAAbvzDcW24HPw/zKSsn6F8Wj4yuLOaFpWMBFaaKKvRvrt26B482HG9Y
	 jXpjKTX1rXhtAiLkITQrinEF/bxdiQN4dGOepbSDTo8YXH3ypkJuMDF8r0haSPj5V/SEN
	 C7tA2jkGopmAYdSFJiNxROE61RC2+tYAsH/q3OWdudjROsPsF9QB226B6EtEYiIagqcVg
	 VgSC62k6y08ph8EZvMxx4HveSRoc0hI24MB1J/RD/a4KNINm9g1HaW5JQLAcWJHzcBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791183;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=MM8PVVoC4d19tt8XwrIgM0xlnQmL5aNn/vzM2tzL2OU=;
	b=bXJLDIzwicqFVfzQD4G9dioFBQFkDJXeJ5qtaTnmjOcDwNRxF6JItaFtadO4LDUrqI1l
	 2vQBhJgWTGFRkM2Qjoz1HDyHQaqISNiFAb1nDyVPPK7jqZZn/nWeQv4kyhJz+BohJlrPy
	 xib7UaMqKgqR/KdKnhh1twZWoXXOo0gOTzlqUWk8MArpk+SZl9mlX/OVWyxRtFP89I95f
	 EXR/O5Oqee/IGPJz6qgz6o5Eh7qf7cyiK+iczPdN7qRMaWGyyjeaNEX3Qy2wrAdEziGlu
	 hBi0MDqFeyEc7OQEhY0gp725lcLjFV8aIho3WUevN1jS+4TGLK/I39pfslxhqBEXQkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VAsAF1Dg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5E1606A321
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VAsAF1Dg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65DC1F00893;
	Fri, 27 Nov 2026 14:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791182;
	bh=MM8PVVoC4d19tt8XwrIgM0xlnQmL5aNn/vzM2tzL2OU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VAsAF1Dgo1fCdGDUPdUB8aj+LkNBlG28NAdfJrYuOjIhcIDRNTLALE0mKwSIXuEW5
	 NRmdsnAZzlwtXcaFcLtjhTE4h1dhu5VUAMsO9IvV3Ar2lg9jX2ySI6emBMgkzXmBKz
	 W1kmJNcku8FmF7ANRDdvqC6x3YkAppfN68dJzmkxcheGNEY+Uf+9nRBS6EumK0uoUX
	 eoAjAT6lpbfUHdNS+60o+NMAqe1WycoRfO1igw4Y6qZtKhOEQNdIozbbIGY7TgcblR
	 BqBbg6AjH0aQ+AGeL3U0C/7g/1nuEA7Op/sZ+dnJrDZ16dUyoHRd5TJmLJO5XbFGYk
	 TA153ZpTVM7Jg==
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
Subject: [RFT PATCH v2 06/14] gpio: regmap: add helpers to add a regmap-irq chip
Date: Fri, 27 Nov 2026 15:52:23 +0100
Message-ID: <20261127145232.814492-7-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127145232.814492-1-mwalle@kernel.org>
References: <20261127145232.814492-1-mwalle@kernel.org>
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
To make life easier for that and to avoid code duplication, add helpers
to create and attach a regmap-irq domain. These helpers are intended to
be called by the new .create_irq_domain() callback.

gpio_regmap_add_irq_chip() locks the GPIO line while its interrupt is
requested. This assumes that the hwirq numbers match the GPIO offsets.
If a driver doesn't follow that, there is one without the locking called
gpio_regmap_add_irq_chip_nolock().

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-regmap.c  | 74 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/regmap.h | 25 +++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 061d2800d0a0..a0d99710dc4f 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -409,6 +409,80 @@ static void __maybe_unused gpio_regmap_irq_relres(void *irq_drv_data, irq_hw_num
 	gpio_regmap_relres_irq(irq_drv_data, hwirq);
 }
 
+#ifdef CONFIG_REGMAP_IRQ
+/**
+ * gpio_regmap_add_irq_chip_nolock() - Add a regmap-irq chip without line locking
+ * @gpio: gpio_regmap device
+ * @irq: the parent interrupt
+ * @irq_flags: the IRQF_ flags to use for @irq
+ * @chip: the regmap-irq chip description
+ *
+ * Same as gpio_regmap_add_irq_chip() but doesn't lock the GPIO lines.
+ * Can be used if the hwirq numbers of the regmap-irq chip don't match
+ * the GPIO offsets.
+ *
+ * Return: irq_domain or an ERR_PTR() error value.
+ */
+struct irq_domain *gpio_regmap_add_irq_chip_nolock(struct gpio_regmap *gpio, int irq,
+						   int irq_flags,
+						   struct regmap_irq_chip *chip)
+{
+	int ret;
+
+	/* shouldn't be called more than once */
+	if (WARN_ON(gpio->irq_chip_data))
+		return ERR_PTR(-EBUSY);
+
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
+EXPORT_SYMBOL_GPL(gpio_regmap_add_irq_chip_nolock);
+
+/**
+ * gpio_regmap_add_irq_chip() - Add a regmap-irq chip for the GPIO lines
+ * @gpio: gpio_regmap device
+ * @irq: the parent interrupt
+ * @irq_flags: the IRQF_ flags to use for @irq
+ * @chip: the regmap-irq chip description
+ *
+ * Add a regmap-irq chip on the regmap of @gpio. Must be called from the
+ * .create_irq_domain() callback and only once per gpio_regmap.
+ *
+ * The GPIO line of an interrupt is locked as long as the interrupt is
+ * requested and can't be switched to an output. This assumes that the
+ * hwirq number of each interrupt is the same as the offset of the
+ * corresponding GPIO line. If that isn't the case, use
+ * gpio_regmap_add_irq_chip_nolock() instead.
+ *
+ * You can use gpio_regmap_get_drvdata() to get the driver data in the
+ * regmap-irq callbacks.
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
+	chip->irq_reqres = gpio_regmap_irq_reqres;
+	chip->irq_relres = gpio_regmap_irq_relres;
+
+	return gpio_regmap_add_irq_chip_nolock(gpio, irq, irq_flags, chip);
+}
+EXPORT_SYMBOL_GPL(gpio_regmap_add_irq_chip);
+#endif
+
 void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
 {
 	return gpio->driver_data;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index dee5f8d2c48c..ff2732f909d9 100644
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
@@ -185,4 +187,27 @@ void gpio_regmap_relres_irq(struct gpio_regmap *gpio, unsigned int offset);
 void gpio_regmap_enable_irq(struct gpio_regmap *gpio, irq_hw_number_t hwirq);
 void gpio_regmap_disable_irq(struct gpio_regmap *gpio, irq_hw_number_t hwirq);
 
+#ifdef CONFIG_REGMAP_IRQ
+struct irq_domain *gpio_regmap_add_irq_chip(struct gpio_regmap *gpio, int irq,
+					    int irq_flags,
+					    struct regmap_irq_chip *chip);
+struct irq_domain *gpio_regmap_add_irq_chip_nolock(struct gpio_regmap *gpio, int irq,
+						   int irq_flags,
+						   struct regmap_irq_chip *chip);
+#else
+static inline struct irq_domain *
+gpio_regmap_add_irq_chip(struct gpio_regmap *gpio, int irq, int irq_flags,
+			 struct regmap_irq_chip *chip)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static inline struct irq_domain *
+gpio_regmap_add_irq_chip_nolock(struct gpio_regmap *gpio, int irq, int irq_flags,
+				struct regmap_irq_chip *chip)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+#endif
+
 #endif /* _LINUX_GPIO_REGMAP_H */
-- 
2.47.3

