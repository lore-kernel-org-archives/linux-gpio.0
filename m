Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171861;
	b=s3GPIOUaZHSbjHCtBfHOWvgH0OQ+0eWA+CUEreEYnZOclKA5B8M3PpVkoPDcfx8kippy
	 EKJ3s2KcgLN8JUMh/8XqCfWybTNSTXOsILRQbyEWWf8ZaG6HiXL7XP+ofIBed06ogVA1H
	 wYGnzydVl5mYOTj0dl/8jCY9ghSzk6gtMRBvn8k9Nit09ZLEyG+o48MIUkeGTNFueykxQ
	 F752Y52EpjICvqOiYbvCldzYIj51v2mEVyKrNjChGZ3HOUWuGf4SemmWaJzFUGSqrsz5e
	 7zhWJuK/1XYPD4nQrtiFDoLzli+4F4AZIrniLS6z4c20fm+0G4BJCAtys0yFrygBp9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
	b=vb8IVz0o35MHNdUMSN/mYz83v+B4OK9SQwqcW1AxfiqbAq2SEuvUBd9WjL/hIfNAF3AG
	 zR2Hh+3ZbAl63tN0tvyiH9PaDQ9XYJbl3Z0ETZZ53JE4kgdHbsjBf4ccfWYMH1jR1Kg8X
	 77+gxwkrLAkNK4nb1Hv3dCxBPY+261Rqm98LQMhar1OlnGgl2YISptz2H+mJ0+Etj5dHd
	 0Lvq04m8IsDWK9154HmCUiKqNuGBkyZRxZDlURIYqebVraklfF3zXCiKA1NEwPECGxfjB
	 X9EYm5wiQuk7j0YF7iBjBQTYlfM2CPPd66g4aGNHYwiyxAW5kt+Tm8Xkfxd9ZUkSaWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mXYTeY1D;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05700606A322
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 07:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05700606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mXYTeY1D
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3878855e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793171859; x=1793776659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=mXYTeY1DFU0B3UNUDpGvH1++9XqRCHBN2c55fDs3gaMOQO47WsY0IeKIoXEOK7phre
         qDRnMs8ytOMr0qtfMOSb8TiEdkTuTi3zrvIo29YjRcHCIyNVRu5jvmrnw+c/7+ZTnZdu
         g+m+dlrewe4oGQ7cM44EPt9kdHQxTNGMX2vBj7nmA41j8BZlObfZrV/xzfLKEfzFF9JV
         zX00cy7U2P/7MMHvf57mTP9FPWSpdqrAGPOP7VFbEtS+I5HsiFc5gBOTKp40co7SyViU
         LmvhwSbNkcVsBfy3XytO1tE7SOLtX0a18awiJgg9Nhufe0Sw0QKxI65RIMv39zTiKOBc
         rFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171859; x=1793776659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=v5sLXwKMb6dthrvvVz5Y9iRFQnvnbgh0h9v7uDGyyut3hf8rmb6lUbEKVY7sUcy8bs
         0FXAasSXiFWkOICVFHRd2gEqnGzhsqy0gjnOdJCBGds6AiM2hXDzOb0TbGRo89GewAFN
         /33qABC+DbZEygZXdeH7wbAHMSo+DJIkotwovhh5zROW8/wPdssDNmPE8FYMG1f9IziW
         BFIm9MyKkT07UEA/tqdgsnBYfqqwYxktCEHZkncTNrLhh3H7/bqKdRwq17lSqnufEbsU
         GlYdtppMEoyzQWMPnRV6GZshsFbxLyyLpgu2Ns/8yPNyy5HyDpAwMP20BZZ7rH5qzifE
         Nr/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwKc5v6w591V9ifeLDyDyWcOMZ4hE45+pAbfppiMJfgEkyYraeZK+lJIEsAfo/xmcVzcsUuRiP3q+yp@vger.kernel.org
X-Gm-Message-State: AFq9FYIZypDQeY/BwTdleyPIUZWfUCMav3EsZPeHAK3p4SoiqC7syyFt
	n7Vhfwv62FvgH/PAnVAyfqkuJDUA1Mdl4cJOzwb3BUrLWwqsYcn522UzhDEl3dxf9xw=
X-Gm-Gg: AYBFou0m8VLyn109VD4yPj4AcAME6mBAF/QLb7FrahiqZYhjFB9cayPhSKMLpaeOno5
	oJYU5StRwYZJfcUBNhBynQ+Xk1+h9e/RkMogKVECwaHK0vpsAUn7nTl67GJcD05S60SfCl+hovM
	sPcdyg+UdrRIsfLQIxiahPfRYq6XzwAA66iXiVcS9S0irk5LWGHAibSz+rG165O5uruyrtOQIKZ
	jaP3bo3ubg/DU7mkhpgpN3xrRPQ8pfojkcBaXwDe/fuKjdYedbYYayknWmm3LiGXd/v8LhRo5wS
	frb2dcDvYwol0LFEZIaok7GYGXO0AakD0E2+Q027IklPXWTZd32PYKTw9YbVdBg29GaX8HWRM8+
	a9mVezNU4OnaBPOamb52WiXXhfyKWhsXXzKhrEaRP3H2jw1VDrf3MCMhptJ7EHLnUMCroYHhNz1
	096Pk65k+lwSbpTYI55hwsle9mioJJSQ3d98wWuE20GYp3NdK6vSXZnTMzc+aEG4rdjMhClm278
	QPuE4t8DeqX/HalE0Wu8z7KEaZ/c2zigZaglqxBqlOoPpa9czFLxD7brgrsyJBVK1kHzK8V/w7/
	YjQD6Spi8uCjnZItFgK7jP7ehzKtmHXToC8qJIdF+wSrqz9tkYoAv9f3iFp18qFXQPwzresnUSy
	EXO0EwqtwUuQX9/Q=
X-Received: by 2002:a05:600c:198e:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a967ba8856mr25106675e9.33.1793171859280;
        Wed, 28 Oct 2026 00:17:39 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a97bf5d7cdsm20719315e9.3.2026.10.28.00.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:17:38 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:17:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
Message-ID: <auGhPHjanNTkkzG-@monoceros>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bf4vux6swhzzilrx"
Content-Disposition: inline
In-Reply-To: <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>


--bf4vux6swhzzilrx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
MIME-Version: 1.0

Hello,

On Tue, Oct 27, 2026 at 11:36:58PM +0800, Han Gao via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id without introducing a lot of unneeded
build dependencies.

Best regards
Uwe

--bf4vux6swhzzilrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhoY0ACgkQj4D7WH0S
/k4lEQf/aQompiZrE8lzHamk+WXWr2kv9iqPDmKByLu358ny9EKvV3eNOG0y3m2B
hMQ9inmxBjyfz0TMb3NkQtmXVKnu41A8A6mcl3B97akrhcvKxPDgsn8FWhhNJiBs
s0jrcYuMILEssk5h7k5Ah8fEdVAXbDTp88j/afUmb9QfOZxjaW+SXfLYigacUFT0
U8Hy6rX3B+GESX5uvdxOY69bn4dHt7Qwr56FksGQtIi7Y9DbyRhhMRnwCy4pCLnw
ZD9t3GwAHwOm1fdsdqP0zLsJPukoZPNmbT58FjRf45TfYHmOSulG5O3oszd4ElAw
wrbitVSdlgy1G4VvYAZKJRQLV5gF2Q==
=JnXH
-----END PGP SIGNATURE-----

--bf4vux6swhzzilrx--
