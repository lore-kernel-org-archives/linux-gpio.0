Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705836;
	b=socmiNGtqGTcidK+QLotirHf5tFd/Ihx2N744+Wh3/udw7YyYJIckrelH8bfo/KgNgdH
	 VFvdfEYBfTbcw82cnRaxG7uvH772ekrw4a47u6+M3kBQZjSfSPMeEbSY8IRngZrRNVpZK
	 /7DsrJqOUW6+1GGP1zJCHQTU9fLI9L6RouAmaJiTKxlB8mHV2OcX053oNEUKnaywMCdC+
	 RW0SPKINn0fYWXdJGhFIU1mXgIRRexbUXTRYI8cj3IpNRst4fSR/SwHh96+znp5NKXFgk
	 ygvJ6el+D5F+Yh4/l4y1JB7vtAnz/CMiYp2lGrnkeHlZ9IoGcdMd9URtlv5rwZoCLsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ISU3l8w7TLmEDthnGOtdjeHk05el5cdMeIlFq0FPkr4=;
	b=LoS5a+cRlTRYchCbruy4AieXQuLVcXqrV1/rcQHJUlkEsmqlkonVBak3VH6O2HKFb23/
	 2nIemhsTQuOWUhCm0AWu+RFdkYiTR6El+kIOMsRZqiiC8UtTs3xxbfEWqWhCgA8NDehnw
	 aUh8mEfG0VcdQzFjEPP3KESGlBG4vO+dWLALbDOh9LkF32Ktx587nay8A3TUySXw59c8N
	 Zogitavpwovg/oFweuOUvthYFoXxJW0s1kzgEW8F65YLpQUf4QjqPvnV/kNSo6tT9+V2S
	 GiNCS8pbsMKGU0g8ji2BmaDuSh9UZAARsLlBLTSXdK3bSRNOdzImQnfNA9rw9dxOaZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Kpo/bOvs";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C9E606A330
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C9E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kpo/bOvs
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so2814438a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 07:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795705835; x=1796310635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ISU3l8w7TLmEDthnGOtdjeHk05el5cdMeIlFq0FPkr4=;
        b=Kpo/bOvs7lpQ6HzkXW+nwDOGjWnK3I94RG0XkgOU1ALTN5ztEDo98gd8ejlB/zecgD
         oJm/o/wwMzfOgsCt/uVDk3tUqqd3YQYowKW3eUGsgTfcd5jy1glGc8guPwmc+Z8tNkzH
         aCzrqgRJu9DuUKBLTHiQ3JT7MJGDyWMHHcAi7PBNz9iRUD3WNElVDlmqUVV8i2dkp1GG
         TUdKPkBqWLO+ZGmQC61lcHguNvRHDjT4NualIlu4FzZQNOnmHbtRw3htMSPsut0vSn3m
         QA8F5OHl3B2TUzm8z781c1pNsY+GkZ/ODLwfQtpv5MEqR800ARN3tTqMmi41WS+uLsX4
         73bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705835; x=1796310635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISU3l8w7TLmEDthnGOtdjeHk05el5cdMeIlFq0FPkr4=;
        b=xjt96EbZEYGJQgaAukvNLsj4F3PrcVHRy74K5rhZyBNQUvTwESCp+KHT7cNicff6Hd
         KqXN6VI5PV63eqbyMCh8d8WBmxw9jkjEZ2lUGFIvdkSpbqnkYEliGg4gDhNtmIpPtLnK
         vYVVhLgez7MwN0BUit1th1KabeISLzTXk+Dlw24lYMns2TI9BZokOYeHD8tXTW5Wx742
         RPaXhzYwEeK83EiXPg08r7ynSfT9eXF9jJDkxG/I22xP2dm/V49al2Z10L01TZq7Qr8+
         TwGG8wLOjbcZng67BdUT77vw67u9A2XvA+b/KXo5ItP+gp39qioLptc7jzdPXHkfAFTD
         a49g==
X-Forwarded-Encrypted: i=1; AL+hErHiKitWTWYmWUtl9hzy7tFDb0nn+W6ElRYVh6XTzJWDfKL0Leuhz2lDplE86kHbPTUowTy5nuNuEdgs@vger.kernel.org
X-Gm-Message-State: APuU4Z+lF+0++4QJfmWkGJ0GjImpPEvMBs3ka31Jk5svOdVStbqFTvUQ
	+kmZKPUjgJTdIEMlJxo8j4iGq3Yh/1m81Md+swfElYkOVansYi2PtXTa
X-Gm-Gg: AZFdTZeLEDiZNTofaD3xxWwvGX3Y3zOEtc8FJi2Pv/d4DkCV9ozWEO7+sExNdcYwjcb
	6aNyCCiHwQnVlyCOi+tlyWobVDsiS88rEV+kxoqtdCge3RItnxTxShbKF78HDKtwUMJMY/rDMBi
	MIgull846GUnHO+g7E371uopSZUUzkd76AlFfq5h0+MK7ZmqvL4ESatPHteCexJxOLa540ksajw
	lB57cok196On+VDAqeD2gt8fatYGWWo2vfGDxKqrGn3fh1bzFn0WIwCLYfFKVxybqTCReDbb9Ms
	5JEBYiKfD//JAw66zU0ZQB+wxaB2jdCIH9Y6YF8KoSwd12Ny2//Sj4SrtMemm7so0GxGBsBC3D7
	lGpehGPB3EK6fhzdPO/qOJusnlgNmESHxSoLWMqe8mUjCk+mqGYxVz2XeW7LC25PDa6fIF1AK4E
	cGkj0M5bSjPhnSnFk3bPt+o33RQSy8AijrztqQ9yGtZoMqE3oW1uX87yAsO4tReho7JOpAkehCp
	g9ZnOh0/9O+RTayHtBBWccaG1z3dExkO69+TrMyFpOUxdK5uwKgcI42Hs7s5bfG7+m4rLFujfpB
	/kTFgSAVM5sWEZUOfckDXzpO6m1z
X-Received: by 2002:a17:90a:e7d0:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b41cb3276cmr20964486a91.60.1795705834971;
        Thu, 26 Nov 2026 07:10:34 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm11099923a12.8.2026.11.26.07.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:10:34 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Thu, 26 Nov 2026 23:09:48 +0800
Subject: [PATCH v3 5/5] pinctrl: upboard: add device id INTC1055 & INTC1057
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
Message-Id: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-5-81d35c9ba246@gmail.com>
References: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com>
In-Reply-To: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
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
index 090316349331..c3e57217296f 100644
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
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_i2c0_grp", "ish_i2c0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1057:00", "ish_i2c1_grp", "ish_i2c1"),
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

