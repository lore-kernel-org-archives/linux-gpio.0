Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794285171;
	b=2CYaTJfcc35jL1oBXJDgVZ4+OizXns54D+4hNLQLNaP073f5E7XBjh2aGNrxO3od5E/Z
	 3wXO4N7K6DXOHSIxuwlfVIU3fsQ4+Eib8wDSs8eQBetbLEHpX7OaGXj7hhOd0Eo46ZZcY
	 rhiQjpAyuAxzXsd/luSXqmW8C4l/Te/I9cEquHU+Q6hg/9qO9JCY+CIJ/tckQfJAHdkN0
	 FPfCyenCDJaIbF8rm866O6Po4BNu+6O+gSvKWlQy/kOkLXUhF+nHWhZp0lbXCKwVPXmJS
	 LKdkHpPPk9uLOHoU2F59rDAJ3ZrXJrLQ+d/M4Oy6cJtuQpjPfcDK9bDaw0OlMXVRwfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285171;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fP4uhxWrwLj9+SVQejTRux8LxkoTj+venrMY0J0+WCA=;
	b=mbEOhXAW5g1Ax8Het6MnZ+7r8N2uOSgBDrF8+sWcSTGw94oeMAqWIGb7Z4WODWfehLwC
	 XvLqsTnI4H0m0O6qeJiiBBHI9I8twaHoesZoetGT9w/fo4kG9gvhvgIf4Pi65oLnOsdaP
	 +0qGX0swdbnYStoqu/H0rS3EXMMQe51F0BKu+uvWkx19nf67lhUlogrO+zclNIUQGL6L0
	 FBAlYoRj27nG5aZlNc+1d7pzECwUNzRiOupaaauB0o9ZmMIaXamVPLrQYH4ecvoLGmHvK
	 HHbymcf6SLW/6sSeVI5gDo2NQwQrK9dOQXjZgQhjwhqidcR0ItHwqfORdR8VhmEsgeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=es60UCzn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3452C60A263E;
	Tue, 10 Nov 2026 04:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=es60UCzn
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794285170;
	b=A78uhgMqLVPeUH2jEyugvnsYDj52L5OwjO9fejGxZt7bZkaFpRkv6SByY1ThUvDbHs9v
	 qYmZ+Yrs1/WReBTmDmcBPBqceMmf1QdynfKLYCjHS0p3gOX29/nqrFP2YvMtEAhASz7V/
	 EBgYzOOXarMVNgkzmx5iNy3QsG89+7KUN7pkYLzSJJxe/I77zMSSo+zEeGwbWaxeJQI6/
	 UgwXKRr8I9OV5HWOhWvvdNMNsiPnKnYloeIhIeqbx35U/DmXITuhpNpJ2hXvxOTgrNFG5
	 xgMslVYAv/j0XyFZnKfJ5Ct1nD/oZu4Rl+aWvZ237LA/0Jf2n77iIB7+Nq4T8KaK9ew==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794285170;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fP4uhxWrwLj9+SVQejTRux8LxkoTj+venrMY0J0+WCA=;
	b=BLDRkk8ub2lNfIboLLPxux69ymfjLSddk3YqjE/iJZyrsBdq0Kbp7oAc8YDiu+J5mpC0
	 7w6/OG3K2pNcqbgcHisCyuVndCUVjZAZEgEiGDrrQF6JP0U9oL6ESNugYWAAzn/oFvum5
	 UBcZxcmrvsNUzXRg78HjnAYP4iZLZOeadzmF+SSrojokhA16cQyilzCkUob/ZyTxLmR+y
	 bd2Tb9d792EjcYvt6Hp0EFXT+KSr6mPO7M8MYGJedLLKaWKOZiyvSNPD8ZDUx+K6oH6g2
	 o5gzKqfbzO1/4XDjUf4npJHuvK8fciZPy9aGgpFp98MwHdo5jBbsavN7aC9B5/ZXDtA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83E661F0089F;
	Tue, 10 Nov 2026 04:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285170;
	bh=fP4uhxWrwLj9+SVQejTRux8LxkoTj+venrMY0J0+WCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=es60UCzn3VES80fd7Psj7gC14NymKKZjNFxYEJR9GZ2ljOjdhNkzeZlCAbpUZhf+U
	 dKLZPWYylnJcLME8Caat7MPLXtv00/ewwEL4tsoouAC9kZ3+odFST5L2dQD7TVj8ma
	 ydDdT0ZDEOg8gD8AN+X4dSlSK8oazNpBMmzRonMOloNMFTGu3Y8qJIenb2ds/DBkNn
	 jp+9yXmvjXorijZL1R6dsdTx+sCibX8PM6x8qawHv9tdUYv+m1V6kNAdtS1i4KbPmB
	 9dtHZkoqQQQsd39XRwYzFDbpSc3Stb1ls5RfLpaR6k6nKdONXQ/jm5d0RVOPR4iR4d
	 srX3cOsHjJJbA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4DA6C48879;
	Tue, 10 Nov 2026 04:32:45 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 10 Nov 2026 12:32:36 +0800
Subject: [PATCH v14 11/14] gpio: pl061: add Ambarella register-layout
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
Message-Id: <20261110-cv75-gpio-v14-11-e586aad0467a@ambarella.com>
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
In-Reply-To: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794285162; l=4176;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=7PBsQ7BHt0WowwsQlVwR3GG8j78Lnd2HAGKwF7XYLks=;
 b=7NNUNZi+Y0ialnXX8hIEy01mHK1NzABGKvCh4HcFg3rjk324TAq1dKiZVOlmmHZZoGagrl1+5
 AYSx0B6djiqBSlb9Sr+Uk0yYlpeQDf1Vq4mKzv17b5eJV/eYDOmbcIZ
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
index cb1ef0f3774c..ff9215447bbb 100644
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
@@ -336,6 +369,19 @@ static const struct pl061_regs pl061_arm_regs = {
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
@@ -345,6 +391,13 @@ static const struct pl061_drvdata pl061_arm = {
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


