Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979786;
	b=ZnVDSNVGzf7bhKgOKjwoZsSKRqqPKmL5USa9KaKxTYYmXTiAV5b/Yyc015baiHsf7amr
	 r42vrlr5fZAv7ArAy8oM/si4/M26MGnn6WUyistHat/QC7tRAgcbUyAjMpJtApLfeRHqV
	 bhVdy0VxNoVcxj2V2ZvlNne5rA2OUbwYffz1HSsSW4v/CXdD81C5WN/R6nFSlr+8ukFlv
	 2ICxbGaUcsvfzW88CGUZk4T7Tinz0FVduv4umQjkc6vPxYrNKO8ILQ1HnNGalKKtbfvTr
	 fT8af6Bhv9DLlJi+Wa/A0isHM94LXbd5XNU8wsbZ2yRrKHDTtvArwJ61DaqV3MsQH2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979786;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6v6OG17OSUIEG4f2H+HmgTBTNuiAezrgxQWfO+HRqMk=;
	b=nP9KTaX3ot8A5eRLWzXbdHHHX8WIp1JZmTnX/J7+wFm/Q+E65JCArS37gaVG0hcUSvM0
	 gnPFZWMoOmLmZDbF+W2biAHQZKvefzgDeIPxbzNvkdvTAoeaGoLUUdiRm+s5KYpVGnpZm
	 trc7JYoYimqixeyD/vERMgTvhUP8P98VnQ8DUgK5pIyrDFPh4KrG891qMg8oRrRp+LeU1
	 5ne4Eo/z11SujdmBItE6MpS8tv3mUFETOhtZJEvoqy/JjeZ4Mp87wMQg7HjD5iO8rZ8jF
	 qEVIpfOKPjFoshC4/m/j282uHuiUmy64rk4Pf2ZHQc1NEgHwhw4UoPxtdG02AuBLl1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L8dDjXhe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E70606A326
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 15:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L8dDjXhe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5841F008A1;
	Fri,  6 Nov 2026 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793979786;
	bh=6v6OG17OSUIEG4f2H+HmgTBTNuiAezrgxQWfO+HRqMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L8dDjXheGkZEnNyEvxsBoAqR1tfYa2sCEe4EouRlPxaZy999K92BEVL7rhFqiPKqB
	 gSOT8LoBqZH3ewDGNSzBneqzOxxPr6Iya6L0j9IIly7FYacogp8zkyFNZ3c3mVquBY
	 vI9+UqhoyUcZ5/Nj2A9byU/5uWgibjtpeiv7zeCCCkfr5IFSTq0FlIiZ0fZA7ZqitU
	 K/Kd+qS5P1FcAGK2EJkpIkOsTfSXcU7Fpg+qf+KoIjmtR3+kMDo9P4g0l2GFZOJPeJ
	 OsZSAShX/xVfzEHKwazS3fu1AN956FAY8mIAgOhZLwd7M++VXYG+ya42rHdrV/19qg
	 SQX+qmnFdRS4w==
Message-ID: <sashiko-outbox-201721@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpio: virtuser: fix interrupt leak and UAF
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261106-gpio-virtuser-irq-uaf-leak-v1-1-ce9772d8ad0d@oss.qualcomm.com>
References: <20261106-gpio-virtuser-irq-uaf-leak-v1-1-ce9772d8ad0d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 15:43:05 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] gpiolib: race condition and double free in desc_set_label()
  [1]
--

commit 4879168b8f1f80dbe315c00e833ecc347918f4e3
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: virtuser: fix interrupt leak and UAF

This commit serializes access to the virtual user interrupt state using the
per-line mutex, prevents duplicate IRQ requests, and registers a devm action
to free the interrupt on device unbind.

> diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
> index 185c1be39b277..21b4bc64d4d34 100644
> --- a/drivers/gpio/gpio-virtuser.c
> +++ b/drivers/gpio/gpio-virtuser.c

[ ... ]

> @@ -635,7 +635,7 @@ static ssize_t gpio_virtuser_consumer_write(struct fi=
le *file,
>  	if (ret)
>  		return ret;
> =20
> -	scoped_guard(mutex, &data->consumer_lock)
> +	scoped_guard(mutex, &data->lock)
>  		strscpy(data->consumer, buf, sizeof(data->consumer));
> =20
>  	return count;

[Severity: Critical]
This problem wasn't introduced by this patch, but can concurrent writes in
gpio_virtuser_consumer_write() race in desc_set_label() [1] and double
enqueue old->rh via call_srcu()?

Just above this hunk, gpio_virtuser_consumer_write() calls
gpiod_set_consumer_name() -> desc_set_label() without holding data->lock, a=
nd
desc_set_label() replaces desc->label without any update-side lock:

drivers/gpio/gpiolib.c:desc_set_label() {
	...
	old =3D rcu_replace_pointer(desc->label, new, 1);
	if (old)
		call_srcu(&desc->gdev->desc_srcu, &old->rh, desc_free_label);

	return 0;
}

Because rcu_replace_pointer() is just a load followed by a store, two
concurrent callers can read the same old pointer:

CPU0                                CPU1
gpio_virtuser_consumer_write()      gpio_virtuser_consumer_write()
  gpiod_set_consumer_name()           gpiod_set_consumer_name()
    desc_set_label()                    desc_set_label()
      old =3D rcu_dereference(...)
                                          old =3D rcu_dereference(...)
      rcu_assign_pointer(..., new0)
                                          rcu_assign_pointer(..., new1)
      call_srcu(..., &old->rh, ...)
                                          call_srcu(..., &old->rh, ...)
                                            <-- double call_srcu() / double=
 free

Queuing the same rcu_head twice corrupts the SRCU callback list and double
frees old after the grace period, while leaking new0.

[1] https://sashiko.dev/#/bug/linux-8fa6e742-7945-4de7-8786-8ad6e6c6ea4e

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-gpio-virtu=
ser-irq-uaf-leak-v1-1-ce9772d8ad0d@oss.qualcomm.com?part=3D1
