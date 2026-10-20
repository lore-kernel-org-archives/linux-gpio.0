Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792482884;
	b=K8q8hJoEaeljpJB9LmYFs3MVxdK0b3tY/QKy3x7s/f0BSzlJjZ+hPN5XWlLDidukI3T8
	 yiWOboqOEgBmGfCUbe+3zjFZap5vO7pcZjX/yO3uvYoSXfHAAK1y/osPFEB0+SCGd8XV0
	 WVNqQIIIxkcU1ujVSw2ptOOI8Fx9J94k1D1+t50M9Si/NLQWRZW9chseywGoj1GkGmcUe
	 aQGAdxEUgKAvxlyp+ehHQmSwVU+qOJ/zO+Xj3YoW/0Fi2wXOl+i6Z6T3Kijjp6WlEzr82
	 8TgwzcFbMvei/Iwov47SwJHBm7rT4iZbvAw/ehXiEoABabGIoctRKYDiumnrwzDVw7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482884;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YYEvDCl427yemRvQ7/XiI3fZK7cfnZX8saZ9VifHjAI=;
	b=U0JeYgNlv7z9r6yOnKEU6T45GiiyWH0PoV19mIPzDJyHZxi2T2jXDC/M/GnVsKbZbdb8
	 NUJdOAULFMp+rgDshyNJ0GO2mBvlAVheGoblJkLXT4IK/cbvuOSjCCQE8lADBZ73Z2gsp
	 +KmGG4BxaYVK54Pc6y1GZmjKxTsViLoyg5HHxlb5lO4gNnKrvayLRsRg+ffTyuRY8AJL2
	 eRzsFtABd5xwWAh+4agKzmdn6d2dHj3fQZRtzIQGnlDqN2eEQzccjynXbvROQQp+LOhH2
	 G5ud7KBkQkaIh1f5ZyCOwrftfrzDjPgXlSrpMYWkWyxwOQOHVBENKb56FCVasYXWTsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bF41dynU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B38860A2608;
	Tue, 20 Oct 2026 07:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bF41dynU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792482883;
	b=MXDeg4Us0895CYPOxN5cPJD8cAkb99DjIB0tpCCIzKvgqXVO/NNVrtJtDSqRRtf9NQLb
	 Qw7WeqV89lGmG1wFr12D+tNP+oWo7OBBVGjLBXcoKZr8JDZy9txTMpQ+PSa2//iCqishI
	 3zv8pEFeNXEgcNqLz6GRWTLnCrZItAw32qcQQ7Q4XDbnygNkF+JewoMI+5BDTbldeA2Sc
	 +0jZ9uuIj83jdrEsdovoxv88bW0to6sQKdeKqzUsW6tmTlR/XFai5aBi4xofN7RqOqEBW
	 Y5i8zvKAyg2Rt7eyURS2LqWAe54LH9tlQ4nG1MyhPOFYDfLGV5mLXuNLg+X4H3mwDmA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792482883;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YYEvDCl427yemRvQ7/XiI3fZK7cfnZX8saZ9VifHjAI=;
	b=PTkRBPkelyaOV65UBMxpT4WAiZrDXJvVchaMvBDwuyT9cZ8I5icHtuyykFKe4md2ST2v
	 KLV+As0iCH9WtCOsxaRZ8zcZiBYVCcaj+cTrcoQqOhxEJOtiI7mFKRqdo/Gas4QQJeV8u
	 wwcy4iL6N5t2bZlNcu9iNk40vbhLggC6BloKCl/XWd5U39i6QvYMJW09y0YiEOkvvaUhu
	 1gVGWte0iZtisbk6HZKtfCR+2rK7sZLJFkN5aVbxr6dA1AnUf5pFd7AgAVTYXJZmaCsrQ
	 NDJ+9WKWDRz4I29F0yv4phUfmOAtPF43immCBvGpbbDghUqZEXLELqHs9LiNlpAuYzg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6EBA1F000D3;
	Tue, 20 Oct 2026 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482883;
	bh=YYEvDCl427yemRvQ7/XiI3fZK7cfnZX8saZ9VifHjAI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bF41dynUEfzcfhCi8bKxuUmEcT2aNr0/biURlUi1aDmQsNeXRbKYB+bhP/wvY+5NN
	 iZPskbR5COsMlmTO/gswgmtahaqD/VjPNaME51AjOJWuOPBgqECysVZYz9VzQCL0GS
	 VZ6WTt9bdQHCTzt0lW0zFrH0trDN/tRwsjuhdcl3h7bxbXLP+67NW8v7MGVZgghCrx
	 ZsEtWdFIgMfbHwWP1o/WeHM3fd4z/mv6QyQcJR1tIZMaZId6MI39RgDoBpyjfi5q4r
	 yWCGs+pBqbWg0JILGcnPrbkE/yTpo2jIs0IMmt+msqo5YV7AJ9wWlws3iUbMRPoipo
	 t43tPMBB/AVEQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ABF13430A8;
	Tue, 20 Oct 2026 07:54:40 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 20 Oct 2026 15:54:13 +0800
Subject: [PATCH v11 9/9] gpio: pl061: add Ambarella register-layout variant
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
Message-Id: <20261020-cv75-gpio-v11-9-e058bae19571@ambarella.com>
References: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
In-Reply-To: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482878; l=4176;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=2uDxqZhVJnIpg09mNLOg/k2Rrl91j8nI5GQMhqJH+5M=;
 b=GYS5gG6H7t6JYDGf5IdKOL9zJV/2LDm4j8yOkGzI1X774ZixJwX+uTxHAlcacAKYB7tInf3vH
 F8vqSiay8dPA1TDvl2fEhH5aWSNowvwTrVDkEJ5KtXhg+fidVua69cs
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
index 3d04f8c2a5c6..27d88c8cbcfe 100644
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
@@ -521,6 +574,11 @@ static const struct amba_id pl061_ids[] = {
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


