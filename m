Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD0364052
	for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2026 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931338; cv=none; b=jQWTvjRu7E1mljA8YMS6H5FMp9QEWAzetUXfQ6UIWur0JRYWyw6jlugd5eeMFUsWvT5fDhZPH+GN5h/pPcqkAHkkyn46ZmMRnnrASU4fP12/hKs/n9iK7nGHzqTHuM8wyK3ebvMLgvGveK4rAIJ0Gq2JuP0a/6RGgS/FZKv09dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931338; c=relaxed/simple;
	bh=SbhSZ2QAqRTMZFb+7jtsWIf2n79+rPx+nDhlyxQ5rto=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GqrTajYHyOFBK9LMBjuesCXt1kwRnRpoPRPRqICDIMEIOPvpDFURbexy5shuzKL7x6aDdCZWuJP+xvjpOD/y0te8UqGSNaZDO6QtgAqbK+Uba/x5/Hv/k8KkXBJ0WidKKDDKDxCZ2rZAH5mdMN3Z64+fMe8APujd9MowAb9rAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOACZPbV; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOACZPbV"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so815677a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2026 08:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931336; x=1788536136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVgxh9oUlB3e4bZmBcCaqz9cii+hpvVBbhiEnaUJ6LQ=;
        b=UOACZPbVn1rODBqTKSudUGB5Wvk4kU+tO3uH7zg0vgVDteq3e5OGsIDjKOn1rISnAL
         Yd33ms9E2Csep5l5lHzgtmvJuj5Vg5bKbfNZWo3ADxc9HZV8sar+ToGiVEFCGm4b5fcC
         dTQ7+u0qb+J2MGqyGQP29dyYWGp9nyeQhp1Q4jWNApP6FgSYkuLUra8Nws++OOaUq4wq
         LPsjWHR1eKW2HZD5A7LOJNufC/fL5XLKiu7Uk7e2la3SK0xw5HFILKqvBZYLN3EkzrB5
         a3nFUC239Y09u+0o+mTA2d8w4BZLQAlSdVLsnHlFjl90rOO+i6flN1KSjEmuE+Jd+j+c
         8ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931336; x=1788536136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EVgxh9oUlB3e4bZmBcCaqz9cii+hpvVBbhiEnaUJ6LQ=;
        b=UhYTUA3RUmKjjuWFg6nHtAa00nXEKYgito7q2LK4lZdmNKS9/FAMJ8RxbNv/h0IGZS
         1vhEyUwhV49j5eIC0yP5iGnE8mbeixt8DthAwPAhFTc9mbmAnUjYXFs8kpbx2oMCcDir
         tJUIHIQnbBKaY2zxPhIVx1OuMWaRLvBVwx3IM3iP/Ih65ePTj/K7GNQg6q4dO8U6qmNs
         eok27WwRpSdZwUmuD/mMsYsCy1avzAfsgvYhDGapZCRM7gkzIjEnQ1gwSY+enUMPuWOF
         Q+Ur/r9GOJdRgCihCp98uSd84Eujlqcohe324dbomzaedArrANUs9OptCUNr9ycDE5By
         /7Lw==
X-Gm-Message-State: AFuF++nXet80BrScriUACSGJLm9cmtt5u1Ylo1EEADhF+sytEPjU7BHk
	uuoHBgu7fnidH+Z2LJCXBzdGLWUgvp7sqhlP0tBe/CFFDFSHP0ySjc/NS9qrJhhrA88=
X-Gm-Gg: AR+sD13KqdgQ3x3jhNa4DHt/4iayHlqX1eUL15q1CMSbfemeS7IVqNjyHxGVDijwoUt
	F/9CAXQ9cykGRYvG5l1OT0xTkOTHKilylvCNsWK+QrUjSx2vx9Mo2pWxKeW0MLNyIS6Foee58Hx
	wvmHlV37+vysgKy/FrcOWSBGn6hnGkCAna7xInVt2WiR97Y3Xx1vWKJkczk5vT4xHeJxkKIGKxd
	mqTHwdZawjiBQhplpf0Kl6Zp8d3v14LcYJYasqpkCbWxnu3Mym9OUD6aBrZu1sKvUpBbt3T4Bh5
	Hqst/+meiQ5tYYFngaG2UGQJWHjC+6w1PvQYe8/IRTKgJ/h0TYOyifxyzmMNwyHAFJZ/w6MFKS9
	MOXKn97G7XO9snGR/fFfL44cJddHE83R0XrmvWWTKx2jjzhiNeFiWrVLZi3CF0NgrcfdHuhOD4Z
	mjcI50OX53Q6KaMjE6hsObHLIW6Zxkw3/ALJLTRo3bnx5037Dyoe7FtU0ggyk55IVBlmYKY1dtU
	VzfmcPihuQ=
X-Received: by 2002:a17:90b:1d52:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-396d10154abmr16419573a91.12.1787931336367;
        Fri, 28 Aug 2026 08:35:36 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([157.51.224.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm6256824eec.23.2026.08.28.08.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:35:35 -0700 (PDT)
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
Subject: [PATCH v2 1/3] pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
Date: Fri, 28 Aug 2026 19:35:13 +0400
Message-Id: <420a5e385cf7204318cdc1cc86a99570162e9b35.1787931313.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1787931313.git.naseefkm@gmail.com>
References: <cover.1787931313.git.naseefkm@gmail.com>
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
Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
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

