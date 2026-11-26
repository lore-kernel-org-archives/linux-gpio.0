Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707452;
	b=Gk95hFMAOU3OMlt8xS/6mpDsKpZuWZTg4DYJWircGku6PTClJoMMS/vBLFXzyctLUGjY
	 qQLGoejsIv3yfbwxboiae2c6uWwuhdoUbiYUKOGHoX/p/1jiLuoVVbGqg16cjz9TajJVn
	 8rfdZ1PdScA2aEgn/hXYdZvWF2sotNwj7EMK3YZjAN64Rz12JJ3zvYayAgYgkSZfeI/Ix
	 sgyFj7GjBjrQCQBSo4zOI0adMBZmCMsdXaQdOQQIuTQ8lyINWgTmxUFNfynHod+0wBs0m
	 JD+xDzCzDDuru7aYb57pHyCzbcWH6MLglX95VffTJOeVhhW/Hb2gJY1K9FtNjq873/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707452;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=f2oCDnClPI+VAzaxTKPMZjopiLHRIZp2Ku3oIqx9Ey8=;
	b=rgeQU1mZAc5b6lB2DRj8pSxjWbt1PoKUJh0zShC5jQ0PZwTKPqrczqnvEQNJsS7aNg5a
	 kWUwWidXJouFxYU3dEku2RP4KIOqHkIOuimj4DEl1HElNGQ4N+RsmNIy0xvMJSdFiFyUC
	 645pkyFyne9hZIMWJHOpwzY/WmJU7m+5Q2yqay4uh5gtssxUJf6R2FkUo1zU3qpeq2sIz
	 v5QcT0tLyjafSI5wZkk+2hs/X5VENDaR+y1I8Z3WctQ7RpbMD0aJ+fVfGsTOraX9NOrsu
	 cei1RvbJgXwPuhxD//xu3eveeZ6nUs1bZ27F3A/3m04l8L3IMz+0ELfikff48bHsCoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khvoxlcM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BD5606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khvoxlcM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5461F000C0;
	Thu, 26 Nov 2026 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707452;
	bh=f2oCDnClPI+VAzaxTKPMZjopiLHRIZp2Ku3oIqx9Ey8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=khvoxlcM/vjs99XvVMnci0T8JgWfHATy5Zp4Mx3KQ2qCP1LIp10AT6P8kyw39R6dh
	 kOQ2UfQa9lmFXijU7fLwPDw8uoJ40NHNOHvcZb+Qi8sS0ZI8MBBz/seQzherlWdOWB
	 jr99ZRNan1AFeEZ5KvIndNFz/KCh7UJ3HU7cQ4huptax09oTPlZhortJ+5Pz/F/aTX
	 Q0d69+ijsBK3DAASAsup7jdcZW1khFgXa5XAfQRn8718RiaUvHXdL3sKGKMNWz8JU3
	 amP/KoK0id0VvXkpHK7v5D3ij7ZS79UGWss0L/6L4ip3TEDAP9N4NUp49bihyT5I70
	 petcbcLOvJFwA==
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
Subject: [RFT PATCH 07/13] gpio: sl28cpld: create the regmap-irq chip from the gpio-regmap callback
Date: Thu, 26 Nov 2026 16:35:18 +0100
Message-ID: <20261126153600.299724-8-mwalle@kernel.org>
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
 drivers/gpio/gpio-sl28cpld.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-sl28cpld.c b/drivers/gpio/gpio-sl28cpld.c
index 57cadeb07fde..46141da2d2f7 100644
--- a/drivers/gpio/gpio-sl28cpld.c
+++ b/drivers/gpio/gpio-sl28cpld.c
@@ -44,14 +44,28 @@ static const struct regmap_irq sl28cpld_gpio_irqs[] = {
 	REGMAP_IRQ_REG_LINE(7, 8),
 };
 
+struct sl28cpld_gpio {
+	struct regmap_irq_chip irq_chip;
+	int irq;
+};
+
+static struct irq_domain *sl28cpld_gpio_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct sl28cpld_gpio *sl28cpld_gpio = gpio_regmap_get_drvdata(gpio);
+
+	return gpio_regmap_add_irq_chip(gpio, sl28cpld_gpio->irq,
+					IRQF_SHARED | IRQF_ONESHOT,
+					&sl28cpld_gpio->irq_chip);
+}
+
 static int sl28cpld_gpio_irq_init(struct platform_device *pdev,
 				  unsigned int base,
 				  struct gpio_regmap_config *config)
 {
-	struct regmap_irq_chip_data *irq_data;
+	struct sl28cpld_gpio *sl28cpld_gpio;
 	struct regmap_irq_chip *irq_chip;
 	struct device *dev = &pdev->dev;
-	int irq, ret;
+	int irq;
 
 	if (!device_property_read_bool(dev, "interrupt-controller"))
 		return 0;
@@ -60,10 +74,12 @@ static int sl28cpld_gpio_irq_init(struct platform_device *pdev,
 	if (irq < 0)
 		return irq;
 
-	irq_chip = devm_kzalloc_obj(dev, *irq_chip);
-	if (!irq_chip)
+	sl28cpld_gpio = devm_kzalloc_obj(dev, *sl28cpld_gpio);
+	if (!sl28cpld_gpio)
 		return -ENOMEM;
 
+	irq_chip = &sl28cpld_gpio->irq_chip;
+
 	irq_chip->name = "sl28cpld-gpio-irq";
 	irq_chip->irqs = sl28cpld_gpio_irqs;
 	irq_chip->num_irqs = ARRAY_SIZE(sl28cpld_gpio_irqs);
@@ -72,14 +88,10 @@ static int sl28cpld_gpio_irq_init(struct platform_device *pdev,
 	irq_chip->unmask_base = base + GPIO_REG_IE;
 	irq_chip->ack_base = base + GPIO_REG_IP;
 
-	ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
-					      config->regmap, irq,
-					      IRQF_SHARED | IRQF_ONESHOT,
-					      0, irq_chip, &irq_data);
-	if (ret)
-		return ret;
+	sl28cpld_gpio->irq = irq;
 
-	config->irq_domain = regmap_irq_get_domain(irq_data);
+	config->drvdata = sl28cpld_gpio;
+	config->create_irq_domain = sl28cpld_gpio_create_irq_domain;
 
 	return 0;
 }
-- 
2.47.3

