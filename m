Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E913DA5AB;
	Fri,  9 Oct 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544644; cv=none; b=hACJJsIE4kF9+CJ+nHTuDmMwGHeJ+5fPduXbcYnlZ5KtJj1nj8FtI0rpIhZQR3XYX7/agmXpq3XykWnvjk1eW/Gs3MEazImM933+blPouK8JiWdoykFNuVmZwLE1fn4N8AELSZjUahgg3DDarxSfDd3ZJu2l/RdXX4dMeXISvrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544644; c=relaxed/simple;
	bh=QqfURqCRSjIT8QqUNMjjI5BrlcSb7a0zfiDUpnlqv7o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=JJce5xQ6V+Wa1iOZvGJ/yjswNUjbrltC9CuNYaWn3G35NWb386NjofPYL+znUgnQoADTNHNRNj/7YuOdRa8ab0DtlfMrO/9jbwjuGEE/uA1YS2Hx5gQW3Y8/LJaeXpQKMZia2WsC/3O53vjvtQW4/1g+7t5Zf4J5tDmjrew9tXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/FGispZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/FGispZ"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 0D8241F000FF;
	Fri,  9 Oct 2026 11:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791544635;
	bh=QqfURqCRSjIT8QqUNMjjI5BrlcSb7a0zfiDUpnlqv7o=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=b/FGispZVANUl3L/g53xcd7r3warx0hlTTQiZGTOURyUVF1RazBSTpHIapcWcaUzN
	 iCdl9YNZniOpT4Zpbo33TPgi0c4FgMmU2iN2FbENi6avZfS2Jrq3IjnlFKYya+h1sR
	 CERDUClRDEv0BKf2w6yNgzjS2j2El1XKzoZD7qy5OQnxDjTv0a1iLFayxx9pWkDNTF
	 +ICCN+4LvMMDbibF/OQn9IHR/9LaBRCvJ+UiA8+jqUsNrEVWQ+VOsthtJmNS15sWUc
	 iZixmX2P7wIHSJXLKRs6/z3Tz5JVpH00+BJ5sENV0T1Ckn5Qu3necsWg+VZ3oKYBaz
	 nEcXNeHC4pBkg==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=3bef6337922c23220f1e9b92a3f942c9202ea1fcf0baaf0927c3329950a6;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 09 Oct 2026 13:17:11 +0200
Message-Id: <DM09KHJNRHUX.2N8J0WISE3J9Z@kernel.org>
Subject: Re: [PATCH 2/7] gpiolib: regmap: add
 GPIO_REGMAP_QUIRK_SET_AFTER_DIR
Cc: "Linus Walleij" <linusw@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>, "Conor Dooley"
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, "Long Zhao"
 <zl020895@163.com>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <longzhao@ambarella.com>, "Bartosz Golaszewski" <brgl@kernel.org>,
 <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <20261009-cv75-gpio-v1-2-5836bd438423@ambarella.com>
In-Reply-To: <20261009-cv75-gpio-v1-2-5836bd438423@ambarella.com>

--3bef6337922c23220f1e9b92a3f942c9202ea1fcf0baaf0927c3329950a6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Oct 9, 2026 at 12:57 PM CEST, Long Zhao via B4 Relay wrote:
> From: Long Zhao <longzhao@ambarella.com>
>
> Some controllers ignore output writes while a line is still an input.
> Add a behaviour flag so the output value is written after the direction
> change. This is a legacy quirk. New hardware must not use it.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--3bef6337922c23220f1e9b92a3f942c9202ea1fcf0baaf0927c3329950a6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCasjNNxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jOfQF8Cw4jXONNZJX4WItZ9rMYOoliD0fFLWwO
1nsnf2iggUIadRpcGz5+ANrV50sx3JJ5AYDCjs5RlXun/HSTsRUloP0f0TTDIkRW
G8Ka+wmmfoacPuIoCRkTZ/dL3v6mUPOG/1Q=
=A+Pj
-----END PGP SIGNATURE-----

--3bef6337922c23220f1e9b92a3f942c9202ea1fcf0baaf0927c3329950a6--
