Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4E458122E
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 16:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971792; cv=none; b=O7/L05WWM8m80uu4LU6z4mhFDQul8l/ZAQHa1/92BmeDJNVv10ULdiU3THb1WTBGW4ywRhuRjH5+tdg8FJJ3niW5Tv05M7Wel4LrHbtpN1djF6CgtE5+IolttrBkt8px4ainEYJBCbaBWy/FtcNcnj7X3O+ATXZiYoZHS8bAc70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971792; c=relaxed/simple;
	bh=khebEgxjEILhgIFw+4a9/HfrN1zFhwqJzYwFwcvd/Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C9AieT3xvC0hbLCzqsR/b4tH7rBOZwll9vqWSXqPlMaKB76p47qG7XgPtChMuzeEbS0wnygOjeEw2z7bMIV3TwECrUnliLr3Vhyytg3dTRzMEYRhrhV1z9xQ5gLnpUOpKNd+rpOHBUUZ8gO2jJ2en10AxwXjNaTYvUmir1rEAwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CKi52U+u; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UCstZ5dA; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CKi52U+u";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UCstZ5dA"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hg5zc5NkDzMlNH
	for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 18:36:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788971788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LThahIsEm781evhbLOdXDwb8nf5zlAMHSaT20cf2nFM=;
	b=CKi52U+uNks9SXfMJFZPKZEIwJdJA9jNjgj8PaJUPIFL143aM/PvBldzexod5flHgBZQO0
	6M+bwn6v5pIhycu5Fkp0EdcfmqFcBH3LU9PHXBJdaTC+7ySWxOeV/fRlMQWmCjDYsJq6pd
	Fphbp+bUNFV+t6yHTvsmL6Abj2qmwYxIsKsQ0sJNMERxj8dZ4JAc2NMPdegTk5ab/c2joD
	eRO47sqvM+xOEJ93peZ9r3JbWUxXZIBnOTa6492qzGxaxwabS9QInanr9QZlswIUCodHmK
	wZEIATsYk1exdKXXqh2RyTbTZKd5Hoi1ELPTYr3hBop543BTouQe0sGBYphE6w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=UCstZ5dA;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788971787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LThahIsEm781evhbLOdXDwb8nf5zlAMHSaT20cf2nFM=;
	b=UCstZ5dAqX8cUGZ8HN7WJLsc+Fi9F4blS1uT585JbrBtHfQHguGQaOeAxXflUZWcQV41uY
	VGp2+MnYJXAH2dVtlJvxLw2j979upIz0Fm2ffVLdWHYHX+X4zRA4GETQe1UExCXtOAyg5M
	o70qQHNSi6o/qZaf9wkapNN9Ch7SYWd78SI/OgmGkZO8gs3+BVOwalaZ20YCSoGCszqM94
	jWC1dNHy9man7I4DcJkzZ0EvPp1/EigBiXTlncbYLtSrnw565tHdG8LnvoW6E4dEkWhu0S
	TJZmUKonOSWOE0X/aVpMXa2VE8nPJ0i5YAJ/gIuIyapdpeeJIzyXfbAB7BKJPw==
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [PATCH v3 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
Date: Wed,  9 Sep 2026 18:35:05 +0200
Message-ID: <20260909163621.96288-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909163621.96288-1-marek.vasut+renesas@mailbox.org>
References: <20260909163621.96288-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qcn31xy3on43o9tptbkxrk3m9eap94gx
X-MBO-RS-ID: e905a0766de1e448fa6
X-Rspamd-Queue-Id: 4hg5zc5NkDzMlNH

R-Car X5H (R8A78000) is the first member of the R-Car Gen5 family.
Add support for R-Car X5H, which has slightly different GPIO block
register layout compared to previous generations. Introduce offset
remap table which performs 1:1 remap for R-Car Gen1..4 and a bit
more complex remap for R-Car Gen5.

The GPIO block register offsets on R-Car Gen5 changed and the change
can be divided into five groups, registers which remained at the
same offset, INDT register shifted by +0x10, OUTDTSEL register
shifted by -0x34, INEN register shifted by -0x38 and the rest of
the registers used by the driver shifted by +0x70 .

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
V2: Rewrite this into a table look up
V3: - Use enum gpio_rcar_reg
    - Drop the IOINTSEL initializer
    - Drop REG_COUNT
    - s/int offs/enum gpio_rcar_reg reg/
    - Make offsetmap into two maps, and static const
    - Use C99-style initializers
    - Drop BUILD_BUG_ON
    - Store a pointer to the offset map table to use in priv
---
 drivers/gpio/gpio-rcar.c | 86 +++++++++++++++++++++++++++++++---------
 1 file changed, 68 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 09bebde5c4260..54dc47d45de7e 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -36,6 +36,7 @@ struct gpio_rcar_info {
 	bool has_both_edge_trigger;
 	bool has_always_in;
 	bool has_inen;
+	const u8 *offsetmap;
 };
 
 struct gpio_rcar_priv {
@@ -49,34 +50,68 @@ struct gpio_rcar_priv {
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
+enum gpio_rcar_reg {
+	IOINTSEL,	/* General IO/Interrupt Switching Register */
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
+};
+
+static const u8 gpio_rcar_offsetmap_gen1[] = {
+	[IOINTSEL]	= 0x00,
+	[INOUTSEL]	= 0x04,
+	[OUTDT]		= 0x08,
+	[INDT]		= 0x0c,
+	[INTDT]		= 0x10,
+	[INTCLR]	= 0x14,
+	[INTMSK]	= 0x18,
+	[MSKCLR]	= 0x1c,
+	[POSNEG]	= 0x20,
+	[EDGLEVEL]	= 0x24,
+	[OUTDTSEL]	= 0x40,
+	[BOTHEDGE]	= 0x4c,
+	[INEN]		= 0x50,
+};
+
+static const u8 gpio_rcar_offsetmap_gen5[] = {
+	[IOINTSEL]	= 0x00,
+	[INOUTSEL]	= 0x04,
+	[OUTDT]		= 0x08,
+	[INDT]		= 0x1c,
+	[INTDT]		= 0x80,
+	[INTCLR]	= 0x84,
+	[INTMSK]	= 0x88,
+	[MSKCLR]	= 0x8c,
+	[POSNEG]	= 0x90,
+	[EDGLEVEL]	= 0x94,
+	[OUTDTSEL]	= 0x0c,
+	[BOTHEDGE]	= 0xbc,
+	[INEN]		= 0x18,
+};
 
 #define RCAR_MAX_GPIO_PER_BANK		32
 
-static inline u32 gpio_rcar_read(struct gpio_rcar_priv *p, int offs)
+static inline u32 gpio_rcar_read(struct gpio_rcar_priv *p, enum gpio_rcar_reg offs)
 {
-	return ioread32(p->base + offs);
+	return ioread32(p->base + p->info.offsetmap[offs]);
 }
 
-static inline void gpio_rcar_write(struct gpio_rcar_priv *p, int offs,
+static inline void gpio_rcar_write(struct gpio_rcar_priv *p, enum gpio_rcar_reg offs,
 				   u32 value)
 {
-	iowrite32(value, p->base + offs);
+	iowrite32(value, p->base + p->info.offsetmap[offs]);
 }
 
-static void gpio_rcar_modify_bit(struct gpio_rcar_priv *p, int offs,
+static void gpio_rcar_modify_bit(struct gpio_rcar_priv *p, enum gpio_rcar_reg offs,
 				 int bit, bool value)
 {
 	u32 tmp = gpio_rcar_read(p, offs);
@@ -399,6 +434,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen1 = {
 	.has_both_edge_trigger = false,
 	.has_always_in = false,
 	.has_inen = false,
+	.offsetmap = gpio_rcar_offsetmap_gen1,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
@@ -406,6 +442,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
 	.has_both_edge_trigger = true,
 	.has_always_in = false,
 	.has_inen = false,
+	.offsetmap = gpio_rcar_offsetmap_gen1,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
@@ -413,6 +450,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
 	.has_both_edge_trigger = true,
 	.has_always_in = true,
 	.has_inen = false,
+	.offsetmap = gpio_rcar_offsetmap_gen1,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen4 = {
@@ -420,6 +458,15 @@ static const struct gpio_rcar_info gpio_rcar_info_gen4 = {
 	.has_both_edge_trigger = true,
 	.has_always_in = true,
 	.has_inen = true,
+	.offsetmap = gpio_rcar_offsetmap_gen1,
+};
+
+static const struct gpio_rcar_info gpio_rcar_info_gen5 = {
+	.has_outdtsel = true,
+	.has_both_edge_trigger = true,
+	.has_always_in = true,
+	.has_inen = true,
+	.offsetmap = gpio_rcar_offsetmap_gen5,
 };
 
 static const struct of_device_id gpio_rcar_of_table[] = {
@@ -438,6 +485,9 @@ static const struct of_device_id gpio_rcar_of_table[] = {
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

