Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361941;
	b=4tL+7UdReZb+Rakvniyb+fnzs56gRiqFKXC/XDwKY1MR5LypTV1bcGlUjF1zMeXgeZ0n
	 y1mgE38TSucvERSzf1qhPn3YT3gEfPYrtMyr80ejYRIZL0fgvx4+aQv1WHqq+m73fveF9
	 BS+BwhaneuF/dmmLZmRLsrPIzHo9N8thJBOnXvU6kLR1SAPLG5Ewm/Z03uMBhDJDRwF6X
	 TrkDKvxd1d8qj/7nzF86zL5R7wJhbRvZ6iuCQr2SxucRJ324MbN3Op01ovLYIXaFeuckU
	 XgBc+5Tn495yHWWD0maZ0B8asaqEE/Wpjmp4iHQYQCsNMSgT2EIeuVHHzqsOnblfVtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361941;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vG4+Y5ev5aXq/zpCrmKcxw1jxAeYwBvGY/RKpbEVbQ8=;
	b=XuBan3xC/Df4yz9XmLOILromb2wBIf9/RjmY72c5JStRLyt6rdiHzHeKL7iJ74G6yN44
	 TUa1NEWy8XZXqOZpzIn6n/3NSfHR/2Ouo5u8lp+S2tD30Yg5NtbUxk54fwqZ3X03Y/J9B
	 sXCcx3Jr5+6W7ZbKrkspoVskPYe6vIMpD1UeS48U45U1b7+mydgnLwiQglPAUCDgLLeUD
	 2F+GFQPNx9JKX4BD4+grJKili6opm5Y59zuy7tS9mWfIrCAz9wHw0Ne7/bBnMUUa/siYd
	 vjLmTzfwu3athIy2SnQs9GNpBOeHarZsb1w4unlvLGiPhsQB7PSIjY7L+HOlXeO8cLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fVMfT8R1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C914606A33B
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 12:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fVMfT8R1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88941F0093A;
	Fri, 30 Oct 2026 12:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793361941;
	bh=vG4+Y5ev5aXq/zpCrmKcxw1jxAeYwBvGY/RKpbEVbQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fVMfT8R1oHlMpwTsKTnSFNnO4MASrnnkpSi7JXjPsbjWF2EfjRun6ygiVaAvcEyNY
	 hGwehKKHSprzTgsQevQIq/GgMhI5vRqInX+QPJ9EGx82+cHAR6cIw2zwBXPicw7B3Q
	 jcQKCuIx61su25ZYKc4JYo6Xdz1n4eHekuUoLZAS9BT6mnM+MYGPfpHZaO1oc4Otex
	 t3Izmo56RKbKLaL2geFWTsvoHk3mmn//anXDQG9oKp1sQ+9Jpg4VIHmD25tDprtQMv
	 QjXFHjbv0ZjHkWEnNjm4DvyNuaWIA0SP15V4FoMqwvFrfM1bMG78wIp0gV+bUChfoq
	 YfZbK1WXeso6g==
Message-ID: <sashiko-outbox-190969@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: rk805: fix ordering of gpio and pinctrl
 registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261030115540.3660242-1-heiko@sntech.de>
References: <20261030115540.3660242-1-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 12:05:40 +0000
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
- [High] pinctrl: rk805: NULL dereference in gpiochip_get_data() via pinconf
--

commit a49ae4e9bf527300ce287085a0623b150f2db443
Author: Heiko Stuebner <heiko.stuebner@cherry.de>

pinctrl: rk805: fix ordering of gpio and pinctrl registration

This commit reorders rk805_pinctrl_probe() so that devm_pinctrl_register() =
is
called before devm_gpiochip_add_data(), ensuring the GPIO chip and its pin
ranges are torn down before the pinctrl device during devres release.

> diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk=
805.c
> index 22f576337faa9..8e04da3ef0f3a 100644
> --- a/drivers/pinctrl/pinctrl-rk805.c
> +++ b/drivers/pinctrl/pinctrl-rk805.c
> @@ -663,13 +663,6 @@ static int rk805_pinctrl_probe(struct platform_devic=
e *pdev)
>  		return -EINVAL;
>  	}
> =20
> -	/* Add gpio chip */
> -	ret =3D devm_gpiochip_add_data(&pdev->dev, &pci->gpio_chip, pci);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "Couldn't add gpiochip\n");
> -		return ret;
> -	}
> -
>  	/* Add pinctrl */
>  	pci->pctl =3D devm_pinctrl_register(&pdev->dev, &pci->pinctrl_desc, pci=
);
>  	if (IS_ERR(pci->pctl)) {
> @@ -677,6 +670,13 @@ static int rk805_pinctrl_probe(struct platform_devic=
e *pdev)
>  		return PTR_ERR(pci->pctl);
>  	}
> =20
> +	/* Add gpio chip */
> +	ret =3D devm_gpiochip_add_data(&pdev->dev, &pci->gpio_chip, pci);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Couldn't add gpiochip\n");
> +		return ret;
> +	}

[Severity: High]
Can registering pinctrl before the gpio_chip cause a NULL pointer dereferen=
ce
in gpiochip_get_data() when pinconf callbacks run?

In rk805_pinctrl_probe(), device_set_node() attaches the parent PMIC fwnode=
 to
pdev->dev, and devm_pinctrl_register() immediately claims default pinctrl h=
ogs
via:

  devm_pinctrl_register()
    pinctrl_register()
      pinctrl_enable()
        pinctrl_claim_hogs()
          create_pinctrl()
          pinctrl_select_state()
            pinctrl_commit_state()
              pinconf_apply_setting()
                rk805_pinconf_set()

Both rk805_pinconf_set() and rk805_pinconf_get() delegate PIN_CONFIG_LEVEL
(and PIN_CONFIG_INPUT_ENABLE in rk805_pinconf_get()) to rk805_gpio_set() and
rk805_gpio_get(), passing &pci->gpio_chip:

drivers/pinctrl/pinctrl-rk805.c:rk805_pinconf_set() {
	...
		switch (param) {
		case PIN_CONFIG_LEVEL:
			rk805_gpio_set(&pci->gpio_chip, pin, arg);
			rk805_pmx_gpio_set_direction(pctldev, NULL, pin, false);
			break;
	...
}

drivers/pinctrl/pinctrl-rk805.c:rk805_gpio_set() {
	struct rk805_pctrl_info *pci =3D gpiochip_get_data(chip);
	...
}

drivers/gpio/gpiolib.c:gpiochip_get_data() {
	return gc->gpiodev->data;
}

Because devm_gpiochip_add_data() has not run yet when devm_pinctrl_register=
()
is called, pci->gpio_chip.gpiodev is still NULL. If a default hog state on =
the
PMIC node sets output-low or output-high, or if a consumer or debugfs reader
queries pinconf before devm_gpiochip_add_data() completes (or during unbind
after devm_gpio_chip_release() clears gc->gpiodev->data), wouldn't
gpiochip_get_data() dereference a NULL pointer?

Would it be safer for rk805_pinconf_get() and rk805_pinconf_set() to use a
helper that takes struct rk805_pctrl_info *pci directly (obtained via
pinctrl_dev_get_drvdata(pctldev)) rather than going through
&pci->gpio_chip and gpiochip_get_data()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030115540.3660=
242-1-heiko@sntech.de?part=3D1
