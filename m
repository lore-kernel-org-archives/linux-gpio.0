Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439402;
	b=MET5RWUjwBG8BprbxHdo9az00qT9qhrFc84y5b1pJoYVF7nZXwhTNXIkyF4uJnFwUjG7
	 8XZQmvTppCky9zCYzeyntD31MWeglIUZsjn8sYGORwZ+vAJkQQdm05xuScfr7CtvRzQZV
	 pOuiAhLkxGDlNayCWalsASiRa84zCYJJ50YLxz/rtBZ+g+SSOR6nETQVBWcG2bzaYfBZU
	 ajI4pGCCH2f1XcQLvWXLYc2ld7CesLYiRQkT4wPe5tBo7alpI03EFWVV6WC2yEgYJzaWq
	 zwFtGetTxt2gPM63gxznUV5dI2nsLVhgKY0nwiq+sIxB/5sTSfafubt8yaGLb0qOnlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439402;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8W333E6hnDKB7P6Q4cv1mPI1OXblpJzN1yU2YkHeyQc=;
	b=4tz7Pev1fhkBfc3xWJegIlBntKyAM1ol/h3p4Ns3o4ICnkWBSVqL1WJ9CjD8sVHgb9Ff
	 EZ3fNVA/V7FTlZIZPR07pGI5MW9ieNn8gq9WbYedknhyn//zHMvSf/AS/o8vIu6Padl57
	 ZN0peZXeA7YMLayOzXpeRZOWz+ZCesj2TYhvPjtw29H389jBqAJyvEHHG7JLVakERYymi
	 oE/GLw86J8T1IUj8bzXdH/j1pDf9vJc3a70Sf5O5W/dwEZodxBo55htebniyu6UuWSTQL
	 mO1aiuK8ucc89l7YK4ESc+hK9mmnLEa69v3XVbqP985QQvS+jrfZ3UkSyZQPqCBm8sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lVxWo4e2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C73606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 13:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lVxWo4e2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBC71F000C0;
	Mon, 23 Nov 2026 13:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795439402;
	bh=8W333E6hnDKB7P6Q4cv1mPI1OXblpJzN1yU2YkHeyQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lVxWo4e2SF/2ILxXB+vkj414GFoXTkOzfr3I4Y1Nli4Q1yG219Pn6Eq6Xx8G3Zcv+
	 k81TvxH35AsNN/gTEv5IB8HdlrLZ5N0XkPExqAolNaXGz4Eh4UbkzqwBUZaNU+7FY5
	 /7Bdz2M2I7aUJBM3r/zBIYpmjYZLmLZFpeslm2Pl0fvcdmV7f406TOZixX3UDyqRrW
	 JF0Zu2/MY8DJFqJNFKltyMHKpBH4JDnMo8yY4XMYQJykBehYJJAxOwMkt8cEDiy41L
	 SlR+M1v3N+arjnFcA2/lqZ/O0vJiYvW3rvW01GeToxni82/Hm3Qs1XI0vOEF2F5tLx
	 sZNgHrDnTvC6Q==
Message-ID: <sashiko-outbox-229295@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rzn1: Use devm_clk_get_enabled() in
 rzn1_pinctrl_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Elfring" <Markus.Elfring@web.de>, linux-gpio@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com
In-Reply-To: <e05bd9db-c855-4972-86bb-3b7346cdd278@web.de>
References: <e05bd9db-c855-4972-86bb-3b7346cdd278@web.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 13:10:01 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] pinctrl: renesas: rzn1: empty rzn1_pinctrl_remove() and unused
  clk field
--

commit b6f0acc93a9de8539ec8710ba4e37529bd3b8bed
Author: Markus Elfring <elfring@users.sourceforge.net>

pinctrl: renesas: rzn1: Use devm_clk_get_enabled() in rzn1_pinctrl_probe()

This commit converts rzn1_pinctrl_probe() to use devm_clk_get_enabled()
and drops the manual clk_disable_unprepare() calls on error and removal.

> diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/ren=
esas/pinctrl-rzn1.c
> index 64a89e307191a..1addd76da642f 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
> @@ -875,12 +875,9 @@ static int rzn1_pinctrl_probe(struct platform_device=
 *pdev)
>  		return PTR_ERR(ipctl->lev2);
>  	ipctl->lev2_protect_phys =3D (u32)res->start + 0x400;
> =20
> -	ipctl->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	ipctl->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(ipctl->clk))
>  		return PTR_ERR(ipctl->clk);
> -	ret =3D clk_prepare_enable(ipctl->clk);
> -	if (ret)
> -		return ret;
> =20
>  	ipctl->dev =3D &pdev->dev;
>  	rzn1_pinctrl_desc.name =3D dev_name(&pdev->dev);
> @@ -888,7 +885,7 @@ static int rzn1_pinctrl_probe(struct platform_device =
*pdev)
>  	ret =3D rzn1_pinctrl_probe_dt(pdev, ipctl);
>  	if (ret) {
>  		dev_err(&pdev->dev, "fail to probe dt properties\n");
> -		goto err_clk;
> +		return ret;
>  	}
> =20
>  	platform_set_drvdata(pdev, ipctl);
> @@ -897,28 +894,20 @@ static int rzn1_pinctrl_probe(struct platform_devic=
e *pdev)
>  					     ipctl, &ipctl->pctl);
>  	if (ret) {
>  		dev_err(&pdev->dev, "could not register rzn1 pinctrl driver\n");
> -		goto err_clk;
> +		return ret;
>  	}
> =20
>  	ret =3D pinctrl_enable(ipctl->pctl);
>  	if (ret)
> -		goto err_clk;
> +		return ret;
> =20
>  	dev_info(&pdev->dev, "probed\n");
> =20
>  	return 0;
> -
> -err_clk:
> -	clk_disable_unprepare(ipctl->clk);
> -
> -	return ret;
>  }
> =20
>  static void rzn1_pinctrl_remove(struct platform_device *pdev)
>  {
> -	struct rzn1_pinctrl *ipctl =3D platform_get_drvdata(pdev);
> -
> -	clk_disable_unprepare(ipctl->clk);
>  }

[Severity: Low]
Can rzn1_pinctrl_remove() and its .remove assignment in
rzn1_pinctrl_driver be dropped now that the function is empty?

With rzn1_pinctrl_remove() gone, ipctl->clk is no longer read outside
rzn1_pinctrl_probe() and platform_get_drvdata() has no remaining callers,
so struct rzn1_pinctrl.clk and the platform_set_drvdata() call in
rzn1_pinctrl_probe() can also be removed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/e05bd9db-c855-4972-=
86bb-3b7346cdd278@web.de?part=3D1
