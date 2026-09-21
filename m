Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143EC4ABBB1
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003777; cv=pass; b=H5eGTVrLFKdDANH7ZCWDNg7kH4lATM8Xo1iVo4Vu3tSW8VIxLxjPbYy5iS8TuXZciBLuWUQDqBJEMJzFRrjKnw6fOqNHz0T22D433x3hVAmZR/vWktq4ZbBLPUxxTAyZX6tgMsVwHGHFc8c/sFCbdBavqjoipNRDrn8gtLOZAlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003777; c=relaxed/simple;
	bh=XHPO43iPwGf/8rDqm86qoTqT4DK9heTLxM81CKZvxYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VT29XAs4abhz/kNtroobsyu8fnKX5o84x1QgKXJSsbXiDP9GUnHEjqAmjJUjHfjRlGLCPHpkJY+xyhevbJUx/7e2QK5oyCimSceFD3Qb8o5EaFN51Bkj1S/GghBiqv3m95YoQZcgFOBnAtcU2/jxCnXKTu5gO+Fsp+YldEMwFBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=MlAuWMAw; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="MlAuWMAw"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so4694965a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 08:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790003772; cv=none;
        d=google.com; s=arc-20260327;
        b=Ijf+5cQogY9MCDe8PogX/H6kIqbQ2/VBUl+TVW4oUT1RGv4P0nJjWG8HI7cHFSAH7Y
         qwdAyo+AwmC7AV3X/Y4Y8ylUvYYk17CD8aER+RxiWjP9/KJX+TDicvd58J4ggHMLUXGz
         gsPJurrH+Xx4lgOVfxgusfLup7VNCmi4ZN64Dg1f6ByXoK6bJDcy34Dn9JJxrMjQIgId
         quUUgt3i253f9xtaGZM9ZUaWh9ynuvhXKQEv4rvsBxgvILYYH7gQWmgLG8v1Noj7pcZQ
         F/IoTkWGQ5y81qjbTQNPvFp100kwcuylkOJPi/zYvcp/OfopMiSkJTlpwrAq4Q0+lWXB
         e7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HX8wdI5S2tl2VsV0b3cC7CFvQKR8NtMSXQBbxVkBhOM=;
        fh=jUl6yxNRUj8OL48gis21f7S4rWNNvQJ9ZWWJ90KamdU=;
        b=Y533m1v8ze42x2ui7R+Zp3u0UiJCiglofAR4xvb5m6TKsEjr/yp/dzjVwuFeFudfuB
         /ejXcNYfVIUSQruon4/tBfqTu8LXH8YlcO60CpCtZihBJ94MEZrdYxXGQoaMt9ZpjHTs
         RPPLghsrYupC54fesfjQzYJOxlSXps2MYDxm8ODQd3O68R0YPeZQLw9coXJu85ZM0QsP
         6JjdICqlT3Bl3+Y/CtYX0FdIMEWOYEvmk3ufB/NzLy/FI7VU+UvWudnOkvjWBxXqO3BZ
         8gDSk7x6WC6EdSoidDu9Gri/ZfzJ73FwEJ4b2Z/KkL0BaeZXO3OkPdkcQpsZrpY/xOmu
         k4dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1790003772; x=1790608572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HX8wdI5S2tl2VsV0b3cC7CFvQKR8NtMSXQBbxVkBhOM=;
        b=MlAuWMAwbjpYzJtw6TBu52HvGXYbcslY8xaCfxUrYPzU9bDyOjDbHfqEDIRVacsDeM
         /tFHlhXgsaAHLTTlwW7qwpnV+mXH0JoJFS11M4+u1Qk6N+/T2VW4aNM1Q/Zt5E75Vs76
         lEaufwQgwsnvCEJtKfNGrtVb6H2pOmFnQP8V9g497VHGXsdCBlOnWgUlka1Yuoz0/j4t
         iSINgCEg3C2FvVOlvEyHlNYjkyszX75D0C4LdyZrBfZDK8rIZKwFfeBTZ8vKTa6Ejg9A
         1RF+io1ZIWhI764yfnveupU0Gn+H5XYZF1GKyHO74vOyfszv4mHxOKzmaycIchooOZ1i
         08GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003772; x=1790608572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HX8wdI5S2tl2VsV0b3cC7CFvQKR8NtMSXQBbxVkBhOM=;
        b=uxRB+q5EAy8JMb2plfkzFAgY2hxvW2Uvxo0k2FI9O+aXXIFYK+r3T1Lz3TLihPClc8
         5onE9Kh3GiJcJxwt+HNETfNIDVy9lJFVEnZzAksoHnZl80iRpffbLKs9R1Pgks2S020k
         3vTzRX5Ds427OnhTjX3gsdJFBYFpidDI8FeUzOLkPXGusN15frwYXbdjFqZytkoJKfuH
         9Cq/8AHD4Mi2LdHV5ToBOaJzyCVoLrdXn2rfYijI186i/TxpPPy1zQQD2ELf1TinRm3x
         QBTY+xkRCDNPOLjIWXxfRv7PXCyOmZf8DLsL2OJbWxnjhJtyPr1DrZp4VBNLzOgH19SS
         VMqw==
X-Forwarded-Encrypted: i=1; AKwUvByV0ADkKoinxZggeI3guTCvIa3a6nUs0yDCBhI64D7IcKA5eGw9dALZc2fAqLcgGPF+RZg2l7rkz4YT@vger.kernel.org
X-Gm-Message-State: AFuF++ltzLpGRxGBuLNTJjtZerDnrkyhY+NmAs1S5PN5iyY1B4IcCC0b
	/osqHqEZe6MroqbNh/0rEh4FzFqtxMJzVTmjZ//Gt+j2Yi0+QTosmQGXhcfXUpDLk7v2XzuKumr
	h6+wv0hKO9AzJJhHjFMWOPc4jYOuUDPJWPTCA+uGA
X-Gm-Gg: AYBFou3mDWqgxkZ/7niyTyIdTd1xLcdbvDrOZBhGBn0q8IULtkuKCbgL/drVn5F80oJ
	rvyenBPUqzpd4bgwhG8wdyTthUpHzU8LSjg9LxAi5aayJKI6W4AC9YHrvPKJdn8VzwZqMxfN/QY
	IUrGFZktGyXq/pqxYPlLura3rurG/j9EW1o3x5NS0u4Y+cbyyRGY4qHGB2L2ht39l/J7jRCFxeI
	/YU21x7kincJv5Mpqfzns2hIfe4URVmxK4aKhT+IO4xcQat0InYKavv772kRU4+DMRmFxx4bCqH
	rl6SNFiF2AhVw+MEZN7Gd76Nu3jT21FgWIHcgSHxW9FjkikJkcVf9A==
X-Received: by 2002:a05:6402:4382:b0:6a9:6944:57f2 with SMTP id
 4fb4d7f45d1cf-6aa564ce3c7mr7698906a12.10.1790003772167; Mon, 21 Sep 2026
 08:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919171100.90430-1-kmehltretter@gmail.com> <20260919171100.90430-2-kmehltretter@gmail.com>
In-Reply-To: <20260919171100.90430-2-kmehltretter@gmail.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 21 Sep 2026 11:15:59 -0400
X-Gm-Features: AcwNN1XBrxH6m24bVAE90lwMgAyLcIq43xhby1tZife3cbQ2oW2ZxE_IChsMK9A
Message-ID: <CADL8D3bOOK0ER+rk3kGLaRKH0LBpTYj64SX57OCzZo4WeTZCHg@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: tps65219: Fix GPIO input value reads
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jerome Neanne <jneanne@baylibre.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Shree Ramamoorthy <s-ramamoorthy@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 1:11=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> TPS65219_MFP_GPIO_STATUS_MASK is already BIT(4). Passing it to BIT()
> again tests bit 16, which cannot be set in the 8-bit MFP_CTRL register,
> so GPIO0 is always reported low when configured as an input.
>
> Test the register value with the mask directly.
>
> Fixes: 57e30e00bd5b ("gpio: tps65219: add GPIO support for TPS65219 PMIC"=
)
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Testing:
>
>   - A temporary KUnit test instantiated the driver with a RAM-backed
>     regmap under x86_64 QEMU 10.2.1.  The TPS65219 input-high test
>     failed on the base commit and passes with this series.
>   - This has not been tested on real hardware; testing on affected
>     hardware is welcome.
>
>  drivers/gpio/gpio-tps65219.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
> index 457fd8a589e89..b25c6f7277680 100644
> --- a/drivers/gpio/gpio-tps65219.c
> +++ b/drivers/gpio/gpio-tps65219.c
> @@ -79,7 +79,7 @@ static int tps65219_gpio_get(struct gpio_chip *gc, unsi=
gned int offset)
>         if (ret)
>                 return ret;
>
> -       ret =3D !!(val & BIT(TPS65219_MFP_GPIO_STATUS_MASK));
> +       ret =3D !!(val & TPS65219_MFP_GPIO_STATUS_MASK);
>         dev_warn(dev, "GPIO%d =3D %d, MULTI_DEVICE_ENABLE, not a standard=
 GPIO\n", offset, ret);
>
>         /*
> --
> 2.53.0

Makes sense to me, our hardware has this pin connected as an input so
I must not have tested this case.
Reviewed-by: Jonathan Cormier <jcormier@criticallink.com>


--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211
