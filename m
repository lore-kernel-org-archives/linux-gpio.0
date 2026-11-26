Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705829;
	b=tL7+HM7ZaS5hvQnynz45mWljgRQTWjIYiZHLCkhnuNvU0YeC/Ru+y9cB+Hw3gkhWe/Po
	 73Sh2YLPP+vDY6i1GfqPZciehPrX25BRu7Ct8T95xJrylkSGTr45P8nOKt+pXhAtHHj8U
	 lKJ6TAy0OLF5ngHlZTtfatcP2mD+Tzj/3JQdPjsYfxMbHiRKh//6yjW6KI9qWTOQb0lQd
	 hPrqHKkLiy52M9UyWR7D9b+Y3NxQ1hxzDkH9rqc/PaN4rhfs1mxoxIFWTJgOXkaUyO1AI
	 qq9cqqW0VPMeqpWO0LWOAHNzb9ts/qOlyft2XoznelTMbRiHwKSx7X6rdzdg3NwskVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wmDIQo20uS6O1DnD+oq0Q5d1d/SJjeCFVriKtYROA4w=;
	b=0/fIYlsRlYz6q2zXoR9+f+nuOonDt03pB/gGepS7oSxp+TuaMZ0exTn7CM3p+OvTbOKw
	 HFoziJlwK71uF0h5in6eBTcfNJnVF9bMbCgrAmvqnGh4MJei6xlVa5dE2wFj6pCU3A4+i
	 cr9e6opkHdTNwZn7DBa71OiFwcDHG3lRfz8w+uUWh0Mk1KffthPi4RdxpeoCr7Ug0q9Al
	 YOzLQ275jLlm/eAzhr7jLBuDDwqnszXnXV9bHchtAyzhZym0xFWwDqjcFYhHn6NxwwxnT
	 ZDtlA37s6FFD9fcslqNv7DdUlRfj0ADa11871dv1ni0fHUSlYK3f9CbA5/ECAcOvViA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cs3ohIph;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B85606A32A
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B85606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cs3ohIph
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b41e627cadso4428787a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 07:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795705829; x=1796310629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wmDIQo20uS6O1DnD+oq0Q5d1d/SJjeCFVriKtYROA4w=;
        b=Cs3ohIpheW2gSgLfy8Ct/Dp2Iugp1WNSOWui5en8x876oqTEtMEI4kUyJG6jIFRtOc
         Esf9cgmDLFmLq1Fa5fk2bH4qmfD0EarnJpza20JXNq2NCJvK+/1NMpx2DduvcjrKfZYY
         WEfR5dAkc4kyXsgBepPDcTqyZQdNGEM4Ex+zTW+1LOUlVXHXLWv6fEcitG2qAvnYKwSc
         +PzAVKdoYTDBggYkeCvz8hxxSfogBBJ0vmxdrWBMtfrtZ+Qhm8eX2YZUzNrtrV/DITci
         AQdoY7bSht5cs0tfknR79PKLbc+G1z2pkHskQdG5iV2gA2arIzYzcSjm3Irn6rgJ2DAu
         IwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705829; x=1796310629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmDIQo20uS6O1DnD+oq0Q5d1d/SJjeCFVriKtYROA4w=;
        b=BwPMJuottz7xC4gxEnOig6XX1IlgPLXe0FpiKIGDGKhtLzKrsVDebGJCezVSylCP29
         Zao5cptKa1w5ofbKp2g+UwDWD8cJgjI987r9495OrnOsSIS+F7jyGtAPWqwWi9G0oypm
         6xVgLZ5nwXaIr6NwWGTyzzpoc7SrY1aqTe7/Bx21hIwelxGDpYnM3VzqE7yW7Zl9C8XG
         bfaW5oybkc9r5DISBFIv4u3whAeXLEHPbKcxpSlitmkXovdX6ulMEHlNXynrUzkhE94n
         8w4UK7gpleqfmTmwDvQCx2rUKSwI4bcKSkRRKP80jEXEOTr3s8Z9LDbjpLmr20s7l/r0
         8Pug==
X-Forwarded-Encrypted: i=1; AL+hErEtkXsxN57keQ/nHCm0WSqdkotrXtmukEzmwc7q/SBg5Xy3/xUqH3li2f8MDEyFYwM3BR+rqp5oDOAK@vger.kernel.org
X-Gm-Message-State: APuU4Z+J69c/JyauFDttFcKBXD9poGaGlAUkgEbJJQusR0ZvQzV32dho
	1nFyobRQiga7l0TUGnS7bLvmlLspzy3czkcz7cL0eJltO6X25202AMTq
X-Gm-Gg: AZFdTZdr7Vvzzgl6EjVUqf2leqQmJGrkVhQq9IsOL49VC25A0ItGYRci6HgGLAl75pj
	fQoekCIqPmr9uD3KaLqt/9tZQ2kjXtWLZB3LuT/LIia9Ip07k7HeSHSdO4dRM0sYzspNZdJVCTL
	63CwO72W20cBuAT/UJAYyNM0F4QfGDhBnlWrgEuwSHw2a+f8InndKiukFhvCB4C+VhgDTiGWcYA
	Fg4gHeZNVtH59uWxmzznBPE94b0LHiKaPGXsHYY06Yq6376NBjAWcAuCb0xfbp/T3vuHqJuUwNL
	U/9J4w8Vgcr5ad55g+mNk8wihxNce4t60sIow6+BDhYvgol3ZNfONnwLBbEfSoZpjxkZmVC6Ge3
	ZKxjZIX5wXswwHcjk1zR+JxPP34lg4erQrgnCxx/8nhfiCU2blUg+0LQVqzLP5vDkXRG7uBeqTa
	PRN/qizjWgostlsCs0IUXJLYCeF+wqsuzpdcUggzg8P9m0zrT9q3CIyifwwP4tViLH6nxZ7/z+8
	KPv89xAQ3Vv/6a5OzHR01a0VoMwelR1Bdjhp6ExQtUiQw1ewlI5ERgvQ/Y2hSLlePRDVVtcPorV
	+WE5cDyfd4Iz2J0zCS2H8fKRNt/e
X-Received: by 2002:a17:90a:d2cf:b0:3b4:d22:8600 with SMTP id 98e67ed59e1d1-3b41c8fe1e2mr18824415a91.18.1795705828955;
        Thu, 26 Nov 2026 07:10:28 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm11099923a12.8.2026.11.26.07.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:10:28 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Thu, 26 Nov 2026 23:09:47 +0800
Subject: [PATCH v3 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD
 GPIO OUT not function mode
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
Message-Id: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-4-81d35c9ba246@gmail.com>
References: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com>
In-Reply-To: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

The CPLD I2C pin mode setting through pinmux-select is not correct.
Should be set UPBOARD_PIN_MODE_FUNCTION on AANT0F04 devices.

Set UPBOARD_PIN_MODE_FUNCTION to 1 to prevent a NULL pointer
dereference error on .modes[i] for any pin group using this setting.

Cc: stable@vger.kernel.org
Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP boards")
Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/pinctrl-upboard.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
index b9af6dd93c34..090316349331 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -33,7 +33,7 @@
 #include "pinmux.h"
 
 enum upboard_pin_mode {
-	UPBOARD_PIN_MODE_FUNCTION,
+	UPBOARD_PIN_MODE_FUNCTION = 1,
 	UPBOARD_PIN_MODE_GPIO_IN,
 	UPBOARD_PIN_MODE_GPIO_OUT,
 	UPBOARD_PIN_MODE_DISABLED,
@@ -289,8 +289,8 @@ static const unsigned int upboard_up_adc0_pins[] = {
 
 static const struct upboard_pingroup upboard_up_pin_groups[] = {
 	UPBOARD_PINGROUP("uart1_grp", upboard_up_uart1_pins, &upboard_up_uart1_modes[0]),
-	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MODE_GPIO_OUT),
-	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MODE_GPIO_OUT),
+	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MODE_FUNCTION),
+	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MODE_FUNCTION),
 	UPBOARD_PINGROUP("spi2_grp", upboard_up_spi2_pins, &upboard_up_spi2_modes[0]),
 	UPBOARD_PINGROUP("i2s0_grp", upboard_up_i2s0_pins, &upboard_up_i2s0_modes[0]),
 	UPBOARD_PINGROUP("pwm0_grp", upboard_up_pwm0_pins, UPBOARD_PIN_MODE_GPIO_OUT),

-- 
2.43.0

