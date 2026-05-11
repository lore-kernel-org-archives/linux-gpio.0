Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220413112BD;
	Mon, 11 May 2026 07:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484245; cv=none; b=PWeyCQVtocncJcF1L7KYGPUt0eOZSYIuqQjYSva/lGETqTuAbez81Jqq6pRkMCxSxEdPvmmsrP8SKy/bdxcT1fjDja3JPPlHmHWhna1HXQ4ya5qmcK2S0BFFJEENaRamcpDDnXRFYYSVmWEcGkpdhxSp/H3vkubhEI+SKV49GL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484245; c=relaxed/simple;
	bh=U4hggzOcfzQiPdwg20XdORXVZacmOjgvFkDO67u/YrY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=q0qkpW2qVzeCbDcv5wuN6Je2IiTNtdXmZvQuEHpnjQ9MaoSVW971HPbogQ0UMUlpMgXFXQK73/HdrRkFJiomXJ8ilspV+ZxC/m/dv2QbPuXWZ10zBb6IiW4xYx6ppIoNY5q2KoT8CH5BIbRQ30Kuf/+VyACtNbmhg3FhT8MY54k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POHvLONE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POHvLONE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75517C2BCB0;
	Mon, 11 May 2026 07:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778484244;
	bh=U4hggzOcfzQiPdwg20XdORXVZacmOjgvFkDO67u/YrY=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=POHvLONEcKoOAoObrqk4DhHHAUeNEOhVSs5GIwWuEq/dXm+DlQv7ddO89DoNvhNBr
	 XBUCfsznvElffX/zFmqGniof9iD9gHkNEm0CveAClu+eR0KFcMEmQW2svQ/gFygP55
	 fmlI12lK0oPrlWGop08kA5GWRpO+XZL0x/CLmp/ZiBILmParvSqFsVIyQbm9tym7e+
	 JgNznX6QIjsVtKdjNUzUaNMLHNnfleD/0Vqcb0utUMSjvN2/MvB9sUD+ZMz6cOgti+
	 vvZUyHiytxIp5UF7Fbja4/v/abcVir+Sq+dD3BEIxeiTTaEtgFBoBte2GtORrSCJzG
	 jbf+JfuOq4BjQ==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=75cc254ef3655599c51bfcff8c3ba8ff03c247272630847d576156327d96;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 11 May 2026 09:24:00 +0200
Message-Id: <DIFO1P3FCHRG.3DVOQS59PF7D6@kernel.org>
Cc: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sashiko"
 <sashiko-bot@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski"
 <brgl@kernel.org>
Subject: Re: [PATCH v2 2/2] gpio: regmap: Don't set a fixed direction line
X-Mailer: aerc 0.20.0
References: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org> <20260508-regmap-gpio-sparse-fixed-dir-v2-2-deee84df3027@kernel.org>
In-Reply-To: <20260508-regmap-gpio-sparse-fixed-dir-v2-2-deee84df3027@kernel.org>

--75cc254ef3655599c51bfcff8c3ba8ff03c247272630847d576156327d96
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri May 8, 2026 at 2:51 PM CEST, Linus Walleij wrote:
> If a GPIO line has a fixed direction, there is no point in
> trying to set the direction.
>
> This didn't happen much before because what we supported was
> all lines input or output and then the implementer would
> probably not specify the direction registers, but with
> sparse fixed direction we can have a mixture so let's take
> this into account.
>
> Suggested-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260507-regmap-gpio-sparse-fixed-di=
r-v1-1-a2e5855e2701%40kernel.org
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/gpio/gpio-regmap.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index f45a432e8ebe..52a67dea8107 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -203,6 +203,9 @@ static int gpio_regmap_set_direction(struct gpio_chip=
 *chip,
>  	unsigned int base, val, reg, mask;
>  	int invert, ret;
> =20
> +	if (gpio_regmap_fixed_direction(gpio, offset))
> +		return 0;
> +

Shall we check if the user wants to set an incorrect direction and
return -EINVAL?

-michael

>  	if (gpio->reg_dir_out_base) {
>  		base =3D gpio_regmap_addr(gpio->reg_dir_out_base);
>  		invert =3D 0;


--75cc254ef3655599c51bfcff8c3ba8ff03c247272630847d576156327d96
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCagGEERIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/j92wGA3WU3AMmVHw/Tqj+0lpdYfBO7Qagvnt8F
KRkUjAQhlyVeqkiCDg8lUoTziPH/ySDJAX43WxUm+qGDlgvFsS8txs8JMz/v1uAU
tdGFHhQBFlmsRu4CiFUFYdNmJR3VLFXeKXM=
=adum
-----END PGP SIGNATURE-----

--75cc254ef3655599c51bfcff8c3ba8ff03c247272630847d576156327d96--
