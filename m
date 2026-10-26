Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032603;
	b=EZxk8YTnarMNT+bTBgeC26Xqe0nFF7jSZ511wgxYeF9odrX9xMsBll02LOK5eguYsMkc
	 H8mbmLep9eoaGTteJz4l8oJ5J3keqqPTWvD1iCiYMiD/QIXepAAOL7yvOuKzJskoIAJGc
	 95K4k5ovfiYxHf06Ejsd1ilnsd1tRZ9oQTg++t1+hgn1U9v3eoAnygayMUYJn4XrctWaH
	 dlP36eOcCHyVwIVhw/Gl54xrrvluoDenRaj1ZiNotPzTYzl+0B+tQvNIygVwwgFdlKsg6
	 cJBZSr5KTX2Jbpx6xg5DgF3koNCM/e0BN42uke0gEURO+53SCvPfHz3lkwhoNWD68PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032603;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nwM4au63Jsk5odFgeRlnWu38AtJdKmUCfU5XAypWDpY=;
	b=yo5d9x9H0Xk09xtsvVzIT8tZP0VzbLmAKmwxg1m7zYy1Wf+k55Z19ygoTBQql/NfhDdx
	 drBysdDfK5+OfCuPSMKWFFsj2xwtAH3nRUXiHAVHcPoB2W3AsfPA7806krGNsDHTBYKHq
	 YVUrqOsMKpF3WTdX+K1EpIZv8GHPgeRzecwX1a5xuos82phYRqPUcGWrHekBcDPdaCxu6
	 ovJzFHny4ARCyoPWz3AH58SetP+8RsPOOey5tRBJG47VF8tYKhRbZVkIcfiBsoTWWIpNO
	 C/o4SHrjDsE0R1OHuVibD6oGueucYBv813Glp6QavOGSLAxQdtBK6zuvno+KQMtDctA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FeT9/YWF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8846B606A31D;
	Mon, 26 Oct 2026 16:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FeT9/YWF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B23A1F01825;
	Mon, 26 Oct 2026 16:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793032603;
	bh=nwM4au63Jsk5odFgeRlnWu38AtJdKmUCfU5XAypWDpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FeT9/YWFOvvNJwYffe1oh53V/ZpbAzeU3N5E6YUbigridTbsav/ZjYlD3uTgEhF+w
	 V7iDRnRvjRGk8VhpYawM1YcuL6h8n/xUyBeWUi6DFwfyhxd/+3/Bo5m3bgtZUeEvPh
	 8iCRmGQsm9neN0TKqwnmz3DMsnrVnDNmf6VB2KeAXTed7VT2qlpHc/c4XFGP3HSsBP
	 SVnhJzRSXuDrhh9OHC9pdyGTe4GJHVfn0azyftP1Bm++ZrzQ4BL18RN9zra8gDCQfA
	 OeqhHdy7SDNmGYXQM6/fO3tXk9dLE5CetcVZEdinW91DJlBRKb4F0Kn0w6DI9aiIwS
	 uVMz+0bxqWcxA==
Message-ID: <sashiko-outbox-185542@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 18/22] gpio: Unify style of of_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <600e39b6a1b7d76b9247c2651bc2d060a55fe633.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
 <600e39b6a1b7d76b9247c2651bc2d060a55fe633.1793030820.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 16:36:42 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] gpio: remaining of_device_id arrays violating stated coding style r=
ules
--

commit bbadc9bb71d86d6711999d534e5d9672f8b1e52e
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

gpio: Unify style of of_device_id arrays

This commit updates the of_device_id arrays across drivers/gpio/ to follow a
consistent coding style for initializers, spaces around braces, and list
terminators.

[ ... ]

> diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
> index e4fa84e227262..fbbe201cce4ca 100644
> --- a/drivers/gpio/gpio-grgpio.c
> +++ b/drivers/gpio/gpio-grgpio.c
> @@ -444,7 +444,7 @@ static int grgpio_probe(struct platform_device *ofdev)
>  static const struct of_device_id grgpio_match[] =3D {
>  	{.name =3D "GAISLER_GPIO"},
>  	{.name =3D "01_01a"},
> -	{},
> +	{ }
>  };

[Severity: Low]
Should the two non-sentinel entries in grgpio_match[] also have a space aft=
er
the opening { and before the closing } to match the style described in the
commit message?

[ ... ]

> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek=
-otto.c
> index 5d98ad597d9e2..46ded0e228827 100644
> --- a/drivers/gpio/gpio-realtek-otto.c
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -356,7 +356,7 @@ static const struct of_device_id realtek_gpio_of_matc=
h[] =3D {
>  		.compatible =3D "realtek,rtl9607-gpio",
>  		.data =3D (void *)GPIO_PORTS_REVERSED,
>  	},
> -	{}
> +	{ }
>  };

[Severity: Low]
Earlier in realtek_gpio_of_match[] in drivers/gpio/gpio-realtek-otto.c, the
"realtek,rtl9300-gpio" entry is missing a trailing comma on its .data
initializer even though the closing } is on the next line:

	{
		.compatible =3D "realtek,rtl9300-gpio",
		.data =3D (void *)(GPIO_PORTS_REVERSED | GPIO_INTERRUPTS_PER_CPU)
	},

Should a comma be added there as well?

In addition, were the following three of_device_id arrays in drivers/gpio/
intentionally left out, or should they also be updated to match the stated
rules?

drivers/gpio/gpio-bcm-kona.c (bcm_kona_gpio_of_match[], missing space in the
terminator):
	static struct of_device_id const bcm_kona_gpio_of_match[] =3D {
		{ .compatible =3D "brcm,kona-gpio" },
		{}
	};

drivers/gpio/gpio-pca953x.c (pca953x_dt_ids[], trailing commas before closi=
ng
} on single-line entries):
	static const struct of_device_id pca953x_dt_ids[] =3D {
		{ .compatible =3D "nxp,pca6408", .data =3D OF_953X(8, PCA_INT), },
		...

drivers/gpio/gpio-ppc44x.c (ppc44x_gpio_match[], missing space and trailing
comma on the terminator):
	static const struct of_device_id ppc44x_gpio_match[] =3D {
		{
			.compatible =3D "ibm,ppc4xx-gpio",
		},
		{},
	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793030820.gi=
t.u.kleine-koenig@baylibre.com?part=3D18
