Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EAA33507C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 23:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771458015; cv=none; b=OotbBmcVeMUaliggfLsCycvxueykL2UYkgeSXKyFyVz7nLIULveM1mgGNIULtnuK36oBxHrfLV9133rcY5GEYDi6CJhbbiWYMm7pOVdFDz39/lvfVKHeZG3y9oGpzr2Zicr1sgN2fuKKpJgsh0QJh6RVGVG1FcsqMHaAokI5Q24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771458015; c=relaxed/simple;
	bh=CBgZWwOQ0quvIbMpH+FyXTwEozhHuVvTtlYLjdZfyZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+Pad2CXCL70VfTIvMILlt7KzzST4UTS6sQ/VvypLE9YE64jMj1pzsKMK2UGIRzfDvZ2u0hGY9+Z4GME8xuZ2exaASy84s8knxL7l762mq6iwcuZE5tXem2e8WJmyeVjcHB2nNArOlY/UUD4DhqnPOLCEcFP8sFnYFoy7Hy1pO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WCgC55Ih; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WCgC55Ih"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d19bfe1190so403152a34.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 15:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771458010; x=1772062810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZMVQf5AvRtVxik9hL/PNE4v6s7C5GzaRdwqbUswM+4s=;
        b=WCgC55Ih7jAyzcQRxfRkX7BJXn16lQ5jNhCxAr3/e1lyAEfomMDus45WhixWWhQuqp
         /G4nOmDwzkG0hKjLfJODNycPBkq6M1TOKCFDjFEDLGAfOMBhRVquMOnK1NKYhFk5GfF2
         3ECRJF+LWXjV2r5741PpF3p/mfATd88xnzhccINecyKADfqabzZ+5FpyfGLigjS875HV
         9xxNNSr4rnA+Wbk0AYpLA5sHizA3dex08vDhlihpOrob6bSGtn3GMdCj0rxicdQGmchp
         J83dPsgpHKAI/LE5paXBxjk7t/2tscrdsZfztbU0twxLv/vjPYR2lbhBOOkz2urqgRff
         rdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771458010; x=1772062810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMVQf5AvRtVxik9hL/PNE4v6s7C5GzaRdwqbUswM+4s=;
        b=VKA7BSiyHr5JmMeUHRoZa3etE+83szMLwujW4VEq9Yi+pVzrBmnU8OrQ9VVX2PJTOc
         m6h3pkF4WG0t8a0jcaGY/fk8TkFhU6jfZUmdXCnFKm34/jdD+ByShfFbrpsJZrI1Otwv
         YaC4C7xOuRYSYOelwJLasXvo+M9ECbf2zV2BfdejZz1ZLL+weKBJuQhEsd6CmgxqJp9q
         yUT9aZ27W7MlHHP3XFsGfxc/3K3SDxlRpNZbJRdvw6PA4sQwiafAmHuRa4fk2IulySrM
         b7UtGN+QQJ/LgIGMiaZ9Ps4+H45b9CxpS7vDLlo7Ecwsrr9jbPHAqcoryzqgHTxrXgov
         yIpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlQv5h8uLqoRfrC39iyCEWRqkgZRi6Q+5xcr31Ek0NmEYLVVgzsBjnbXbPK+lqffZ/x7ERRrYAh1/J@vger.kernel.org
X-Gm-Message-State: AOJu0YwiYyZacQdIZI4R1Icmru6EBap1gosqJok1DVq/+fvuG6r923l5
	SAc6epsZs/l9TxKZn2K38t2iwKMDwGR/iSe8c5PuTWTk/uZmjUkzcxoGJsYaGvASaHg=
X-Gm-Gg: AZuq6aJ3FmKbPzZj215gkUlcvm53XwlUANyXurkifP/CEFlMzpXRJlzV7feBUu+ocXT
	3RU9IIsl2PBbIPeFCVdOA1jy+c4YO5dX1tCI7PSKSSJl7A2rHPqNTBvPFfp92cB/O/uSAZs9IEJ
	Q4MEbz6VnYw+B30Ft8x2kx33wIltftR7UoEz+1hxgRvoLwsh0n2ykzfHNGyqU8svbCO2XYeb+HG
	Gu9XIFFSV+oliE++GAQ7wPSToHZItAEkVzsDMhG1w/bw7EkBngRImGe2A+vLFMY8b/eKAJNUGEp
	mdV8R0h9kJKYzXTzAhDM2RhIBhdEQpQyeDSiE5Y0jb1qnyfZvVy0LCCEnUMJ7Xn9uh0Q045Jsy4
	VjnmnW6Yth7/ZI5zgJjEhKj/VF5sG2VN8gfvmtlnpAAAdu1/nuzKfRSdPcxq33zGSpULOJmrRyi
	Rc3/9K1py2ZUGlzz6Ut2tZpnSr/FPSnmoMnZQAntJJ3pdvsbCBa5kzlQ41SRxi39zjcKwsCs0Z
X-Received: by 2002:a05:6830:83b2:b0:7cf:d9a3:12cf with SMTP id 46e09a7af769-7d505dc3856mr2774563a34.16.1771458010253;
        Wed, 18 Feb 2026 15:40:10 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:ab87:97b2:3c7b:da2f? ([2600:8803:e7e4:500:ab87:97b2:3c7b:da2f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4bb66a066sm15763696a34.19.2026.02.18.15.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 15:40:09 -0800 (PST)
Message-ID: <e883faef-0837-4f8b-8fb6-f73fb4a26446@baylibre.com>
Date: Wed, 18 Feb 2026 17:40:08 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ti-ads7950: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <aZYmemDCcVzPB1RM@google.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aZYmemDCcVzPB1RM@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/18/26 2:52 PM, Dmitry Torokhov wrote:
> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by ti_ads7950_get() for output
> pins is normalized to the [0, 1] range.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/iio/adc/ti-ads7950.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
> index bbe1ce577789..0c4db18ec4d7 100644
> --- a/drivers/iio/adc/ti-ads7950.c
> +++ b/drivers/iio/adc/ti-ads7950.c
> @@ -433,7 +433,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
>  
>  	/* If set as output, return the output */
>  	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
> -		ret = st->cmd_settings_bitmask & BIT(offset);
> +		ret = !!(st->cmd_settings_bitmask & BIT(offset));

		ret = (st->cmd_settings_bitmask & BIT(offset)) ? 1 : 0;

Would be consistent with the style of the rest of the function (see below).

>  		goto out;
>  	}
>  

There is actually another bug with the return value of this function:


	ret = ((st->single_rx >> 12) & BIT(offset)) ? 1 : 0;

	/* Revert back to original settings */
	st->cmd_settings_bitmask &= ~TI_ADS7950_CR_GPIO_DATA;
	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
	ret = spi_sync(st->spi, &st->scan_single_msg);
	if (ret)
		goto out;

out:
	mutex_unlock(&st->slock);

	return ret;
}

When the gpio is an input, the function always returns 0 or error,
never 1 because ret gets written over.

It looks like we need to introduce an extra variable to fix that one.

If we make the new variable bool, then we don't have to mess with
`!!` or `? 1 : 0` to normalize it. The compiler will do it for us.


