Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707461;
	b=n51kuAq0viJkIO7HWqXCrQBDWTGtR1D10iPAbtfbCI/CFWBweoUuTArG9/e0LJui9Ho6
	 v+6S7rNEHiH5/jxmHsTQYdoTLnfbDBMlhIOFjOiktlSddwrIToDQ0KV7iZpMCAxdpRHw3
	 PKACyX9V7LD11H47gmxmtlcnZIFEwEOUQHxFWbPJ/tbGLx43aXFNsFCA3uVqee3CY2tcu
	 waDbM05wOS9LmO3T6Gg8AzpjhYRMMs/T5D5fovP92MwCYuz4lgo3hGx/dnTVUtCpHIxvs
	 DcmBgKhCiE8TQTI9/AAFJAagdbV4XEr17YhB502Nu6m2Jfep3XEhYcjN0cD8HDj7Adw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707461;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Tsbt+DTLYEVcstYstnP1hdZwz4BCikq3eEBiW69wILE=;
	b=ZsdrV/xI9fy5PmXrwk9nuwOGV/A6UOJuP1M2Yc9qL1xwtxoPu0Ia2pkmEMmeUpAhBn6J
	 cDtvSofNnwkkEwLzOOZmkRdxV+cZw/fJTn9yKlyhc9Vodr5GqWr+xXcajEc3zG3DNTW2v
	 qnFafAUIDPOIYe0A+SzOe1E78cMqMrdpryqQvPcSlSrNorzSyIUgNnMmLikvD93rX4jgj
	 O0ynfBatpbus/JszJwsa+CXepQhRLNFurZoD9avFSNxy+YFnEWM9DdriQF8MZVbExmVsC
	 m+qFj0hRVT1vY/L+l2spsKzNYSZJ7N23uTZ+FxrhBQGL993RzEb902hAqcV/wp+2jXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ho/N4KnK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F5B606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ho/N4KnK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6FA1F000F0;
	Thu, 26 Nov 2026 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707460;
	bh=Tsbt+DTLYEVcstYstnP1hdZwz4BCikq3eEBiW69wILE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ho/N4KnKeky92McgdmtIb+ZVlBEY7gCodbzDfifwrbJ83Eoy4WHIpLy9SpQo/ivIN
	 tDDW5PCsHxxNRcA2wV0JT7FmTHZPWuvGfiN6fT9s0JhtCXhsY6PqS+ASn06kaDlcm8
	 VzPLxA36FtBz1be9A+mpCuj2xQ27NkXkoge8hR8wHyLnwXkR7ojx32ZaB0qdXzx7IB
	 7p1/bkCr1fB/jbV3ADatdrf7LbREeqgnZuMmP39EshL3WuCrE9svOUj/bv/DGyfoaE
	 b7xRnpGjF0JttT6djYp+uwoGS4TWtN2b+3P7+REcj0K0XfPm+EybiPBFk71GdFUGvG
	 jPZiqU+syBG0w==
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
Subject: [RFT PATCH 09/13] gpio: pcie-idio-24: create the regmap-irq chip from the gpio-regmap callback
Date: Thu, 26 Nov 2026 16:35:20 +0100
Message-ID: <20261126153600.299724-10-mwalle@kernel.org>
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
 drivers/gpio/gpio-pcie-idio-24.c | 36 ++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 8fb34398053d..3be7aad266e0 100644
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
+	domain = gpio_regmap_add_irq_chip(gpio, idio24gpio->irq, 0, idio24gpio->chip);
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

