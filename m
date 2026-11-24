Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511856;
	b=e3HBK3CdMZIN6vz4U6FyEiYxUTCgoEA0gJzMbF8hChfxm3MlMsfH/bYI5svoMQb0rvBP
	 KYxBRZnfndeg+qMFYm0WK/IuYLrvla3HmrezZAtPgxAFriTgvcYWa6ky+A9mAUByrkw3m
	 NQ81SrTA9Bin9v9vFNuLSJ8ndaXMlk3gxnFQCpAMQKYzLUmgBR+onvpdWF8SjcvNarZhM
	 yXRea08VLhGSA6PMaV6JFUKZ10BqvTl4nLeoOY6nWigyARivlSTiYhvt1YiYEd30FxOUl
	 Qo+PFiXwzOaMCBIclXCDpZHkUce6VWULvn5UES1+xEtDvXoh2WlOi2myuMVqZ6Mtj0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511856;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=F9ZILuSuybDZtjSD48JBlRkjyPSEXtkqyJScsyUc8/I=;
	b=aPCCiO4AW+btHr2Nfam9YVbhN/td+z2kguwSYQS3UmsuqjBWx4bCDshzOpLdBPLrxCZU
	 rVUbIXDorykQ3vqKP7quanGTSWcoEW1Ln0M+gcdqQ8ZHJBtQUitVkToYDPu5alv4KutMo
	 V9tDZKFVgzfXY6BAUFhsova03x3xcx2UTeyWOurkaFcZIb+l+bEj/+zHxkda8EPMx3Al3
	 6ZevqILLZ8YM8XzVCUYhIj56kCgL/XNT8cmw8lhLjWMFwkag8oGOxRN2dJgus3Y2Ictt5
	 7hVF0KCWFrPjX/N8su1SoYPg5Oe/nhXJBoDaHpQUUsNZdeXUZRmpTO2bcOIP9JWdMOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iXkg0yr1;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E075A606A31E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 09:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E075A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iXkg0yr1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7576DC4CBEA;
	Tue, 24 Nov 2026 09:17:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C1DA601E1;
	Tue, 24 Nov 2026 09:17:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDEAC11E68486;
	Tue, 24 Nov 2026 10:17:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795511853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F9ZILuSuybDZtjSD48JBlRkjyPSEXtkqyJScsyUc8/I=;
	b=iXkg0yr1nNVuTsr4GiTS/DwpT1NFo55nN3RDXLum7wXL/qOmZC/f7kMIAP9HQd7SEQsjOB
	GZ4sagC/F8K1m/vGOYPT979NXRBSvtiY5nVCfD7ZD6poekg69eNODjp/NsnF6oiERoxYck
	+VxNTbbOPzbpiSGHMoxSkV3kGLv1soQyS48NbDmzKiTjcmsB+sRjE9SAW3LAwOPVWjyT7+
	4ewO4TmA4B854PVAIEIUb/Th29xv/BDsmi/US5sXZyy1TIKYsCdqrwDw3WE3pdo9HYyzKm
	iJQHXGu4zoOLdhCHwCUFaAQ1b+FW0jMHZE68VxiC782rs5aAJY7wYFx9cQimNw==
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
Subject: Re: [PATCH 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD
 GPIO OUT not function mode
From: Thomas Richard <thomas.richard@bootlin.com>
To: Gary Wang <is0124@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
 Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, BillyChou <BillyChou@aaeon.com.tw>, 
 stable@vger.kernel.org
In-Reply-To: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-4-f2322a91686d@gmail.com>
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
 <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-4-f2322a91686d@gmail.com>
Date: Tue, 24 Nov 2026 10:17:15 +0100
Message-Id: <179551183567.11700.4795900066384429160.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> The CPLD I2C pin mode setting following uart & spi used modes array
> on device AANT0F04.
> 
> CC: stable@vger.kernel.org
> Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP boards")

Please explain the real issue you met and how you fixed it.

>
> diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
> index b9af6dd93c34..66c1c3e3bfe0 100644
> --- a/drivers/pinctrl/pinctrl-upboard.c
> +++ b/drivers/pinctrl/pinctrl-upboard.c
> @@ -225,11 +225,21 @@ static const unsigned int upboard_up_i2c0_pins[] = {
>  	UPBOARD_UP_BIT_TO_PIN(I2C0_SDA),
>  };
>  
> +static const enum upboard_pin_mode upboard_up_i2c0_modes[] = {
> +	UPBOARD_PIN_MODE_FUNCTION,
> +	UPBOARD_PIN_MODE_FUNCTION,
> +};
> +

Add a static_assert.

>  static const unsigned int upboard_up_i2c1_pins[] = {
>  	UPBOARD_UP_BIT_TO_PIN(I2C1_SCL),
>  	UPBOARD_UP_BIT_TO_PIN(I2C1_SDA),
>  };
>  
> +static const enum upboard_pin_mode upboard_up_i2c1_modes[] = {
> +	UPBOARD_PIN_MODE_FUNCTION,
> +	UPBOARD_PIN_MODE_FUNCTION,
> +};
> +

Ditto.

>  static const unsigned int upboard_up_spi2_pins[] = {
>  	UPBOARD_UP_BIT_TO_PIN(SPI_MOSI),
>  	UPBOARD_UP_BIT_TO_PIN(SPI_MISO),
> @@ -289,8 +299,8 @@ static const unsigned int upboard_up_adc0_pins[] = {
>  
>  static const struct upboard_pingroup upboard_up_pin_groups[] = {
>  	UPBOARD_PINGROUP("uart1_grp", upboard_up_uart1_pins, &upboard_up_uart1_modes[0]),
> -	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, UPBOARD_PIN_MODE_GPIO_OUT),
> -	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, UPBOARD_PIN_MODE_GPIO_OUT),
> +	UPBOARD_PINGROUP("i2c0_grp", upboard_up_i2c0_pins, &upboard_up_i2c0_modes[0]),
> +	UPBOARD_PINGROUP("i2c1_grp", upboard_up_i2c1_pins, &upboard_up_i2c1_modes[0]),

I personnally prefer the actual implementation because it saves some lines.

But if you really want to use modes array even if the mode is the same for all
pins of the group, you should convert all groups to modes array, drop dead code
and explain the benefits.

-- 
Best Regards,
Thomas Richard

