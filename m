Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBF53AFB1B
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 03:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206029; cv=none; b=hj9XBlDYkBPVeqfraTelC8oV//76Zzink8e7AdFkbdvgM3hCCBQdZxRGjS9xlIROQf2BQgIr0kGLmhMgLDWDxtjRjplHtwP2Gon1OA5OXpZm5foYy4k4oPnaTJZSCg8xftuf88D2ImLVq/3IbTRP5gnDXNmomn+WM7PnH6F5oLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206029; c=relaxed/simple;
	bh=wuz5bNOoP19HCr7bSGc4QYIhctYN/7vbByTWiHVH474=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pWjc/u9p/FhoiecJwOG9M5Xpu/BCekACxMdLfoejpx3vufqPH3qa/gDUM8dh9AJ927eDyH5OEPhkGwqNQINi2kAy1PyZU9DvYk8EmqZMsoMIgx8a6FeeWT8WSdaUfEK3HZCYXfjLpKYC3KHN9dqoUprt/9r9bz0a4v5OX2moIbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPuNjwN5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPuNjwN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFE01F000C5;
	Sat, 17 Oct 2026 03:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792206023;
	bh=Pjne/RaakBy6Uwn6RNOp87vatZhP7zgY1KQjSI2NrHc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mPuNjwN5PTv5ZLTeh6C1nB3X5eaqlPfxIO4nr4A5+MyOfo4Cy69LmhAEoRy1BhC9g
	 CWALmRwOcqR9F/Msrag1ECzZDD4eEU5H2M0YiZAXqk+HED8+pApI7Ls608Yds60hfA
	 ZQLyC8rQQvwSFJvFoOoEjTkej4B5gzb/SBpQRjBpXhRqxdSQEJfJBx1Fv/dC9XIt/J
	 zLc4foz1IrzSxJp5+M8OwgRIYCj0WMGlEcO27zIKVhA2ime9i3KMkUCZPwJ4CNIrNp
	 1b7rhUlgaiw4m3ZGWop2341Mx7oNxyC2zHe2uJetFqRg2eHNYIGmQL+24rmxIRTVAa
	 +jZd/43gr1tBQ==
Message-ID: <sashiko-outbox-175222@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] gpio: shared-proxy: Fix race between concurrent
 first users
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261017024335.1432020-2-shengchao.guo@oss.qualcomm.com>
References: <20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com>
 <20261017024335.1432020-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 03:00:22 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] gpio: shared-proxy: unreset vote state in gpio_shared_proxy_dire=
ction_input()
--

commit f02d19c15e193895e840a218407e46f54481d01c
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

gpio: shared-proxy: Fix race between concurrent first users

This commit fixes a race between concurrent first users of a shared GPIO
by tracking the number of proxies that have configured the line (via
direction setting or voting) in cfgcnt rather than checking usecnt =3D=3D 1.

> diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-=
proxy.c
> index bc69b8729d196..0d1d724a6a376 100644
> --- a/drivers/gpio/gpio-shared-proxy.c
> +++ b/drivers/gpio/gpio-shared-proxy.c

[ ... ]

> @@ -155,15 +184,21 @@ static int gpio_shared_proxy_direction_input(struct=
 gpio_chip *gc,
>  	struct gpio_shared_proxy_data *proxy =3D gpiochip_get_data(gc);
>  	struct gpio_shared_desc *shared_desc =3D proxy->shared_desc;
>  	struct gpio_desc *desc =3D shared_desc->desc;
> -	int dir;
> +	int ret, dir;
> =20
>  	guard(mutex)(&shared_desc->mutex);
> =20
> -	if (shared_desc->usecnt =3D=3D 1) {
> +	if (gpio_shared_proxy_may_init(proxy)) {
>  		dev_dbg(proxy->dev,
> -			"Only one user of this shared GPIO, allowing to set direction to inpu=
t\n");
> +			"No other user configured this shared GPIO, allowing to set direction=
 to input\n");
> +
> +		ret =3D gpiod_direction_input(desc);
> +		if (ret)
> +			return ret;
> +
> +		gpio_shared_proxy_mark_configured(proxy);
> =20
> -		return gpiod_direction_input(desc);
> +		return 0;
>  	}

[Severity: Medium]
Should gpio_shared_proxy_direction_input() also reset shared_desc->votecnt
and proxy->voted_change here, just like gpio_shared_proxy_direction_output()
does when gpio_shared_proxy_may_init(proxy) is true?

If a proxy becomes the sole configured user (shared_desc->cfgcnt =3D=3D 1 a=
nd
proxy->configured =3D=3D true) while holding an active vote (proxy->voted_c=
hange
=3D=3D true and shared_desc->votecnt =3D=3D 1) -- for example, after calling
gpiod_direction_output() with 0 followed by gpiod_set_value_cansleep() with
1, after voting as a GPIOD_ASIS consumer, or after another consumer that
initially set the direction to output-low releases its descriptor -- and
then reconfigures the line as input via gpio_shared_proxy_direction_input(),
gpiod_direction_input(desc) clears GPIOD_FLAG_IS_OUT on shared_desc->desc
while leaving proxy->voted_change =3D=3D true and shared_desc->votecnt =3D=
=3D 1.

When the proxy is later released in gpio_shared_proxy_free():

drivers/gpio/gpio-shared-proxy.c:gpio_shared_proxy_free() {
	if (proxy->voted_change) {
		ret =3D gpio_shared_proxy_set_unlocked(proxy, shared_desc->def_val);
		if (ret)
			dev_err(proxy->dev,
				"Failed to unset the shared GPIO value on release: %d\n", ret);
	}
}

gpio_shared_proxy_set_unlocked() -> gpiod_set_value_cansleep() ->
gpiod_set_raw_value_commit() will see GPIOD_FLAG_IS_OUT cleared on the
input descriptor, fail with -EPERM, and log an error (and at this commit,
prior to commit "gpio: shared-proxy: Drop the vote of a released proxy on
write failure", leave shared_desc->votecnt and proxy->voted_change leaked).

[ ... ]

> @@ -189,18 +226,20 @@ static int gpio_shared_proxy_direction_output(struc=
t gpio_chip *gc,
> =20
>  	guard(mutex)(&shared_desc->mutex);
> =20
> -	if (shared_desc->usecnt =3D=3D 1) {
> +	if (gpio_shared_proxy_may_init(proxy)) {
>  		dev_dbg(proxy->dev,
> -			"Only one user of this shared GPIO, allowing to set direction to outp=
ut with value '%s'\n",
> +			"No other user configured this shared GPIO, allowing to set direction=
 to output with value '%s'\n",
>  			str_high_low(value));
> =20
>  		ret =3D gpiod_direction_output(desc, value);
>  		if (ret)
>  			return ret;
> =20
> +		/* Only this proxy can have voted, so the tally is ours to reset */
>  		shared_desc->def_val =3D value;
>  		shared_desc->votecnt =3D 0;
>  		proxy->voted_change =3D false;
> +		gpio_shared_proxy_mark_configured(proxy);
> =20
>  		return 0;
>  	}

[ ... ]

>
>
> --=20
> 2.47.3
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017024335.1432=
020-1-shengchao.guo@oss.qualcomm.com?part=3D1
