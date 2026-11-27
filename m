Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791187;
	b=2UB7Zk7k2rE5eni3WHxrWJwfjJb45rG8f48bJGKHi3EVThuxs4JiShiXVdJlCntaMnw0
	 eLFFO979o3lO5fbCyN5CY5H8cxTa7UR9+a6GMmWWTijFQAo7ZEFk4LFzMWx2ZMviLMGuA
	 oCSzgU+fqchfgDcKR0Jdal04rTPaPNUVkxuPT8qdBahjg7CCSB5kIjt+Gb5hBBY+jlwMD
	 NFF5qD8yDigyyxcx6Q5ZzdjPR/QDvzXaG4U1NYfBeD4bsODoCy89jprnRJCqfcAAnwj4/
	 LwhJXjswSntm7dnUMqZqAeIHycZX5rmKf7gm9nbbbf0zWS2hnYj7yvYrKXtx+mwbKpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791187;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=QE0oVtI/py717JnDeulrVx+SoFxs8JDa1YElE+ziiL4=;
	b=359HVvyCVfV3MKU+XgAW7964aRGY1T1rjzjQlcXtaHg5HCxccB92T30NzajC+yLAoPSR
	 SvGkErkHSlfJNiCc/EJGQQZJQwsDZajQfGLn7k4gzgM23jsdaBPww0efpx4qYFzWJ6yWf
	 jsd/EWjz4DzRyqXjDEkWgPErUFZZxw6j9uyYZpf1H/N2V1XZTl5iSSWt/mPV3SB50/8Au
	 D6ur63s4AAMJX0VkXq5FhlPmofI5MkyQBbLwIplB9Tmqe5IDRsW2Gf/MZQtrhn3I3r+GC
	 PW0gFDPDAG3A3PbqV8aYjfnT+RzDwmqqjyFJybUOhlX251UUXvMP7oaTWYfoll8z8GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gwdp0ACL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D91606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gwdp0ACL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB3B1F00899;
	Fri, 27 Nov 2026 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791186;
	bh=QE0oVtI/py717JnDeulrVx+SoFxs8JDa1YElE+ziiL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Gwdp0ACLicil+yett1rWOD2nXWT0ysoBacGVga3uTmE1SHP6rDcq0LuKKUGoFY7Nb
	 h7B+9qnua2pFdN+PuCr0n3phIkLoRbaddeNQKVyjiyO3c2dQWTPVWKOECtWAswV+pb
	 tLi3OpEloavev8atfn1gm3eveIrHLwOTCh33byXNpwkP9jubSmQhuVmb/YP4O5xwoL
	 CeuSnAg3y6KL/kw9weF9zin2QvycZ+hyfUEiS3NWKOhpcFCyb5uPn4PBBZlgpSvikc
	 8NS5x5G1gOk02UYDKdgCMoC2CVwycISm9zt2upUCpUp9k9U1sZyVkg08UVnJVMfInr
	 Yu87VJBONAVlg==
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
Subject: [RFT PATCH v2 07/14] gpio: max7360: create the regmap-irq chip from the gpio-regmap callback
Date: Fri, 27 Nov 2026 15:52:24 +0100
Message-ID: <20261127145232.814492-8-mwalle@kernel.org>
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
---
 drivers/gpio/gpio-max7360.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-max7360.c b/drivers/gpio/gpio-max7360.c
index b77a51092dcb..372659edc8fb 100644
--- a/drivers/gpio/gpio-max7360.c
+++ b/drivers/gpio/gpio-max7360.c
@@ -27,6 +27,12 @@ struct max7360_gpio_plat_data {
 	unsigned int function;
 };
 
+struct max7360_gpio {
+	struct regmap *regmap;
+	struct regmap_irq_chip *irq_chip;
+	int irq;
+};
+
 static struct max7360_gpio_plat_data max7360_gpio_port_plat = { .function = MAX7360_GPIO_PORT };
 static struct max7360_gpio_plat_data max7360_gpio_col_plat = { .function = MAX7360_GPIO_COL };
 
@@ -128,7 +134,8 @@ static int max7360_handle_mask_sync(const int index,
 				    const unsigned int mask_buf,
 				    void *const irq_drv_data)
 {
-	struct regmap *regmap = gpio_regmap_get_drvdata(irq_drv_data);
+	struct max7360_gpio *max7360_gpio = gpio_regmap_get_drvdata(irq_drv_data);
+	struct regmap *regmap = max7360_gpio->regmap;
 	int ret;
 
 	for (unsigned int i = 0; i < MAX7360_MAX_GPIO; i++) {
@@ -141,10 +148,19 @@ static int max7360_handle_mask_sync(const int index,
 	return 0;
 }
 
+static struct irq_domain *max7360_gpio_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct max7360_gpio *max7360_gpio = gpio_regmap_get_drvdata(gpio);
+
+	return gpio_regmap_add_irq_chip(gpio, max7360_gpio->irq, IRQF_ONESHOT | IRQF_SHARED,
+					max7360_gpio->irq_chip);
+}
+
 static int max7360_gpio_probe(struct platform_device *pdev)
 {
 	const struct max7360_gpio_plat_data *plat_data;
 	struct gpio_regmap_config gpio_config = { };
+	struct max7360_gpio *max7360_gpio;
 	struct regmap_irq_chip *irq_chip;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
@@ -162,11 +178,15 @@ static int max7360_gpio_probe(struct platform_device *pdev)
 			 * Port GPIOs with interrupt-controller property: add IRQ
 			 * controller.
 			 */
-			gpio_config.regmap_irq_flags = IRQF_ONESHOT | IRQF_SHARED;
-			gpio_config.regmap_irq_line =
+			max7360_gpio = devm_kzalloc_obj(dev, *max7360_gpio);
+			if (!max7360_gpio)
+				return -ENOMEM;
+
+			max7360_gpio->regmap = regmap;
+			max7360_gpio->irq =
 				fwnode_irq_get_byname(dev_fwnode(dev->parent), "inti");
-			if (gpio_config.regmap_irq_line < 0)
-				return dev_err_probe(dev, gpio_config.regmap_irq_line,
+			if (max7360_gpio->irq < 0)
+				return dev_err_probe(dev, max7360_gpio->irq,
 						     "Failed to get IRQ\n");
 
 			/* Create custom IRQ configuration. */
@@ -181,9 +201,10 @@ static int max7360_gpio_probe(struct platform_device *pdev)
 			irq_chip->num_irqs = MAX7360_MAX_GPIO;
 			irq_chip->irqs = max7360_regmap_irqs;
 			irq_chip->handle_mask_sync = max7360_handle_mask_sync;
+			max7360_gpio->irq_chip = irq_chip;
 
-			gpio_config.regmap_irq_chip = irq_chip;
-			gpio_config.drvdata = regmap;
+			gpio_config.drvdata = max7360_gpio;
+			gpio_config.create_irq_domain = max7360_gpio_create_irq_domain;
 
 			for (unsigned int i = 0; i < MAX7360_MAX_GPIO; i++) {
 				ret = regmap_write_bits(regmap, MAX7360_REG_PWMCFG(i),
-- 
2.47.3

