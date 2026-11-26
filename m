Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707468;
	b=eMrirt1Toqb7TvkslCU9IGmgVFyiRmFW4nYYrB5T3Gt28gg8oLTZBXnuRIdgrnJUEzjw
	 KjOBoJuDGt3vCh+azhX56i+7oBZaB1GNzqgo+ZGUF61zHTmQYoQDigcwy8gZ5LwVvBE+z
	 6Wt+VglOaDEnAtAli3Vv9JJ7Xcf1CCrGoxatZaOPF3LE6tPBSBtix1Cx2GRNGTB3SC8EA
	 xscHx7vNTWAd69csC8OOCwpFUOJmFYYwLO7wWrQF2AML/iqHdAZ597pB3EtF6Xk21wOFF
	 XitOqNDqk9699PcADTb7E3zRjxz+eEtYxY1QayTKzUkwvJ3QNmz28mK2Htvk2J/ZF+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707468;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=PqwHWXguFg78kkOi1Q2i5fVgt4nDXWvrvDEgGE6P+wc=;
	b=mepN+yJJay7MxsN+fpyOdLYvZAaWrUjsxhozla4A/vNV3A8URJK+r/4WhwNvf24qLDI7
	 NNjPV6PIGIfyWpl8iRbBQKQ+2zx1XDRgYpaH+puXYNPRVWRUvxabR8ChUWCjloACBXWx9
	 mserea/bVczG320crqDeQVX1Ht2UkcqJ7kUoeDu9RjNUP7dVe92tQ6+oUI03rg0Lkak2P
	 ju1BwKSF0l+r9NiBnA6pd1Z6tdkmsKHVIMFra1IsnqNEX930dmzPMvsItwZzAQ+ftnM4Q
	 NAaWn6IbIh9XGPXp2kN0HIZimQH61/Unz6zs9OGxfNreHPjB+8J1Ay9sl2D4gCx8xKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OOk+col3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD8606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OOk+col3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8DE1F0093E;
	Thu, 26 Nov 2026 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707468;
	bh=PqwHWXguFg78kkOi1Q2i5fVgt4nDXWvrvDEgGE6P+wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OOk+col3NxGLQWefG5nLcpJ4Hrn0Gp5HfBQCb0NXNpfzMGEqe6qJFHxDIMahsTFrz
	 jQud8EmLhtLbTXfBU9MDq7hOUwxTV3MW4YsJYZFqHL02rDCphAL9R8Npi9ix4X1Ww1
	 ySY35Fsqb/k8A/w0TJTiziatFQN0Ec3R020qaKxC66o9EsnVCeQzhevjJiBZvOuf4h
	 C48zNXaOa8J9s2nwFxTXhrBUYZyfZc8HX4Ac3NSXeNaT3eH/mrpEqC8AJIzLJWJveK
	 JJ/mTKche+eEm6VXc7cu3Hv+w6X+ZvvB80L4P8DYHXnPtrfNvPv/BjxE7tyuvSIyde
	 yYdt8MFU8YlLg==
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
Subject: [RFT PATCH 11/13] gpio: 104-idi-48: create the regmap-irq chip from the gpio-regmap callback
Date: Thu, 26 Nov 2026 16:35:22 +0100
Message-ID: <20261126153600.299724-12-mwalle@kernel.org>
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
 drivers/gpio/gpio-104-idi-48.c | 38 +++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index 93d7ccaded83..434704c06d7e 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -123,15 +123,33 @@ static const char *idi48_names[IDI48_NGPIO] = {
 	"Bit 18 B", "Bit 19 B", "Bit 20 B", "Bit 21 B", "Bit 22 B", "Bit 23 B"
 };
 
+struct idi_48_gpio {
+	struct regmap_irq_chip chip;
+	struct device *dev;
+	unsigned int irq;
+};
+
+static struct irq_domain *idi_48_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct idi_48_gpio *const idi48gpio = gpio_regmap_get_drvdata(gpio);
+	struct irq_domain *domain;
+
+	domain = gpio_regmap_add_irq_chip(gpio, idi48gpio->irq, IRQF_SHARED, &idi48gpio->chip);
+	if (IS_ERR(domain))
+		return dev_err_cast_probe(idi48gpio->dev, domain,
+					  "IRQ registration failed\n");
+
+	return domain;
+}
+
 static int idi_48_probe(struct device *dev, unsigned int id)
 {
 	const char *const name = dev_name(dev);
 	struct gpio_regmap_config config = {};
+	struct idi_48_gpio *idi48gpio;
 	void __iomem *regs;
 	struct regmap *map;
 	struct regmap_irq_chip *chip;
-	struct regmap_irq_chip_data *chip_data;
-	int err;
 
 	if (!devm_request_region(dev, base[id], IDI_48_EXTENT, name)) {
 		dev_err(dev, "Unable to lock port addresses (0x%X-0x%X)\n",
@@ -148,10 +166,14 @@ static int idi_48_probe(struct device *dev, unsigned int id)
 		return dev_err_probe(dev, PTR_ERR(map),
 				     "Unable to initialize register map\n");
 
-	chip = devm_kzalloc_obj(dev, *chip);
-	if (!chip)
+	idi48gpio = devm_kzalloc_obj(dev, *idi48gpio);
+	if (!idi48gpio)
 		return -ENOMEM;
 
+	idi48gpio->dev = dev;
+	idi48gpio->irq = irq[id];
+	chip = &idi48gpio->chip;
+
 	chip->name = name;
 	chip->status_base = IDI48_IRQ_STATUS;
 	chip->unmask_base = IDI48_IRQ_ENABLE;
@@ -160,11 +182,6 @@ static int idi_48_probe(struct device *dev, unsigned int id)
 	chip->irqs = idi48_regmap_irqs;
 	chip->num_irqs = ARRAY_SIZE(idi48_regmap_irqs);
 
-	err = devm_regmap_add_irq_chip(dev, map, irq[id], IRQF_SHARED, 0, chip,
-				       &chip_data);
-	if (err)
-		return dev_err_probe(dev, err, "IRQ registration failed\n");
-
 	config.parent = dev;
 	config.regmap = map;
 	config.ngpio = IDI48_NGPIO;
@@ -172,7 +189,8 @@ static int idi_48_probe(struct device *dev, unsigned int id)
 	config.reg_dat_base = GPIO_REGMAP_ADDR(0x0);
 	config.ngpio_per_reg = 8;
 	config.reg_mask_xlate = idi_48_reg_mask_xlate;
-	config.irq_domain = regmap_irq_get_domain(chip_data);
+	config.drvdata = idi48gpio;
+	config.create_irq_domain = idi_48_create_irq_domain;
 
 	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &config));
 }
-- 
2.47.3

