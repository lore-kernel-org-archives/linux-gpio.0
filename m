Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C8848989D
	for <linux-gpio@vger.kernel.org>; Sun,  2 Aug 2026 22:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785709430; cv=none; b=aS0kWdedpGRgMfSmjEeVk4uCHccrgu6YgjslS1ksgXHxWF1b/xHTWNp7pLReDdqR3/2gwH9Gz3wMndPC1FLm9Qbz7j923fZ/bRkfO9l7wYnJ+etwUfliiNC3bez0CpzxsFmZxvReXrx971gVRyiYelBFrkrE/jbBq+HWM/5DpfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785709430; c=relaxed/simple;
	bh=l1ZnHpxm2/LMNQiDhVhwSE0m9IpcWUrwKDgA+ZpNiFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdOfRGnp+NwbaZmDg6eaaU4b/Th++rY47ySsGxBd+q5m0pdtTq2O3/krLXWf/vxNvkJe5FTq5DMMI8kYjiy3kxq9c2VOJY0J9WW2MtqX1G5uiD5XaMQlAd9/b3dmY3zN785bDFgh2td3n00i7nIDbQup7SOIvX6DdtcFeFbHGxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=biKhHYEU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="biKhHYEU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956242332dso13109205e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 02 Aug 2026 15:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785709427; x=1786314227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l1ZnHpxm2/LMNQiDhVhwSE0m9IpcWUrwKDgA+ZpNiFA=;
        b=biKhHYEUBhRisKnxkGyEKIEDf803QjLlxC1C/l654mvzhuoyV2ocylZRdV4RFT5FeC
         xTDQy+dTgsct3jYVWZ0+/lPeLbpWCF+JGffDvKRRHT7fm6gaJbgVMeVD2ygc97j4oTj2
         5DXbptSW6Hf9A/WjSur0gZVFZhBWR+k4pCkAEgUP4Ri7A/TWOf3nFAyVDqP3+1N8xB0I
         eRhZ6I8FYj8HDZZZFaj/r0UhhT6ZQY6GF7foTCWw1vP59wnZGeiCemOo6IGeq6+GUWtF
         gzwIfRJso5iWMHtBVkGGCZzwhlAjOJHcLH+PS4rXDeyCqIL7wItyShZSNSUPc24A0cLL
         zDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785709427; x=1786314227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1ZnHpxm2/LMNQiDhVhwSE0m9IpcWUrwKDgA+ZpNiFA=;
        b=Hw2v0BRPRsonjNu2LcvPpZs+bQ+LMYqQgAK3WIWCJGnS6tsjCAuLwbYPbXe7xvI39q
         6ZPDYOt3QZaAn2b30+z2bhNikxt0Qs85TEAVmZkc4wiHdRQtBeP5kZz4NQ2BD9y8+PKS
         erbNHuppw0zSREgJU8TgIBFeV14cFNyk9GJfDV32s8XDtoX3EP7JHJ4cheSpU75VYYQX
         ochxIY74TfGbJqpZ0Lr+ADR2Qgoe0jX0mRVVEW9a7+jFv0um0u49aPpZIde2VK+p11rU
         86wuCFumH/zkWJci3jUpsgg1WaHBArWXwZG3WDt50Mo/ErQJSTmc1I5wp4O3L4rLTK0q
         j+0A==
X-Forwarded-Encrypted: i=1; AHgh+RpgrJuVnzkFh9FF4RZYuH0iyrGBxnqXXNs6movwQWyP/nU32kH2y8PyBQtVkbgXT4/3lQCIedhk9wMD@vger.kernel.org
X-Gm-Message-State: AOJu0YwuKwbmLFv7ivvQ9BEHWTZYqrVS5rX+JAXFCjnQ7CslnX3WJLhJ
	dKwK/+6Qt+QAZ1zD9uIrSqdnzBrMMLUBjDMbPOiEJ5B8Ew0RVBhSXm6sEv94UTwH/S0=
X-Gm-Gg: AR+sD10jguv3YZpSsPC0cp4fcvl+Dg7yyNM76sUHZs/hHfs4xWGtw8PKl3/btPoC00y
	s4i3c+boWq2jzacNmDQP3lGoB9wKKr9Mi99PpcPgwX79RqYMQfRSLEI1CKixYUto6xEGxzcFWyQ
	dclvqauFDfS8C/Xu4walyreTkiLtCf+DaKxGXc75qdmVjUhDyozII9vFkq7IKZK3ozxrktVik8/
	zJdTiBYzHYBN7v4e5LPHRUschMNNi7d+72xWGmqnRDYLVOvoIhgAmXaddauHDlxhKcv6bx3DD6n
	fbWcdVD4dQNVaf9ZQDtkBcKqsu2q9IL9TyL7AgCUYlH/O8q0Tjq4h7lPSL+/UFthWJ7r1p5cj86
	hB1vz4MwNxGm3CkQ7Zqzb94Nhx8eht2hAEs19+cazdSLWi+X45a1kofrXOOR0KQdwIaAiLTp1Ye
	ScFcSzTrVZEfga31gWTLNP21ppHwYmqrXXmTOaDoaA1dUoLpJnFSOcXklauB9Y5Ec/Dw==
X-Received: by 2002:a05:600c:8b08:b0:495:5b4a:53b7 with SMTP id 5b1f17b1804b1-4980c694e4amr194391165e9.19.1785709426561;
        Sun, 02 Aug 2026 15:23:46 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49808691014sm168712505e9.11.2026.08.02.15.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 15:23:45 -0700 (PDT)
Date: Mon, 3 Aug 2026 00:23:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Message-ID: <am_CzLdCkMKeRv_F@monoceros>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
 <20260801072711.153217-5-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gz2oumjekulxb57s"
Content-Disposition: inline
In-Reply-To: <20260801072711.153217-5-changhuang.liang@starfivetech.com>


--gz2oumjekulxb57s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
MIME-Version: 1.0

Hello,

On Sat, Aug 01, 2026 at 12:26:54AM -0700, Changhuang Liang wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>, which will go away soon.
<linux/platform_device.h> already contains the necessary bits to have
of_device_id defined, so you can just drop the #include for
<linux/mod_devicetable.h>.

This also affects several other patches in this series.

Best regards
Uwe

--gz2oumjekulxb57s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpvw24ACgkQj4D7WH0S
/k52FQgAnVpMoN8c7RMzlLeC4BZnq+Mr045A+Lyjzbeke6y6tbnrEC8YbXAvRo2N
sNZXvZHsehjbmNqj46Yh6CxejtAye4h4IKeyjmmrOGc/+Q+bJ0g85G2hmalRb7oi
CA+lzCUG1kR9AkM0WIATKYQ9xlDy/rxCqmIGxrfvfY/N/xxtC0JwBpuqmoq5BBaD
7VjgxCyAmBP3XRCgEJB6OEtCdz8Uu55RM2uFyy9Ep1/jGuW4EOAkgFzYOlv6XdDt
7/4pdjxlnZeXPQRqdYVo5atbFjSGaPkYijxj3ITmnD9eipiXu0elV7ONWEXCgejO
v/cmCw7tsyRfKKvwR5+mjGtHhsRtuA==
=Z5ww
-----END PGP SIGNATURE-----

--gz2oumjekulxb57s--
