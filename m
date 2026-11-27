Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776107;
	b=qGmnFGXHb+d5rHMEhEi62Ls9J6XPtcqJ3qOcaVM+RzTyS+Y9QGbgFA8g3aEN1JjYb12H
	 18wd8ubU/iRxTDBj4tSTseHTI9TDXThkEGkRJk0usjh/ih/D8DWom7zswvn2SX47dMbDT
	 QCvA39K2u76NegF7zDbgsmKUteC6CsUj2821oRY46qzB7erpj/V/ITcBF5J0WTmUaWgTr
	 eC7/dHjw9Ry/Nt5Pcniz1XIV/C2+b/1SntsUQ3V3oRI1vsQAhbQ6vm4UeWoZq1SmS3tTm
	 McBRciZM4ieTlFaNkX3ubs2vu1Mh37Opt42WFAEWB5n9J9x60BHHDb0thb+dF90nJ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776107;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:To:CC:X-Mailer;
	bh=Uk+X0vqcBjgcKLTgHVBWTVYXKqbPiX5ROkvLC/OOkWw=;
	b=mlJMPoXtamNo5UUBsna3I96XmWO29YjCnAstA8kAcU7mLTOGzKJV/O9Qs0axzT0gzpnj
	 EyQCw+ZbXjFybAzVog0uV5IyIiY0rrSxht8sxE84G4c/6VRiIPaRU/QVvYQLyOYs8BYvH
	 yO6aoiVRk3CYs0AENcZAcPlykwxvfMXzjYpZiVGlVuofQ9jQIUmMPpUL2dTary80qKwSX
	 PhdynLXL8BaTCFh+gf9vGcB2sNiDurztReaXotsiyol6Ts3W/uJASsbz/y3OqF+U+Lys/
	 u3RocmYKr+SNPPja/9wXSO9VcoQARWOrX+ZDdEt5srx0MkOj4SYTXeSGLDdjwmz2S1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=yHK0UgWk;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3D9606A324;
	Fri, 27 Nov 2026 10:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F3D9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=yHK0UgWk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795776107; x=1827312107;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=MXiGnd9wKRDIoByFElLHLsh5vCL5BRUud2G+vZxW3uE=;
  b=yHK0UgWkNEzZVfI/MjJ0nmo5YFZ4gNaJIjB/b8Ttgc8Afs3TjB4uNYtH
   0zE+9eqpXG4fVskAA1L09o9MAEZ0SOJCHBKlO4NoU3N357YR9WxUSGYsM
   rsxjT/77WGMQ89rTUuRBGzrFNiJStJLPydlj8tq7x9iPCGMPwQRCKhJdC
   NO2z9BAS9m6L8X9id39UQjXZyZj2FpIn8/zoc00oIMDDLCFumJiyZeQso
   U9mqLr8tZr4mCtipx/y1s9w2SdcotqAqEnWjCPpgbqSKjtALWus/myQnV
   MvXk1EXWRjIdtl1EztRglqGt6tTbAHz5im6Jxr7tfSYCI2BobrK/xHJC/
   A==;
X-CSE-ConnectionGUID: z3BlVJVPSOmp/ksnYQ2KbA==
X-CSE-MsgGUID: SdOxVR20QqOpA5w5GLmSpA==
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="67352353"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 03:41:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Fri, 27 Nov 2026 03:41:45 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 27 Nov 2026 03:41:44 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Fri, 27 Nov 2026 11:41:19 +0100
Subject: [PATCH] pinctrl: ocelot: support GPIO interrupts behind a sleeping
 bus
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20261127-ocelot-pinctrl-irq-behind-sleeping-bus-v1-1-24f5ebbc6081@microchip.com>
X-B4-Tracking: v=1; b=H4sIAE5eCWsC/x2NwQrCMBAFf6Xs2QWzgkV/RTyY5NkuhKTuVhFK/
 93gceYws5HDFE7XYSPDR11b7RAOA6X5USew5s4kRzmHEC7cEkpbedGaVius9uKIWWtmL0DXE8e
 38xjTCMlyykGoxxbDU7//0e2+7z97nFfIeAAAAA==
To: Linus Walleij <linusw@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev

When the regmap sits on a bus that can sleep, as for VSC7512 or lan9645x
attached over SPI, the driver registers no irqchip, so consumers such as
sfp have to poll their GPIOs.

Register a regmap-irq chip for that case and add its domain to the
gpiochip. GPIO_INTR_IDENT is the status register, GPIO_INTR_ENA enables
a pin, and the reported bits in GPIO_INTR are cleared before the nested
handlers run. GPIO_INTR also records changes of a disabled pin, so a
change while the interrupt is disabled is handled when it is enabled
again. GPIO_INTR is cleared once at probe. The resource request and
release callbacks lock the line as an interrupt in gpiolib. The
regmap-irq chip is deleted after the gpiochip is removed, so the
interrupts gpiolib frees on removal still have their mappings.

GPIO_INTR records any change of an input, so only the both edges trigger
is supported and the other types are rejected.

When the regmap can sleep, the probe returns -EPROBE_DEFER while the
interrupt parent is not there yet. SoCs with memory mapped registers
still register the gpiochip without an irqchip in that case.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
Tested on a lan9668 host board (pcb8385) with a lan9645x attached over
SPI.

Dependencies:

Based on v7.4-rc4, which contains the dependency 5cf0969621bc
("pinctrl: ocelot: do not use the chained irqchip behind a sleeping
bus"). It does not apply to pinctrl devel without it.

If merging v7.4-rc4 into devel is not wanted, I will resend on top of
v7.5-rc1. Review is welcome in the meantime.
---
 drivers/pinctrl/Kconfig          |   1 +
 drivers/pinctrl/pinctrl-ocelot.c | 110 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 107 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index dc7138302c55..fc10914e2e1a 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -467,6 +467,7 @@ config PINCTRL_OCELOT
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
+	select REGMAP_IRQ
 	select REGMAP_MMIO
 	help
 	  Support for the internal GPIO interfaces on Microsemi Ocelot and
diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index c71ddcb24dbd..e593af9f1179 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -376,6 +376,9 @@ struct ocelot_pinctrl {
 	u8 stride;
 	u8 altm_stride;
 	struct workqueue_struct *wq;
+	struct regmap_irq_chip irq_chip;
+	struct regmap_irq_chip_data *irq_data;
+	int irq;
 };
 
 struct ocelot_match_data {
@@ -2327,6 +2330,91 @@ static int ocelot_irq_set_type(struct irq_data *data, unsigned int type)
 	return 0;
 }
 
+static int ocelot_sleep_irq_set_type_config(unsigned int **buf,
+					    unsigned int type,
+					    const struct regmap_irq *irq_data,
+					    int idx, void *irq_drv_data)
+{
+	return type == IRQ_TYPE_EDGE_BOTH ? 0 : -EINVAL;
+}
+
+static int ocelot_sleep_irq_reqres(void *irq_drv_data, irq_hw_number_t hwirq)
+{
+	struct ocelot_pinctrl *info = irq_drv_data;
+
+	return gpiochip_reqres_irq(&info->gpio_chip, hwirq);
+}
+
+static void ocelot_sleep_irq_relres(void *irq_drv_data, irq_hw_number_t hwirq)
+{
+	struct ocelot_pinctrl *info = irq_drv_data;
+
+	gpiochip_relres_irq(&info->gpio_chip, hwirq);
+}
+
+static void ocelot_sleep_irq_remove(void *data)
+{
+	struct ocelot_pinctrl *info = data;
+
+	regmap_del_irq_chip(info->irq, info->irq_data);
+}
+
+static int ocelot_sleep_irq_init(struct platform_device *pdev,
+				 struct ocelot_pinctrl *info)
+{
+	struct regmap_irq_chip *chip = &info->irq_chip;
+	struct regmap_irq *irqs;
+	unsigned int i;
+
+	irqs = devm_kcalloc(&pdev->dev, info->desc->npins, sizeof(*irqs),
+			    GFP_KERNEL);
+	if (!irqs)
+		return -ENOMEM;
+
+	for (i = 0; i < info->desc->npins; i++) {
+		irqs[i].reg_offset = REG(0, info, i);
+		irqs[i].mask = BIT(i % 32);
+		irqs[i].type.types_supported = IRQ_TYPE_SENSE_MASK;
+	}
+
+	chip->name = dev_name(&pdev->dev);
+	chip->status_base = REG(OCELOT_GPIO_INTR_IDENT, info, 0);
+	chip->unmask_base = REG(OCELOT_GPIO_INTR_ENA, info, 0);
+	chip->ack_base = REG(OCELOT_GPIO_INTR, info, 0);
+	chip->num_regs = info->stride;
+	chip->irqs = irqs;
+	chip->num_irqs = info->desc->npins;
+	chip->set_type_config = ocelot_sleep_irq_set_type_config;
+	chip->irq_reqres = ocelot_sleep_irq_reqres;
+	chip->irq_relres = ocelot_sleep_irq_relres;
+	chip->irq_drv_data = info;
+
+	return devm_add_action(&pdev->dev, ocelot_sleep_irq_remove, info);
+}
+
+static int ocelot_sleep_irq_register(struct platform_device *pdev,
+				     struct ocelot_pinctrl *info)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < info->stride; i++) {
+		ret = regmap_write(info->map,
+				   REG(OCELOT_GPIO_INTR, info, 32 * i), ~0);
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_add_irq_chip_fwnode(dev_fwnode(&pdev->dev), info->map,
+					 info->irq, 0, 0, &info->irq_chip,
+					 &info->irq_data);
+	if (ret)
+		return ret;
+
+	return gpiochip_irqchip_add_domain(&info->gpio_chip,
+					   regmap_irq_get_domain(info->irq_data));
+}
+
 static void ocelot_irq_handler(struct irq_desc *desc)
 {
 	struct irq_chip *parent_chip = irq_desc_get_chip(desc);
@@ -2358,7 +2446,8 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 {
 	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
-	int irq;
+	int irq = info->irq;
+	int ret;
 
 	info->gpio_chip = ocelot_gpiolib_chip;
 
@@ -2369,8 +2458,7 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 	gc->label = "ocelot-gpio";
 	gc->can_sleep = regmap_might_sleep(info->map);
 
-	irq = gc->can_sleep ? 0 : platform_get_irq_optional(pdev, 0);
-	if (irq > 0) {
+	if (irq > 0 && !gc->can_sleep) {
 		girq = &gc->irq;
 		gpio_irq_chip_set_chip(girq, &ocelot_irqchip);
 		girq->parent_handler = ocelot_irq_handler;
@@ -2383,7 +2471,17 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 		girq->handler = handle_edge_irq;
 	}
 
-	return devm_gpiochip_add_data(&pdev->dev, gc, info);
+	if (irq > 0 && gc->can_sleep) {
+		ret = ocelot_sleep_irq_init(pdev, info);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_gpiochip_add_data(&pdev->dev, gc, info);
+	if (ret || irq <= 0 || !gc->can_sleep)
+		return ret;
+
+	return ocelot_sleep_irq_register(pdev, info);
 }
 
 static const struct of_device_id ocelot_pinctrl_of_match[] = {
@@ -2486,6 +2584,10 @@ static int ocelot_pinctrl_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, info);
 	info->dev = dev;
 
+	info->irq = platform_get_irq_optional(pdev, 0);
+	if (info->irq == -EPROBE_DEFER && regmap_might_sleep(info->map))
+		return info->irq;
+
 	/* Pinconf registers */
 	if (info->desc->confops) {
 		pincfg = ocelot_pinctrl_create_pincfg(pdev, info);

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261119-ocelot-pinctrl-irq-behind-sleeping-bus-7bc7e2d23d12

Best regards,
-- 
Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>

