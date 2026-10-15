Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60751616C;
	Thu, 15 Oct 2026 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061672; cv=none; b=ryLCIBFJR2G+N7wyT7bAlXbsIxx98TwW4hNUmpBgokhJTEbfUWhsnRSvu7l+edSeVa7LiEsoyeLpdz+LxRmD08s7jRXbXbS7dK74ML6zTV2zjrsRCMU6AG6hfKguG5XCzaAv2U/uIkzRUKZdx6y9epnqi4YGIsofE98aMjh+o8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061672; c=relaxed/simple;
	bh=XSOE9bfWbP21F8YLkxpDFq7Sh/eldUUSTvBIWHPH2h4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PUaK0by3lOA8jlhZ8NlQh+L/kgPnW4LLNLPrl+5un50iEo/ay3B3yHn4XyOBecLE3FBCGd1vgNiJaYw9CccaiQ1mME5VlYbjH2akUGUJsYQn5EKOdvJO/XvEf6GFB+knecj4d8aAMJmkP6kDd//ptFUuXuzDMKgqeCevVbfuymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAUOpi0S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAUOpi0S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D1E4C2BCC7;
	Thu, 15 Oct 2026 10:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792061672;
	bh=XSOE9bfWbP21F8YLkxpDFq7Sh/eldUUSTvBIWHPH2h4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AAUOpi0SVsc3q64NbxFNk6wgkKeuuAECb0Jo6AeXHKgr7g9eralH6l4DmOahwl8Q7
	 nI2OiDPBsYvRU/cGBQINBSWwzI7gHdKm9MRxeyUXT9pn5adxe/Xds+CjcRd33f7OBm
	 GSa/ERPftNHXsq+St45TVZGXr8cjO0jcHwIeaFnXITRFsH5TEkaCQC1Byj9CTsD1wR
	 FwTmmqiH2D6L7/g5svpSjU7exsppdv2wpH38YT16gmyragGfHlaSS2nSZFiI0KIb5n
	 V+5Voqu3U2SGy85MWJtySHHLPgjkqkBzMgdURFxaPt2YjxV6hlr/6lutr5Mhww3azc
	 RVniktUh+4LQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFADCC6B34;
	Thu, 15 Oct 2026 10:54:32 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 15 Oct 2026 18:53:35 +0800
Subject: [PATCH v10 8/8] gpio: pl061: add Ambarella register-layout variant
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-cv75-gpio-v10-8-3fe3eb315a55@ambarella.com>
References: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com>
In-Reply-To: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061669; l=4175;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=nuJGzmyUEPX5sPekFa33E3GZ5ZG3z70+67I9AjnvK+o=;
 b=NNnby6/P5sSr1obZxqeztJIfAc+VOSZv0TOIuviFEtxshMzM8JCgYCf+Fn1vjvTwwQi4LttRT
 0Lzyei+e9qFDxYWgjRSoD9ySo85KvZEj6gnDptgJjF06xhFceAA7tcY
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Add a 32-bit, 32-line layout with DAT/DIR/IS/IBE/IEV/IE/MIS/IC plus
MASK and ENABLE. Probe unmasks the bank and enables the controller.
IRQ type changes also clear the pending bit. This derivative does not
need write-after-direction or system suspend save/restore.

Cache DAT (REGCACHE_FLAT_S, not volatile) so gpio_set() updates one
bit from the output shadow instead of read-modify-writing the pin
level across the bank.

Match the part with designer AMBA_VENDOR_AMBARELLA (JEP106 identity
0x68, bit 7 set) and part number 0x061.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/amba/bus.h  |  1 +
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 3822faa3e276..075af7985d89 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -38,6 +38,18 @@
 #define PL061_MIS		0x418
 #define PL061_IC		0x41c
 
+#define AMBARELLA_GPIO_NR	32
+#define AMBARELLA_DAT		0x00
+#define AMBARELLA_DIR		0x04
+#define AMBARELLA_IS		0x08
+#define AMBARELLA_IBE		0x0c
+#define AMBARELLA_IEV		0x10
+#define AMBARELLA_IE		0x14
+#define AMBARELLA_MIS		0x20
+#define AMBARELLA_IC		0x24
+#define AMBARELLA_MASK		0x28
+#define AMBARELLA_ENABLE	0x2c
+
 struct pl061_regs {
 	unsigned int dat;
 	unsigned int dir;
@@ -93,6 +105,17 @@ static bool pl061_arm_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool pl061_ambarella_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case AMBARELLA_MIS:
+	case AMBARELLA_IC:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static const struct regmap_config pl061_arm_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
@@ -103,6 +126,16 @@ static const struct regmap_config pl061_arm_regmap_config = {
 	.use_raw_spinlock = true,
 };
 
+static const struct regmap_config pl061_ambarella_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = AMBARELLA_ENABLE,
+	.volatile_reg = pl061_ambarella_volatile_reg,
+	.cache_type = REGCACHE_FLAT_S,
+	.use_raw_spinlock = true,
+};
+
 static unsigned int pl061_line_mask(struct pl061 *pl061, irq_hw_number_t hwirq)
 {
 	return BIT(hwirq % pl061->data->ngpio);
@@ -338,6 +371,19 @@ static const struct pl061_regs pl061_arm_regs = {
 	.ic	= PL061_IC,
 };
 
+static const struct pl061_regs pl061_ambarella_regs = {
+	.dat	= AMBARELLA_DAT,
+	.dir	= AMBARELLA_DIR,
+	.is	= AMBARELLA_IS,
+	.ibe	= AMBARELLA_IBE,
+	.iev	= AMBARELLA_IEV,
+	.ie	= AMBARELLA_IE,
+	.mis	= AMBARELLA_MIS,
+	.ic	= AMBARELLA_IC,
+	.mask	= AMBARELLA_MASK,
+	.enable	= AMBARELLA_ENABLE,
+};
+
 static const struct pl061_drvdata pl061_arm = {
 	.regmap_config		= &pl061_arm_regmap_config,
 	.regs			= &pl061_arm_regs,
@@ -347,6 +393,13 @@ static const struct pl061_drvdata pl061_arm = {
 	.reg_mask_xlate		= pl061_arm_reg_mask_xlate,
 };
 
+static const struct pl061_drvdata pl061_ambarella = {
+	.regmap_config		= &pl061_ambarella_regmap_config,
+	.regs			= &pl061_ambarella_regs,
+	.ngpio			= AMBARELLA_GPIO_NR,
+	.clear_irq_on_type	= true,
+};
+
 static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct gpio_regmap_config config = {};
@@ -517,6 +570,11 @@ static const struct amba_id pl061_ids[] = {
 		.mask	= 0x000fffff,
 		.data	= (void *)&pl061_arm,
 	},
+	{
+		.id	= (AMBA_VENDOR_AMBARELLA << 12) | 0x061,
+		.mask	= 0x000fffff,
+		.data	= (void *)&pl061_ambarella,
+	},
 	{ 0, 0 },
 };
 MODULE_DEVICE_TABLE(amba, pl061_ids);
diff --git a/include/linux/amba/bus.h b/include/linux/amba/bus.h
index 80a74cd2da7e..411533bfa61d 100644
--- a/include/linux/amba/bus.h
+++ b/include/linux/amba/bus.h
@@ -98,6 +98,7 @@ enum amba_vendor {
 	AMBA_VENDOR_ST = 0x80,
 	AMBA_VENDOR_QCOM = 0x51,
 	AMBA_VENDOR_LSI = 0xb6,
+	AMBA_VENDOR_AMBARELLA = 0xe8,
 };
 
 extern const struct bus_type amba_bustype;

-- 
2.34.1


