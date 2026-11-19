Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131731;
	b=jGAiEjR2ehoTF6cUVqiRkoX7S9K+m/rJOJ3odibDjqcjrvBHwwMQB+K+9hCwZqGv8JTz
	 5jQQDGcKkDGe5DiWQA7NobTLa3rsFAvO0+Ff0S9FuedWlHezOttOiSR+YAbR7960W5U7N
	 cDA1sMLc6wZ/LnytjjXlpOyg2CXpLqOt+jRRFtUc7gRWOTmvhEhIh4bwWiH/PKiIuzC4H
	 MhEYmeoUjMaWXiNZ0kpTd0bYmOyoKtt88+KrzMHp87em7Sz9kM3MHlcucJ5JfJgXEgeUv
	 q+Bq7ftJdHy4UTDZp8La59OsYb0Ye5gAEvNh9lgs2e5/Y/oNi2JodLX9BjgSJZKnazA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131731;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iuWrXA+JpZStu2UyFi68H9Je3I9SsSvKBF5d+DgcO5g=;
	b=M2BcH+mDKDpvQqG54ljnE3zxaNgasTTSNCJb/VNtCEfES/RF3KJnO7/ErJKznvh3evjy
	 KTz38eDDoWZkUrLkcmpjnR67aWZTLtSNcty+4I6JQdrpBzuyLiLhagxJPt5N2QcOTbhbO
	 hR2VBwcppN9+p+tmkwaoAhqlbLmJjXIWAh2TUu2rcsXnTNfVR1HUHq+tesVwymnAWG9rS
	 epWRbXKoNltb12p9bLRDhSXB727iLPN3z6cmClIbjwztXyO0aoVnm9BqfNREiBoYyMLUO
	 Zh9UTm4No8pLk6Ct8t1pBp21tcVZWT5Zvr1+LjEb4yleZWLpPgZVznXgHp5Wpe64tGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q9L8FyTX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F91606A320
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 23:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q9L8FyTX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40461F000C4;
	Thu, 19 Nov 2026 23:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795131731;
	bh=iuWrXA+JpZStu2UyFi68H9Je3I9SsSvKBF5d+DgcO5g=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Q9L8FyTXli462UprAGLvCdpudRJ6RLNxZvkOk6ZRBR+0iZp+QICxbvGwVXTGLArPs
	 rFWQALwNj3S0I5FJ12z8tx/WBG5EWHwWfLOVV0dTDcWnOeynZr9EBxefVpoYQIWjxP
	 qzdPeP2n2dq1ZoHWQnNCEj6D3lDo/0sZMKvxMPWFogoi7slCNr64A9OwrAC/v0WUSE
	 Ljf/Dri2qF5WexR6tanqFS0eZS4HK/tAFiOAfeuFORVa6CYMUsWTdGCVbh727mym3T
	 MkOuSD9X20wd3/kainyoLqvshwx7xjIbyjkpGalPfBNOL8n1nqBu4/hWT5pUyWgbZB
	 Zfx/NaBtcPZXA==
Message-ID: <sashiko-outbox-224208@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] pinctrl: single: Reject bit-per-mux without a
 usable function mask
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-gpio@vger.kernel.org
In-Reply-To: <20261119232806.4093754-4-alexander.sverdlin@siemens.com>
References: <20261119232806.4093754-1-alexander.sverdlin@siemens.com>
 <20261119232806.4093754-4-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 23:42:10 +0000
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
- [Medium] pinctrl: single: __ffs(0) undefined behavior in pcs_probe()
  on zero fmask
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] pinctrl: single: division by zero in pcs_allocate_pin_table()
  [1]
--

commit cc08958bb33456e53a3135b8e53047a689914a44
Author: Alexander Sverdlin <alexander.sverdlin@siemens.com>

pinctrl: single: Reject bit-per-mux without a usable function mask

This commit rejects pinctrl-single,bit-per-mux configurations in
pcs_probe() when pinctrl-single,function-mask is missing, zero, or wider
than the register width.

Link: https://lore.kernel.org/all/20261119205013.2563811-10-lee@kernel.org/

> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-s=
ingle.c
> index bc6a3a4999156..73425f6c97284 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -1855,6 +1855,14 @@ static int pcs_probe(struct platform_device *pdev)
> =20
>  	pcs->bits_per_mux =3D of_property_read_bool(np,
>  						  "pinctrl-single,bit-per-mux");
> +	if (pcs->bits_per_mux &&
> +	    (!pcs->fmask || fls(pcs->fmask) > pcs->width)) {
> +		dev_err(pcs->dev, "invalid function mask 0x%x for bit-per-mux\n",
> +			pcs->fmask);
> +
> +		return -EINVAL;
> +	}

[Severity: Medium]
Can pcs_probe() invoke __ffs(0) before reaching this !pcs->fmask check?

When pinctrl-single,function-mask is present in the Device Tree with a
value of 0, of_property_read_u32() succeeds earlier in pcs_probe() and
runs:

drivers/pinctrl/pinctrl-single.c:pcs_probe() {
	...
	ret =3D of_property_read_u32(np, "pinctrl-single,function-mask",
				   &pcs->fmask);
	if (!ret) {
		pcs->fshift =3D __ffs(pcs->fmask);
		pcs->fmax =3D pcs->fmask >> pcs->fshift;
	} else {
	...
}

__ffs(0) is undefined (__builtin_ctzl(0)), and shifting the 32-bit
pcs->fmask by pcs->fshift can also trigger an out-of-bounds shift before
 reaching the new check.  Checking if (!ret && pcs->fmask) above would
avoid both.

[Severity: High]
This problem wasn't introduced by this patch, but does pcs_probe() also
fail to reject an invalid pcs->width [1]?

Later in pcs_probe(), the switch on pcs->width ignores anything other
than 8, 16, or 32 in its default case:

drivers/pinctrl/pinctrl-single.c:pcs_probe() {
	...
	switch (pcs->width) {
	case 8:
		pcs->read =3D pcs_readb;
		pcs->write =3D pcs_writeb;
		break;
	case 16:
		pcs->read =3D pcs_readw;
		pcs->write =3D pcs_writew;
		break;
	case 32:
		pcs->read =3D pcs_readl;
		pcs->write =3D pcs_writel;
		break;
	default:
		break;
	}
	...
	ret =3D pcs_allocate_pin_table(pcs);
	...
}

When pcs->width is less than 8 and bit-per-mux is not set,
pcs_allocate_pin_table() computes mux_bytes =3D pcs->width / BITS_PER_BYTE
as 0 and divides by zero in pcs->size / mux_bytes.  If pcs->width is
greater than 8 but not 8, 16, or 32, pcs->read and pcs->write remain NULL
and pcs_add_pin() dereferences pcs->read when irq_enable_mask is set.

[1] https://sashiko.dev/#/bug/linux-a0303b6e-d0c6-4292-aeeb-fa8a21861827

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119232806.4093=
754-1-alexander.sverdlin@siemens.com?part=3D3
