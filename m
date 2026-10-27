Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793074775;
	b=yUehD4oOUXrAcJoEk39zzQXTRXBWdf6w8URShSqX2bfos/9j2iKd4MTid0lGewB8HvWz
	 nwd5ZW/40yva/7FOVRPYLEBozuCrE2se3SF9WUHj7lMGlBAdFm8M++r19NPUGzlIzct7Y
	 QB0QuWW2o7wa+H6kEtsDaPsYuZk61QnKEWuPCfM0OLq4q2zMatC8RQ9QbgYPmqSIkq6+z
	 2/it4jKGjEUh3M8BoknxQTAmBAjFdUSCR6qe+46xkRWEysB7fnbDj5vvDjtjNfpQb64jP
	 6IiHkBj7nnR3lwOL0jANB1rxggf9rIDHmR+Xz09zYtuxLZaEOuxOTmp+b0naVeklj0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074775;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nMGVN4Brm1hv3RThGOdhh/STGFHjMhLVYTs/wmJkCMc=;
	b=exX7n4XAEBSnj8+ApKRitaKNcJplVdAENrcadGw3Z6XhcXC3AsLbDIG7f/4cN5aHiLZs
	 1/SQl58W1q5jElFLKDiC2/3t0/p9J59lBG0fPFqrvPGX9b9W5HYKlk9liUo59kXlXpDRy
	 5eVGbqTUzU8LNHpuXXr6P2vpyl2qaf517a9KkN/lEPsujk1yAuMARAp9uOnQsL2jLZBsF
	 gIIKIKx6zkpGA/Uv16ALW2Wm118Kp/VXZeq7VnnLSILKPzqc3yAv7co5u8HD+dQyOdcGF
	 tHl853MuSuULDrCfPSVLVmQ86gNZtdbVUa021N/v7otKB06kZuryEEYnIBiXQOPZf9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQcau29y;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575FF60A2603;
	Tue, 27 Oct 2026 04:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQcau29y
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793074770;
	b=TgWzaLxpX9y+axBCoxc6Vx8/HFefmDbS2sukK5mfHC337gOvcjbnuYdEtB8pJ0zRug7U
	 ewxaqAE+FxSwjCXK1x5saF/im5sNHdoWNkA+OIKLXIMtGcp07bLrpV7FTRIqQDR8ND2yV
	 C/ZaORayIuidaOCdCkLIAvEj3UkVRbL0t8jZToCrwnbOP+skoQuhLe1aZzl8K8GS9bDez
	 3u74v1wGoFxW+wgUKnXugUvCOTS6XEzXqZBcpJ2HxahLWmfhxMsgfG+386GVAcCtUccoN
	 K0L79fjSTPwn7RQR/cCgBh/jQUOOg8Pa/6u8VV+r0oxSZg7jCxUkkDtUZ2vAQm7tVlw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793074770;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nMGVN4Brm1hv3RThGOdhh/STGFHjMhLVYTs/wmJkCMc=;
	b=BmHl542f7JjR/icGE9K5vaO6cbMpmUvdMQwuwZlfK5ZFNr80gegocpvEPn1Ei6J21yGe
	 iVdwb2FdRR8VUG6jq+i6xKOHlgWrvNbH88oC3bMWxuGXwDVIOLIU1cpROHcTIBWnywQ70
	 aMeT9MvKztRE7tmo8zMkxFf1fWx2wZYg0vv6dYkpvBfjxsQhvnJq3wkhRpuRd6KGT71AM
	 e1BMI7BmSNLTJEO3QDYwY/4YE59+NoLghlDwqJdzHabxwDTFZ8a0ap+CEZBV4MUf1z/mz
	 He88dRZtfrsBwmq6drvWF/u5/y5lDFoD4jg9fseCxMTDrHYwPT2aImDafHTOswX7INg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C52D1F031EB;
	Tue, 27 Oct 2026 04:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793074770;
	bh=nMGVN4Brm1hv3RThGOdhh/STGFHjMhLVYTs/wmJkCMc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hQcau29yf2Kfsrr/hN3EKW0ppYb5q3DJihhk2Rn9xAXHVC8ZkJxIu9zHESzTQ7RXk
	 bvQ3KIuyWR/v0u7EKWtRTPyGA/Q7kJJueirY2HSkixbGJjOu0IvlPOZlqVufNy32Tq
	 V3GDXuO1e3kyEFg59govdF7ZSAkIkdUBfL3P7hTFY/pUzJGgPb6yd+IxhziVP6AP6F
	 pZ7p16TNtuhDuVICP/oExYPCA1Jzzg4OJ3gWuRnQ5dqUFPMgrjxY1nvQRVEQ0vlaMH
	 rT6cTmfxNWgHoInzE3M01SE36msWmPGA69mj0rVGP2JJMk1P5kdaCKQ2cDw3CR5pH+
	 1rx1xb6UtkW7A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0D87B44FA4;
	Tue, 27 Oct 2026 04:19:27 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 27 Oct 2026 12:18:57 +0800
Subject: [PATCH v12 10/11] gpio: pl061: add Ambarella register-layout
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
Message-Id: <20261027-cv75-gpio-v12-10-c22555400e18@ambarella.com>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
In-Reply-To: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793074764; l=4176;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=G59jrHPBkzMwAhGAMQmJXrOsf/3XjraTolzCVFiEScs=;
 b=hREJ0T3PJGVPQDMc+kfMBJOE9EpuL6SQ4J2U/9hXWanBAIyq/yZSUhjwWIKt9/m6wjvp/4UH/
 hLZeEBEIff+DYAlezkOuchAMed4FVxbeJYH5CB2fQVXt8CpA/d+1+CA
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
index b715c3a2326e..0fb42c531451 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -39,6 +39,18 @@
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
@@ -94,6 +106,17 @@ static bool pl061_arm_volatile_reg(struct device *dev, unsigned int reg)
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
@@ -104,6 +127,16 @@ static const struct regmap_config pl061_arm_regmap_config = {
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
@@ -335,6 +368,19 @@ static const struct pl061_regs pl061_arm_regs = {
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
@@ -344,6 +390,13 @@ static const struct pl061_drvdata pl061_arm = {
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
@@ -520,6 +573,11 @@ static const struct amba_id pl061_ids[] = {
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


