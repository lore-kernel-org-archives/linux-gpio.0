Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531B4369D55
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162704; cv=none; b=AHUKu4xvqOq2xOIBwZ0mzeN4L6/eJEc04Shpz6nGhbEq84HlLpotxD2Ts/3/GPi1AHD8HICX0qYdmaKILnvMtjgz1uw0W5PdeCLzFmTk+CRKzt/KqK0UdTw1mSlmckI61Uro4QmqwChpRKXulsOYiTI2583ctmVu3q1hbZICwAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162704; c=relaxed/simple;
	bh=L2C4wuedqrXkch+9t7M8f1MKNOYPLF05JO7V70Pw+UU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=D5x8GjrjjBbJTGJRp333XvN+SXD8ZLeebPlDnLpJGHt4sbTkcTgNn5sdoz6c/8JWD74L2dyr+qw+1dd5Xx3wDhy8OSdNUy7TZZZ4n/h2AJbOKZFIHTCLkWQCN3IpKiYnughZbdkoVFqEWBcaKX98ZmHHgpq6mjtXXywTyGQJ4iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Emem4yvt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Emem4yvt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF931F000C4;
	Fri, 16 Oct 2026 14:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792162703;
	bh=AYMGadJxNvvi2+GaOBos7+hc/cOA2NmSNysQ9bGgTEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Emem4yvtrM7guhg6dGaADrKGiUbEaUKlMyqnmCFBhokr+Yej4ZXRmMnHFDnV0z+nU
	 LLgKB7xzgq3AO5Pubnad3hwqQgOlqEtSTaMrPhRdSRFRmLtLdNz8RRp3mb/8El7j2f
	 9L7YWASMff2QKriz1OendigtQMFEWXnDHd2rjpjDoMzisNlOFaa+HgzVkJ5Z7RYqZM
	 7z7NIKNBdbTH2TuKXdWw45KIEW9BA9VQy6UC2w7SI/l7KI+jTWlSd0AW6ETPPckqWX
	 yjNwyz8829dwpCHkj2fyXfizrIHZq3hZEq1TvflbMd2cBqdGbq2EofWzs/bXVwGg93
	 qWbyWS7hpvgDA==
Message-ID: <sashiko-outbox-174507@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: Fix race between concurrent
 first users
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261016144919.1362846-2-shengchao.guo@oss.qualcomm.com>
References: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
 <20261016144919.1362846-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 14:58:22 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] gpio: shared: set_value(0) is a no-op on ASIS lines driven HIGH
--

commit b2e913f9e7adbb02eb24728f50149f4b95e20857
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

gpio: shared-proxy: Fix race between concurrent first users

This commit fixes a race condition where multiple consumers probing concurr=
ently
can both request a shared GPIO before either configures it, causing both to=
 fail.
It tracks the number of proxies that have actually configured the line, all=
owing
initialization only when no other proxy has done so.

> diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-=
proxy.c
> index bc69b8729d196..0d1d724a6a376 100644
> --- a/drivers/gpio/gpio-shared-proxy.c
> +++ b/drivers/gpio/gpio-shared-proxy.c

[ ... ]

> @@ -230,10 +275,21 @@ static int gpio_shared_proxy_set_cansleep(struct gp=
io_chip *gc,
>  					  unsigned int offset, int value)
>  {
>  	struct gpio_shared_proxy_data *proxy =3D gpiochip_get_data(gc);
> +	int ret;
> =20
>  	guard(mutex)(&proxy->shared_desc->mutex);
> =20
> -	return gpio_shared_proxy_set_unlocked(proxy, value);
> +	/*
> +	 * A GPIOD_ASIS consumer may vote without ever setting the direction;
> +	 * count it as configured so a later user can't reset its vote.
> +	 */
> +	ret =3D gpio_shared_proxy_set_unlocked(proxy, value);

[Severity: Medium]
If a consumer requests a shared GPIO with GPIOD_ASIS and the physical line
is already driven HIGH, does shared_desc->def_val still default to 0?

When the consumer later calls gpiod_set_value(0) to drive the line LOW,
gpio_shared_proxy_set_unlocked() checks if value !=3D shared_desc->def_val.
Since both value and def_val are 0, it skips calling
gpiod_set_value_cansleep() and returns success without changing the
hardware state.

Does this result in set_value(0) acting as a no-op on ASIS lines that are
initially driven HIGH?

> +	if (ret)
> +		return ret;
> +
> +	gpio_shared_proxy_mark_configured(proxy);
> +
> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016144919.1362=
846-1-shengchao.guo@oss.qualcomm.com?part=3D1
