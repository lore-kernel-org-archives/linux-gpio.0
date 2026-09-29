Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA39A3D7D97
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790696098; cv=none; b=F4/BJlQv4bFVyybV5v4HMLgJ5hENGhl+xMt9Tk15K4I9SUCwSHkSsk16fbMvE0GJAg5s/CfNTT5bgabTa190GbwSoPY6EV1jBzWyWa7/grLcIN9Vll4mrdGZyvB18sEaixAaS4TNMQaJu0TctIF5Smj1IEF1+NskGQVYVhKr1so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790696098; c=relaxed/simple;
	bh=CSu1cXiqbY/jfZtGsZTi+5MN622ll/b5t0C05YWaEAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdMqrHHrpOcmVo/uH5+E1ZuatdWPz51BxDGAIIv+q88fwM3jl2ocEIxFy1bzpnB346jXQAiFUF0CUSp1bdJWR21GsIi/GtF/gXsSLJDXD4RbP+9ND7Sb7ZArxHRyHXUbP6anyj4oabi6eVAv/WTqtydvvRffYmTGjLhi9/RixIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TNanFD3t; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TNanFD3t"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so24799075e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 08:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790696094; x=1791300894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bK1kRsPsOXdZFtj24JVUR5GYlNpzvwaq05tohnScRrQ=;
        b=TNanFD3tMdr3qxAyG/YamAhZSglLIl5FKaJrSDYj3abZDaBc0mrzSec56Jxqg9ozyi
         1UAtNVpfVKKpeOLRJ1ihZ/7COJaHHi1xI9wObDFnW7xk/pWit6WnXByryLHp24hGNnr0
         omrUzZKQjLvnrbe2S2hmegXU0vtK3pJlR6AicRXo6OhFH/Ur3OYgHRHgIGFzb5Nde13q
         E0pSLXG4nZ2FopCw4gMiMyVtHML0ZKiRpC2rGuJXTdopgVdSHANKP4QxPWJlUruSKASF
         wjpNv9/928m0/QJE9r78PF2k4B8gIi8MnOrgtXNhnefcdJB73fFJ9J7EagfDZ8vGGkM9
         OOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696094; x=1791300894;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bK1kRsPsOXdZFtj24JVUR5GYlNpzvwaq05tohnScRrQ=;
        b=oOwa3S98NLvf5HKiFResOvdT3kP1uGAjum7aTGV1GpVq49LB4UF8HvfWQWfT4v+166
         EfeWPLHFrh1YvQJEJeFMmvZiAZBlbHjesUzXr88pab5jWJZGILbwTPOy0XaRQLNzB4Ld
         sMGbDC4rUQgezcH8Q01FtmeBRLZIzVsN1kbb8SgUYNzk69RzvnxYnoJKu5BOmkUVASYk
         U5LHo8ACeIvD1r2i/90A5/QoVt96hsx2rtitBmBLQQg0v2DiGyB8PGWFgnHHhKrJfPwz
         HiNdPytsruZYYqsslxJVHzW/UdqfqnhAUTLEfvvtb1kC5mJSHk2gopIgSpLieC/1WAO3
         vmgw==
X-Forwarded-Encrypted: i=1; AKwUvBzoIHTcfYkRzY0jSjFkkI5olX/ZBz2A1IRHYdvzaUq2XkAEQHejr1EALpvup6h6MhGXUE5LKXtPUkmZ@vger.kernel.org
X-Gm-Message-State: AFuF++mRV3q7NPtXoOWBT4XkqjDmlL6nd8la7L9QWCx0OsnOGk6SM6ap
	ylEKkgSDcgBjdWtRwcv+QfpBq5YDdkr5IhKTwSBrV2Vl9O+yV5Z9FanVp9yNaKx/rlQ=
X-Gm-Gg: AYBFou3LIcE95Ng14gKFeOa4GMBpYzsj30LDL6cTmlaWGEzKXN9ZGC0DdUiOfr7TSoQ
	mzDC6DxQh+S+bQ+eGGh0BOOtpUeHypKytKZREfoVzzDCBkXRp54M68+ePNvIQoDjuhX/bSDjwfO
	nFWEYC6BRXX++dYn1rjTn9/TxC0aY9pIHTkR1g7njB6PCX2uLOKafks5Ky8etfjfAKpeJPPA356
	e3BKfQhQLb32qq7eFqcaFqc0F75HvGjDOFKqYbE9uZLQ/p7U0fVDz1Y1ljjWp640iBmGQ+3pOvY
	Ppr5LMleV2bTxjOavYluo6UFUDZfIQZWrAhD91eOqFgrUHBv1Ml5LCpn5/fm+f90OMUwcR0mW7D
	9sv1YQgzBmInYtuQW03o5chBM3ieSSS/FtnNcd/NTX79vbdtOSFz10PyATlxO1VK/FyWpPQPWPe
	3UgHE09mmR9sqrlvqQUYO4gFP3kIJxkuJRLDIl94DU+yzRb5w40DcntlHhclRw7ePs10WqCnwPB
	Y6ZawbzPiw71686WTNpueB+AHuBIFMCKaP5UpSnvspq3dQsKoAnOGlGMc1SBHRsr9KsQxUS
X-Received: by 2002:a05:600c:8b6c:b0:49f:ffd0:9a9a with SMTP id 5b1f17b1804b1-49fffd09b09mr145822235e9.25.1790696094266;
        Tue, 29 Sep 2026 08:34:54 -0700 (PDT)
Received: from localhost (p200300f65f19a904123cb16e9a8bb736.dip0.t-ipconnect.de. [2003:f6:5f19:a904:123c:b16e:9a8b:b736])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a00d0f442dsm81897025e9.13.2026.09.29.08.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:34:53 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:34:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, 
	mfd@lists.linux.dev, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 14/20] pinctrl: berlin: support Synaptics SL261X SoCs
Message-ID: <arvZnEsAdJ5R9mBi@monoceros>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-15-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qdr5pu2vmyb2k4sk"
Content-Disposition: inline
In-Reply-To: <20260929061417.20733-15-jszhang@kernel.org>


--qdr5pu2vmyb2k4sk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/20] pinctrl: berlin: support Synaptics SL261X SoCs
MIME-Version: 1.0

Hello,

On Tue, Sep 29, 2026 at 02:14:11PM +0800, Jisheng Zhang wrote:
> +#include <linux/mod_devicetable.h>

Please rely on <linux/platform_device.h> to pull in the definition of
of_device_id and drop the inclusion of <linux/mod_devicetable.h>.=20

Including <linux/mod_devicetable.h> creates a bunch of unneeded
dependencies on subsystems you will never need in this driver.

> [...]
> +static const struct of_device_id sl261x_pinctrl_match[] =3D {
> +	{
> +		.compatible =3D "syna,sl261x-soc-pinctrl",
> +		.data =3D &sl261x_soc_pinctrl_data,
> +	},
> +	{
> +		.compatible =3D "syna,sl261x-system-pinctrl",
> +		.data =3D &sl261x_sysmgr_pinctrl_data,
> +	},
> +	{}

Please use { } (with a space) to match the most common style for these
arrays.

> +};
> +MODULE_DEVICE_TABLE(of, sl261x_pinctrl_match);
> +
> +static int sl261x_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return berlin_pinctrl_probe(pdev, device_get_match_data(&pdev->dev));
> +}
> +
> +static struct platform_driver sl261x_pinctrl_driver =3D {
> +	.probe	=3D sl261x_pinctrl_probe,

Not a fan on aligning the =3D, still more if it's done inconsistently in a
single struct. If you ask me, just use a single space before the =3D.

> +	.driver	=3D {
> +		.name =3D "sl261x-pinctrl",
> +		.of_match_table =3D sl261x_pinctrl_match,
> +	},
> +};
> +module_platform_driver(sl261x_pinctrl_driver);

Best regards
Uwe

--qdr5pu2vmyb2k4sk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq72pkACgkQj4D7WH0S
/k6pzAf+PhNU58V7LTtOu13Q7FpXZuGYfITE5o06ZTODsXEE48OgW8ZdwP7VY1Rr
OASvkk8I0b2igulZlmDQF6y/Uo8vr7BFFtBnDNLOlskSrwtGlRdlA+OxtblggT3/
ZtDs4aXeswkygIA/WvR5ypgSrpFZbf3ulmLpJxoG7wyWd2z20AE0RMgHMxWnRRRK
u1HPQWxqFS3vW0NsDLIGQ8yxAhuvL3DkQrfMVQONTNlqb9YbbJ5Ei9pHPDcYiggC
2NvAR0+Iczq3x7p1plWpq1ism4qNBPatzP3vOw+KMQXMHzNrOEICQ0lR54jlGDtd
U3aErEDsuZZpCY/HwikxQiabfzr3uA==
=ieOW
-----END PGP SIGNATURE-----

--qdr5pu2vmyb2k4sk--
