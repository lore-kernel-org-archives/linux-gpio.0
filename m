Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447025;
	b=1R9ca49cnZ9APUWuvFWMgzOOv1/w86yL+CeeDwN7SflCPeaBFThOXqSxu93fVKeX49z0
	 y09RlxeHg0W83nitY0YYxRrj0h+013esY2SsX9q9xYvszC2Q5aK3gizkXyeF57w/PUwGq
	 NP5O4zLC3hsNXqQMOyt+iG130zwAsKwrgzFZ2ffMT3DPz3ut7b/W0iV9ByvHK3BtJRCDk
	 Fv60h6y0NMZEh+Clj534UAs/nexnkl40fb/c3DbfTjfE5AyPZ32kHYOoB8ap/77IamSTf
	 +Ud1gKJ3MtcVhQoglpnPYQVBh3K+1pEjMPnNIFuFgYxAyf2kMG83xmA4inVvTbf7Mog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=riC1NYgSZjSkHoH2+prXZK8ReZ+OOKUQUT09kf88/Zk=;
	b=HLnUFYtvK2MRxwysQKIU7m/SA66eZ9cWpD0g6+P7plVe6e4UlZAZjDYB3C6+4HRdJP8S
	 v6Wy80bClVNSTPk6eVCmJh5rXq48fW2bBfArNZQvxPT4z9WG3zzMsq2sZG5DeO1JBwYWX
	 9uu1KdWkUEqM4FRASariu4NgybYNOpoIAqKcFRixfh1chF6TfCar/X9I3dZJ4ELvVD3Vj
	 XEYK2UT++xaLcFMXAtWEV5MnMOHE8nourJ5ea8rY8xJLGNAcajMVHJi8biBhSwJD/CUS7
	 MR2/KQXpTaU7sPeZt0wFVx7E82KXM38F3l76lNnGTKoQ5FC4EmIwacCJE5+qjnL8kvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvacZEQk;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716E4606A327
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 716E4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvacZEQk
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f020d0169eso15637835ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447024; x=1796051824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riC1NYgSZjSkHoH2+prXZK8ReZ+OOKUQUT09kf88/Zk=;
        b=qvacZEQkezWPIkkrVAsmoroDaIt4CLLUwFFVUlIxxyXLUIuNhsNO+aYrOuQQZhJa8P
         Nln9ZtPlOdbFZZXiCZEZKIYjBrjvLoulnM5WXP2Y+vmOtSEjoddklUpXCRWuGUppyIG1
         3dZ6tR3DqlTRDj+fiXYcWiKDtI3KfADbaQyhCXCFM4HmBInO+ZGDDNRYqkiUi9GRPS9j
         yV2uqKv9SDzOgplv2gD7GJzGYTQdVhQ24+CF5U2R3AEcvoaPGwig2lEYnmg9uQ0JVVK7
         63+fm3CQWdcfzI4bbGK7U/a6mdf65IYfQ/JyCuOc2D+bFxH6i+ayGQd4T/9dDFpTMcNf
         bJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447024; x=1796051824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riC1NYgSZjSkHoH2+prXZK8ReZ+OOKUQUT09kf88/Zk=;
        b=Gdp8b9gnm28OdH3rXzQ/83YXdXY/b4hO0yXya+rP7GWEAtZbdypPBHtwhF9s5VWZb0
         yqwhqWJg1ZUSJF+xmTUSlxTTrRYL4kxlxVXlliie/I1/c5HKw3kl4B7G/6zBbLu3AehE
         wGbfzx7pELtQES02hFcJ4iEycj5+owjKvoLrs/5oKzBwpT0EexBaX94AY4mLTirkoTik
         FeIrKzsznO1k2oUak0U5y4UKOQ+XizMG/p7qvjC/aD5p/oHUF5/9dUkckzPJLB+8Ui5t
         acNtcYphHPkKwQfAlk2ZBVemIeZEGl+wzC208UbJi3KyNy9h06lEt5qVq07UZL8Id3K3
         uJfg==
X-Forwarded-Encrypted: i=1; AL+hErHtPCOSyqFA4MQKWLaQYxZGXj4T6CsGgKzvjhflFd/dN1TirwWQ2Qj9Bn4s2o1+DLSiWujZyMZRS/eC@vger.kernel.org
X-Gm-Message-State: APuU4Z+6YgeSCGXiQ8di6xwDvlBd9aMSw4dSjo54FEA2nL5EzSIWvHNZ
	T++js4/8tmAcDPzA7qmxFnO26/ea4tEqH65ECym4oBBudpFVTvsGLVr9
X-Gm-Gg: AZFdTZdkN7ugP9z7TEGWHRHYPmzEKU60x6n/h1DpIvXO523zVGDptceGB+YPYXIQC29
	PmaN8aOLBACecIRtgKJ5vEuDr3FXIqOjG1wOMqm1HpgGNd3LsxXW11ffKXN/Wf5KVyHyIMIMXfw
	J52Ur0qktffMDpXSD3FzSu6g6lQ1BwNH4v5uePg40uX/hnY8jr9S6IBEe65TjwYLlOWFgn19a0Q
	7IVyfVM9SMTn+yQlnrh/9jLkc/aRggyAw2oqYQCFO2NHFFrBw0AeG9HRYXRO/KBcQf1GnanND9+
	w6hMVuuq84Oy/VVlQpgSHFRPrl3o+X+pO/cfeeVlPEeFPgqGi692suXXevGr+FfFw9U+vwOG5S7
	vNr8oexDx8aioSuzgNVdkrHEjRXAqqel7Dz9jn1nXl9jxAwAl0l6juYWYqC6RVHitzHFO9vUH3Y
	u5pLwnasXei9pnsDaKklGsjfqq9+GN0mDBmlPQ4RUt4ygDa2pXKNCc0csnhW+LPR8O/fEq7TwQ/
	Jm1ziE6z7wq3ds0XgOu5oZemU2GvWOhILwaKXM1rlbRgXuGz84FHU7GEwABhNsO1f1P0j2ql3QB
	FVG/6qdBqsvtfYark5P6GJGzTsA+PA==
X-Received: by 2002:a17:90b:3d8d:b0:3b3:b750:d2ed with SMTP id 98e67ed59e1d1-3b41c7b56c9mr10765037a91.8.1795447023716;
        Mon, 23 Nov 2026 07:17:03 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm20067482a91.5.2026.11.23.07.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:17:03 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Mon, 23 Nov 2026 23:16:18 +0800
Subject: [PATCH 5/5] pinctrl: upboard: add device id INTC1055 & INTC1057 &
 INTC105E based UP boards support
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
Message-Id: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-5-f2322a91686d@gmail.com>
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
In-Reply-To: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 BillyChou <BillyChou@aaeon.com.tw>, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add support "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
"UP Squared i12","UP 7000" and I2C/PWM/UART/SPI pins mapping data.
---
 drivers/pinctrl/pinctrl-upboard.c | 102 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
index 66c1c3e3bfe0..232678fb811e 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -922,7 +922,7 @@ static const struct upboard_pinctrl_map upboard_pinctrl_map_apl01 = {
 	.nmaps = ARRAY_SIZE(pinctrl_map_apl01),
 };
 
-static const struct pinctrl_map pinctrl_map_adl[] = {
+static const struct pinctrl_map pinctrl_map_upxadlp[] = {
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c0_grp", "i2c0"),
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c1_grp", "i2c1"),
 	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "pwm0_grp", "pwm0"),
@@ -930,9 +930,61 @@ static const struct pinctrl_map pinctrl_map_adl[] = {
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
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ish_uart_grp", "uart1"),
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
@@ -950,7 +1002,47 @@ static const struct dmi_system_id dmi_platform_info[] = {
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

