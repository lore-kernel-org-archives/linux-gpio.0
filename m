Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380617;
	b=OghO0hm6CVWPpL1M97cEj1pSmeKsAyZO5+hySiSGSMH8DIxQyPEDoo4vFkVXNkS28Tjs
	 JHr1alsBSdMVf3rEufj6GG6Ir1G/3AAs0TmhCPiuOgtpnhtVR8k3Yq1t+m627dcdYJA7B
	 E06mDj/8fJ9nT9aEggrTmx0x2uow8k30dcfxqnrRyBQGCK85/G0Ge/F4z1CZqtVBjnbkk
	 vNBQ2luiJEmpbAvPVRtJi46c4XLMdwZ8BtWMaM4DJ3Eqdu2/deaWxRWtfGvQHplrEBKpl
	 mnH/bkfUaISqE5nqB0CCtCOgGHnB0ltshwCxih7QmQhxXE27+2rFxG3xxYOAnkgoVNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380617;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=1eWKOZJmHFTw8mc51zVsa6b6BFNw6zxGkRiFuN9WWuk=;
	b=u1+tnqvPZGsub0BlGyQPn7l5xK+SvhFW3X0LKos4r/rK9a8jALhIihR2JUYzhHIcaKRX
	 Sr8zfCUwnuj7PUhnQjTKdndudh7PkWzLB9jXHjga/UnnSZj7sBKgUGSoq/KYh/ReG3kWo
	 cYPC4FrieLnnilx5QVY9zFaxHFNQLA5RtOGL3fkOSCn4k0G5iaKolcpT7/Lg9wvWe2s8N
	 Gp9b77NSThnAZvMk1bnJFNgMH8Ne3UuvtYFNP3LpO2rNGcbaUqp/uS4z/dqoiYKKEZi7J
	 7KPTVVliH7TjlMxlWaPf3NdHZK+1rxKwGJFp6EIy3q38pty1PQXmwO5Qv9rjFPUHqVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=XXYuRJ7R;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1359C606A333;
	Fri, 30 Oct 2026 17:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1359C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=XXYuRJ7R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=1eWKOZJmHFTw8mc51zVsa6b6BFNw6zxGkRiFuN9WWuk=; b=XXYuRJ7RSD2jFJ21WZqf+71hfT
	9WAHaPum2eX90phj58hYyfAPeFY8Ol5WyaHlPALiUDr2GkE45rDvg8LMtnlVMzUYDDN5zQns26kIO
	qg3xSEBKM+S7gr6x51Q8HWHcsWJwMPH+b91uHoCv/nQMHQcI4thcfCu+ruWOYdJdov0Of8FScP38b
	/CG5pylUDoUC1lBJgXxlfR98D3Y3mpKDiALnTkCUTNMR6Wk/JnmO4JYzlvSX+qPYrxYzyWNF/tnoR
	EqKc4k8OpJVCXUVyccO6JEcLMHbBiwnDZ5HyPHkDm1P8lvsoxcodikL/+pOzX5YSBQE2L0qdT1LIw
	PcafdHfQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH] pinctrl: rk805: fix ordering of gpio and pinctrl registration
Date: Fri, 30 Oct 2026 18:16:52 +0100
Message-ID: <51242770.MN2xkq1pzW@phil>
In-Reply-To: <sashiko-outbox-190969@kernel.org>
References:
 <20261030115540.3660242-1-heiko@sntech.de> <sashiko-outbox-190969@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 30. Oktober 2026, 13:05:40 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] pinctrl: rk805: NULL dereference in gpiochip_get_data() via pinc=
onf
> --
>=20
> commit a49ae4e9bf527300ce287085a0623b150f2db443
> Author: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> pinctrl: rk805: fix ordering of gpio and pinctrl registration
>=20
> This commit reorders rk805_pinctrl_probe() so that devm_pinctrl_register(=
) is
> called before devm_gpiochip_add_data(), ensuring the GPIO chip and its pin
> ranges are torn down before the pinctrl device during devres release.
>=20
> > diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-=
rk805.c
> > index 22f576337faa9..8e04da3ef0f3a 100644
> > --- a/drivers/pinctrl/pinctrl-rk805.c
> > +++ b/drivers/pinctrl/pinctrl-rk805.c
> > @@ -663,13 +663,6 @@ static int rk805_pinctrl_probe(struct platform_dev=
ice *pdev)
> >  		return -EINVAL;
> >  	}
> > =20
> > -	/* Add gpio chip */
> > -	ret =3D devm_gpiochip_add_data(&pdev->dev, &pci->gpio_chip, pci);
> > -	if (ret < 0) {
> > -		dev_err(&pdev->dev, "Couldn't add gpiochip\n");
> > -		return ret;
> > -	}
> > -
> >  	/* Add pinctrl */
> >  	pci->pctl =3D devm_pinctrl_register(&pdev->dev, &pci->pinctrl_desc, p=
ci);
> >  	if (IS_ERR(pci->pctl)) {
> > @@ -677,6 +670,13 @@ static int rk805_pinctrl_probe(struct platform_dev=
ice *pdev)
> >  		return PTR_ERR(pci->pctl);
> >  	}
> > =20
> > +	/* Add gpio chip */
> > +	ret =3D devm_gpiochip_add_data(&pdev->dev, &pci->gpio_chip, pci);
> > +	if (ret < 0) {
> > +		dev_err(&pdev->dev, "Couldn't add gpiochip\n");
> > +		return ret;
> > +	}
>=20
> [Severity: High]
> Can registering pinctrl before the gpio_chip cause a NULL pointer derefer=
ence
> in gpiochip_get_data() when pinconf callbacks run?
>=20
> In rk805_pinctrl_probe(), device_set_node() attaches the parent PMIC fwno=
de to
> pdev->dev, and devm_pinctrl_register() immediately claims default pinctrl=
 hogs
> via:
>=20
>   devm_pinctrl_register()
>     pinctrl_register()
>       pinctrl_enable()
>         pinctrl_claim_hogs()
>           create_pinctrl()
>           pinctrl_select_state()
>             pinctrl_commit_state()
>               pinconf_apply_setting()
>                 rk805_pinconf_set()

that is a correct finding.

It seems the correct way to resolve this, is to switch from
devm_pinctrl_register() to the newer devm_pinctrl_register_and_init()
and calling pinctrl_enable() at the appropritate time in the driver
as suggested by the documentation.


Heiko


