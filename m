Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987759;
	b=cmIt+UpnZAhXUeX4pXvVq2v7M97ixORRF1csYjX/2Y6pGobWaucYP5OCnjFKKHU5l971
	 HA80bhZBM+3VgGqPkjK2thE/RcFI/JIdaeTBlYB3ZlFBfMHbvrItJLMFPpyd1y6xOepXJ
	 ld954MX0apP4vpgf84qcNCGdVD0a8Q9l3QXKXqczcl+wZc3lValFXsbpPPNFq9g0tw04l
	 dPYcn0exPSo1peVVotD3MCj1pSCe0YzU9DsIm4f1RdTJjyBUAwGO566oNNbxIL4+7wSHe
	 ZE7jUhb/fvMjan17yoEAgzyGiuuXbLf4iz5uFKxreoWsbu0dkqefikmaitMgULmCL3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987759;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fzeHN8d8bldbeF38ydgew++Q3qGE0jDgmAbkpjww+F8=;
	b=piwL1NeogqnKm6XvHFagcxfctIvn6sSZI1Ujr+jAs5jh7YHNrXqTYCwp5z8Q5OnqeXh0
	 f55/+U5UibAtzQon+xmbLmrVtOJOl+zM1vjxlHnV7qdmHHngqD5+SWcpQBKQvjvVXiEqD
	 YH+x/XyoDNcCk+s6XUbA42cGe3JKicVKm3jJvu0eO3hdv1CKiIKnTrFoOM8rlcc7oA1x1
	 XR5m/u8Ma97axu46yoQu4qR2ea4v1XNQWGG5jz/fbSxbnfAvzmvLm5F/etQjSnkY6QD2W
	 BgwqQv89sFZG2aztbI3hOgVKd4qkeIzA6lwhVoux+BRMy2LXvD3Rr4cSYD+3BzUi1cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvuVqmMY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F42460A2622;
	Wed, 18 Nov 2026 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvuVqmMY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794987758;
	b=MGcZWxQVfUxczKwvd2ITzsmVFuwCA+kuoUyD3BWf+yDLVQ/Cn+pyXylbPmJzockAP6KV
	 P4GFLqiPo7h/eAltxU+oHIuhDnlyZW7IfSs82P/jVIUoagkDCRNjWw4RglYITR6C25Xmh
	 iGXaslYqdUsNtMLndfIBYS717h8S6/vydJNXpJb1E6eGmLfYE7R83RH+RqF45UKQSOuyu
	 +z+PPN+6a2p3yGPC/SKX24N9YEyux4i4p+YTSIZEqyLfGqcuYRtE42gMDtUViLq5WEYGh
	 ay5rrsWYVJ4S7tWSN5neueFqaq+J8agxTtG+B5FDS6XD69/FeeV29dWnUlh7bbBb4IA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794987758;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fzeHN8d8bldbeF38ydgew++Q3qGE0jDgmAbkpjww+F8=;
	b=nHESpf/Chbsic9ftoMxVD2Vit1jXeToKu89On0uSqVkqpC+0HyQjPGTYDXSJ1My6Hr7K
	 qOMNJTwiH2nhCF98P99lL8Dv5TGnV0NxSkGtg9CfQmuLLRIIeTDwdC0qwZLe60uko9ACz
	 tv9Q/VKsNEHwC+YIewbBy+/LTItayp/DJvN0rzuUCqGnV5r0G/ZnPkhxzxPwFQOSVMD6b
	 RvWvHzhkXtNWBTq1COdERhW9tNlsG4M4kGK421GLRpHHTW2J5pXF9ykqYLnCD+abeh19J
	 AlU1wBfCgc19kuX+RMkOWTnKxAX7WJ73noVQGGq0xEA5Uue7QVWkbdCGQdEcbmHENPg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 504271F00926;
	Wed, 18 Nov 2026 07:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987758;
	bh=fzeHN8d8bldbeF38ydgew++Q3qGE0jDgmAbkpjww+F8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fvuVqmMYpDf1D54gcr9+3AV/y6w5DRph7FxLVmqoyiRBHQMrXLh5/bBRCBtWAiP/P
	 kKpTW9vaqo5YKvNhb7fDvdVeo+l1Sq+9ZeWJ5C/bTesbhej32QipZmKF7f1mkoN0Pa
	 t4E0LyR0j0zBgs0qOxpzhrcj7Ce7/0cAWrqG3fbDH/pwn8lRfB2XEiBchSeTxDGB11
	 Zd2Hnbl8S1mPxQu2gsI6ZIaWL1wReCyKsRogbmKEgSDcbnXWi5KClvYMYRxgppYVM2
	 SUolgtat4aSQcDKp7+VmUSOQLMlC3oVCJppyhDYIDg4uMASYL01GMkRGk/NLZb8/1l
	 JyjCDk24jHNMA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 794BF4AC7E;
	Wed, 18 Nov 2026 07:42:35 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Wed, 18 Nov 2026 15:42:28 +0800
Subject: [PATCH v15 11/14] gpio: pl061: add Ambarella register-layout
 variant
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
Message-Id: <20261118-cv75-gpio-v15-11-e3c563673fe1@ambarella.com>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
In-Reply-To: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987752; l=4176;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=+FQ7ek8nO4X0Qa1cFQcJ8+CLuyvL3JmOgFFPFnQtJrs=;
 b=2msvk5QAtOUI7yv0miDR54KHSYDXZ6GVB0FaRALj17Kjce0lNKqATe8J4fQZGRZl5T4I6d6EP
 Szbet85BBuYBZdZ6NCoDaMSGbq6/uWsesCBK80xe9c1gUTNJpbRnh25
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

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
index db3d02976383..c0a3a8b5c2c1 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -40,6 +40,18 @@
 #define PL061_GPIO_NR	8
 #define PL061_DATA_OFFSET	2
 
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
@@ -95,6 +107,17 @@ static bool pl061_arm_volatile_reg(struct device *dev, unsigned int reg)
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
@@ -105,6 +128,16 @@ static const struct regmap_config pl061_arm_regmap_config = {
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
@@ -382,6 +415,19 @@ static const struct pl061_regs pl061_arm_regs = {
 	.ic	= GPIOIC,
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
@@ -391,6 +437,13 @@ static const struct pl061_drvdata pl061_arm = {
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
@@ -567,6 +620,11 @@ static const struct amba_id pl061_ids[] = {
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


