Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791198;
	b=eEJTgtvxEyNqMC+qIh5kIdzhVr7T7Aur8m7OsPKVQ9Az4QLVMG1oWj/lkqda1pP4MIkh
	 41gD6rozUN+eICktHzqHaTlqQb5zJJx97l360Tfh25134cT4CYqUcROVGTfBvuCM217A+
	 B5h9LhBv2vxfDZMRp7c/1cL4Eo0LuUKl7cMfWSjHtM77RAAbHIw4KRAJIX1fddlWaAAKC
	 lIlDXo3JJnTkphrx0lghZpjDQp8i2kwjT5NEkTlLHL7sdtcElVjqvhv37xrKhYNsYx1KY
	 IgANwvyjKG72log/D8MW/qrC9ka8IMYm5Kka4z7eFmz2M5ABu/gJf5PDoWaAoHxtVHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791198;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YrZcAr8zwh+Wu0MB50B+y8v3FImgOGnTkOGAxIzXLgY=;
	b=W81zFJ2j2sB44gCY8VkTND5n6/VjxM8Nfv4fEAmIvVlwUPMwxn9//XTrHWcLV+GLXJYP
	 9L+qxI04Ts7WAi3IP/ULXa0xNiilK2JK71mMAx9hliYBQXhjL2c2f6xmxyneSdTp0U4+9
	 /uDm9WMJhNTS6ScHMOG0eM91hMdLQsJB0fqZ7D1VnSljEaTNHADbmWTBH//WOPlxdFcAr
	 +g5AHXUKMAtdUJUyGZcuspYaMmINSuk1QwQoROJ5PMQfKITe42aYtDNyvlc/ETGa0m4Rv
	 yB7hCN3CrZvkqUa1HZnhcIZsuPbP0LKBhVpx+gARDJKehJPAU/tT7IxLn80txiXU8pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CIQiKkHg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45B6606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 14:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CIQiKkHg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B061F00898;
	Fri, 27 Nov 2026 14:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791197;
	bh=YrZcAr8zwh+Wu0MB50B+y8v3FImgOGnTkOGAxIzXLgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CIQiKkHgeXyqDZlhwdNJRZRkBkb2eAQ8hDyLwFMfE2LzKY/bJIm8BebDQJIpTiabW
	 kwGwDL/rNcf2qX/VhgtTW5suWAynVbIT14aqiU/RK4V+baIfoRePqelmu05ntBclXK
	 YEomrFFoWYc4aFnXT2szb+qvIMpHR9s9jAKib/oZYuKlfUM0n59UNPD9m5ZtsJ4I+w
	 F/rI1RB1xhnFI3XoCHv2uU/MM7ANRxSiAIJnzJunlR6SO77BX0nLRiLHfKsJaZZJW7
	 S9rLA8rR2PdCNhZ6KCog8z5uk0za4qIv4GKuhxAEOGOGKZXr69+EMAFRlILenmkITW
	 v2wzTn8o+4FSQ==
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
Subject: [RFT PATCH v2 10/14] gpio: pcie-idio-24: create the regmap-irq chip from the gpio-regmap callback
Date: Fri, 27 Nov 2026 15:52:27 +0100
Message-ID: <20261127145232.814492-11-mwalle@kernel.org>
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

Use the new gpio_regmap_add_irq_chip_nolock() helper to create the
regmap-irq domain. Use the _nolock() variant because the hwirq don't
match the GPIO offsets.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pcie-idio-24.c | 36 ++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 8fb34398053d..604558bed12e 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -148,18 +148,22 @@ static const struct regmap_irq idio_24_regmap_irqs[] = {
  * @map:	regmap for the device
  * @lock:	synchronization lock to prevent I/O race conditions
  * @irq_type:	type configuration for IRQs
+ * @chip:	regmap_irq_chip for the device
+ * @irq:	parent IRQ
  */
 struct idio_24_gpio {
 	struct regmap *map;
 	raw_spinlock_t lock;
 	u8 irq_type;
+	struct regmap_irq_chip *chip;
+	int irq;
 };
 
 static int idio_24_handle_mask_sync(const int index, const unsigned int mask_buf_def,
 				    const unsigned int mask_buf, void *const irq_drv_data)
 {
 	const unsigned int type_mask = COS_ENABLE_BOTH << index;
-	struct idio_24_gpio *const idio24gpio = irq_drv_data;
+	struct idio_24_gpio *const idio24gpio = gpio_regmap_get_drvdata(irq_drv_data);
 	u8 type;
 	int ret;
 
@@ -183,7 +187,7 @@ static int idio_24_set_type_config(unsigned int **const buf, const unsigned int
 	const unsigned int rising = COS_ENABLE_RISING << offset;
 	const unsigned int falling = COS_ENABLE_FALLING << offset;
 	const unsigned int mask = COS_ENABLE_BOTH << offset;
-	struct idio_24_gpio *const idio24gpio = irq_drv_data;
+	struct idio_24_gpio *const idio24gpio = gpio_regmap_get_drvdata(irq_drv_data);
 	unsigned int new;
 	unsigned int cos_enable;
 	int ret;
@@ -225,13 +229,27 @@ static int idio_24_set_type_config(unsigned int **const buf, const unsigned int
 	return ret;
 }
 
+static struct irq_domain *idio_24_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct idio_24_gpio *const idio24gpio = gpio_regmap_get_drvdata(gpio);
+	struct irq_domain *domain;
+
+	domain = gpio_regmap_add_irq_chip_nolock(gpio, idio24gpio->irq, 0, idio24gpio->chip);
+	if (IS_ERR(domain))
+		return dev_err_cast_probe(regmap_get_device(idio24gpio->map), domain,
+					  "IRQ registration failed\n");
+
+	return domain;
+}
+
 static int idio_24_reg_mask_xlate(struct gpio_regmap *const gpio, enum gpio_regmap_operation op,
 				  const unsigned int base, const unsigned int offset,
 				  unsigned int *const reg, unsigned int *const mask)
 {
 	const unsigned int out_stride = offset / IDIO_24_NGPIO_PER_REG;
 	const unsigned int in_stride = (offset - 24) / IDIO_24_NGPIO_PER_REG;
-	struct regmap *const map = gpio_regmap_get_drvdata(gpio);
+	struct idio_24_gpio *const idio24gpio = gpio_regmap_get_drvdata(gpio);
+	struct regmap *const map = idio24gpio->map;
 	int err;
 	unsigned int ctrl_reg;
 
@@ -302,7 +320,6 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	void __iomem *idio_24_regs;
 	struct regmap *intcsr_map;
 	struct regmap_irq_chip *chip;
-	struct regmap_irq_chip_data *chip_data;
 
 	err = pcim_enable_device(pdev);
 	if (err)
@@ -348,7 +365,8 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	chip->num_irqs = ARRAY_SIZE(idio_24_regmap_irqs);
 	chip->handle_mask_sync = idio_24_handle_mask_sync;
 	chip->set_type_config = idio_24_set_type_config;
-	chip->irq_drv_data = idio24gpio;
+	idio24gpio->chip = chip;
+	idio24gpio->irq = pdev->irq;
 
 	/* Software board reset */
 	err = regmap_write(idio24gpio->map, IDIO_24_SOFT_RESET, 0);
@@ -362,10 +380,6 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (err)
 		return err;
 
-	err = devm_regmap_add_irq_chip(dev, idio24gpio->map, pdev->irq, 0, 0, chip, &chip_data);
-	if (err)
-		return dev_err_probe(dev, err, "IRQ registration failed\n");
-
 	gpio_config.parent = dev;
 	gpio_config.regmap = idio24gpio->map;
 	gpio_config.ngpio = IDIO_24_NGPIO;
@@ -374,9 +388,9 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	gpio_config.reg_set_base = GPIO_REGMAP_ADDR(IDIO_24_OUT_BASE);
 	gpio_config.reg_dir_out_base = GPIO_REGMAP_ADDR(IDIO_24_CONTROL_REG);
 	gpio_config.ngpio_per_reg = IDIO_24_NGPIO_PER_REG;
-	gpio_config.irq_domain = regmap_irq_get_domain(chip_data);
 	gpio_config.reg_mask_xlate = idio_24_reg_mask_xlate;
-	gpio_config.drvdata = idio24gpio->map;
+	gpio_config.drvdata = idio24gpio;
+	gpio_config.create_irq_domain = idio_24_create_irq_domain;
 
 	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
 }
-- 
2.47.3

