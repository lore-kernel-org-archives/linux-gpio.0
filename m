Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22D330BF4F
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 02:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788920048; cv=none; b=Nml3EFBRaPob59tN7uHWRX5dPpgwftq7lESJx8esvJej2I73y1yZt9NWbIRUSTwZKUDQ49aijaeuqNikhSbRGAfQFgT+9BFIxxpTULceAF9D62kctAcUUjdUHE/MOvyMk1nG9u/2vMCQ5ebp+thHv3LMGARECkctbZ2WOYXTZ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788920048; c=relaxed/simple;
	bh=GLIfJ96+dcTdrpDRB1wFAfzNxtk8q3YftB2AFNZLjfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDLloQzliw/k4Yjmbo3isWlpa2yiNSXKz10oKt9Io/KWPicnWX8TFg1pZR6yaHAcJ+5RoyYGOBaCiZHMdtHDDhSTfoxhMylrId8pNNCHmkg2XEl96re7ArLfymwyo75fvxLDufvUfTyXWWw89GC8b6Ma6+nvQ1oSgjacTpTtQyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qoswQpO0; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nl8d9+sN; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qoswQpO0";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nl8d9+sN"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hfkrX5F3czMlG6
	for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 04:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788920044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SpRuSsPJ57ViytWC3iX2AH5QJjTS6Q2cs39FSdDHC34=;
	b=qoswQpO0Nq4lVGS474e6JtbGWfj+78MUgFwbODTO2XhOPYRca9ImccKfIWVFnRtdRYMnlN
	h99YjzvX2UmDX5rgmAqCMQICrT3RHjBFWJk/Z+cm+Y3Z90Zdo1/mRgbPm8IIywNzIf3Rbr
	N995C8YQylOI56CRcuRDqv4UP4BB1B+5DV5bJYLUQ3ALiCRL07EOs51uzVvxj6UiNc6TaQ
	QjsKeOW5snYmq1EdpbrFR2/R7148gTFrds2uYELTxQ18Hpe4meU0tjkIGlDeIvk8smyCjl
	XWLan+JJQe/haWdxwlLKQcEbBXpjM7U+EqwWTXkk7AeZSuIlQVyXAFbFm3GolA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=nl8d9+sN;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788920043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SpRuSsPJ57ViytWC3iX2AH5QJjTS6Q2cs39FSdDHC34=;
	b=nl8d9+sNaRefxWTVhw1gTWRG/A8H6wOLxnD+52w7WbUtlU262/yh/E8e8kpnryt3UztxvU
	hJs8YaqzvnOMa5dOIeh1zJoJOKvlwWCpqJPIiIbbJCTFn7hnvlGqT1ziySyeZ3z8VUdc7Z
	RDWLNBPkv2w0gx+rt0bCKNlcEb7LhmmogLZzGbw9qZFXCgLcDRoWLoOzLfZKIfGmQ+0PW1
	AQrR9jFfkStoEciS7dB3e5lc8sBUULXUpVV68cVrJvu13RKAdJNtJVYr4V+n7ocI4oiZ1E
	5sNFIbrLqsBvyKZ+QL5R+c1lUhtLIztvl8WnSwkPADgWvU6sQasc9JZXfPIomA==
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [PATCH v2 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
Date: Wed,  9 Sep 2026 04:13:12 +0200
Message-ID: <20260909021354.135899-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909021354.135899-1-marek.vasut+renesas@mailbox.org>
References: <20260909021354.135899-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gz8rm9pws8bb6ppfhutenz31o7t5p3wi
X-MBO-RS-ID: ee4828a6142b1371a6b
X-Rspamd-Queue-Id: 4hfkrX5F3czMlG6

R-Car X5H (R8A78000) is the first member of the R-Car Gen5 family.
Add support for R-Car X5H, which has slightly different GPIO block
register layout compared to previous generations. Introduce offset
remap function which performs 1:1 remap for R-Car Gen1..4 and a bit
more complex remap for R-Car Gen5.

The GPIO block register offsets on R-Car Gen5 changed and the change
can be divided into five groups, registers which remained at the
same offset, INDT register shifted by +0x10, OUTDTSEL register
shifted by -0x34, INEN register shifted by -0x38 and the rest of
the registers used by the driver shifted by +0x70 .

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
V2: Rewrite this into a table look up
---
 drivers/gpio/gpio-rcar.c | 63 ++++++++++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 09bebde5c4260..2946ca910c512 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -36,6 +36,7 @@ struct gpio_rcar_info {
 	bool has_both_edge_trigger;
 	bool has_always_in;
 	bool has_inen;
+	bool has_layout_gen5;
 };
 
 struct gpio_rcar_priv {
@@ -49,31 +50,48 @@ struct gpio_rcar_priv {
 	struct gpio_rcar_bank_info bank_info;
 };
 
-#define IOINTSEL	0x00	/* General IO/Interrupt Switching Register */
-#define INOUTSEL	0x04	/* General Input/Output Switching Register */
-#define OUTDT		0x08	/* General Output Register */
-#define INDT		0x0c	/* General Input Register */
-#define INTDT		0x10	/* Interrupt Display Register */
-#define INTCLR		0x14	/* Interrupt Clear Register */
-#define INTMSK		0x18	/* Interrupt Mask Register */
-#define MSKCLR		0x1c	/* Interrupt Mask Clear Register */
-#define POSNEG		0x20	/* Positive/Negative Logic Select Register */
-#define EDGLEVEL	0x24	/* Edge/level Select Register */
-#define OUTDTSEL	0x40	/* Output Data Select Register */
-#define BOTHEDGE	0x4c	/* One Edge/Both Edge Select Register */
-#define INEN		0x50	/* General Input Enable Register */
+enum {
+	IOINTSEL = 0,	/* General IO/Interrupt Switching Register */
+	INOUTSEL,	/* General Input/Output Switching Register */
+	OUTDT,		/* General Output Register */
+	INDT,		/* General Input Register */
+	INTDT,		/* Interrupt Display Register */
+	INTCLR,		/* Interrupt Clear Register */
+	INTMSK,		/* Interrupt Mask Register */
+	MSKCLR,		/* Interrupt Mask Clear Register */
+	POSNEG,		/* Positive/Negative Logic Select Register */
+	EDGLEVEL,	/* Edge/level Select Register */
+	OUTDTSEL,	/* Output Data Select Register */
+	BOTHEDGE,	/* One Edge/Both Edge Select Register */
+	INEN,		/* General Input Enable Register */
+	REG_COUNT
+};
 
 #define RCAR_MAX_GPIO_PER_BANK		32
 
+static volatile void __iomem *gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int offs)
+{
+	const u32 offsetmap[2][REG_COUNT] = {
+		/* Gen1..Gen4 */
+		{ 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, 0x18, 0x1c, 0x20, 0x24, 0x40, 0x4c, 0x50 },
+		/* Gen5 */
+		{ 0x00, 0x04, 0x08, 0x1c, 0x80, 0x84, 0x88, 0x8c, 0x90, 0x94, 0x0c, 0xbc, 0x18 },
+	};
+
+	BUILD_BUG_ON(offs < 0 || offs >= REG_COUNT);
+
+	return p->base + offsetmap[p->info.has_layout_gen5][offs];
+}
+
 static inline u32 gpio_rcar_read(struct gpio_rcar_priv *p, int offs)
 {
-	return ioread32(p->base + offs);
+	return ioread32(gpio_rcar_remap_offset(p, offs));
 }
 
 static inline void gpio_rcar_write(struct gpio_rcar_priv *p, int offs,
 				   u32 value)
 {
-	iowrite32(value, p->base + offs);
+	iowrite32(value, gpio_rcar_remap_offset(p, offs));
 }
 
 static void gpio_rcar_modify_bit(struct gpio_rcar_priv *p, int offs,
@@ -399,6 +417,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen1 = {
 	.has_both_edge_trigger = false,
 	.has_always_in = false,
 	.has_inen = false,
+	.has_layout_gen5 = false,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
@@ -406,6 +425,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
 	.has_both_edge_trigger = true,
 	.has_always_in = false,
 	.has_inen = false,
+	.has_layout_gen5 = false,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
@@ -413,6 +433,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
 	.has_both_edge_trigger = true,
 	.has_always_in = true,
 	.has_inen = false,
+	.has_layout_gen5 = false,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen4 = {
@@ -420,6 +441,15 @@ static const struct gpio_rcar_info gpio_rcar_info_gen4 = {
 	.has_both_edge_trigger = true,
 	.has_always_in = true,
 	.has_inen = true,
+	.has_layout_gen5 = false,
+};
+
+static const struct gpio_rcar_info gpio_rcar_info_gen5 = {
+	.has_outdtsel = true,
+	.has_both_edge_trigger = true,
+	.has_always_in = true,
+	.has_inen = true,
+	.has_layout_gen5 = true,
 };
 
 static const struct of_device_id gpio_rcar_of_table[] = {
@@ -438,6 +468,9 @@ static const struct of_device_id gpio_rcar_of_table[] = {
 	}, {
 		.compatible = "renesas,rcar-gen4-gpio",
 		.data = &gpio_rcar_info_gen4,
+	}, {
+		.compatible = "renesas,rcar-gen5-gpio",
+		.data = &gpio_rcar_info_gen5,
 	}, {
 		.compatible = "renesas,gpio-rcar",
 		.data = &gpio_rcar_info_gen1,
-- 
2.53.0

