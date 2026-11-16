Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851346;
	b=JEhGvi7K1xmm1tHS/PqaY48LUhcbeE0xGW0ycd5hBSoVFDwwaQT1LD1gaYRPo3Z/9os5
	 9s7MS0zybQwJQuwphAPFXadGsqBRaMLA+eykCyEUfWrjj5rEmGMWka8rTxHgLCeo/CwfQ
	 jM3BYSZjlBL7X7/6HI5Q/bf2FsccVH8b/oEopU7wBesjlrS3qDSqLfEpPjILSm2mxUc/g
	 viOO6sNLpQd2G9AjVPtLbjXGDlanr91TKZXTpnnFr52HrJUYlkl5X4ktrrnUZPIASgyum
	 4u4ePCNzat9aDPvzFWmGwPJ/HPMigW5aPJu/DVZt1i2AvFIBK2xPNanBX3245TnopDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851346;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Hs8L4oSM/KeHXo/QqE3JZ5ZtUqINEGmmyvGUPLPWHqk=;
	b=4qkIii7Ndz9Huvy/GEwXTrAQ7Auck73h80QDgVsUEHwbJ5lWHR8badfp0XbrVbUKMbSm
	 gfNKaGIMP6W5NQGop0bJ62ha3zYpQYhqKYVbjWceYi/kscdGZF+6/mfS4IPWjEV/yzx2z
	 XyZskkWFu1rfWvCie2b2o9JFZ37FApmIpP34jfLcZXLImFXUvt3Z7exUSEm+H4it0fx4v
	 wsfEWJoUjW6D+lh2lGZ5C9toV2y/uJ+JMxxefvbvnJI8IYHeZn4DwTvwY1pUCAR8ijzxI
	 HypXGz3vcgGtcQ2lW5cwbG46ewgL6o/d1e7WrrTE2BlFFREXYkth9cPvViU/hTmUzHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D10E606A32A;
	Mon, 16 Nov 2026 17:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D10E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:e6fc:5f71:2c1e:7d62:945f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xT0pB-004GcH-1l;
	Mon, 16 Nov 2026 18:49:01 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v3 1/9] pinctrl: airoha: make gpio register layout per SoC
Date: Mon, 16 Nov 2026 18:48:46 +0100
Message-Id: <20261116174854.342912-2-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116174854.342912-1-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
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

The GPIO register layout is fixed to 64 pins in two 32 pin banks and
four 16 pin direction banks. Every SoC uses the single static
airoha_gpiochip_regs and the compile time AIROHA_NUM_PINS.

Move the layout into the match data. The gpiochip register table
carries its own pin count, and the five existing SoCs point at the
shared 64 pin table.

No functional change for the existing SoCs.

Signed-off-by: John Crispin <john@phrozen.org>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Add the Acked-by of Lorenzo.

 drivers/pinctrl/airoha/airoha-common.h  |  6 +++++-
 drivers/pinctrl/airoha/pinctrl-airoha.c | 14 ++++++++------
 drivers/pinctrl/airoha/pinctrl-an7563.c |  1 +
 drivers/pinctrl/airoha/pinctrl-an7581.c |  1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c |  1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c |  1 +
 drivers/pinctrl/airoha/pinctrl-en7528.c |  1 +
 7 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index 16f7abcdfb83..850e733db15a 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -89,6 +89,7 @@ struct airoha_pinctrl_conf {
 };
 
 struct airoha_gpiochip_regs {
+	unsigned int ngpio;
 	/* gpio */
 	const u32 *data;
 	const u32 *dir;
@@ -99,6 +100,8 @@ struct airoha_gpiochip_regs {
 	const u32 *edge;
 };
 
+extern const struct airoha_gpiochip_regs airoha_gpiochip_regs_64;
+
 struct airoha_pinctrl_confs_info {
 	const struct airoha_pinctrl_conf *confs;
 	unsigned int num_confs;
@@ -126,7 +129,7 @@ struct airoha_pinctrl {
 	struct regmap *regmap;
 
 	struct gpio_chip gpiochip;
-	struct airoha_gpiochip_regs *gpio_regs;
+	const struct airoha_gpiochip_regs *gpio_regs;
 	unsigned int num_irq_pins;
 };
 
@@ -134,6 +137,7 @@ struct airoha_pinctrl_match_data {
 	const char *chip_scu_compatible;
 	const char *pinctrl_name;
 	struct module *pinctrl_owner;
+	const struct airoha_gpiochip_regs *gpio_regs;
 	const struct pinctrl_pin_desc *pins;
 	const unsigned int num_pins;
 	const struct pingroup *grps;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 52a768c859b7..b50108826d8d 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -94,7 +94,8 @@ static const u32 irq_edge_regs[] = {
 	REG_GPIO_INT_EDGE3
 };
 
-static struct airoha_gpiochip_regs airoha_gpiochip_regs = {
+const struct airoha_gpiochip_regs airoha_gpiochip_regs_64 = {
+	.ngpio = AIROHA_NUM_PINS,
 	.data = gpio_data_regs,
 	.dir = gpio_dir_regs,
 	.out = gpio_out_regs,
@@ -102,6 +103,7 @@ static struct airoha_gpiochip_regs airoha_gpiochip_regs = {
 	.level = irq_level_regs,
 	.edge = irq_edge_regs,
 };
+EXPORT_SYMBOL_GPL(airoha_gpiochip_regs_64);
 
 static int airoha_convert_pin_to_reg_offset(struct pinctrl_dev *pctrl_dev,
 					    struct pinctrl_gpio_range *range,
@@ -207,7 +209,7 @@ static void airoha_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
+	const struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
 	u8 offset = data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
@@ -244,7 +246,7 @@ static void airoha_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
+	const struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
 	u8 offset = data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
@@ -261,7 +263,7 @@ static void airoha_irq_ack(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
+	const struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
 	u8 offset = data->hwirq % AIROHA_PIN_BANK_SIZE;
 	u8 index = data->hwirq / AIROHA_PIN_BANK_SIZE;
 
@@ -379,7 +381,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->set = airoha_gpio_set;
 	gc->get = airoha_gpio_get;
 	gc->base = -1;
-	gc->ngpio = AIROHA_NUM_PINS;
+	gc->ngpio = pinctrl->gpio_regs->ngpio;
 
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
@@ -831,7 +833,7 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 	pinctrl->desc.pins = data->pins;
 	pinctrl->desc.npins = data->num_pins;
 
-	pinctrl->gpio_regs = &airoha_gpiochip_regs;
+	pinctrl->gpio_regs = data->gpio_regs;
 
 	err = devm_pinctrl_register_and_init(dev, &pinctrl->desc,
 					     pinctrl, &pinctrl->ctrl);
diff --git a/drivers/pinctrl/airoha/pinctrl-an7563.c b/drivers/pinctrl/airoha/pinctrl-an7563.c
index f011c6c9ccce..6a2a307807e3 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7563.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7563.c
@@ -1063,6 +1063,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
+	.gpio_regs = &airoha_gpiochip_regs_64,
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index bfb777594811..6bec1d44b8a0 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -1435,6 +1435,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
+	.gpio_regs = &airoha_gpiochip_regs_64,
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 1cd0f442ddc1..2689bbd9ebba 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -1465,6 +1465,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
+	.gpio_regs = &airoha_gpiochip_regs_64,
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
index b0c5e60f0aeb..1589acef683f 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7523.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -1107,6 +1107,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.chip_scu_compatible = "airoha,en7523-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
+	.gpio_regs = &airoha_gpiochip_regs_64,
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7528.c b/drivers/pinctrl/airoha/pinctrl-en7528.c
index f6c8f834421f..9854e9530219 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7528.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7528.c
@@ -1155,6 +1155,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.chip_scu_compatible = "econet,en7528-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
+	.gpio_regs = &airoha_gpiochip_regs_64,
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
-- 
2.34.1

