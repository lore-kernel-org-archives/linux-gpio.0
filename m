Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810206;
	b=BnEYho77UkLcNUgiKsNo9ho/stogCqmWc+I3ellqtBm4Hiyqid+7maDPfHN3u7sybtTM
	 RwoLLOl3MH7VpuZWepGmphNBnkP3/aV3VmRoPwlp2+E3sFxLt9H4atSB3GpbhXflxwgea
	 KliLVB4bNLmphXpTr3GCOW83aTqpOHLOKk6s2aLZrmS1WntVAxsZPcaOznvtsrHKQuHxi
	 PyZ+OJufxz4/JMUraahx7wrshou0bGL3sli9+9ptiEqVVsOf1Ogv3cyoHbBn4Lv0lwNfH
	 UIDa8lXMpyms57piEqfmQqwXtulVV6ovFgaAY+NKWa8DqAzJ53h8HpSH5fShypP8A2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iwinBqJVI6CfJQnf2HrLfPVQ0/rpb948wCB1K04dFmA=;
	b=DezDXVIbRj6E11WxQDcFv8k1+YD3Dcrcahq0q1HDTtibw7ta99q7M5vxnt39dqedFglH
	 9zOdzSBw6byy+Sy3IJAbMfAM2J6cfpXRqPMur06dLLrkI5AO//ykSjB1IKqQZUI+XSQrA
	 bdmoyrqY/39qqMqsUYl3EzQqzq4e0WheCOr+MqLBvJgW7O+pKtx3E683uJZnaKAKUGAAV
	 bv0Xgu3gMBiG9cwrxkJxTHxcNpmtuP9RYdXlrDVD2gQexQi3Xe/Fh+s6AT3S9jXypAPKg
	 PPhKVRVsuRdgWxHtC5q+1eIHq0J2M0o44h92AInaPvcSs9RncsWiwAjVr+RP045UNyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VFkituvX;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0C6606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 20:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VFkituvX
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6df7f544919so4995601eaf.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 12:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810205; x=1796415005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwinBqJVI6CfJQnf2HrLfPVQ0/rpb948wCB1K04dFmA=;
        b=VFkituvXBbHNHAsMZaLgubeRUts9st8z8FIxbGXilNOoefQXSvQ4AQxONHqByST8d4
         iUC+6KwbySRPU1s/Aod4eoaRjLR7z1xm3/9JcOlmRw7Lj/+xB0cpqGf9gp/D1fRbFMo7
         MqCpRsATR20ht+ZISQb7xPlIzxLALU7KMb0QzmMIa0OJYd+LHYAg0LIVdIxvLwaqboYX
         tSj9et2MASNfErEto9y0/n/xHjp1bsizqmKtddkbk4zhYcr6RizEGYjt5lEEnL2lZwyl
         CVUaDaIHk0msNLuzHbohKLcUAB4idUY0+YfP2fpAvnigMZZ7gBgbKROJubo5KcSrBRF6
         rMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810205; x=1796415005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwinBqJVI6CfJQnf2HrLfPVQ0/rpb948wCB1K04dFmA=;
        b=Ip5Gc8PTN4P4RRmF8D8ycGbaYRs0RENvkTZKLSQctsLCf3UhVfSPTj9+n1lSMoq0JQ
         4ByY5gzyDKZuy/St96/3EBE5ZwUjkUxbb1b+6FBdKOiyooMUpFk9kvKjKXIDJ3XIMne1
         NpSahccDSobOJqsvw/iw5dfT+jcRk3e7a/9UMREA6rWc9wjOB1ydMDbkWSPGwV6+1whp
         LIjfcTRytHi3nHZL8kI1P7WBoWnnFipuKvQ1OZ0ECloQTczzhE7GclGs5HUg/mt5zPK3
         sXnxNhcCEdomr6rWWM/elhezV3hf3kxD08hgjpapc5RjbKLNqBUshSPROsJa7lWMH3k1
         TwIA==
X-Forwarded-Encrypted: i=1; AL+hErFLy6xAb7M4/lHZNQcEWbFqo1HYAvCuVPFkIfdWVZNzWcm68xidf3+JMfmElfqKeRsb6S4idokKOQ3n@vger.kernel.org
X-Gm-Message-State: APuU4Z/8PoauXia9WjBkwZLrmkXCcJUNJL0tCTwrOID2JEIM3PFiijdr
	qkKj78WLs228Lf+WC/LKz8q7DDlhnqsWV2oeH82llmB2RMVAl2SYKArLBcZO7KYE
X-Gm-Gg: AZFdTZfc+bB6qdIZMpAeMJxcBuY9a57wGY9UnQ7KMrXB6Vs2jiGeAPV+KmHuz/pGokN
	YURm5gJtWCipeJsMj9pBu5R8xc+kfd2fZ5j1XvJfEXqX8NHoTpKpyKE0JHfBOwBcA1XH4gV+8Bv
	L35exc5o3PUF6Oo1LznDoZQiIlMXGgAAOof0ctQ28lX5qHEKrv8kMM0lFNkE7CyX9WrhzOJi5MF
	1qNPGtjrx/2O6THl9h/gwNdGG5PdvTD8XcCpZbDog8z4yzK8iAavAzgt/2e19cVV3QcIvwBdVLi
	3ucIbVATxNYSsvqaRviTsJRKGnXWdCb6L74S3rE7NpNpJOCqv5eTjrQuy8e64eeK17he5uDeWv9
	3dSkU6NHNueEa+Tx5Toa1EGWnSefgvgI8SMQRgtXNqEl/D5GInYI1TP+5cc1NUxJ2vmE2Cr5IkT
	3IhNU58Lq6Id8z5crmjVxmOX6nuNwc1n8qh5n4Cj8KPLxer333gmzmFsKvUPc1YhrXJ4/Q3pMVF
	fcnRx8kg/zHFtLNhKq9nByMyF9Y1ZJBRAFgeXXwQKppP/N53AUlNeCQFvHbZjqIwwOICRovI8zg
	IRGus4q1JHahA0LFojHrTMwLK3lQTg==
X-Received: by 2002:a05:6820:a284:10b0:6d9:e2f3:9b51 with SMTP id 006d021491bc7-71b39544cf5mr16352909eaf.66.1795810205054;
        Fri, 27 Nov 2026 12:10:05 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b8590ba0fsm4834662eaf.2.2026.11.27.12.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:10:03 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Sat, 28 Nov 2026 04:08:34 +0800
Subject: [PATCH v4 5/5] pinctrl: upboard: add device id INTC1055 & INTC1057
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
Message-Id: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-5-029071f417d5@gmail.com>
References: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
In-Reply-To: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
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
index bcd2dae9969f..7c947158b07c 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -913,7 +913,7 @@ static const struct upboard_pinctrl_map upboard_pinctrl_map_apl01 = {
 	.nmaps = ARRAY_SIZE(pinctrl_map_apl01),
 };
 
-static const struct pinctrl_map pinctrl_map_adl[] = {
+static const struct pinctrl_map pinctrl_map_upxadlp[] = {
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c0_grp", "i2c0"),
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c1_grp", "i2c1"),
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "pwm0_grp", "pwm0"),
@@ -921,9 +921,61 @@ static const struct pinctrl_map pinctrl_map_adl[] = {
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
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ish_uart0_grp", "ish_uart0"),
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
@@ -941,7 +993,47 @@ static const struct dmi_system_id dmi_platform_info[] = {
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

