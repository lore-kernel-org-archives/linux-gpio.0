Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791194;
	b=CwpCJdcES4Hq7WUWO6qVUk10J6DC9WEabgziv2SjeqnCHsQlljCk4wI9GCPcrBWorltE
	 3+5MeIAr8q6XnhJLuaRxUOxSdoHiVZJFcWIv3ISzF+Q/wKTlfDCTgKY5sh2ZyZsuKHgpE
	 WmBWFKwkC0BUnSgEHq2PRltHRyMphx0gu1ydb7GS4+RvgxjmGqQ9Axa5CFKgJ/F0GQdnm
	 e5Gv1P0FtADzM29KAoznGwgQbZw5qSYpIO5/afBfGocqwUqPNqA0vWl5zcdQ+J87mVCKi
	 RIrk/whuxW0UhSbDBHSHbGeVl/vaSsl7bRcD9YTCq/AMYXcBv+Rk/pVPA/eZRUoBK8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791194;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=erP+LMBLUcN9gH9fte8an0RIfEUgmPlH/y/OR6138y0=;
	b=R760AQWOv72tRN8sB19f4ytPyce3deSjgOaiQE8NcljmjvF/Aj8jeK29qAwCRP8kMVSP
	 H87RmNg1EkCmk1yBHGY434qlDTv8F/Q72r6qc587SdpV8yFMRXXnJ3aVSxVOctZ2cB/Lk
	 od3JXTvOqAfLm/Tsu0bDSOBBAPRAAwG07XHV1J7lpjxjwc8j03/sIAC/6g4HrgCLEFUsD
	 P/EtwR9IFoPULTD8osfDRwZRotUzvr0uTHYru+3VlCdMIrzNH9mQumNPcxLmUzIvl1GTX
	 JjdEcPwh3OLHMZ0rZadsukkqI6/Xh7hJTFQHdCN5u+TMhnYtora3hqk98X/IYHfZ1Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hin6SMcx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F948606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 14:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hin6SMcx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1B31F00935;
	Fri, 27 Nov 2026 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791193;
	bh=erP+LMBLUcN9gH9fte8an0RIfEUgmPlH/y/OR6138y0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hin6SMcxf3mYEz9Gj8lnck+ecRGjr9lIDgdq5KsGrwNa6faCG4Q9Xv4llBZEtJL3e
	 JAigyxc6Q8KAWCdIuguCMagLRiTyQKTY4U7hrI2AM94nTzt+ZfyOO2OqWxlWtdzyXg
	 65UQhkCOI4Ghf/DRh9gOsgGfOhii/1IL7oulx8pnBlH/2tkoz1kuiV5mV22Fh55fz2
	 /TzdcIgwjTw5zxVqLenlGbfXpaxmP/IHzPCd2mqwAt/LfIjz3aU32E1X8AEAvxkJEw
	 oHe+CRiH8/lESkatVjTUQTu4xJceHKaBw81bpGtbtaXZbHf5Fi0/eXrptX0NrcUubd
	 Iag2338Qo/kiA==
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
Subject: [RFT PATCH v2 09/14] gpio: idio-16: create the regmap-irq chip from the gpio-regmap callback
Date: Fri, 27 Nov 2026 15:52:26 +0100
Message-ID: <20261127145232.814492-10-mwalle@kernel.org>
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
 drivers/gpio/gpio-idio-16.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-idio-16.c b/drivers/gpio/gpio-idio-16.c
index b9aa8bb9347a..16744ecb5fad 100644
--- a/drivers/gpio/gpio-idio-16.c
+++ b/drivers/gpio/gpio-idio-16.c
@@ -34,12 +34,14 @@
 struct idio_16_data {
 	struct regmap *map;
 	unsigned int irq_mask;
+	struct regmap_irq_chip *chip;
+	unsigned int irq;
 };
 
 static int idio_16_handle_mask_sync(const int index, const unsigned int mask_buf_def,
 				    const unsigned int mask_buf, void *const irq_drv_data)
 {
-	struct idio_16_data *const data = irq_drv_data;
+	struct idio_16_data *const data = gpio_regmap_get_drvdata(irq_drv_data);
 	const unsigned int prev_mask = data->irq_mask;
 	int err;
 	unsigned int val;
@@ -66,6 +68,19 @@ static int idio_16_handle_mask_sync(const int index, const unsigned int mask_buf
 	return 0;
 }
 
+static struct irq_domain *idio_16_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct idio_16_data *data = gpio_regmap_get_drvdata(gpio);
+	struct irq_domain *domain;
+
+	domain = gpio_regmap_add_irq_chip_nolock(gpio, data->irq, 0, data->chip);
+	if (IS_ERR(domain))
+		return dev_err_cast_probe(regmap_get_device(data->map), domain,
+					  "IRQ registration failed\n");
+
+	return domain;
+}
+
 static int idio_16_reg_mask_xlate(struct gpio_regmap *const gpio, enum gpio_regmap_operation op,
 				  const unsigned int base, const unsigned int offset,
 				  unsigned int *const reg, unsigned int *const mask)
@@ -107,7 +122,6 @@ int devm_idio_16_regmap_register(struct device *const dev,
 	int err;
 	struct idio_16_data *data;
 	struct regmap_irq_chip *chip;
-	struct regmap_irq_chip_data *chip_data;
 	DECLARE_BITMAP(fixed_direction_output, IDIO_16_NGPIO);
 
 	if (!config->parent)
@@ -137,17 +151,14 @@ int devm_idio_16_regmap_register(struct device *const dev,
 	chip->irqs = config->regmap_irqs;
 	chip->num_irqs = config->num_regmap_irqs;
 	chip->handle_mask_sync = idio_16_handle_mask_sync;
-	chip->irq_drv_data = data;
+	data->chip = chip;
+	data->irq = config->irq;
 
 	/* Disable IRQ to prevent spurious interrupts before we're ready */
 	err = regmap_write(data->map, IDIO_16_DISABLE_IRQ, 0x00);
 	if (err)
 		return err;
 
-	err = devm_regmap_add_irq_chip(dev, data->map, config->irq, 0, 0, chip, &chip_data);
-	if (err)
-		return dev_err_probe(dev, err, "IRQ registration failed\n");
-
 	if (config->filters) {
 		/* Deactivate input filters */
 		err = regmap_write(data->map, IDIO_16_DEACTIVATE_INPUT_FILTERS, 0x00);
@@ -163,7 +174,8 @@ int devm_idio_16_regmap_register(struct device *const dev,
 	gpio_config.reg_set_base = GPIO_REGMAP_ADDR(IDIO_16_DAT_BASE);
 	gpio_config.ngpio_per_reg = IDIO_16_NGPIO_PER_REG;
 	gpio_config.reg_stride = IDIO_16_REG_STRIDE;
-	gpio_config.irq_domain = regmap_irq_get_domain(chip_data);
+	gpio_config.drvdata = data;
+	gpio_config.create_irq_domain = idio_16_create_irq_domain;
 	gpio_config.reg_mask_xlate = idio_16_reg_mask_xlate;
 
 	bitmap_from_u64(fixed_direction_output, GENMASK_U64(15, 0));
-- 
2.47.3

