Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707449;
	b=bkBL2dP1m6VpVh1bb7A622xDyHv2eCxFm1JTgylDHp0XEUt1lTm7nFM6leocB3oze+be
	 geOLoNDJMT74zv7dBeNYjBgsq/p2goT2EltMH2NXO62cq7WJgbYAsyMptJ0rslx9pcvbe
	 VxC5pXjVbbroUX/osSOxsgVSS+0L6TGN/9DsSPPfMO7pjI3bWmZ45qsTNc9p+fjua9uSL
	 rccUDdpcf+Cpo+ell4H6ZGEePXFHU4PxkZnE5xswA2SszXcL6A7ycBmcLvu2pXBXhhbPy
	 sXBEr2CzkwKveZdLoHf9TDPhLWJYUkWF3V8PtiPEdS4qyw1gUqslWzWT5l4+ivtyhEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707449;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=n8IIW/eQ3jjYYIMsP+u9vYbJcvY8QkSUw6wvsTnNajQ=;
	b=ZIhZcE/t09hNvnciB4gDx830iFv7R1efIGKtWRSzbaadwv4LpifsoQEMB/a1y+rayu5f
	 62WK5vN97BVw9gEjtNzkgFlp3evioMm+whAtTnf2h2sQkUjZYLCNwD6NpRcv3XtBjT6vw
	 PR2Xcoh8wjaNL4YdRMmzESV+ENB1VYdBoEZq78PUXh5mKlL4g5Znbt3yRJ8a4jN2BiKKO
	 uFokkGpAVJIVZEOVB2FJGLsMG7IG3CwHNWxO+JbufjgiXkKNO9dQDi69akElkeByfIZpd
	 lAZfhjT7u3Mbw32btYDGEjW3ER5Cs9lBXIq7/4293f73bSaPERYENEauTX4Xyl58fGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knG5AV3O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B635606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knG5AV3O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD9D1F000C0;
	Thu, 26 Nov 2026 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707449;
	bh=n8IIW/eQ3jjYYIMsP+u9vYbJcvY8QkSUw6wvsTnNajQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=knG5AV3OQcCvwl6SbfyZvgbpz/F3VbpTJsrOmddDxoHAT36elbwz4b63bIWblnmq0
	 KxPb/IQIbfmiquNMpFAYgWhoYv1ryr4oRtL/aiV/lqhJiNKu+JuAkfNPtSq+KlC1sI
	 RhDC/bb3c83RMVls540oRrHA76sqcsF3Y4ngoS+BdRLtsNlvI1ARNrPIZK6i9mVS1y
	 zHiXpTdTPJw+uF65Jc8uyrhHTMBIl8bjlulkyS1fjwN3tKIkJBBm/+dOAVOCyEHWtF
	 6diDDOoZ44NARwj07+1IrP2HZBRqvZjSmBbtVV4NissBGA4z1Xc342zWZSYDah3erH
	 PpMfbocgge0oQ==
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
Subject: [RFT PATCH 06/13] gpio: max7360: create the regmap-irq chip from the gpio-regmap callback
Date: Thu, 26 Nov 2026 16:35:17 +0100
Message-ID: <20261126153600.299724-7-mwalle@kernel.org>
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

Use the new gpio_regmap_add_irq_chip() helper to create the regmap-irq
domain.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-max7360.c | 62 ++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-max7360.c b/drivers/gpio/gpio-max7360.c
index b77a51092dcb..87f9442181d7 100644
--- a/drivers/gpio/gpio-max7360.c
+++ b/drivers/gpio/gpio-max7360.c
@@ -27,6 +27,11 @@ struct max7360_gpio_plat_data {
 	unsigned int function;
 };
 
+struct max7360_gpio {
+	struct device *dev;
+	struct regmap *regmap;
+};
+
 static struct max7360_gpio_plat_data max7360_gpio_port_plat = { .function = MAX7360_GPIO_PORT };
 static struct max7360_gpio_plat_data max7360_gpio_col_plat = { .function = MAX7360_GPIO_COL };
 
@@ -128,7 +133,8 @@ static int max7360_handle_mask_sync(const int index,
 				    const unsigned int mask_buf,
 				    void *const irq_drv_data)
 {
-	struct regmap *regmap = gpio_regmap_get_drvdata(irq_drv_data);
+	struct max7360_gpio *max7360_gpio = gpio_regmap_get_drvdata(irq_drv_data);
+	struct regmap *regmap = max7360_gpio->regmap;
 	int ret;
 
 	for (unsigned int i = 0; i < MAX7360_MAX_GPIO; i++) {
@@ -141,11 +147,38 @@ static int max7360_handle_mask_sync(const int index,
 	return 0;
 }
 
+static struct irq_domain *max7360_gpio_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct max7360_gpio *max7360_gpio = gpio_regmap_get_drvdata(gpio);
+	struct device *dev = max7360_gpio->dev;
+	struct regmap_irq_chip *irq_chip;
+	int irq;
+
+	irq = fwnode_irq_get_byname(dev_fwnode(dev->parent), "inti");
+	if (irq < 0)
+		return ERR_PTR(dev_err_probe(dev, irq, "Failed to get IRQ\n"));
+
+	/* Create custom IRQ configuration. */
+	irq_chip = devm_kzalloc_obj(dev, *irq_chip);
+	if (!irq_chip)
+		return ERR_PTR(-ENOMEM);
+
+	irq_chip->name = dev_name(dev);
+	irq_chip->status_base = MAX7360_REG_GPIOIN;
+	irq_chip->status_is_level = true;
+	irq_chip->num_regs = 1;
+	irq_chip->num_irqs = MAX7360_MAX_GPIO;
+	irq_chip->irqs = max7360_regmap_irqs;
+	irq_chip->handle_mask_sync = max7360_handle_mask_sync;
+
+	return gpio_regmap_add_irq_chip(gpio, irq, IRQF_ONESHOT | IRQF_SHARED, irq_chip);
+}
+
 static int max7360_gpio_probe(struct platform_device *pdev)
 {
 	const struct max7360_gpio_plat_data *plat_data;
 	struct gpio_regmap_config gpio_config = { };
-	struct regmap_irq_chip *irq_chip;
+	struct max7360_gpio *max7360_gpio;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	unsigned int outconf;
@@ -162,28 +195,15 @@ static int max7360_gpio_probe(struct platform_device *pdev)
 			 * Port GPIOs with interrupt-controller property: add IRQ
 			 * controller.
 			 */
-			gpio_config.regmap_irq_flags = IRQF_ONESHOT | IRQF_SHARED;
-			gpio_config.regmap_irq_line =
-				fwnode_irq_get_byname(dev_fwnode(dev->parent), "inti");
-			if (gpio_config.regmap_irq_line < 0)
-				return dev_err_probe(dev, gpio_config.regmap_irq_line,
-						     "Failed to get IRQ\n");
-
-			/* Create custom IRQ configuration. */
-			irq_chip = devm_kzalloc_obj(dev, *irq_chip);
-			if (!irq_chip)
+			max7360_gpio = devm_kzalloc_obj(dev, *max7360_gpio);
+			if (!max7360_gpio)
 				return -ENOMEM;
 
-			irq_chip->name = dev_name(dev);
-			irq_chip->status_base = MAX7360_REG_GPIOIN;
-			irq_chip->status_is_level = true;
-			irq_chip->num_regs = 1;
-			irq_chip->num_irqs = MAX7360_MAX_GPIO;
-			irq_chip->irqs = max7360_regmap_irqs;
-			irq_chip->handle_mask_sync = max7360_handle_mask_sync;
+			max7360_gpio->dev = dev;
+			max7360_gpio->regmap = regmap;
 
-			gpio_config.regmap_irq_chip = irq_chip;
-			gpio_config.drvdata = regmap;
+			gpio_config.drvdata = max7360_gpio;
+			gpio_config.create_irq_domain = max7360_gpio_create_irq_domain;
 
 			for (unsigned int i = 0; i < MAX7360_MAX_GPIO; i++) {
 				ret = regmap_write_bits(regmap, MAX7360_REG_PWMCFG(i),
-- 
2.47.3

