Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540291;
	b=Ac+pGO+ps/BVr/OzARE8lhXWRTJdfgVSB9Oa7v5U7iwQgjL0+INK//i1CYsUmNXyHYly
	 CWD9dHINO2GshbltJLkpWHRAFL4NZ4ciVJEPdWLxv5+/7kbu6WTo9fCKH17Rk+vaaQtWG
	 6FAwUAT3drUoFC+ESUzrnBlD5nShK5d7G7755kzisHJvtzd4Hqs2RIagTHYmvQMrKm6+a
	 57IhIcxSRlZH2bgUGAO50tow/98sTW8iSF6zufWuKarOt+/3aOqH82FjXfrrG/cF4NhyK
	 tz119AJnEbUgzYHJIdDqtYKej6YEErLf+1mFkB2yr/0WxA3nR2mmatrNvnKf0AMh8fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gnWF9t6Ikmgl21AYsFaDMu1qgmT/r8tnqfNnG1PTC8E=;
	b=p9ftz6y7tWbF6ferFJA8QMwB+USiwsaXWeN6xAQm2FCFdNiS1c+pyBAJCl6oD+nrJZqh
	 uRwSaG6LIa14LAUMdYIv14shEhJWZvP6OSSjuPZkx4L2IP7WzV+CIZDudnJ/JuLIeD03V
	 js5GkvZ6AkO6UOJ4BPxZbzxRrV0M6l+sOKYk0hs5bUvALlrGY11pZG7iwK7KSIV4RuENW
	 EN68vljHfO4sggNxMDUcGsNytnxM6vmE67UYRud1N6ElFDdFLV3Owlq1l0zQJcTzAXAms
	 ZEDFGt1vftoufUUvOE3Ij2zsnVf2UiLCdKqWoPlYF2nD2SZNuyPN0W2lj23hdisEILA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwT6ARen;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04EE606A6B5
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 17:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C04EE606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwT6ARen
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8633b750a12so1583154a34.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 09:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540290; x=1796145090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnWF9t6Ikmgl21AYsFaDMu1qgmT/r8tnqfNnG1PTC8E=;
        b=uwT6ARenn0C576iVXiEC3I8K1VLP1hiSiBsK95HubxUIJCLGG/LQR6hgTnThzGDrVT
         AaXzCM+bAobpKun8qIgCsKt3Vi2wgr37FP+NnmDwdH8WI1T/549ub8x05pRzglj8ECQK
         b/yYwj6mPNmbDnKBE0zDLvPW1gVRCHF9wltSxlMv1FEs0k+3fwxOGbgBQomF7YHF4Vpr
         nOUDeZrb2j4aH8pqgfuyDTSVutozOMSOz1hNzXw5biFSi+olenGaSWibGbUOiSXQ6kLN
         syhmADK4zCm0EmUiVwlPlDviICDvtudy2SGi0MHFf1Xft7twGD8Ly3TPemtOe1KG0CxZ
         bZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540290; x=1796145090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnWF9t6Ikmgl21AYsFaDMu1qgmT/r8tnqfNnG1PTC8E=;
        b=gRBk6iKlGm51qn7u6cCOgDjdsRZYnaxADydyxFiS9D/7Cqecg9/aahv/Lq5haCDerm
         L6+I7GXfX0vDjjoHHBvdTDPjx/d9WLNraFyVI8np/Bm4S0BVB2KoVUoM1aH08egSaTMT
         zt2LQzhbRzjUN8+RzD+AgXEUF95KpKBeKgxwb/MUO90WhOC11q9cMUYWG7O9tx1/aR5Y
         dXP+aKIa5F5Hs9ELo/odABw08q6dsTmx1NuM3wK3D3ybR35E5yn1+9u/npwLfLw1RIj/
         w77s+0S/x+CfignYovH6oophUOiqefqqJwL4ehka8sVfA3jSm8AJ3ShmhAjww79amwRb
         JXtg==
X-Forwarded-Encrypted: i=1; AL+hErGDYrRmkscKiFLcTYCuySLQSRHirWIoMnNPL+VlNDBM2+bAnLsQ243lmVNmxCWFIY/+q/tPpPOMHWwW@vger.kernel.org
X-Gm-Message-State: APuU4Z82tOWC+jMzG95OOejr9gXYpzwtxr6fnnuYjMEg6NfRwXtbIPHd
	5YLn8XCVgcCCAPxmKVoTjyjVD7UJO5lqGrKozaR+Sj0Ixp1g9Fn8sRvcs2c6HK+g
X-Gm-Gg: AZFdTZcF8yWvKPAknKXAFh/dMwFR7KPpIGlriC6hjvulXX84zRBegeNyqfZf7mDpUY0
	D7f/3GVXbzdBkxeN2TGJHDClQL4KALJ5UGFlUFzOxo4HLC0JPCuedEJi2q6vkQ1s6EcwKkBfDrW
	3xUxpzyZfRtRumJawUv6o8T3h9L2kAd+K11PPj88ZZ1wf82weI7G4hytq3rTQLCycJb894fGhyf
	h2lGxiQB9V8d2GkyI3XPF1pmKqndYgD/+Utr2Hst/grDHxKvWlWcbyr1uy79s05gEP5OdWIuSCi
	bQOmskG9imUhQq4KAMKeWqFRY547QoR4x99aVmY4iBe31cllVM2pu5T01h955cGglecpV9OlxAB
	ierLDUaAta3nSDnhOUDCnPqDSFycjbIB1ALSTLCq03uO5dJUjRXt0F1MrIU/fdnMqi3dj/P95np
	7H/L0/ShP/WRhLVBtfOppVI59VqoXMNXJEKrP1f+4Z2I3+t/GfeQi9U+VT85t4izqAROp33cZ+v
	pr0rBcSE/mxFKP4khbf2Cwm+H7F7eKqg2VS0+NatVIttsHiumhOWX1rY4H3tXRO8v/Eh4QEX7eD
	6MRAgFot/iIhP2grhl2EpBfXgFo6Kw==
X-Received: by 2002:a05:6830:6512:b0:862:acfe:9281 with SMTP id 46e09a7af769-86315979898mr17123473a34.15.1795540289528;
        Tue, 24 Nov 2026 09:11:29 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6besm11131021a34.11.2026.11.24.09.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:11:29 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 01:10:39 +0800
Subject: [PATCH v2 5/5] pinctrl: upboard: add device id INTC1055 & INTC1057
 & INTC105E based UP boards support
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-5-c8079f8f569f@gmail.com>
References: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
In-Reply-To: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add support "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
"UP Squared i12","UP 7000" and I2C/PWM/UART/SPI pins mapping data.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/pinctrl-upboard.c | 102 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
index 090316349331..6b53d6fd5996 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -912,7 +912,7 @@ static const struct upboard_pinctrl_map upboard_pinctrl_map_apl01 = {
 	.nmaps = ARRAY_SIZE(pinctrl_map_apl01),
 };
 
-static const struct pinctrl_map pinctrl_map_adl[] = {
+static const struct pinctrl_map pinctrl_map_upxadlp[] = {
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c0_grp", "i2c0"),
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c1_grp", "i2c1"),
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "pwm0_grp", "pwm0"),
@@ -920,9 +920,61 @@ static const struct pinctrl_map pinctrl_map_adl[] = {
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ssp2_grp", "ssp2"),
 };
 
-static const struct upboard_pinctrl_map upboard_pinctrl_map_adl = {
-	.maps = &pinctrl_map_adl[0],
-	.nmaps = ARRAY_SIZE(pinctrl_map_adl),
+static const struct upboard_pinctrl_map upboard_pinctrl_map_upxadlp = {
+	.maps = &pinctrl_map_upxadlp[0],
+	.nmaps = ARRAY_SIZE(pinctrl_map_upxadlp),
+};
+
+static const struct pinctrl_map pinctrl_map_upsadlp[] = {
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c0_grp", "i2c0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c1_grp", "i2c1"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "pwm0_grp", "pwm0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ish_uart_grp", "ish_uart"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ssp2_grp", "ssp2"),
+};
+
+static const struct upboard_pinctrl_map upboard_pinctrl_map_upsadlp = {
+	.maps = &pinctrl_map_upsadlp[0],
+	.nmaps = ARRAY_SIZE(pinctrl_map_upsadlp),
+};
+
+static const struct pinctrl_map pinctrl_map_upadln[] = {
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "i2c0_grp", "i2c0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "i2c1_grp", "i2c1"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "pwm0_grp", "pwm0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "uart0_grp", "uart0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_spi_grp", "ish_spi"),
+};
+
+static const struct upboard_pinctrl_map upboard_pinctrl_map_upadln = {
+	.maps = &pinctrl_map_upadln[0],
+	.nmaps = ARRAY_SIZE(pinctrl_map_upadln),
+};
+
+static const struct pinctrl_map pinctrl_map_upnadln[] = {
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_i2c0_grp", "i2c0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_i2c1_grp", "i2c1"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "pwm0_grp", "pwm0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "uart0_grp", "uart0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_spi_grp", "ish_spi"),
+};
+
+static const struct upboard_pinctrl_map upboard_pinctrl_map_upnadln = {
+	.maps = &pinctrl_map_upnadln[0],
+	.nmaps = ARRAY_SIZE(pinctrl_map_upnadln),
+};
+
+static const struct pinctrl_map pinctrl_map_upxarl[] = {
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC105E:00", "i2c0_grp", "i2c0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC105E:00", "i2c1_grp", "i2c1"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC105E:00", "pwm0_grp", "pwm0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC105E:00", "uart0_grp", "uart0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC105E:00", "spi0_grp", "spi0"),
+};
+
+static const struct upboard_pinctrl_map upboard_pinctrl_map_upxarl = {
+	.maps = &pinctrl_map_upxarl[0],
+	.nmaps = ARRAY_SIZE(pinctrl_map_upxarl),
 };
 
 static const struct dmi_system_id dmi_platform_info[] = {
@@ -940,7 +992,47 @@ static const struct dmi_system_id dmi_platform_info[] = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UPX-ADLP01"),
 		},
-		.driver_data = (void *)&upboard_pinctrl_map_adl,
+		.driver_data = (void *)&upboard_pinctrl_map_upxadlp,
+	},
+	{
+		/* UP Squared i12 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UPS-ADLP01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_upsadlp,
+	},
+	{
+		/* UP Squared Pro 7000 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UPN-ADLN01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_upnadln,
+	},
+	{
+		/* UP 7000 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UP-ADLN01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_upadln,
+	},
+	{
+		/* UP Xtreme i14  */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UPX-MTL01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_upxarl,
+	},
+	{
+		/* UP Xtreme ARL  */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UPX-ARL01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_upxarl,
 	},
 	{ }
 };

-- 
2.43.0

