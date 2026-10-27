Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793081137;
	b=K2JANrzgNu8CX+WELzmdcr3sDqFqi+POKj9r9nvgbgVK79YNOARLEBHJ8NbBNcg8AiFu
	 1fPYXZ1YKNCBAOl3l0YYa5lMfNnUri+niqh8/5U5BKdybfN/ZDur33ewvZ+ZdVz38MHIe
	 SCNk4Ja9IOdl42A6mgyjW71yuFt5xzXLVjiO7e5UIxkXSE68C+dDXKDwdoPk2CJvSNmZj
	 9IxPldLR6+JydpyBsjpSA/Odz6LUbCQt+5MeJ+YhkjTvNa0Xsep6RELHU3vCPqdJfgdH4
	 7aj+WkIvcL9ts2yj+zCLcGYqXqlAKZPPGsoDeLIfmSbg8pZbZKEPHPXilE7CiQ+XOkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FyaFjvdm32U/IxSaU5LseDLqJIT+GCnBMfwNLDa5YB8=;
	b=Crbj9YoNEezgDaqYx/AxZr5PZMfPTdBLocobNsS0sAloLutxxLLVMKQiQqKgBdz2F0X5
	 ZfZBUnR6MWBwjs9jH4FYsw5tNFHFb1ow/aX6JVMBZeoVBMZgHoOJ/cgZreY+R4ejToZ0c
	 BxZAvP6wqFfM+/DIyu+vCCe0iesHFzndrd+FSQeDSZmHtAWzL1y/XoottqHRxJxi+3EXu
	 X36nz530+l/Xf1fatpCr7k/mRfI00moNDwn+RQxb2p1VjOUrsPbuV3mNl6tEpe80LFvSe
	 +JSiqRx9EVBniSlIoYzSRvPQxb8IFawjpL3o7LLheXJ1v9hwvjSi5I9y8iWg+y9x3cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PddLDvUN;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3082A606A31B
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 06:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3082A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PddLDvUN
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso472057e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 23:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793081135; x=1793685935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FyaFjvdm32U/IxSaU5LseDLqJIT+GCnBMfwNLDa5YB8=;
        b=PddLDvUNztcgtwxD95E8F+7tysvbAU/1w5sHqBY5DBDP5PDOTVF/uiG8UbCMQFZd2a
         NUUX5mW3m6woSHAhA0Fgc3x2cSiDh8KFvWq53/toFZ8t+uAQOTGx/zrgxFBqet3F8dTK
         +gYCdnqlwbdUenUT03YHUth9m6G8RaeVPK87zXnlH4gUZlZkQPwy/wc+eKofWycXpXQJ
         37m0EUzswFxTO2ETRHhituKW/TevVueSS0Y6TR1NnSvO2TSzzCKRxR7KBEbUE7dS//y2
         eSByBMvNptUqBJHpwvH9ZN89mfouv71jwZ6PjfCA/s1Ik7mD+EVStyQnKYHIDlQ77TM+
         6zlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793081135; x=1793685935;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FyaFjvdm32U/IxSaU5LseDLqJIT+GCnBMfwNLDa5YB8=;
        b=JjHntKff3F/xROY4uwWZNTzcZcaozomt8CFulcnLWB3VO8mnF0nEVAX704gHWn/mMg
         020qmonXhWdCAz/EGGboQe3N0dREBik41P9xkgGRZ+GNP+pjvG76vbgV4YKDOXsM4xEU
         dHw5u1+qZoP4h1RYMz89NqISEEYN+bOobJcKImI0P3X5CEbM5EFRXhlUfh4oWFUoZRO2
         OzBP6Scn2UtHqfHM/JAbaWMUPLtnmTUCGvd8EqS4vJ3qSmUgetAb1Dg2DrBt3tJrRUMw
         OrJej+sfoVN07dDtQaGuDlm5ldDBG7XeL6k+EPwwLa6/hzLU+GLDeribWHt/VsUC30M5
         T+Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxe8cyuKTQ/IT0C4BmeR53UitVst7BJOS3BJFU2J4X1r2bew7z8RfI8NofffJuh2gFfMJKITHPHJh7e@vger.kernel.org
X-Gm-Message-State: AFq9FYK8Km3Azc6mfmeLrRbSiOEKq1NL8WA3LANcursnz3T6ezhYp/mM
	48t3RKYAT3edVYvfuIvs1va0FXAxfH2Lldubn66p/hbP/wnScoIsEd1y
X-Gm-Gg: AYBFou1e9CScDnsfIl/dXVnP+SCsWQz6TXbbI1w11LfKF5P2J2caWa4nmPMkPUSwoK4
	fnHvI1YnaGCa98sHvxkF/KcDUstPuvY8KHcQDPjo/nx3IX0Rw1lYp8EdxmV/6YQS0DJNL6cueGJ
	+izZdrG3RaT6AuErK9AhyoapbUgpiwsx6WEj8WwuFT5LLXYuJxZxPKVgLXRwI754dlijTaLfJuY
	nMO+2Hc/1W5KyZbTBnj+AfaGaH6wx+Q8aSyPyakE/z/PLOjYUDoUCCx2gJYAcf3wrkyqIYuWnLj
	3j4RXdkEA/Mn+RWCxC47XCDMYzIUtoyay7YiIYyJWb8WKjSQBYbwTZsIfdePTTBxNCE+d56ZKlV
	fgKMFHzgNhKscXxV1j3KmsssmZAbbandHyCX2zG9A+pw28BHb26O/2qT0+bJKCFBdXNLst/aBww
	oa34Sg10IAuIJvt4RHhjDjywU1Xq0G3/Hp/UhkpSeV30/PQnXzizRqn83VGM75Gxm2+v0GbmIJi
	sXz5obU58F4h6Yg13e2H/7p2FncxUtuocKVJYm5AvJrXguaQGP24cfQzALpzuGbaHEyZgRSCdD+
	QA7K66+nJaAfXejuDoXfnYzeZvKG0QQVSgID
X-Received: by 2002:a05:6512:350a:b0:5be:3cd0:e4f4 with SMTP id 2adb3069b0e04-5bfc617eb26mr436454e87.38.1793081135106;
        Mon, 26 Oct 2026 23:05:35 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ce9esm1913515e87.79.2026.10.26.23.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:05:32 -0700 (PDT)
Message-ID: <a4a176ab-d826-4f83-ba56-e86e9c6b764c@gmail.com>
Date: Tue, 27 Oct 2026 08:05:31 +0200
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/22] gpio: bd73800: Use named initializers for
 platform_device_id array
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
 <fc1ffd672a11b0f89524c6295e4070c954eb81c0.1793030820.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <fc1ffd672a11b0f89524c6295e4070c954eb81c0.1793030820.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/10/2026 18:28, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> platform_device_id that replaces .driver_data by an anonymous union
> (though this driver doesn't use .driver_data, so this patch isn't
> strictly necessary for the plan, but still ok for consistency).
> 
> This patch doesn't modify the compiled array, only its representation
> in source form benefits.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks!

> ---
>   drivers/gpio/gpio-bd73800.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bd73800.c b/drivers/gpio/gpio-bd73800.c
> index 2be2a885820e..c960ea6e8426 100644
> --- a/drivers/gpio/gpio-bd73800.c
> +++ b/drivers/gpio/gpio-bd73800.c
> @@ -189,8 +189,8 @@ static int gpo_bd73800_probe(struct platform_device *pdev)
>   }
>   
>   static const struct platform_device_id bd73800_gpio_id[] = {
> -	{ "bd73800-gpio" },
> -	{ },
> +	{ .name = "bd73800-gpio" },
> +	{ }
>   };
>   MODULE_DEVICE_TABLE(platform, bd73800_gpio_id);
>   


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
