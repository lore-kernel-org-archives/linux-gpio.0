Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDDD4CDDD6;
	Fri,  9 Oct 2026 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543580; cv=none; b=s+WiMBFtP6qBPCYg0+PwMOsftE7adR/A1fJrQKBjyZccICxdx4WtutVLvNQzny85NN2o7X81PDX4RBLLGz1eQSQw0X2Bp6RWZNrZZbNmtnZFyGzEQzuAg9jJjJs9d3U6YAwbBUTHLJ1q9OAaHuMWbgWk07TgEwNdrObEdxOFmDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543580; c=relaxed/simple;
	bh=85eIT4o/M2rEJoeOnVqScMNsV0MTYTeAJ3ECPzfcYCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZphXM327I3I9nQiAvwr+xdOK8M6z5JV7/oXcCsNF6O1nG3DwDTbENb+0RAEgdtH4x2zitWYGmLjBXJbv+67xYVtKYIxhaDpVESUmJitBsWu9OofNkDPocF06NxHibYElyWsyjoSEHmIrESZ6qD41acGvcLVo6G9/JOwhx7xYAUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxY/aGoJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxY/aGoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24F9FC2BD05;
	Fri,  9 Oct 2026 10:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791543580;
	bh=85eIT4o/M2rEJoeOnVqScMNsV0MTYTeAJ3ECPzfcYCU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DxY/aGoJCsV5nQ9nYN4DHJDBAUGeMIaI+H3nDHkF1o3hAdiAct3IKJ9+iYVZawq9w
	 JI/rGQgE0pT709uqM3w8198EOZe609QPTyk9DaVBd2h4RFElG/7uZE0kFBwYRbn3hw
	 R9BU1H6HzIT1Z6Pk5QdP8UOmga6lvXA4e+K9Hs+tujuMIVCDLDI4a+RLnwuQ+F51kc
	 4rtjMUyUIGvgMD9/R00fDoUqFU/+dJgiOJQ4y7huSBoQEsiLVDc2NII7vTEioEVo8k
	 tf/UpNCYJytIbB2Ass69O12Ixx46DpIHWCGrvrnjW1vFG4uTzG3OhPHT7g5t5EAoBl
	 SFXNd5hix+ang==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEE9CA6012;
	Fri,  9 Oct 2026 10:59:40 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Fri, 09 Oct 2026 18:58:00 +0800
Subject: [PATCH 7/7] gpio: pl061: add Ambarella register-layout variant
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-cv75-gpio-v1-7-5836bd438423@ambarella.com>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
In-Reply-To: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791543577; l=4039;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=+ZFH91SYcTapEqs5zs5i2KILpZNRDsWCcR4WyIWoj1g=;
 b=lgiv1XQ95H1EuTo549U19EvPh4CZp7GqJQnHRZea+XYQ0emIUKS5rf91b3ixaeUxloDtBLrB9
 1Mziqr0c+F0BjKB1fQDX44Bu52ZIj10RfACCQ13Sscc8jKbFw5QJHQD
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

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/amba/bus.h  |  1 +
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index ba3350a8971c..ccadeb118305 100644
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
@@ -318,6 +330,17 @@ static bool pl061_arm_volatile_reg(struct device *dev, unsigned int reg)
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
@@ -329,6 +352,17 @@ static const struct regmap_config pl061_arm_regmap_config = {
 	.use_raw_spinlock = true,
 };
 
+static const struct regmap_config pl061_ambarella_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = AMBARELLA_ENABLE,
+	.volatile_reg = pl061_ambarella_volatile_reg,
+	.cache_type = REGCACHE_FLAT_S,
+	.fast_io = true,
+	.use_raw_spinlock = true,
+};
+
 static const struct pl061_regs pl061_arm_regs = {
 	.dir	= PL061_DIR,
 	.is	= PL061_IS,
@@ -339,6 +373,19 @@ static const struct pl061_regs pl061_arm_regs = {
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
@@ -348,6 +395,13 @@ static const struct pl061_drvdata pl061_arm = {
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
 	struct device *dev = &adev->dev;
@@ -515,6 +569,11 @@ static const struct amba_id pl061_ids[] = {
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


