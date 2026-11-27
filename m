Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810178;
	b=xU6nHsdpYXXqIwYuo+zuklpm8l6o7BFjjPs7FcgNEQkbPMdgHsnZsp3q09JsRyMZ9Wft
	 elv86Vk6CUt3VGB6JwlfCErI225mST1vjt2Ivv7yxjMU3VFVErq3DiXskTSAZvaU/zQAe
	 L6d21lJu3MxmvF7yIfUG1jxyX7syuJVrrAelrSvcAAWiAqESH5Y4+DpKQwpW8VLI3blE4
	 jI/UKv/CjpIwhMAIXZjrjCpQaxAjwsKchbWbrkKe1ZDXXm9DgRdd5VzqEH98TEIoBUBTs
	 uA4k4ZLST5WD1sCO4rsk2tpiCChP0pNeXGGr/plQFCddyoj0jdkxrSk0gKK/rAWzAFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oD076z39b10S7Uv7+/KjmA9hdIdFEVHigchJTPIZoGY=;
	b=S/o/dy0j8+IYLONvwVAndIk+dUv/LFQvnSytupPNHZZJxMh2/XUvLSKWtYDuh06Nj1Kc
	 rm7oTDHt6p4aUarHzyyc1vGazxPjnTxIZLuR/ZWH5nyO+qDRQS/br/7KIEvtbyDC7xyGi
	 rejCRZNpqvf58tzziDeV8rokXjljew4tPGhQk/bYyb0y8gNyHOx4ugVH7bgLRjXrHpCW3
	 mL//QlembdERmLVFCvygnXFowU6VZFa3Uz5xBGeuxnTd2WLmZlLgQPblZjvZ5uost7Azq
	 +afOsHc7KxqTzocWtilm2gWwu51QonOwgas3TcaZNeQVSEqJaN+yrk9yBMyO3u3eCPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WG67o0/v";
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179F7606A31E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 20:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 179F7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WG67o0/v
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71aea92f666so5398765eaf.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 12:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810177; x=1796414977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oD076z39b10S7Uv7+/KjmA9hdIdFEVHigchJTPIZoGY=;
        b=WG67o0/vjL7KN2kNoGlQyoEhTCgtap0vuh+sJZX06NJNTe8D/MMuzJLCOd0XK1VCAK
         bcE5sD30UdCmBKFk2giFu1f7W/Tbeo6dPJDV0uR+rBRlsR59Cbuo7ALkYWlm7gvkJ69x
         Uz5g/Dr7sBl8uHxMp1Q92dBOQT7eGmn/Cbsd/jZnH2wOCoFo2tKrlAC4KLmD4yxXLp8D
         DNp/8pHsP5477W9OB4SNY141Y1YyJcr+ZljhdAvtxSEn8zDli5sg2kkOgEZGaf/rGfYh
         WwYbCCGncH8lD03yxshfjlTHi2/Mtv8hKPOFcVwbG57tnIInf2oBwS2bedPBziyslwdk
         8vqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810177; x=1796414977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oD076z39b10S7Uv7+/KjmA9hdIdFEVHigchJTPIZoGY=;
        b=kSYkYr0KVC4LOI48pFLCeaPWsSVp3wEUJkMKzhMwcgtRpMJRekCd3J0goErUxlGq+l
         SqHR8EemBQNYObsPLtkgsS3kvI0Oe+1BffDBkihQWN962e3MfJOHGQp3aPpBisyww3OV
         O6GWbnCi60t11hNQgsdnPyx7qovAMEKzMIMuAzJVWqHn8pblG9EdtYvVnOk9fBzFgxAO
         LZIhbOThtoDDNWleOtt4Zpf47HtokCsd+SdiXArZpbw8QrTJK2btSt0G8GggySH4x8eG
         2wtw3dfu5q4yjDEgKW3LqwYWQRFIipKv95cbfHzBNpAB+e9qybZ3xQM/wSUVht+l/FdY
         RFog==
X-Forwarded-Encrypted: i=1; AL+hErEBNJpScRX99Ru3d8QNQbSUuhB/T5y0wi7Wd/6tCSIhLOE/vEKgs5auVdHAHCWA1S3Y3hdYLlugOMWY@vger.kernel.org
X-Gm-Message-State: APuU4Z+d/Yk4HPHEkkej6Sxfc86I9FzO6Z+peGFYuuhQY4oAcRwAbgv0
	jVI2OdL5Q324qMjXjLmHVDNxKsmADAuRyRB4gmayUw8RIMGKPKyMiUlQ
X-Gm-Gg: AZFdTZcUpxsK/rVvI2fk/8d0NzHbndnh0XXU3qldQVsqrcZMTyvd0j2dcdP0r0zKgRG
	dUWXlMeDmUk+BdDnofog/vUoaLbFz7B9owY8F1Qh0i1fk4RwfqRve6wh+44kDBScjAGqXndN0xe
	Pza82VHINTYZ5PwUTxQ+po/kHLfAuhTHusbxNODTSxJ3pTSqVZspceemtdv9Mw+3S3aVRtZvBIN
	8DuGOsWLZtHBHXJ/aN/DgJh7r64j076hwUPjiVijXrMOUyAKlWtOcaR6mJz9+wZCJLipvDh0IWW
	/V9TkAqyvbqAHx3r8CpQ1vMFi31QQVoW3z79F7Y2xnVuIFkh4XD61blAt6Rg3hz6UDKSTI084hV
	r2DVVHuBfmjU7Lzb9yXrYUIwXFyx4UHTfsbO/b4wBBnFCQ/DDhefaQrGdZY6rwXhBTYUE18NPE4
	V/Iom1GC2ESJxptfLzDayIOzv/92mbF2gmDUI6suC/sKwwmlDsT/RZqZn6arp83tlYfkgQ+H1hF
	qqeyl4ZV9Z7YCWGBL+SNt9L3Kwz+rYJo4Dppn+v1RuTQrWxG4xUiGIyqLyknwFDkQAcJzxr/Mg7
	xzZUpsvK+TVj5qCWhh9n/kcxngcYaQ==
X-Received: by 2002:a05:6820:61e:b0:71b:7883:8d89 with SMTP id 006d021491bc7-71b7883ae62mr9547659eaf.66.1795810177027;
        Fri, 27 Nov 2026 12:09:37 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b8590ba0fsm4834662eaf.2.2026.11.27.12.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:09:35 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Sat, 28 Nov 2026 04:08:31 +0800
Subject: [PATCH v4 2/5] pinctrl: alderlake: add some groups and functions
 for INTC1057
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
Message-Id: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-2-029071f417d5@gmail.com>
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

Add ish_i2c0,ish_i2c1,i2c0,i2c1,pwm0,uart0,ish_spi pin groups & functions
in adln_soc_data for device id INTC1057. The pinctrl-upboard driver set
the correct pin function corresponding to these data.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-alderlake.c | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-alderlake.c b/drivers/pinctrl/intel/pinctrl-alderlake.c
index 415bc0a16957..d3bdd727ced2 100644
--- a/drivers/pinctrl/intel/pinctrl-alderlake.c
+++ b/drivers/pinctrl/intel/pinctrl-alderlake.c
@@ -306,6 +306,42 @@ static const struct pinctrl_pin_desc adln_pins[] = {
 	PINCTRL_PIN(256, "GPP_R_7"),
 };
 
+static const unsigned int adln_ish_i2c0_pins[] = { 5, 6 };
+static const unsigned int adln_ish_i2c1_pins[] = { 7, 8 };
+static const unsigned int adln_i2c0_pins[] = { 99, 100 };
+static const unsigned int adln_i2c1_pins[] = { 101, 102 };
+static const unsigned int adln_pwm0_pins[] = { 119 };
+static const unsigned int adln_uart0_pins[] = { 105, 106, 107, 108 };
+static const unsigned int adln_ish_spi_pins[] = { 128, 129, 130, 131 };
+
+static const struct intel_pingroup adln_groups[] = {
+	PIN_GROUP("ish_i2c0_grp", adln_ish_i2c0_pins, 2),
+	PIN_GROUP("ish_i2c1_grp", adln_ish_i2c1_pins, 2),
+	PIN_GROUP("i2c0_grp", adln_i2c0_pins, 1),
+	PIN_GROUP("i2c1_grp", adln_i2c1_pins, 1),
+	PIN_GROUP("pwm0_grp", adln_pwm0_pins, 2),
+	PIN_GROUP("uart0_grp", adln_uart0_pins, 2),
+	PIN_GROUP("ish_spi_grp", adln_ish_spi_pins, 7),
+};
+
+static const char * const adln_ish_i2c0_groups[] = { "ish_i2c0_grp" };
+static const char * const adln_ish_i2c1_groups[] = { "ish_i2c1_grp" };
+static const char * const adln_i2c0_groups[] = { "i2c0_grp" };
+static const char * const adln_i2c1_groups[] = { "i2c1_grp" };
+static const char * const adln_pwm0_groups[] = { "pwm0_grp" };
+static const char * const adln_uart0_groups[] = { "uart0_grp" };
+static const char * const adln_ish_spi_groups[] = { "ish_spi_grp" };
+
+static const struct intel_function adln_functions[] = {
+	FUNCTION("ish_i2c0", adln_ish_i2c0_groups),
+	FUNCTION("ish_i2c1", adln_ish_i2c1_groups),
+	FUNCTION("i2c0", adln_i2c0_groups),
+	FUNCTION("i2c1", adln_i2c1_groups),
+	FUNCTION("pwm0", adln_pwm0_groups),
+	FUNCTION("uart0", adln_uart0_groups),
+	FUNCTION("ish_spi", adln_ish_spi_groups),
+};
+
 static const struct intel_padgroup adln_community0_gpps[] = {
 	INTEL_GPP(0, 0, 25, 0),				/* GPP_B */
 	INTEL_GPP(1, 26, 41, 32),			/* GPP_T */
@@ -341,6 +377,10 @@ static const struct intel_community adln_communities[] = {
 static const struct intel_pinctrl_soc_data adln_soc_data = {
 	.pins = adln_pins,
 	.npins = ARRAY_SIZE(adln_pins),
+	.groups = adln_groups,
+	.ngroups = ARRAY_SIZE(adln_groups),
+	.functions = adln_functions,
+	.nfunctions = ARRAY_SIZE(adln_functions),
 	.communities = adln_communities,
 	.ncommunities = ARRAY_SIZE(adln_communities),
 };

-- 
2.43.0

