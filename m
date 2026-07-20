Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E943F54AC;
	Mon, 20 Jul 2026 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545974; cv=none; b=JzImLFbSrsR1nBh+iajllkwOQnJrHQnEie7ZWs+PrpMKiLYZBrtt3YnmQO35DsxMTJiI31kkZmmGz9ThyaZWlQ2+2/3CkaYKyLFABlV16c+q7aZFERhCgEe1Z4KxiEZesGlMLtCA0Cc2ygaynCGzKesokgykPfoCUiKFSRok7BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545974; c=relaxed/simple;
	bh=SdzoBqTDWx2IfWao4BpS6SyJYgHhshP6od3YGkG05E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9IQKjUn1W2PO3CFY1MA2vWHn/VMHI/QDsL4re4E/LvngMlBnru/ZRyHYp5VYdKf0+YbBb5Cf6NYcETddLvJb4o8l57+XxNYLMsn9BwfafnXaZepneyb58GAOburLdPQx0XYW+OnxC1oQJbOFzntdNujcfHlBp+10FBUZiw7cv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLchMXO/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLchMXO/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9717B1F000E9;
	Mon, 20 Jul 2026 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784545973;
	bh=QWpd+DeC6GUGcC5xnH0y84cDRG939JqQXdR158A4ElA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oLchMXO/tq6thxzwrqZ9dMIfF8YfuNtT/LlXTQpygEtpaWmsd2TMVjpkOX4AyMW/l
	 2zNiLFbGe4xBqwjyhTLysbWtfeAD9P4josELC011UC9b+8i90aWGpurRKnKDxxdKAP
	 fhvGdDIW9tT7a26dPaI6MS4GFGmUUgfmCRg04AaSQCbW1IrCEa4ETPut1/sK1oSUUV
	 tMdgVmbsr/2EuZt2sLbSB9+suR8RtzvHm9p0IWtpOQlDjpXe7hwIeSqNv/xxjGI3zi
	 +y+VuX3RPKtAGQ03aYxrnPwHVSgrxzuW2OQi/0ykD0IgLNWkd5c3N41Wg6y5RPZxtZ
	 O4ay8JJeIZXzw==
Date: Mon, 20 Jul 2026 13:12:50 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Pan Chuang <panchuang@vivo.com>
Cc: Linus Walleij <linusw@kernel.org>,
	"moderated list:PIN CONTROLLER - AIROHA" <linux-mediatek@lists.infradead.org>,
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] pinctrl: airoha: Remove redundant dev_err()
Message-ID: <al4CsgKsPOjLbMOG@lore-desk>
References: <20260717105847.131359-1-panchuang@vivo.com>
 <20260717105847.131359-2-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SXE91GLyrT1/fSSM"
Content-Disposition: inline
In-Reply-To: <20260717105847.131359-2-panchuang@vivo.com>

--SXE91GLyrT1/fSSM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 04b4424c688b..abfb018f207e 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2519,10 +2519,8 @@ static int airoha_pinctrl_add_gpiochip(struct airo=
ha_pinctrl *pinctrl,
> =20
>  	err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
>  				dev_name(dev), pinctrl);
> -	if (err) {
> -		dev_err(dev, "error requesting irq %d: %d\n", irq, err);
> +	if (err)
>  		return err;
> -	}
> =20
>  	return devm_gpiochip_add_data(dev, gc, pinctrl);
>  }
> --=20
> 2.34.1
>=20

--SXE91GLyrT1/fSSM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCal4CsgAKCRA6cBh0uS2t
rHN/AP9WOMMqAKBkonIPmZJjNZHnygVO1hiEz0O2OzJGOpC/rQD/VbXrG4odBVqc
+qAQn+JF55oPPslgw2SiHZTDmMgpDQs=
=0x8e
-----END PGP SIGNATURE-----

--SXE91GLyrT1/fSSM--
