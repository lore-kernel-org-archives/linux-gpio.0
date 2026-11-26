Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707438;
	b=iOusN94mPsjiWmV3/TpNL+pmZVBUaudQX+cIED+fShlDjAFf7b3Td2JczJn6XYWsfFR2
	 2NUN8ds/VxcKXRKpK0319rWufV5PTjE/Ewkv7o+zjkHLLvdeGuQQ0eT2zYwG68+wiYDgZ
	 e4U9LTdT98R9jDIQbZE8kp42FO5fcrH4TIpjeUKbBW+ZgAdK9vMXvbwXnxG79s9AmIWnL
	 IncMBJutzHSCSl4eVYRNI1KuzuaShAv6xWQ12f2r6PikOQ8wIzK1b7DYiYOy72E5xfLM+
	 EUAN0vZPBy3h/ezX4zzgA+nlT96xDWGwXY3T7EL3nRUOo1Sooi/86ZmNS/YR5Rep5rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707438;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wDCzsaF9OwqYKEOmQIiqg4EoYkZbk4Y7OfMjLeWdzoE=;
	b=WlLFDjr9gjVJ1JRP6n/fixmvfpYzReXzGvke9PqibGqaqnOr3vKP2g8vjRfbicI0xtXS
	 6xMxv7S3aElMphZ5odyl6qAZu59JV4mRcXDqel16wGwtQCPZRMzOsvjN9ymCvrgPgRtle
	 jmbKvhcagadEpzEj8/E7thu6RYcNgayOgMdpi/GiLBAWqXYAJ765398Rabn5KJSFGsPf2
	 dpEF8LkY/MoKPAhPnovCtEvF24yFy4GUxU2HTOZBGTLDOPHDmaNT2BYIQseLngLilOYIQ
	 7cxIXlOz1yFXqmgZKWs9I2xhkMhGjTXF+0y5s0lpQLfosqaC27rDZkXHdA9zyH4qllQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lgEm/vvj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F52606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lgEm/vvj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FB71F000C4;
	Thu, 26 Nov 2026 15:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707437;
	bh=wDCzsaF9OwqYKEOmQIiqg4EoYkZbk4Y7OfMjLeWdzoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lgEm/vvjmF/ol1QHK4bgH1vhNDE1caOq1F8JejURL9/TPAURIpwuGVGFpU/VAu7Ff
	 sGrWJzGA+ymXTuTL3lmuoEb0hyZIuD0OYGX0L6xPwqlhx5LfAWV6CTDBGmNfBQyDKG
	 hA2iHZb7HXwkVLe6Z0zCiABbHlrXTuZwQotulIP0TiIWDTH7mPDVytXp+N9PEt7n87
	 OAdjD/TCyaQwx9DC6OhkmNyqnUHSMtYqVtg2RAuZXlc0hQkITTkB80pcRbUEEF/8ve
	 xTCSVZgnBfRXnOM4oFKufSEqs1wbVTaKhwfaL+JedoKpL48hW8LQ2ecZnAASuG0ZfU
	 AYowrcPbJwN7g==
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
Subject: [RFT PATCH 03/13] gpio: rtd1625: create the IRQ domain from the gpio-regmap callback
Date: Thu, 26 Nov 2026 16:35:14 +0100
Message-ID: <20261126153600.299724-4-mwalle@kernel.org>
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

Use the new .create_irq_domain() to actually create the domain. This
way, there is no window where a NULL pointer could be dereferenced.

Switch the irq host_data to the gpio_regmap pointer because it will
already be needed in the irq domain callbacks. Otherwise the
.create_irq_domain() callback would have to set the data->gpio_reg
pointer which looks odd.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-rtd1625.c | 74 ++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 33 deletions(-)

diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
index cf4f61603dfb..0713692804e2 100644
--- a/drivers/gpio/gpio-rtd1625.c
+++ b/drivers/gpio/gpio-rtd1625.c
@@ -79,7 +79,6 @@ struct rtd1625_gpio_info {
 };
 
 struct rtd1625_gpio {
-	struct gpio_regmap *gpio_reg;
 	const struct rtd1625_gpio_info *info;
 	struct regmap *regmap;
 	unsigned int irqs[RTD1625_MAX_IRQS];
@@ -290,7 +289,7 @@ static void rtd1625_gpio_irq_handle(struct irq_desc *desc)
 
 static void rtd1625_gpio_ack_irq(struct irq_data *d)
 {
-	struct rtd1625_gpio *data = irq_data_get_irq_chip_data(d);
+	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(irq_data_get_irq_chip_data(d));
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	u32 irq_type = irqd_get_trigger_type(d);
 	u32 bit_mask = BIT(hwirq % 32);
@@ -352,11 +351,12 @@ static void rtd1625_gpio_disable_level_irq(struct rtd1625_gpio *data, irq_hw_num
 
 static void rtd1625_gpio_enable_irq(struct irq_data *d)
 {
-	struct rtd1625_gpio *data = irq_data_get_irq_chip_data(d);
+	struct gpio_regmap *gpio_reg = irq_data_get_irq_chip_data(d);
+	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio_reg);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	u32 irq_type = irqd_get_trigger_type(d);
 
-	gpio_regmap_enable_irq(data->gpio_reg, hwirq);
+	gpio_regmap_enable_irq(gpio_reg, hwirq);
 
 	if (irq_type & IRQ_TYPE_EDGE_BOTH)
 		rtd1625_gpio_enable_edge_irq(data, hwirq);
@@ -366,7 +366,8 @@ static void rtd1625_gpio_enable_irq(struct irq_data *d)
 
 static void rtd1625_gpio_disable_irq(struct irq_data *d)
 {
-	struct rtd1625_gpio *data = irq_data_get_irq_chip_data(d);
+	struct gpio_regmap *gpio_reg = irq_data_get_irq_chip_data(d);
+	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio_reg);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	u32 irq_type = irqd_get_trigger_type(d);
 
@@ -375,7 +376,7 @@ static void rtd1625_gpio_disable_irq(struct irq_data *d)
 	else if (irq_type & IRQ_TYPE_LEVEL_MASK)
 		rtd1625_gpio_disable_level_irq(data, hwirq);
 
-	gpio_regmap_disable_irq(data->gpio_reg, hwirq);
+	gpio_regmap_disable_irq(gpio_reg, hwirq);
 }
 
 static int rtd1625_gpio_irq_set_level_type(struct irq_data *d, bool level)
@@ -385,7 +386,7 @@ static int rtd1625_gpio_irq_set_level_type(struct irq_data *d, bool level)
 	struct rtd1625_gpio *data;
 	int ret;
 
-	data = irq_data_get_irq_chip_data(d);
+	data = gpio_regmap_get_drvdata(irq_data_get_irq_chip_data(d));
 	if (!(data->info->irq_type_support & IRQ_TYPE_LEVEL_MASK))
 		return -EINVAL;
 
@@ -406,7 +407,7 @@ static int rtd1625_gpio_irq_set_level_type(struct irq_data *d, bool level)
 
 static int rtd1625_gpio_irq_set_edge_type(struct irq_data *d, bool polarity)
 {
-	struct rtd1625_gpio *data = irq_data_get_irq_chip_data(d);
+	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(irq_data_get_irq_chip_data(d));
 	u32 val = RTD1625_GPIO_WREN(RTD1625_GPIO_EDGE_INT_DP);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	int ret;
@@ -454,16 +455,16 @@ static int rtd1625_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 static int rtd1625_gpio_irq_request_resources(struct irq_data *d)
 {
-	struct rtd1625_gpio *data = irq_data_get_irq_chip_data(d);
+	struct gpio_regmap *gpio_reg = irq_data_get_irq_chip_data(d);
 
-	return gpio_regmap_reqres_irq(data->gpio_reg, d->hwirq);
+	return gpio_regmap_reqres_irq(gpio_reg, d->hwirq);
 }
 
 static void rtd1625_gpio_irq_release_resources(struct irq_data *d)
 {
-	struct rtd1625_gpio *data = irq_data_get_irq_chip_data(d);
+	struct gpio_regmap *gpio_reg = irq_data_get_irq_chip_data(d);
 
-	gpio_regmap_relres_irq(data->gpio_reg, d->hwirq);
+	gpio_regmap_relres_irq(gpio_reg, d->hwirq);
 }
 
 static struct irq_chip rtd1625_iso_gpio_irq_chip = {
@@ -505,9 +506,9 @@ static int rtd1625_gpio_setup_irq(struct platform_device *pdev, struct rtd1625_g
 static int rtd1625_gpio_irq_map(struct irq_domain *domain, unsigned int irq,
 				irq_hw_number_t hwirq)
 {
-	struct rtd1625_gpio *data = domain->host_data;
+	struct gpio_regmap *gpio_reg = domain->host_data;
 
-	irq_set_chip_data(irq, data);
+	irq_set_chip_data(irq, gpio_reg);
 
 	irq_set_chip_and_handler(irq, &rtd1625_iso_gpio_irq_chip, handle_bad_irq);
 
@@ -524,6 +525,31 @@ static const struct irq_domain_ops rtd1625_gpio_irq_domain_ops = {
 	.xlate = irq_domain_xlate_twocell,
 };
 
+static struct irq_domain *rtd1625_gpio_create_irq_domain(struct gpio_regmap *gpio_reg)
+{
+	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio_reg);
+	struct device *dev = regmap_get_device(data->regmap);
+	struct platform_device *pdev = to_platform_device(dev);
+	struct irq_domain_info d_info = {};
+	int ret;
+
+	d_info.fwnode = dev_fwnode(&pdev->dev);
+	d_info.size = data->info->num_gpios;
+	d_info.hwirq_max = data->info->num_gpios;
+	d_info.ops = &rtd1625_gpio_irq_domain_ops;
+	d_info.host_data = gpio_reg;
+
+	data->domain = devm_irq_domain_instantiate(dev, &d_info);
+	if (IS_ERR(data->domain))
+		return data->domain;
+
+	ret = rtd1625_gpio_setup_irq(pdev, data);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return data->domain;
+}
+
 static const struct regmap_config rtd1625_gpio_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -536,12 +562,10 @@ static const struct regmap_config rtd1625_gpio_regmap_config = {
 static int rtd1625_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_regmap_config config = {};
-	struct irq_domain_info d_info = {};
 	struct device *dev = &pdev->dev;
 	struct gpio_regmap *gpio_reg;
 	struct rtd1625_gpio *data;
 	void __iomem *irq_base;
-	int ret;
 
 	data = devm_kzalloc_obj(dev, *data);
 	if (!data)
@@ -578,29 +602,13 @@ static int rtd1625_gpio_probe(struct platform_device *pdev)
 	config.set_config = rtd1625_gpio_set_config;
 	config.value_xlate = rtd1625_value_xlate;
 
-	d_info.fwnode = dev_fwnode(&pdev->dev);
-	d_info.size = data->info->num_gpios;
-	d_info.hwirq_max = data->info->num_gpios;
-	d_info.ops = &rtd1625_gpio_irq_domain_ops;
-	d_info.host_data = data;
-
-	data->domain = devm_irq_domain_instantiate(dev, &d_info);
-	if (IS_ERR(data->domain))
-		return PTR_ERR(data->domain);
-
-	ret = rtd1625_gpio_setup_irq(pdev, data);
-	if (ret)
-		return ret;
-
-	config.irq_domain = data->domain;
 	config.drvdata = data;
+	config.create_irq_domain = rtd1625_gpio_create_irq_domain;
 
 	gpio_reg = devm_gpio_regmap_register(dev, &config);
 	if (IS_ERR(gpio_reg))
 		return PTR_ERR(gpio_reg);
 
-	data->gpio_reg = gpio_reg;
-
 	return 0;
 }
 
-- 
2.47.3

