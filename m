Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701574;
	b=0S/y+IXny8ZfpFLoF+/tqGBY0uz/hncNcDH7PrCCnDNn/vvBT+SlAUHqmUchkdb9P2iG
	 v44p1QGwfHf7YI5I5tXzy0WiNIExVuptORZS3eHVLlPk93gIc8OnCp76FzCeQFPHZfTBi
	 0WywVY0rsYGM+V8yXk/pFSZsZ6bLz83HsZtJ7xDqxt5UrSpTEgNBgbzy7m2CLNBz3osH6
	 0UY41dJ3TlNprBmSiCaM2juQWBWI1KUtE98DW3SQRV4yF3n0cLYmXvfNSVqn6oJSPZLQZ
	 g0MwzdOQR/JvEMrWybdZoM8bjvM8juihZkcXRibx33qnhgXoOJznYVeCQw0zguRJkpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701574;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Obx8OtNRA6+z4+FID0lm5gipj49ZtIPABC5Ay0Lcy3g=;
	b=25pVq/lmkECRRtMK58GvAHXVxElGDWGu+Ab5GrAL9EvVO/ldfFEL6cokuDRHrVspQHjo
	 yyuzTkw5gWSNDHfCE9NE/viznN/T/oJoZV89li9lXTrkBUKQVNbSCbrxb0l6VIADAG/xR
	 KK5pEXHAmqHOs0AJUSRnqn43QA2oKQ0333Kh9xRyySq4RHdRzHoNTP8dGJZnJv6tn+0LT
	 L2v3Iy9ZNi0iYYkbBaRuG1A1sw+cMkvpO3RHLbzKM27iMU1WHdWL3Dv+CfJc2Uynxa7jy
	 Duv2V20TLkIMpBNTpphsaxrUWnZ69ldpB1cHa+zRFzPSPT9rLfFm/CGJvtNamFYWsvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CsbLJNuc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66E4606EEAA
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 10:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CsbLJNuc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D421F0093A;
	Tue,  3 Nov 2026 10:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793701573;
	bh=Obx8OtNRA6+z4+FID0lm5gipj49ZtIPABC5Ay0Lcy3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CsbLJNucTeIZkI1szt+yKxWCq20ior44CWumlPxD5iMxXjrgQx5gPOK7QnEyegIx7
	 CttL+zTKQceNCkGRFovcsP4fpqR0RgJUD4ZXTV3u8yIat89JsMyPq6KUKfKDl/fo2E
	 OkGJf3n6GmDFcQEtBht6EiTxQnHD/SPl/kvq37cxFaniizSyWyp3iNek+HfxYtJZT4
	 +F8ASCB4XTLmF3fUL8bXc5GFjW/90K9ehM5UlQitNhF8VxLmZe1tU8RhU4FvRT1zdj
	 0kzy2ee6Tel9izRmRo17WTVw6YDpU172VJxBWaVk3KC1dRy/tIzcuLqlP9+rCh/aYm
	 HlXUk4OvQHhmw==
Message-ID: <sashiko-outbox-195044@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5.10.y] gpio: dwapb: mask/unmask IRQ when disable/enale
 it
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlndWVsIEdhenF1ZXogKFNjaG5laWRlciBFbGVjdHJpYyk=?= <miguel.gazquez@bootlin.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261103-dwapb-fix-v1-1-c93ef2f20695@bootlin.com>
References: <20261103-dwapb-fix-v1-1-c93ef2f20695@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 10:26:13 +0000
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
- [Low] gpio: dwapb: missing semicolon in dwapb_irq_enable() causes build f=
ailure
--

commit 8cbb31bc1b5314b8269d987acc47c5043fa04ab3
Author: xiongxin <xiongxin@kylinos.cn>

gpio: dwapb: mask/unmask IRQ when disable/enale it

This commit synchronizes the GPIO_INTMASK register state in
dwapb_irq_enable() and dwapb_irq_disable() so that interrupts are masked wh=
en
disabled and unmasked when enabled.

> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index d6240ae0f87ca..c2c9b42a60865 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -282,13 +282,15 @@ static void dwapb_irq_enable(struct irq_data *d)
>  {
>  	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
>  	struct dwapb_gpio *gpio =3D to_dwapb_gpio(gc);
> +	irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
>  	unsigned long flags;
>  	u32 val;
> =20
>  	spin_lock_irqsave(&gc->bgpio_lock, flags);
> -	val =3D dwapb_read(gpio, GPIO_INTEN);
> -	val |=3D BIT(irqd_to_hwirq(d));
> +	val =3D dwapb_read(gpio, GPIO_INTEN) | BIT(hwirq)
>  	dwapb_write(gpio, GPIO_INTEN, val);

[Severity: Low]
In dwapb_irq_enable() in drivers/gpio/gpio-dwapb.c, the assignment to val is
missing a trailing semicolon before the dwapb_write(gpio, GPIO_INTEN, val)
call. Does this break compilation when CONFIG_GPIO_DWAPB is enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-dwapb-fix-=
v1-1-c93ef2f20695@bootlin.com?part=3D1
