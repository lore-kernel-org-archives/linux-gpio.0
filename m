Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707465;
	b=Pn+Zt2/6lHEUpV66AtZy4aJSa51oUiPcMGckv4Kd02RosQ7EUQLLK5/lGDK8A4OXmor/
	 kbCEUP0p2TwopYRB9AJwZ6LFOZwbRgjzT4MxqZQwzqFtns90mqiohbszW3+xPxsRNNduF
	 V65DtJtKpzL7z6oin5viqAmfdnv+pzrK/sNAxzjHAd68Wv+OYghVvafRicMn7EA1twhGe
	 PFv+dj1H8dpgLxzaOMNM3RT4LQhWochW8SsRnKrr0LS799nTsnXYnZjn4LfsY9X0YwLQ0
	 nLj/IC8BAtXyX0latTSqkhRgq5VzpI9IB3v2NBQCiOqyjLdIPkmcH8HuuBCQNnkULLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707465;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RnkA9y3jvjbsCjqFxDkWmCYhD02DJggmW3DjxL3kl/k=;
	b=EPGo+xlBQ4BdBXhoH4TPfVuL9/RH7w7Qz0zocQAaI4OudmLRKCfaaA13ukEObF+tRSWn
	 Z5PvaGxqpOMNvhxPLJZLT3Bs6+wMvV6NwVmjhRZKABituQGwWZH+ury59d33Lms2oczps
	 XAV7ikNB1Vk/sgb7V2bTE/IPhd17O00t2WTEHZR/Pb3kNHSxu0acCIXKgoSgxr4KQhRI4
	 oN7JOVEpOcZVF6Hn40TpwIAry04gV6F7qMnmxdjzbD+oSEVdr4OrYG1a5E1b7Z1nkIni3
	 9bF6hViXAF7mXt6HJHYjmzKFnpZ2b9n6nZbGOhHlBRmSlU7CppbaNQxtWwOKnlg596g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWGQLmIh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEAE606A321
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWGQLmIh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1090E1F000ED;
	Thu, 26 Nov 2026 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707464;
	bh=RnkA9y3jvjbsCjqFxDkWmCYhD02DJggmW3DjxL3kl/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WWGQLmIheHdhxuxYcGwDbuZCsRT2DTJgBudQ8Ig1rN67H0ZJbUVQIoMFDVsJbwZgl
	 F/tjU9P182Yrcez6W/azKGblGTZIXByZkClMW5+D0L6WdfLc2LyIl3EAeFb5LVdHX/
	 hKVuerwpzDMWTaZNUgaT/ouxmIV2Gzgc7sUav9UmR1Qg2ModWnkG2qLd4VQiCpqKz5
	 70MPtfRblft6uMq0hIuplbzcXq/vda0JlM0IXskNA2WFF2aQLDW9I34UAE4c29xlfD
	 BxBIHY3EwKHkXtvKaZ+AV/2s/lr7OriUXgbXT+arJpdcLiUGVu4zAx9ZctUIVo+zyf
	 jC7vJqQCbcatg==
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
Subject: [RFT PATCH 10/13] gpio: ws16c48: create the regmap-irq chip from the gpio-regmap callback
Date: Thu, 26 Nov 2026 16:35:21 +0100
Message-ID: <20261126153600.299724-11-mwalle@kernel.org>
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
 drivers/gpio/gpio-ws16c48.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index cd0c35c057cb..6a5e74fc3395 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -104,16 +104,20 @@ static const struct regmap_irq ws16c48_regmap_irqs[WS16C48_NUM_IRQS] = {
  * @map:	regmap for the device
  * @lock:	synchronization lock to prevent I/O race conditions
  * @irq_mask:	I/O bits affected by interrupts
+ * @chip:	regmap_irq_chip for the device
+ * @irq:	parent IRQ
  */
 struct ws16c48_gpio {
 	struct regmap *map;
 	raw_spinlock_t lock;
 	u8 irq_mask[WS16C48_NUM_IRQS / WS16C48_NGPIO_PER_REG];
+	struct regmap_irq_chip *chip;
+	unsigned int irq;
 };
 
 static int ws16c48_handle_pre_irq(void *const irq_drv_data) __acquires(&ws16c48gpio->lock)
 {
-	struct ws16c48_gpio *const ws16c48gpio = irq_drv_data;
+	struct ws16c48_gpio *const ws16c48gpio = gpio_regmap_get_drvdata(irq_drv_data);
 
 	/* Lock to prevent Page/Lock register change while we handle IRQ */
 	raw_spin_lock(&ws16c48gpio->lock);
@@ -123,7 +127,7 @@ static int ws16c48_handle_pre_irq(void *const irq_drv_data) __acquires(&ws16c48g
 
 static int ws16c48_handle_post_irq(void *const irq_drv_data) __releases(&ws16c48gpio->lock)
 {
-	struct ws16c48_gpio *const ws16c48gpio = irq_drv_data;
+	struct ws16c48_gpio *const ws16c48gpio = gpio_regmap_get_drvdata(irq_drv_data);
 
 	raw_spin_unlock(&ws16c48gpio->lock);
 
@@ -133,7 +137,7 @@ static int ws16c48_handle_post_irq(void *const irq_drv_data) __releases(&ws16c48
 static int ws16c48_handle_mask_sync(const int index, const unsigned int mask_buf_def,
 				    const unsigned int mask_buf, void *const irq_drv_data)
 {
-	struct ws16c48_gpio *const ws16c48gpio = irq_drv_data;
+	struct ws16c48_gpio *const ws16c48gpio = gpio_regmap_get_drvdata(irq_drv_data);
 	unsigned long flags;
 	int ret = 0;
 
@@ -167,7 +171,7 @@ static int ws16c48_set_type_config(unsigned int **const buf, const unsigned int
 				   const struct regmap_irq *const irq_data, const int idx,
 				   void *const irq_drv_data)
 {
-	struct ws16c48_gpio *const ws16c48gpio = irq_drv_data;
+	struct ws16c48_gpio *const ws16c48gpio = gpio_regmap_get_drvdata(irq_drv_data);
 	unsigned int polarity;
 	unsigned long flags;
 	int ret;
@@ -242,6 +246,19 @@ static int ws16c48_irq_init_hw(struct regmap *const map)
 	return regmap_write(map, WS16C48_PAGE_LOCK, INT_ID_PAGE);
 }
 
+static struct irq_domain *ws16c48_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct ws16c48_gpio *const ws16c48gpio = gpio_regmap_get_drvdata(gpio);
+	struct irq_domain *domain;
+
+	domain = gpio_regmap_add_irq_chip(gpio, ws16c48gpio->irq, 0, ws16c48gpio->chip);
+	if (IS_ERR(domain))
+		return dev_err_cast_probe(regmap_get_device(ws16c48gpio->map), domain,
+					  "IRQ registration failed\n");
+
+	return domain;
+}
+
 static int ws16c48_probe(struct device *dev, unsigned int id)
 {
 	struct ws16c48_gpio *ws16c48gpio;
@@ -250,7 +267,6 @@ static int ws16c48_probe(struct device *dev, unsigned int id)
 	struct gpio_regmap_config gpio_config = {};
 	void __iomem *regs;
 	struct regmap_irq_chip *chip;
-	struct regmap_irq_chip_data *chip_data;
 
 	ws16c48gpio = devm_kzalloc_obj(dev, *ws16c48gpio);
 	if (!ws16c48gpio)
@@ -286,7 +302,8 @@ static int ws16c48_probe(struct device *dev, unsigned int id)
 	chip->handle_post_irq = ws16c48_handle_post_irq;
 	chip->handle_mask_sync = ws16c48_handle_mask_sync;
 	chip->set_type_config = ws16c48_set_type_config;
-	chip->irq_drv_data = ws16c48gpio;
+	ws16c48gpio->chip = chip;
+	ws16c48gpio->irq = irq[id];
 
 	raw_spin_lock_init(&ws16c48gpio->lock);
 
@@ -295,10 +312,6 @@ static int ws16c48_probe(struct device *dev, unsigned int id)
 	if (err)
 		return err;
 
-	err = devm_regmap_add_irq_chip(dev, ws16c48gpio->map, irq[id], 0, 0, chip, &chip_data);
-	if (err)
-		return dev_err_probe(dev, err, "IRQ registration failed\n");
-
 	gpio_config.parent = dev;
 	gpio_config.regmap = ws16c48gpio->map;
 	gpio_config.ngpio = WS16C48_NGPIO;
@@ -308,7 +321,8 @@ static int ws16c48_probe(struct device *dev, unsigned int id)
 	/* Setting a GPIO to 0 allows it to be used as an input */
 	gpio_config.reg_dir_out_base = GPIO_REGMAP_ADDR(WS16C48_DAT_BASE);
 	gpio_config.ngpio_per_reg = WS16C48_NGPIO_PER_REG;
-	gpio_config.irq_domain = regmap_irq_get_domain(chip_data);
+	gpio_config.drvdata = ws16c48gpio;
+	gpio_config.create_irq_domain = ws16c48_create_irq_domain;
 
 	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
 }
-- 
2.47.3

