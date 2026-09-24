Received: from mail-ej2-f29.google.com (mail-ej2-f29.google.com [74.125.228.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6026E4A483F
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.157
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264837; cv=pass; b=G5fDxMRfjrT8mqswJSP7gGXmHDvkF85se7yAZB/fs7YUKyP/weJKAgJHLNPZTYMLV5N84zB8bT3d3H826wyyDkGVal/Eh+y9CaQ/YjrZoxJRSegQKA3l6x2ZL9weqEFfIqsyyLqp2iMgEUaRirTsMqVpC11udvvKWsAinccKn7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264837; c=relaxed/simple;
	bh=ngFJLjCIxCAeT7eexOCKSDLrNT1g5/NSYXpxJa6UjHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjDDWHjQvWd/cHQHAN+ui7QnOrgOOk6URlkxi+TmMMS46nvvxCKADV+94fHUL9IBxuYyrDc68sdwyV4gz1UKrQ3WX5mV0YMqkkX+xL7KEzJhbo1qpwRQyDH6Em6cGpHx9QEB2GdwBdG6mVXeTF0BcOu9K9rVA/anHYMJW/cUAxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7gK6hFH; arc=pass smtp.client-ip=74.125.228.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7gK6hFH"
Received: by mail-ej2-f29.google.com with SMTP id a640c23a62f3a-c294496989aso285073766b.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 08:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790264833; cv=none;
        d=google.com; s=arc-20260327;
        b=q0opa2DnUZo1YGm+IgBccWrvwqG7tGX8YkWb0OeKnn0zyrPM6NDMOhP+ZvTs2mxWWq
         Wjj1WI33Q9zqbTbTZmskXzBaXAxHxnqxng/vspw7ffmoV8NaaLzHJ+QzZ5H76gUlxcEg
         01K0QzQ2Qz3Y7w9MYkslGYJVnvZWRwm+spfYhMltMhHQnWVI/OLd98HNXhH8VlyWjyS3
         oeBRydR6wEtOQtv60pDGa6/a3A31XVFocH+I7/YynHF4MTuatStnNUPpZWaJcP3PJ7nv
         wtxcT2EwDc95TTlkfk9EFaI9ZjSocmyjFBXLgtfWZCunh3cbP8k6XXOaae16GGafNwy3
         ZNCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NjMgt0ZpdQg2knSU2JXbBhhsf0Kx0wU7rhre5Y0cyIw=;
        fh=Zmgc1GuYbgYdifj5PDgWcDE86Hsu4+d2vAp9BeU+85Q=;
        b=MilyT5fAarz9PP2dy0F4uQ3hqXgnrBAWtWXLqMFmwHZu4MGZ6o82VrLSfCYG0L7hzW
         u8l43xmKNXsxNoqZHqtgZBh87qDO88i/0qnML0LLdTOOlCpklEMGfK73kRc7Xv2ftHqR
         6njWBHFcHDz0ZdX7MP6KLJeFj5+EbzRLsCO55qmMxPx8YB96NpKmoCfGINL0kyef/Kis
         N+3KcAYr+S5UnLCjz97Bkq27wMVY27NsO2hx8nSyUBLzCRIijGu6aCNq94hJBxOqfMMY
         A8m/MwfUd+o+KbqJ5CDj2mJDsEt2KDnh0b/AOehhrlb/snjNdoNJod54Gz2iUIgWCieL
         srJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790264833; x=1790869633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NjMgt0ZpdQg2knSU2JXbBhhsf0Kx0wU7rhre5Y0cyIw=;
        b=N7gK6hFHAihZOUZORT213j1fI5UtgijwWWtFSyC6oQpnkkFWe94kgpQZ+SxEVStIYN
         FGLWMWh7BqtzktIHG+ONODHaxdkY2XJ4p903wAtdsgGSG3fRe3Fc7yXDx2qkfWvnmalR
         qGXfx7Vz5MJrFvHrqgQ2msKlyg7q2qGLLfFd8jT3Zbz3v7vwd5hWOqysbRx0mLZUGeZh
         ibkywErp2mP/mLyhzAz7/X7BUrPi2XO4xw9r7J9hcRsg9Cxx+fDE3jB61Ekn43dIPlne
         G1JJTXPRT8PQwCJ4QHMvzwxqMrXDQ1302yhimmqSPAFb1rh3e+JOOTykL3BRmIbtc5id
         5yQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790264833; x=1790869633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjMgt0ZpdQg2knSU2JXbBhhsf0Kx0wU7rhre5Y0cyIw=;
        b=PM/RfjU5dAlRiMZSvQTJ+pNk6ivwzmLVTR8WBfyYTiOvq+IpFsEvagvKpkfLwX7Jq2
         QJZjULReawDEFqfgQP5RAvi6JU2RB3x4YaK0RfDDzy8HbTsQB92clj63aajD3xZ8Z/al
         /AAqr6oj6zbd9UuZlwkEhqaQ1dd0gNFZWXlzVKy7pOqTWeQFAZM9EHZOJm1SzSetmBuQ
         ELPTcmha+KopBw6P45q8mHSLoIVDNsMJm5K3PMBMcwL8TkLS8I/4a9pibZcN/45Wx4+v
         nMilpvaOhOsqxFuXkPF72Dy7lbuQDTbQZFWfl8JRySUYhYotTiaviD539K6ffJ8XrgPh
         vhnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLoxGRJSJH9UsCWwwESK/qiZvm/futdsbWGqlb/efeV8OkWJk6GrwlF8AhrJtbi8majaO5QepcDy8I@vger.kernel.org
X-Gm-Message-State: AFuF++k9wyP/e5bEtd2WdvKl/eSI7547217lNBOCJAiyEHcVoD06TwUs
	xQGfhlfoJgR5CzdNJh6u6iyw81eUj7vin2XHJ1M4YqMU2oHWQmkbk/RF8VbOoRkZaR/nvZyS6/I
	AfsHJHbOeu+DCetqGnkcFK4l2nTIonvY=
X-Gm-Gg: AYBFou0d44XLvvnw6J6exnvmZ40wo7+JymbxusG4yRKPl7D/GmphtLzIlJhHLjDp40W
	Z6jy6sgS3JaQoGB8sfj0cPHph49UxWIIJXRrkfdTJMEcoan/sdQSfSo+wrBlGsLnhvLLb0ZuNef
	Zv74T46bXnPyj+YgOFwwYlFgJfIneRlNReM8FakEIEwtV/QRXfDyib68wgdJbItnhMsUN37ZM6/
	MskoOeM1h/LVvqlaypQ2t9Mqp05FGuq0SBM3exN1c8+Sh2cZRODeoLaWbasjyoudoY7BCmphEIM
	vGT314pP8wAhqoSY2XMlU7F1R97GlZOT03CTFWMPzQxkOcfTbGgYVU5T69wb+qIqz1bX4maDr5N
	U1Ax+YB5vhXV6Rf5vykV9Tk5Tzud2FAfelWmGFBJy+JK5X1ZE7sXLmqS9170/6JfwIJaBTG5iAM
	KoqFFhIaqbTV/9ngfLyS7cKHODZW7a2b+ERkA/Cw0QZQ==
X-Received: by 2002:a17:907:1ca2:b0:c29:6de8:d143 with SMTP id
 a640c23a62f3a-c2ac23d7742mr270801666b.19.1790264832926; Thu, 24 Sep 2026
 08:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919171100.90430-1-kmehltretter@gmail.com> <20260919171100.90430-4-kmehltretter@gmail.com>
In-Reply-To: <20260919171100.90430-4-kmehltretter@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Sep 2026 18:46:36 +0300
X-Gm-Features: AclHuK-80m-884TG7yfw_6rikpHBOHTr9J36QiRQ2iE519ZRagEJv1so03yiKVQ
Message-ID: <CAHp75VfOwZG0htxs7LJ5X4cdTMApESRpDaGCQqJpD3RSap+-6w@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: tps65219: Fix TPS65214 GPIO direction programming
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jerome Neanne <jneanne@baylibre.com>, Jonathan Cormier <jcormier@criticallink.com>, 
	Shree Ramamoorthy <s-ramamoorthy@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 8:11=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> GPIO_LINE_DIRECTION_OUT and GPIO_LINE_DIRECTION_IN have the values 0
> and 1, respectively, while the TPS65214 GPIO_CONFIG field is BIT(1).
> regmap_update_bits() masks the supplied value, so passing either
> direction value clears the field and selects input mode.
>
> Translate the GPIO direction to the register encoding used by
> tps65214_gpio_get_direction(), setting GPIO_CONFIG for output and
> clearing it for input.

...

> +       val =3D direction =3D=3D GPIO_LINE_DIRECTION_OUT ?
> +               TPS65214_GPIO0_DIR_MASK : 0;
>         ret =3D regmap_update_bits(gpio->tps->regmap, TPS65219_REG_GENERA=
L_CONFIG,
> -                                TPS65214_GPIO0_DIR_MASK, direction);
> +                                TPS65214_GPIO0_DIR_MASK, val);

regmap_assign_bits()

--=20
With Best Regards,
Andy Shevchenko
