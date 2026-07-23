Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1774DA553
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821327; cv=none; b=M5wsk/8rDOqnjT+aJ4IJy6K56qDlyLRKEYTlt3/pY4xzR7CIx5uy5NwL/Sldz+H+DWkL2TCnI+6V/5/i8wKQYjGRseVGISv/qEpPmHG2bLPA5eZ4sxJNXHKsIFbFCxpH2KL37UYHwIIBEFwyugacepqfMZoaaYNtFkikSUsMu5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821327; c=relaxed/simple;
	bh=wTk4QHODwZeY9MQQaVLlgC4Op5rF1hCiiCZMN1je3qI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WC1cjB3V85+IbRVOfqxNHVlyw3Ndtt+k4SVYuKMzZKHs1uFz458/mNsPiSAjbHHHrh19hjxS4Ct8FLclggjMXhhFrkbOr4m4fKDrtDFPpDiF0+2kNniMt0m0V0+FOrbYrMsrKmn50hjJfNbjpxfwa96jFoP/0YLBuYkmuySjAig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XErxknKQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XErxknKQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so8833235e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784821318; x=1785426118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tVn9L0uT9WqpFCGvSzpUHM6nyoCAGrX5lOFtWk19oXk=;
        b=XErxknKQxQ4gB+tH/CPcsaWlCQ4epWIHzlsmIbzPbSV9/HvKCpJn8PkxW2dYP3fJqR
         Ph6zUuGtVZ+D080GvDD/jwVDzR/qPkqWaY1PfyxLLeYkphgDC+t61dNwvURkqRJqfPdy
         FuIdmuogvNnHHy+WIFxfl8ijF4Q7FsPVUtScUJtzNxESMJwg7dXZTixBoMsoQPRkiawG
         619xTKDQqekkXsvgGyXTeWfESw0+ljC/DlqOIRS7sDKCSpfMyki/s4foC1fiwMq1wmL2
         ZVMjzyUdeG/3oWYSkgmJaep5wK8fmQKjlVu8yGS8YNRMa9fYJQCfnzKttcqbHhLyWRxb
         EBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821318; x=1785426118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVn9L0uT9WqpFCGvSzpUHM6nyoCAGrX5lOFtWk19oXk=;
        b=a/z/73HX+dLHgZbsiAL/Pch2YKuBVfvEMj/l1qM2pprKh7VlqV7QFBzlzrnFZAucpj
         pAM7b/BvR9E4/W/Ak2w9lvIeHblsvpQQpl1FBFHKNCKRxtejFLrRCtaix2BaKfNUhWiy
         r/ABx3vXQfSwctS6MNFQCI4B+q4NvZBIXWQVlAeg0MuxtwnuBTyqj/UtqIVYV6eafXG/
         F6oSSvPOSlk7ymbuH2fhvNtPAenl5h8fmURbBfy1vEgIe0Uait5mTFt0gZ8qcVnGC9k9
         uGADgurFP5snqC/HMLgDBm0N9qycW9ARzfXE6fh6rhKvV7jFCuMoUzVYHx91YrsKzxrF
         alcg==
X-Forwarded-Encrypted: i=1; AHgh+RoygSDuLObD3XAc9wCft2to5T5m40w+tlPOl9AekvqyqgYtynW7QHl76p+6FgATkzGxF46fPfQk0Kdc@vger.kernel.org
X-Gm-Message-State: AOJu0YyR2q8/cw7b/amOwCbGbEBfGEIYvpqCp3VHmOvaYrWmWOwxTmH6
	Zg/RbAWz3PgDHva7mWgLpvpirIk4UAkOU5fz2OIY5FfRZtE5bhlShSBVwfX2nw==
X-Gm-Gg: AR+sD13nEXWQXO5FolD9/PM6MHTxJFJakC58IGKb2tKeY0SnPoxhs3H/Gq6H6L0uaOi
	RhKEUkutAdECSP16uoYuN2a7xp0AW6DMHnWLyFwURTt7Aio997cfYyDHOsEeXpp6r9rFD3Hxlec
	SiJYOy5qPA27x3mA6GN2uBXMN4Or98BslzkkHQuh2HBOb1XZmdMsO8cS6QkF4HYDwg+FlZPzb+x
	0vB5VBten12UUn7NSFykq5mWhs4+KRtQZD062UDqxCCvUQnrILRRSQscSthTMMlJpEbXW9nw++2
	eAq03Izd39i8oo1F8wB4m6Q8c4nFviAtgvCFeFhFTER2qQrbQiloT2tFa4dC3YxA+/6y0LBSAqM
	SF450Le5jx1K7qPW0YCmNtRuPfY55IhUjqGbmvsO7eFTMvfd3SW+x+8pXB5H8TddAfWF+rdwCo8
	Y60mIGEixfMzMbLwWwuL5Y5HBmWew=
X-Received: by 2002:a05:600c:e549:20b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-49573cd3b43mr27865705e9.15.1784821317705;
        Thu, 23 Jul 2026 08:41:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:f073:32ed:a057:cd3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af5d3c2sm3411345e9.1.2026.07.23.08.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:41:57 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v19 1/4] pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L
Date: Thu, 23 Jul 2026 16:41:47 +0100
Message-ID: <20260723154154.319674-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723154154.319674-1-biju.das.jz@bp.renesas.com>
References: <20260723154154.319674-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add power-on control (POC) support for SD channels 1 and 2 on the RZ/G3L
SoC (r9a08g046).

Introduce PIN_CFG_IO_VMC_SD2 capability flag (bit 22) and SD_CH2_POC
register offset (0x3024). Extend rzg2l_caps_to_pwr_reg() to return
SD_CH2_POC when PIN_CFG_IO_VMC_SD2 is set.

Replace RZG3L_MPXED_PIN_FUNCS() with RZG2L_MPXED_COMMON_PIN_FUNCS() for
port PG and PH pins, dropping PIN_CFG_SOFT_PS which is inappropriate for
SD pins, and annotate them with PIN_CFG_IO_VMC_SD1 and PIN_CFG_IO_VMC_SD2
respectively.

Annotate all RZ/G3L SD0 dedicated pins (CLK, CMD, RST#, DS, DAT0–DAT7)
with PIN_CFG_IO_VMC_SD0 so that power-source register lookups work
correctly for those pins.

Add sd_ch2 field to rzg2l_register_offsets and rzg2l_pinctrl_reg_cache to
save and restore the SD_CH2_POC register across suspend/resume cycles.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v18->v19:
 * No change.
v17->v18:
 * Moved sd_ch2 variable near to sd_ch[].
v1->v17:
 * No change.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 74 +++++++++++++++++--------
 1 file changed, 50 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index be52d47d77ae..e3e24ce917c9 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -69,6 +69,7 @@
 #define PIN_CFG_PVDD1833_OTH_AWO_POC	BIT(19) /* known on RZ/G3L only */
 #define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
 #define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
+#define PIN_CFG_IO_VMC_SD2		BIT(22) /* known on RZ/G3L only */
 
 #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
 #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
@@ -254,6 +255,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
  * struct rzg2l_register_offsets - specific register offsets
  * @pwpr: PWPR register offset
  * @sd_ch: SD_CH register offset
+ * @sd_ch2: SD_CH2_POC register offset
  * @eth_poc: ETH_POC register offset
  * @oen: OEN register offset
  * @qspi: QSPI register offset
@@ -262,6 +264,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
 struct rzg2l_register_offsets {
 	u16 pwpr;
 	u16 sd_ch;
+	u16 sd_ch2;
 	u16 eth_poc;
 	u16 oen;
 	u16 qspi;
@@ -368,6 +371,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @nod: NOD registers cache
  * @clone: Clone register cache
  * @sd_ch: SD_CH registers cache
+ * @sd_ch2: SD_CH2_POC registers cache
  * @eth_poc: ET_POC registers cache
  * @oen: Output Enable register cache
  * @other_poc: OTHER_POC register cache
@@ -386,6 +390,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*nod[2];
 	u32	clone;
 	u8	sd_ch[2];
+	u8	sd_ch2;
 	u8	eth_poc[2];
 	u8	oen;
 	u8	other_poc;
@@ -474,20 +479,32 @@ static const u64 r9a08g046_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG3L_MPXED_PIN_FUNCS(B)),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3, RZG2L_MPXED_COMMON_PIN_FUNCS(B) | PIN_CFG_IEN |
+				    PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 6, RZG3L_MPXED_PIN_FUNCS_POC(B, ISO)),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 7, RZG3L_MPXED_PIN_FUNCS_POC(B, ISO)),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG3L_MPXED_PIN_FUNCS(B)),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 0, RZG3L_MPXED_PIN_FUNCS(A) | PIN_CFG_IEN),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 1, RZG3L_MPXED_PIN_FUNCS(A)),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 2, RZG3L_MPXED_PIN_FUNCS(A)),
@@ -1053,6 +1070,8 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
 		return SD_CH(regs->sd_ch, 0);
 	if (caps & PIN_CFG_IO_VMC_SD1)
 		return SD_CH(regs->sd_ch, 1);
+	if (caps & PIN_CFG_IO_VMC_SD2)
+		return regs->sd_ch2;
 	if (caps & PIN_CFG_IO_VMC_ETH0)
 		return ETH_POC(regs->eth_poc, 0);
 	if (caps & PIN_CFG_IO_VMC_ETH1)
@@ -2677,28 +2696,28 @@ static const struct rzg2l_dedicated_configs rzg3l_dedicated_pins[] = {
 	  (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },
 	{ "SCIF0_TXD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
 	  (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },
-	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B) },
+	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B | PIN_CFG_IO_VMC_SD0) },
 	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x9, 2, PIN_CFG_IOLH_B) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
+	{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x9, 2, PIN_CFG_IOLH_B | PIN_CFG_IO_VMC_SD0) },
 	{ "SD0_DS", RZG2L_SINGLE_PIN_PACK(0x9, 5,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT0", RZG2L_SINGLE_PIN_PACK(0x0a, 0,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT1", RZG2L_SINGLE_PIN_PACK(0x0a, 1,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT2", RZG2L_SINGLE_PIN_PACK(0x0a, 2,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT3", RZG2L_SINGLE_PIN_PACK(0x0a, 3,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT4", RZG2L_SINGLE_PIN_PACK(0x0a, 4,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT5", RZG2L_SINGLE_PIN_PACK(0x0a, 5,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT6", RZG2L_SINGLE_PIN_PACK(0x0a, 6,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT7", RZG2L_SINGLE_PIN_PACK(0x0a, 7,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 };
 
 static const u32 r9a08g046_clone_channel_data[] = {
@@ -3672,6 +3691,9 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 			cache->eth_poc[i] = readb(pctrl->base + ETH_POC(regs->eth_poc, i));
 	}
 
+	if (regs->sd_ch2)
+		cache->sd_ch2 = readb(pctrl->base + regs->sd_ch2);
+
 	if (regs->qspi)
 		cache->qspi = readb(pctrl->base + regs->qspi);
 	cache->oen = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
@@ -3724,6 +3746,9 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	rzg2l_oen_write_with_pwpr(pctrl, cache->oen);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
+	if (regs->sd_ch2)
+		writeb(cache->sd_ch2, pctrl->base + regs->sd_ch2);
+
 	for (u8 i = 0; i < 2; i++) {
 		if (regs->sd_ch)
 			writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
@@ -3791,6 +3816,7 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg = {
 	.regs = {
 		.pwpr = 0x3000,
 		.sd_ch = 0x3004,
+		.sd_ch2 = 0x3024,
 		.eth_poc = 0x3010,
 		.oen = 0x3018,
 		.other_poc = OTHER_POC,
-- 
2.43.0

