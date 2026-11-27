Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791206;
	b=kkXLM+m4xDE3eqyua/XCOYWIgefynbYe95RQFN5sXw6RaoZ8i7NH6lZySevTh332NvTs
	 fKX8CfTxnTDZeomM1MNkU3YdhiIPeoYvTmKAUjAqf053r+BV4wPFeFwjm4/vNnDwDBhH3
	 4MUfen8INNt8tWjIfewIr9pImGGTBbj72HXDytW/vJFdHXsgNmFTmERHc4ujKUnT8pGx8
	 t/RdKqyfAxxbLBVPh9F7dvXiwSONJcbM7KI2P0YRfLqf9iBEDoQxdiMOMx3F2eK04+mv8
	 K3LRPlLTmVv2lknVpZKFyAm+fQQdsRmOKV1AjdVJUBFtBSygYAfa/aXcz+zO0RKEosA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791206;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3y4OlDbeqvWxg7N6a3LQ41j1rKPM+y4nwJqVxl2OCp8=;
	b=1yi+ZdMy8cSN0ekyEKTN/huez4AYIf3zYk5gfgChqDkj5gJo9pc36f6eBktkQrYahHAb
	 qdWRKsiN+mjWMhYYGULBhaArgr7USGLByf8+2Rv6KGmpPI2jqfJav11+mwI86EqsXtYry
	 rHA3Z/gvnWe6poAAiWwEAy2GmTICyY+MbCzHcGXhk3WHOa+ugxk5P4y3A+stENarZYyJD
	 uqcSCxBHay0AdO74aKXG0kIZPqyGlDD7/7xMCVUMytWJ2qjO8UrGy5L4J1BOYJzm0CZ1q
	 ffWkjAhrfJDtwnsTxkc6XWHwIRNmpJA7AYsBeC6i6GuLp5PueQy/heHMnrv7LdT8+ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yt1fJxXz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41145606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yt1fJxXz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47131F0089F;
	Fri, 27 Nov 2026 14:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791205;
	bh=3y4OlDbeqvWxg7N6a3LQ41j1rKPM+y4nwJqVxl2OCp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yt1fJxXzj0f5kipMqq1XUD9Kw/nNYfA08XMGciV2e3Tmff3HdESzkNQ4KVXkBpNjz
	 LmDhuDT5H4CEVdACJsz5CMkZe7BJDMsGZJB50aO+yNGfu+Ge8fbdmn0y0TrIA4qKxm
	 h4kUgdmjG8AxWYcQP+0/B8KLmxlXEfaXK841/2nm21xA3Bh6/zpiVJccw+7TY9JS9H
	 NQJoNSwIGfjiztA97A7vVa9X/IP2F/Bvtuw8c4ghUfcLwXtPwJpRPF1BbpzzhmzCkb
	 9BzCUF7xJC0nHaxQ82tW6uQ0IRJR7Ff6GEaArYNJu0FBwTanGhk4ZOmXKV8z5iCzIV
	 qWaWYfJ0Q71vA==
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
Subject: [RFT PATCH v2 12/14] gpio: 104-idi-48: create the regmap-irq chip from the gpio-regmap callback
Date: Fri, 27 Nov 2026 15:52:29 +0100
Message-ID: <20261127145232.814492-13-mwalle@kernel.org>
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

