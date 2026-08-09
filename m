Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C374431E83B
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 08:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786262722; cv=none; b=EJcOCTltWAiP5Iq2g8o7JYKPo9iDkAWDEjcR/v2lQYzaeYrG+6dCL9njfejkPhYgYPz5K8tNnVKnOdMq31LgOdQRnEqVrlg728JuEHI1YKeiJHV/+Pr04BNEo6eC7I8MeInP7e42bsNMGo50vHqu0WD/5iRLX1UKNGv/N+9j5U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786262722; c=relaxed/simple;
	bh=HtdrbqIWUJsUEPksxgMOqrZEHxi9Y9IoJajtcc9yr5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HBw8bhP3sGh6PbTNiYVHf1za2Xzhs5MgxHzx8ExIJvpfqLpDEEwgTwqWyWWsctFSX92oQ4vYjDDfNKmh9VuoM6GB4ib93Trw4CEZRFJAq6xJ0rZ4qtUUd4CUtd/dJn4KTvi72bujTFH6aP/Cr5gUFF1nAYA3CZKvltNK4SAYlBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kB2Kw4sB; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kB2Kw4sB"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39266382df6so904990a91.3
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 01:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786262717; x=1786867517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfWlRrbNj4Bcq24IXL0yWkLlYoRbm2P5BkwSEgw03dg=;
        b=kB2Kw4sBYJuXkACI+Z6bSu15tlHvWwyxX2MXz/IotQlh1z0RBNd3dVoyNsqgrK5k+6
         FZ2vZV8Fuk7XaA+6uq1xRmIkFCEMuMLZ9bbAqkIe7bNz7KNFB5lX7Qo+D73zzQp3ksEe
         /Ffvr5mJLvGkrRYldgE5C295uleIzP0ztFvWEuhetSLyxG5w7yJ/GKZnV5aYiPbAI/uj
         VE9wOzDmlURKQdPhzVUAdpkYwQi2NaHzdOezw5NUyGsTKGK7cXQy7b1eBQIJoSQoOvKQ
         +HcSbTyRNY69MD2XyLpV7clcnQYfvXZecYrGVJJ5xVNNy88OCCmCqaSrkaeYV4gVvCfe
         WzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786262717; x=1786867517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VfWlRrbNj4Bcq24IXL0yWkLlYoRbm2P5BkwSEgw03dg=;
        b=l08ribtHVid/oYERWppIOj/FxLcXA1zAB1sCrIoXuW8kNErUyp92fCej8KkxRE/svY
         ecNHex7IwfI362/MnyjaoBzJMZ0ugC1FkX72zeupa7nA2iV/6/mY353NLOVmUI34l9U4
         0LZttdYwISSz7ggb6wF9ZW3duK/HiqPT5n0W/ed6P5KIwLG+AYAU4jCnMtQSw499sg2B
         gQEZMssLFOAwjgG5cNnCToAL+s4uR4yjBDrEfH/bp4LEdczjUUxtgmgYCnQnDhAUlX+n
         lj72+VGG1Hy5XI1vAdhfrV/dgzuMMTpvKIbv4Pm4da9wDedqhQtGY9lgevDMsJ5zUHeA
         Fg+w==
X-Gm-Message-State: AOJu0Yy2p3wKhVATBEqNspaq4uRuuVnLLBPq7nFeiw9eHGgQNWtjpayA
	NVJGKBcrTD3lZCt/8PYff4iyikWx6wvH0lJtfzOa056NpJL1iRjyAo2GAb3ZT55A
X-Gm-Gg: AR+sD12EL43sgf2BGNbHO0z8msHAZ4IB8NQTm7XBwy/v0HqEEqGBWnVgmF/On4vSdMV
	HKPeC+bb2OC1YE4/jfUcKCOsakD4r/uQMhSZAMYrT2I1c/5McwsQez0yLzpL5OZyPCnJ2uAM63o
	muR2a3IdJFAlgOAr8Ai85fLwIpovzrEXz0l/sGJBoQoHjNVkQ1VvJYXMmWmbTjh9L+yv2WkI5uD
	+hroFA7ZnetwKuc/DT7nYgiY+09EBR/KOv5yvBHI1hTLEoyr14VMXuWmSc3h/TBVkLZXJcFRWhV
	1dbquTmVl9KKgQXX4/DUNgOLQDFU+EUVgtCMTd5yQrYu53KttqWeg++oGybRGIRwIZXME/REVwr
	iXVUIJ+brJ/B9lANHRQRRlSQu2Lc9UmcqoxxjtgIE2GAwHVnPA4XLExdNRUJhqGQr0sHK0JSFjp
	BcGxhRpI2s1dWCHFwKCws7/5bVZIrfZDeJBdxnu28k5mOL3NTJzW9s/CyuYKxtT4iD8rsL
X-Received: by 2002:a17:90b:56ce:b0:38d:f94d:4c6e with SMTP id 98e67ed59e1d1-3903c5faa8amr36761114a91.17.1786262717450;
        Sun, 09 Aug 2026 01:05:17 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7b39bsm23315598c88.14.2026.08.09.01.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:05:16 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
Date: Sun,  9 Aug 2026 12:04:58 +0400
Message-Id: <5a7f97adbca73f2bd01393ce0ca840c2a6f43f76.1786262697.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1786262697.git.naseefkm@gmail.com>
References: <cover.1786262697.git.naseefkm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver assumes that every one of the AIROHA_NUM_PINS GPIOs can raise
an interrupt. That holds for the SoCs supported so far, but not for every
member of the family: on EN7528 only GPIO0-GPIO15 are wired to the
interrupt controller.

Without this the driver hands out interrupts for GPIOs that can never
fire, and the interrupt handler reads status registers that are not
backed by any pin.

Add a num_irq_pins field to the per-SoC match data and use it to bound
the interrupt callbacks and to size the loop in the interrupt handler.
Feed it to gpiolib through gpio_irq_chip::init_valid_mask as well, so
that gpiod_to_irq() fails for a pin that cannot be an interrupt source
instead of deferring the failure to request_irq().

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 drivers/pinctrl/airoha/airoha-common.h  |  3 +++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 33 +++++++++++++++++++++----
 drivers/pinctrl/airoha/pinctrl-an7563.c |  1 +
 drivers/pinctrl/airoha/pinctrl-an7581.c |  1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c |  1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c |  1 +
 6 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index c1acbfb7426e..16f7abcdfb83 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -127,6 +127,7 @@ struct airoha_pinctrl {
 
 	struct gpio_chip gpiochip;
 	struct airoha_gpiochip_regs *gpio_regs;
+	unsigned int num_irq_pins;
 };
 
 struct airoha_pinctrl_match_data {
@@ -140,6 +141,8 @@ struct airoha_pinctrl_match_data {
 	const struct airoha_pinctrl_func *funcs;
 	const unsigned int num_funcs;
 	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_MAX];
+	/* number of GPIOs wired to the interrupt controller */
+	const unsigned int num_irq_pins;
 };
 
 int airoha_pinctrl_probe(struct platform_device *pdev);
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index f505a3f69c5d..52a768c859b7 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -213,7 +213,7 @@ static void airoha_irq_unmask(struct irq_data *data)
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
 	u32 val = BIT(2 * offset);
 
-	if (WARN_ON_ONCE(data->hwirq >= AIROHA_NUM_PINS))
+	if (WARN_ON_ONCE(data->hwirq >= pinctrl->num_irq_pins))
 		return;
 
 	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
@@ -249,7 +249,7 @@ static void airoha_irq_mask(struct irq_data *data)
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
 
-	if (data->hwirq >= AIROHA_NUM_PINS)
+	if (data->hwirq >= pinctrl->num_irq_pins)
 		return;
 
 	regmap_clear_bits(pinctrl->regmap, gpio_regs->level[index], mask);
@@ -265,7 +265,7 @@ static void airoha_irq_ack(struct irq_data *data)
 	u8 offset = data->hwirq % AIROHA_PIN_BANK_SIZE;
 	u8 index = data->hwirq / AIROHA_PIN_BANK_SIZE;
 
-	if (data->hwirq >= AIROHA_NUM_PINS)
+	if (data->hwirq >= pinctrl->num_irq_pins)
 		return;
 
 	regmap_write(pinctrl->regmap, gpio_regs->status[index], BIT(offset));
@@ -273,7 +273,10 @@ static void airoha_irq_ack(struct irq_data *data)
 
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
 {
-	if (data->hwirq >= AIROHA_NUM_PINS)
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
+
+	if (data->hwirq >= pinctrl->num_irq_pins)
 		return -EINVAL;
 
 	if (type == IRQ_TYPE_NONE) {
@@ -304,9 +307,11 @@ static irqreturn_t airoha_irq_handler(int irq, void *data)
 {
 	struct airoha_pinctrl *pinctrl = data;
 	bool handled = false;
+	unsigned int nbanks;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(irq_status_regs); i++) {
+	nbanks = DIV_ROUND_UP(pinctrl->num_irq_pins, AIROHA_PIN_BANK_SIZE);
+	for (i = 0; i < nbanks; i++) {
 		struct gpio_irq_chip *girq = &pinctrl->gpiochip.irq;
 		u32 regmap;
 		unsigned long status;
@@ -340,6 +345,22 @@ static const struct irq_chip airoha_gpio_irq_chip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
+/*
+ * Mark the GPIOs that are not wired to the interrupt controller as not
+ * valid, so that gpiod_to_irq() fails for them with -ENXIO instead of
+ * handing out an interrupt that can never fire.
+ */
+static void airoha_gpio_init_valid_mask(struct gpio_chip *gc,
+					unsigned long *valid_mask,
+					unsigned int ngpios)
+{
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
+	unsigned int num_irq_pins = pinctrl->num_irq_pins;
+
+	if (num_irq_pins < ngpios)
+		bitmap_clear(valid_mask, num_irq_pins, ngpios - num_irq_pins);
+}
+
 static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 					struct platform_device *pdev)
 {
@@ -362,6 +383,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
+	girq->init_valid_mask = airoha_gpio_init_valid_mask;
 	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
 
 	irq = platform_get_irq(pdev, 0);
@@ -848,6 +870,7 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 	pinctrl->grps = data->grps;
 	pinctrl->funcs = data->funcs;
 	pinctrl->confs_info = data->confs_info;
+	pinctrl->num_irq_pins = data->num_irq_pins;
 
 	err = pinctrl_enable(pinctrl->ctrl);
 	if (err)
diff --git a/drivers/pinctrl/airoha/pinctrl-an7563.c b/drivers/pinctrl/airoha/pinctrl-an7563.c
index 40cbbe90cc46..f011c6c9ccce 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7563.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7563.c
@@ -1069,6 +1069,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.num_grps = ARRAY_SIZE(pinctrl_groups),
 	.funcs = pinctrl_funcs,
 	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
+	.num_irq_pins = AIROHA_NUM_PINS,
 	.confs_info = {
 		[AIROHA_PINCTRL_CONFS_PULLUP] = {
 			.confs = pinctrl_pullup_conf,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index 2fcf88106e11..bfb777594811 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -1441,6 +1441,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.num_grps = ARRAY_SIZE(pinctrl_groups),
 	.funcs = pinctrl_funcs,
 	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
+	.num_irq_pins = AIROHA_NUM_PINS,
 	.confs_info = {
 		[AIROHA_PINCTRL_CONFS_PULLUP] = {
 			.confs = pinctrl_pullup_conf,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 2c3a75c35915..1cd0f442ddc1 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -1471,6 +1471,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.num_grps = ARRAY_SIZE(pinctrl_groups),
 	.funcs = pinctrl_funcs,
 	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
+	.num_irq_pins = AIROHA_NUM_PINS,
 	.confs_info = {
 		[AIROHA_PINCTRL_CONFS_PULLUP] = {
 			.confs = pinctrl_pullup_conf,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
index 5aa39bacf460..b0c5e60f0aeb 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7523.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -1113,6 +1113,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.num_grps = ARRAY_SIZE(pinctrl_groups),
 	.funcs = pinctrl_funcs,
 	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
+	.num_irq_pins = AIROHA_NUM_PINS,
 	.confs_info = {
 		[AIROHA_PINCTRL_CONFS_PULLUP] = {
 			.confs = pinctrl_pullup_conf,
-- 
2.34.1

