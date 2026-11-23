Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447019;
	b=5YW4QPy5XiE8c4M073YfHpIVB5kuNIzE+qMmzEHgTR/x+CuClzdYyvtsa6LOIDzTfWbt
	 x0w3o8LHa1MuZzyB6ZNBqNiKikkPXjNmAuQvfc9OGvQmKCedQjn4mhvOjuWTdQL4J8R2L
	 eBgV2eHr4TgK1eTEi3DJQEQYxMcuwMzbIwXubLELBkt62VYQpZ6syz7yQz7wjgmYkbn6o
	 CV9tjh7R/XvvqVApA4vXZ/iMTtSCR41Z5bNb++3gIEZm/fq6sU9cuiRIvQMhiyDP1RhfF
	 2yJotcef+O74NvaZX4/KBGGHKsB7mkkDOCBoQr2HSLAuSSCVN7XPkcjNjmF5CygnX3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tSXne0eFSt3J93YlYm+5HBbf8tEO/NOSC0O1Mc/J9n0=;
	b=aiesBDknn+1BC+0G23UUbWNCbWStPCWUlTxRdQhD4KdCkPlMsvtGGOP4peK+ruhfJR9P
	 OUqTN8Ij3pQCw/2fOR0lLEVtZ6r2se4PSAqRWNPELRaoMU87AGSDn+dwRaEfk3kRUD0rJ
	 rAsVkQHmQTj0tCyw6UkFtdbH8h3RNwFuQujy39+TlGblbIOXoUyIsoCbvcMeA8Vk21L42
	 PEebwDYjpEsWhs4Xrz77EnVbCiqPucd6fFKAj9FpAAGX7a66Bab/0WE4Gs7W2mBFMfwUN
	 nz9kP/XpR8zPMevedV5/WtR1DYr50/9Le2AeWaNWOlq2vPh67/hxgryKdkqE2nwMZ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DxCvjj8Z;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56174606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56174606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DxCvjj8Z
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso1805159a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447018; x=1796051818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSXne0eFSt3J93YlYm+5HBbf8tEO/NOSC0O1Mc/J9n0=;
        b=DxCvjj8Zy05C/UG/Gosszmux+ROyuvE93znej2tokQMY1UAJ3+kguZ508V6luN55Al
         yaKj2zvKa9jlVvjarByCANCpUh+gqq/zwnvFfqFZJjSkarc0bpxjDlHdyqUGpN3gBGsw
         uL+YdSfiUNF+uezoBDZrgna9xHCbgiPCQ/ZUZ8zVIkzcc6b2UaZDK5EQ6pNU7fX0XVxY
         qcAJelmxa2k64GqMwlZy4+HXhAGlPi5xDFxfuh8WCZs0zSuNrTj23wIHrO56EiMlTbTf
         7ERxDdm0yVaIO20pN44TlXipI8IN3ixMfJZ/SCDUnAogeRt7bCFF84UnCuYFhs0xYvT3
         2MkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447018; x=1796051818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSXne0eFSt3J93YlYm+5HBbf8tEO/NOSC0O1Mc/J9n0=;
        b=ld80yJ1+vrtCMuhHs94RlR6EoGH6gtOD7rM9x/P1Fiox6YgQN2G2ToWAeNO63DXeaY
         UX5GYAybqHJ4SYWR3xkaoj4PhMTX+Wv+h5q3FBeW/guCpA8cAXQ68W87TLnOvMhZkzAv
         SJNwTAcaAoBtUfztXASFyquhfYLUM0u5ZXkeWc37InmWa6lTdOUBoInwoha/qLS4MsHz
         +/UWGsoSwrimaj22Ef70qoR7JALzmDZQmz9vE//QLvV/y8TK3XXBhgLBshREazYsUJoB
         oi+BwUNj+zIcFj8ucih62CJ+ircyxRF+2mWu5//A/KNWJDBlY4Tt0+7vKzxC+lfvxx+q
         2X8Q==
X-Forwarded-Encrypted: i=1; AL+hErFookxIyj+RJdsWeNLXpHISqtEavD4WUhyRNe3q/0+zs5b2gJ4W336KCQ2EhcaPnVmrZlDP4v4TgkSZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8vUZ4KgIOW/o2pDmKr1+wok1BBGDSUpA9fF6iPgML8a3l+S+TK
	1NNSvAtSlRmIg7UubQ0qq7QkPSfd6SVT+2KPU2AVx6ely6m4BB9VKI5n
X-Gm-Gg: AZFdTZcZY7W1SFOlgCmnpRrGuTKrCEEJ81UNJWmJt7xWAJxDhvyIXsqFe73z6n3HG3+
	pCctJkD65NRfMxFWi0zqPUH91hfYPtIZdQ/Xnjsnxc4tDZcdWz5DwAfYcc4bEDvbBEb0hEoQ5dd
	hZ8GxKXQmJ1HZrHtYyfPHgtj6zepcAA1sj6+5EvzY+TqZLFazg8K+w5KX72TwpUoYyEQIRz2xQI
	jst0nTQWm9bN0jXdaiCJkjPKIFwdxz5x7j8eQzgtnRasXg0NyoIrtDU6gBUNGXUZhUAMU0Qrfrk
	zVZN7nsEDu4OD2NpHAspK+iAPfM2K8aqNEcL3dF5aon5IMc71tDx2EP7dXoUqoqeourS9qafG/u
	yPj/QpQZOxTslmf7IiWAtt1j7yNxSQxjXaGnw7u1Gt1+PW9yHBGRZKtpoNbuPePxcMjULsjvHt9
	d3Gg7yLCJZoiN1XkOiHJQJRLbDF6fd/u+lKmAAGKZbiL34lrDShSu+IG8ydUaXVt8TNqRupueSD
	gc8xCwG+fPfsLiFiXoO0PSWFHEhBcWW+wtViLt3KDWGlGV07KKo3+gb8V+7Bu7TEbMgSp198O/4
	mRfQD5PI9ew8CuwMK5JrqVNlpUUGdg==
X-Received: by 2002:a17:90b:2fd0:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3b41c982d97mr10577101a91.64.1795447017561;
        Mon, 23 Nov 2026 07:16:57 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm20067482a91.5.2026.11.23.07.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:16:57 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Mon, 23 Nov 2026 23:16:17 +0800
Subject: [PATCH 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO
 OUT not function mode
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
Message-Id: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-4-f2322a91686d@gmail.com>
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
In-Reply-To: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 BillyChou <BillyChou@aaeon.com.tw>, Gary Wang <is0124@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

The CPLD I2C pin mode setting following uart & spi used modes array
on device AANT0F04.

CC: stable@vger.kernel.org
Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP boards")
---
 drivers/pinctrl/pinctrl-upboard.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
index b9af6dd93c34..66c1c3e3bfe0 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -225,11 +225,21 @@ static const unsigned int upboard_up_i2c0_pins[] = {
 	UPBOARD_UP_BIT_TO_PIN(I2C0_SDA),
 };
 
+static const enum upboard_pin_mode upboard_up_i2c0_modes[] = {
+	UPBOARD_PIN_MODE_FUNCTION,
+	UPBOARD_PIN_MODE_FUNCTION,
+};
+
 static const unsigned int upboard_up_i2c1_pins[] = {
 	UPBOARD_UP_BIT_TO_PIN(I2C1_SCL),
 	UPBOARD_UP_BIT_TO_PIN(I2C1_SDA),
 };
 
+static const enum upboard_pin_mode upboard_up_i2c1_modes[] = {
+	UPBOARD_PIN_MODE_FUNCTION,
+	UPBOARD_PIN_MODE_FUNCTION,
+};
+
 static const unsigned int upboard_up_spi2_pins[] = {
 	UPBOARD_UP_BIT_TO_PIN(SPI_MOSI),
 	UPBOARD_UP_BIT_TO_PIN(SPI_MISO),
@@ -289,8 +299,8 @@ static const unsigned int upboard_up_adc0_pins[] = {
 
 static const struct upboard_pingroup upboard_up_pin_groups[] = {
 	UPBOARD_PINGROUP("uart1_grp", upboard_up_uart1_pins, &upboard_up_uart1_modes[0]),
-	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MODE_GPIO_OUT),
-	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MODE_GPIO_OUT),
+	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, &upboard_up_i2c0_modes[0]),
+	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, &upboard_up_i2c1_modes[0]),
 	UPBOARD_PINGROUP("spi2_grp", upboard_up_spi2_pins, &upboard_up_spi2_modes[0]),
 	UPBOARD_PINGROUP("i2s0_grp", upboard_up_i2s0_pins, &upboard_up_i2s0_modes[0]),
 	UPBOARD_PINGROUP("pwm0_grp", upboard_up_pwm0_pins, UPBOARD_PIN_MODE_GPIO_OUT),

-- 
2.43.0

