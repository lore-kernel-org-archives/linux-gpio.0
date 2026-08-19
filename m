Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118FD47A0D8
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150199; cv=none; b=Jnq38+b8o3fMF5CbXMwvqdBAap0uvfrQ7kuKgxFHxdwO7OceXt3G72sqZy2SGrWeRoGqT3lpYSQBf5OS+fem3ODcLU4pstbULw18AumspAte96CHAZlkLZh+wB6SdsFi8XgJ6RsxpQyyLdQ7ewos4A1/Vt4KFzNZQpgstFD0dAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150199; c=relaxed/simple;
	bh=M07D58ZeDaSbPcc6plIUbY7wywtktkQNsgqM0aNezkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUMNMoXE5lUatTZuI1bTpa9lZJPKJpOewjd3PTCYCt3M2ojDnWPe5/90elgme449o8WV5oo0FeAGwaryTMQ92zS0QQrsCsyDrlrFqXIXM1JcdMZJB5Xq/YiTHxOyMofBP0qaJncLJsTjodL2DmE9UaawcXFYXdrzwRr/vD9teWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JOAM26YD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JOAM26YD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so4407265e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 07:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787150195; x=1787754995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7qGeRWI7SAAtnBtbyXcVwS+NHSXPmqeN6QfrBXzCBrY=;
        b=JOAM26YDGa/qxc+k9W+oozSCtmLp1ctpVWZk2YmmpWGOuKK4BVpY9h2ko9wIwtWonu
         05fYPrsn2Ny27duFgL2UH938TgIqkBMo6DPI9sbvKligTwjB6jArv+aadSnhC/xWAKFQ
         U6aY0SIvdIDwSllPPOCSYwLprWfFi9o6eBVYZLKPALBcZCXcgpss1hdiRovGfcpPq+6e
         VnVKw16nRDoTpPUcMMA26gZRjPhRvYSQ3oN9lNaB43/rV29v14SfSE351z3RRPBBtaWG
         SkZ3H1sSqiMEEksvzHOKcheGqqvzACMhnEbM//TQGHp3udcYrWiBGUnZdtM10iGbI7xw
         nlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150195; x=1787754995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7qGeRWI7SAAtnBtbyXcVwS+NHSXPmqeN6QfrBXzCBrY=;
        b=IuVA4kXUPYvaLt4jxV54RYCeoduhH4L03dnfaakobxoxFEckT8O5/LXMZKaggsic4f
         3Iv3kOwTglgQSEY8d+ld4jlY8+jCwAUYrms0YRYKLqok6qJ5k+EvtvVIv+ReP3qS+sp0
         tGp+Fpo2qS13smdKlf99oMGs/6MX+NfRnJ7JPwdCSDzVRoGT4ZuOW/k/rOTgOc/PVo2S
         MAgiJ/DpGruGgnwI43zM3utA4t0XUZNIZt/xVHAvW4FIg09j3wZMspWsUQScQVwZKSAe
         pZpaHoC5A032118cgetIwaLEQL3a4F2KAPjp9QHXW7RsUSl3yLUjUMTf7anCFycvukGc
         /o5g==
X-Forwarded-Encrypted: i=1; AHgh+RoXEcUyiF373/SqGxE3SAKFHvQqLbBGonNTjUXo4yCFIFNLCoyWU/IZ1BVT1p0Ldhw84U0vwNLZgF8I@vger.kernel.org
X-Gm-Message-State: AOJu0YwQNZxPljFMi6qVEEEwKzdRoffQ2KTw1WRgL8LXX2nRHa5CGsNb
	HGQStSvNWf9a+e/4hsu+bvCycJmVrzVeMytiDcghxSv9qVP0FRJNJeBw6TTYak094SH/p8cO1kA
	d+LGT
X-Gm-Gg: AR+sD100ow8/PYFUYqFyidcJGaoG7x+SJqiKcaPb7qXPsV+LLKvBmCQeaF8GY99wCFW
	iidmXCHzt237esjWr3+vGOGRhKW0FVtWl73kIZlyZ+C1If70EwKq95pdi8CjhONde4tZYVFt6CA
	hXPEhk3Vv8wJ4E5LGHRZTCjz+eJ6MyLkLwW674pBT2jCOkf9py6Sq+8NkofWyzdtR4O/fILRBXk
	7ANcGLOhEpZ6fyMtObyvbVXqdpF5gGbK9238LJFehdibUjZG2bHK7q4HnJqSoogtykMvCM29Enp
	Lp3Sj2XljUVW2xQBmqYVJEVU5nFFMu8vxLesnnUeMM3rE2w5VcreYEF1ogHjVcONmx+2dvKZujF
	0tLdjlo9eOglQX66qaJ/dwhc4zuR/4Qs1iWZpIbRGAFxdm60+iQwSF4MXTE6QgmtV2uA2gnFCgP
	ZrdPn6fzouKTzBtB9sNXQtuLr/mGrhgpejYuGWehixBxaTFNQx2zSyS3wcY8yY4Jwlfrto9nBtG
	2jXJFv4amo5beJexW0HQ7SWTPuyp8g9b/WR2avjqPzZL1KAwg==
X-Received: by 2002:a05:600c:3e0f:b0:499:a79a:694d with SMTP id 5b1f17b1804b1-499aa155e7dmr104767165e9.4.1787150195340;
        Wed, 19 Aug 2026 07:36:35 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6400:1700:e978:dd1f:393f:9962])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e37284sm32671235e9.4.2026.08.19.07.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:36:34 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C power source
Date: Wed, 19 Aug 2026 17:35:53 +0300
Message-ID: <20260819143553.2478984-6-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
pin controller provides a register to select between these two options.
Update the Renesas RZ/G2L pin controller driver to allow selecting the
I3C power source on RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- due to patch 3 from this series:
-- dropped the definitions for PVDD_I3C_1200, PVDD_I3C_1800
-- dropped available_i3c_ps[] array and fill everything in available_ps[]
-- dropped the adjustments from rzg2l_pwr_reg_val_to_ps() and
   rzg2l_ps_to_pwr_reg_val(), rzg2l_ps_is_supported() and
   rzg2l_pinctrl_pinconf_set()
-- dropped the tags

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- none

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 6329742fda94..4866896fff78 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -69,6 +69,7 @@
 #define PIN_CFG_PVDD1833_OTH_AWO_POC	BIT(19) /* known on RZ/G3L only */
 #define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
 #define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
+#define PIN_CFG_IO_VMC_I3C		BIT(22)
 
 #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
 #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
@@ -254,6 +255,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
  * @oen: OEN register offset
  * @qspi: QSPI register offset
  * @other_poc: OTHER_POC register offset
+ * @i3c_set: I3C_SET register offset
  */
 struct rzg2l_register_offsets {
 	u16 pwpr;
@@ -262,6 +264,7 @@ struct rzg2l_register_offsets {
 	u16 oen;
 	u16 qspi;
 	u16 other_poc;
+	u16 i3c_set;
 };
 
 /**
@@ -269,6 +272,7 @@ struct rzg2l_register_offsets {
  * @other_poc_pvdd1833_oth_awo_poc: PVDD1833_OTH_AWO_POC mask
  * @other_poc_pvdd1833_oth_iso_poc: PVDD1833_OTH_ISO_POC mask
  * @other_poc_wdtovf_n_poc: WDTOVF_N_POC mask
+ * @i3c_set_poc: I3C_SET_POC mask
  */
 struct rzg2l_register_masks {
 	union {
@@ -278,6 +282,11 @@ struct rzg2l_register_masks {
 			u8 other_poc_pvdd1833_oth_iso_poc;
 			u8 other_poc_wdtovf_n_poc;
 		};
+
+		/* RZ/G3S masks */
+		struct {
+			u8 i3c_set_poc;
+		};
 	};
 };
 
@@ -390,6 +399,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @oen: Output Enable register cache
  * @other_poc: OTHER_POC register cache
  * @qspi: QSPI registers cache
+ * @i3c_set: I3C_SET register cache
  */
 struct rzg2l_pinctrl_reg_cache {
 	u8	*p;
@@ -408,6 +418,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u8	oen;
 	u8	other_poc;
 	u8	qspi;
+	u8	i3c_set;
 };
 
 struct rzg2l_pinctrl {
@@ -463,6 +474,10 @@ struct rzg2l_pinctrl_ps_desc {
 
 /* Keep the entries with .caps set in the first positions. */
 static const struct rzg2l_pinctrl_ps_desc available_ps[] = {
+	/* I3C I/O domain voltage 1.2V */
+	RZG2L_PINCTRL_PS_DESC(1200, 1, PIN_CFG_IO_VMC_I3C, RZG2L_IOLH_IDX_NA),
+	/* I3C I/O domain voltage 1.8V */
+	RZG2L_PINCTRL_PS_DESC(1800, 0, PIN_CFG_IO_VMC_I3C, RZG2L_IOLH_IDX_NA),
 	/* Ethernet I/O domain voltage 2.5V */
 	RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
 			      RZG2L_IOLH_IDX_2V5),
@@ -1158,6 +1173,11 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
 			*mask = masks->other_poc_wdtovf_n_poc;
 		return 0;
 	}
+	if (caps & PIN_CFG_IO_VMC_I3C) {
+		*offset = regs->i3c_set;
+		*mask = masks->i3c_set_poc;
+		return 0;
+	}
 
 	return -EINVAL;
 }
@@ -2540,6 +2560,8 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
 	{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x2, 0, PIN_CFG_IEN) },
 	{ "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x2, 1, PIN_CFG_IEN) },
 	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0x6, 0, PIN_CFG_IOLH_A | PIN_CFG_SOFT_PS) },
+	{ "I3C_SDA", RZG2L_SINGLE_PIN_PACK(0x9, 0, (PIN_CFG_IEN | PIN_CFG_IO_VMC_I3C)) },
+	{ "I3C_SCL", RZG2L_SINGLE_PIN_PACK(0x9, 1, (PIN_CFG_IEN | PIN_CFG_IO_VMC_I3C)) },
 	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x10, 0, (PIN_CFG_IOLH_B | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x10, 1, (PIN_CFG_IOLH_B | PIN_CFG_IEN |
 						     PIN_CFG_IO_VMC_SD0)) },
@@ -3759,6 +3781,8 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 	cache->oen = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
 	if (regs->other_poc)
 		cache->other_poc = readb(pctrl->base + regs->other_poc);
+	if (regs->i3c_set)
+		cache->i3c_set = readb(pctrl->base + regs->i3c_set);
 
 	if (pctrl->syscon) {
 		int ret;
@@ -3801,6 +3825,8 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 		writeb(cache->qspi, pctrl->base + regs->qspi);
 	if (regs->other_poc)
 		writeb(cache->other_poc, pctrl->base + regs->other_poc);
+	if (regs->i3c_set)
+		writeb(cache->i3c_set, pctrl->base + regs->i3c_set);
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	rzg2l_oen_write_with_pwpr(pctrl, cache->oen);
@@ -3913,8 +3939,12 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 		.pwpr = 0x3000,
 		.sd_ch = 0x3004,
 		.eth_poc = 0x3010,
+		.i3c_set = 0x301c,
 		.oen = 0x3018,
 	},
+	.masks = {
+		.i3c_set_poc = BIT(2),
+	},
 	.iolh_groupa_ua = {
 		/* 1v8 power source */
 		[RZG2L_IOLH_IDX_1V8] = 2200, 4400, 9000, 10000,
-- 
2.43.0

