Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791190;
	b=JgXxht9PKKfHhvg19YvVf5lbIqBULUKaSbN0mO+ZZF0I0pxJW4BUK700KY/o3pL9g8aj
	 7eenYZuXAj2DSnM96vCiiNs3VGEzw+d6y4yZTwcVAlPvUYLmzcA6jRWRybd5XLIudweAI
	 AsvebenhmCZEqlztpz8mp6e1qMBugr1zgNba413lynw9Yd6ZMejkmMAsUInHrkFTsE1xU
	 WLNfmP2Ys3UBMM10jqmv0DwSxcNxN9bJ+ZM6b896YZE+t/txTWExol03zMZa6kcUdoWLR
	 K5WvvVEoJwQWmTvOfBWntEF8QBncBeYzEuauEBD/Pl0BGsUH7/l4rO/TJS/6LevYSbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791190;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=teInCXB1IQUkEfsUoC42cAGLIlvhiPKtcU6j6iJ2U/o=;
	b=4RjPSOpu3p3fQy5Du8AYa2G2ry8lzU7RxKJ/SqN3KimO89cc8dJB93TN6h7vCspwrxXU
	 z52i9zTP5J5wBkoWGLgciJJObH1zt5mCM3ukm5+dleEEQdCkx+cMC62RawhghpVtWsh7m
	 3dRd7/aC29bJfNNvKMhRppMGfvDxUp+hnGQcFeDi5/P+tIjAOar0opayHwn9euxvMY4cX
	 9E2EfaUE3/Oom+yGM3WQ4qJ9eKaXSLsXNNa06ribxMPajeKepkpdN1hOyYCVkNgKMvhN8
	 3SBxr6T8sx0Xv4t0ERDFedYUWde0K7ls6cIVD7bYlBMu1QJQsNl369yjdLjPQ854j1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iJsp/8wh";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AC6606A31E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJsp/8wh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0417B1F000C1;
	Fri, 27 Nov 2026 14:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791190;
	bh=teInCXB1IQUkEfsUoC42cAGLIlvhiPKtcU6j6iJ2U/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iJsp/8whgkR5O04jEZ7YvW/4xajfzxERXW+Nkt8xRxkqOfAs72GyE+61kcVU84qCL
	 iQ99ckRJL4QQj2DWqYwmu4aqMH3/U6buUHbFpD5VQKHA1jhddXpDPjpEb78tHZ8KCS
	 ZmK98oDtMgZgGofjbRpbWiWceTwDJA7iKeRtqmmPUE84U2/QeVAFiQJXmnmx2XYP36
	 aCbLVerK9ssmf30M+g0MUHFwiWcDJfM8vkKA9avFOHyO1H5sk2Px1mVvK6FbVUcUMG
	 XHh8AQvZUXAiZReBZE3psc+y5maPYO6OqMTSknsfhEFyV6AQJ4zp/wOdtS4/jSn6TC
	 A+gSvDmYrnc3w==
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
Subject: [RFT PATCH v2 08/14] gpio: sl28cpld: create the regmap-irq chip from the gpio-regmap callback
Date: Fri, 27 Nov 2026 15:52:25 +0100
Message-ID: <20261127145232.814492-9-mwalle@kernel.org>
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

Use the new gpio_regmap_add_irq_chip() helper to create the regmap-irq
domain.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

