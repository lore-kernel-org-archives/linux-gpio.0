Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4803327204
	for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2026 22:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786228141; cv=none; b=psxxSwPzn/OEiB6anoDVtSZhlfUk8zaEj18TeL7zYv5Yg1diblJ85j1cL2mZTdS7qRJg6eKRS47zfylsq8N+Idw86hWy7B7zNLU5+gDEGr2hg9CijrbxIzPedJRKACMSAZxXaxlKbDy7zZg7CKqBOJAFUl8iMUN3jldX5ir97Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786228141; c=relaxed/simple;
	bh=hfpHyqbT5jRvXDYQn9ovPxHk8U/q7Qin0xEK87w0o84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEsnJRHkil8FKXHKV39WIVXLVgv3hds8SN9/hlbuym4Qqg1D3KrjxIZSjknROR8MWmgrhf0s+19yJAzE/7Sma7V7ja7vZsb+/dHLDWcSt/gIdeh0VhMa+iFAcWqx5NyKiB3ABJaeNnV4ZDKxrBw1nGKtNuY94W1JdL6lqiK2Bok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=b1kh8LRg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="b1kh8LRg"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fe377a217so340926f8f.1
        for <linux-gpio@vger.kernel.org>; Sat, 08 Aug 2026 15:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786228138; x=1786832938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfpHyqbT5jRvXDYQn9ovPxHk8U/q7Qin0xEK87w0o84=;
        b=b1kh8LRgRe7s+n4mVCubl2NuUh6Mw/xiLvKvKni5IpyUF5hmKYG+CBqpEgALJxPN59
         3EncL/wMyrm+g4CsumEOsEdm40gCGyKx/DQXLX0MAuiiznzdfiTpTjyftFKRqaEDA6K+
         +XqdWPz0iUMyutvVy1v581MzRlWr7dcDiRqLXhOE10WONPOLIrfqwqxMcllVGXFJ3qGJ
         P8ahDISi4IKRVWxh1Cei+ZP0cNUua5wtq83UW902X0l6TKVTlVvEd+6ldOTfBfAj+Fom
         CBXLzZ7zYVUsMWqtT/Ffv2O1gZa/UGOf586vC4Mi8SMPp0wI5NjjoGgZRVS9+5KoDXTv
         z8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786228138; x=1786832938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfpHyqbT5jRvXDYQn9ovPxHk8U/q7Qin0xEK87w0o84=;
        b=miyx/mKHE2r47NpLLtwgnOD1WHyhdZj2gchMckjkcYvpSn7gC6fmAmjaPNY8/rZW6b
         mxR1uPdotfrx1+z1FGSTmmn7Cxos6hUvCJNddNfmgzLT9vuPpXjPyFGY7kJxmHdTb9YN
         4KFJ2zyDrKZQDoV9tm3I5MkMjPSQWDQqz99rz37aS2fI2ASv54zLUMKZpZUMILQEa9FI
         T8Q24jNwNlRW68mbFdlhuS/ZZBREcnPRemZWgOVUoDXoexF2bKsMH5M7tWx05ME7+E4C
         Y23RhkJjMxXILQKOOc3s/mthOsCcn9RbLa8bqjbGDCmFlfQCAYTP1mTZyW7Or7To1abr
         i0Ig==
X-Forwarded-Encrypted: i=1; AHgh+RrysQqybarlKhYKMIG8Qtd1L8AGxHraqbhijWD8UjNLiF0AIkekanYWbL0RAeGi6n4ok+nWA0Lj63CI@vger.kernel.org
X-Gm-Message-State: AOJu0YxvbsZa6nxk3dTunY0VMq914RMuxr2JawF0tOVCliR39peooPxV
	iifZhR1JPE9IsQLK5NLGNJIUFMfviLpRohy5ipNwFpW/x08k9BqLrs1P7dfmKxgEQ5c=
X-Gm-Gg: AR+sD13MOJ9myyhUJwAFc3AufcsYV4yIvwC0rZigS+lOyKG2/d0v54HplpsqiQ62HZj
	hfIPRJao9WRcKhl5LZNlRys3aUO0OhxAaqSGLHEp+Czd/HFlSHPRXS2adwSYOtmTwjPatSPdG+L
	BTR7HVK2rt4Tv+4X3mj2e0La0OIGzt0zYi0WDE1UTe0MTDNUnvBzYg7AxAKX+UDxoylN7qQ6KNs
	Hbrcxu7ziYdJmIivaOrVGo3wpU4RO4UMgSnxzjjxLwmD9uVqhtoFVj1RTd9fn5tYqF4YtQh+iPj
	CShkds3cCZBYXKjMzaEM+E2tuB9GCRVf9JzJqJ4XAmfNtCddyDg4mclV7cLNy/eV7HU/5n7yoxI
	TPHK6k8Okgd/072kYppk1rIefeDCg9RKQgIK8SMw29zHQblzpKZDvIypNf7gtyXdi7QiS1glQ7w
	uNDFJYSCl45+6mdLrLUNkd8GiGwGnqUCVeIEa+eoViHPz8WgLdcrScYtoAgduqpW20Sw==
X-Received: by 2002:a05:600c:c297:b0:494:596e:e8c4 with SMTP id 5b1f17b1804b1-4994e7d3395mr310550825e9.17.1786228137777;
        Sat, 08 Aug 2026 15:28:57 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499542851d6sm288407275e9.12.2026.08.08.15.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 15:28:56 -0700 (PDT)
Date: Sun, 9 Aug 2026 00:28:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/9] iio: adc: add the ti-ads1262 driver
Message-ID: <anetMEd_kLs1YXwu@monoceros>
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-2-f89925d72792@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xus2kmvhvcegdeph"
Content-Disposition: inline
In-Reply-To: <20260807-ads126x-v3-2-f89925d72792@gmail.com>


--xus2kmvhvcegdeph
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/9] iio: adc: add the ti-ads1262 driver
MIME-Version: 1.0

Hello,

On Fri, Aug 07, 2026 at 10:58:24PM -0500, Kurt Borja wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/spi/spi.h>

Please rely on <linux/spi/spi.h> to provide the structs of_device_id and
spi_device_id and drop <linux/mod_devicetable.h>.
<linux/mod_devicetable.h> is planned to go away soon.


--xus2kmvhvcegdeph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp3raEACgkQj4D7WH0S
/k6snAf/ZimSXz5iWhv+nDRnquhMeQutecJJ6wy0PYcvRIzAhs29l7XUYCTTmbAY
pryv/lHnxxwPHg72nVVJZ8Aw7L31auVMNL7wC8vz1ccx8xrtbmmvtWr/YcC5WC0b
kYSLH9kdxkNsKKQE8CO7SbPbpn+AVZ9Lvf2u3BqqJ+3MaouS+oA0J2J5fwpP0wnp
UoDvFR5NRpiQw8G7GtFAjtkSyDKhJGe3FJOa2fKs/qR/SAlUyBdiRn26MOLyrWn2
mGne8wJhszet7gKHeAWgeE8OpdVMxyf9beZ3lcgr7y1OVGq5qvdU7YgspootZdQc
PG9SnQm66dwnLs5u/UDLOYPgGe+pXg==
=+9ZW
-----END PGP SIGNATURE-----

--xus2kmvhvcegdeph--
