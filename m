Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FFC47CC8A
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887676; cv=pass; b=sRxw6i/aU5VSXasWr2GX4rPdfVq5VtnmlPS/lj4+Lal6+wZfirT2kAGEf5bk7PeEnP0zOj29xRYx5Js87aa9pmNrzyjc7WTjqVsSJvRSeq8c5kkJhFgF1BqFDwOVE3RhjGFmZB5lB2qGUnj60PN2ShTkV7czJJd20ajm1++oyb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887676; c=relaxed/simple;
	bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xygv7pxXVini8iQOPA+3Jzn6dii8ANTgoTRUJ19UZQ0wpoegXxCtawB5I+uFJmNZOKQdkCdW2XOxzVQp7pa7MD90uTn+001QM7AhQJS/uilB29KK1KJNAhs2DWakpKS5oClU9avcq8jxFhOZFjwCIqpkGdj5LhT3B/U9rmujT8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=modQlBSG; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="modQlBSG"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso3267067a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 03:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887673; cv=none;
        d=google.com; s=arc-20260327;
        b=h2XXOFsJ1Z2W9tl80BU+naxhIX4YjloCEfYLrFphZv3gp9sAYdaDnrc1wYoBmgtJw8
         n8oF71L/+SnqaGdrYhuJWA2fK77jilIfbqqkWqnhjihGTA9WG+Cve3nYzdA4l7NcrwJx
         pSbzclyr8G/dTBr6KMXYTwf/uC9+wYdkxX66TU2rXiuXg/NxBEpSFvjvGZuqxnAZ56iL
         5vzLlrWGDHvkr9j4QbL+xHNEar4MnHv5PxGCy/ukfLTxTVW+ngTwpPyJK3txCu/A+o3+
         A9jFGfl1Vl28GocUnkGQ/BejaQVzX828TaDx+i7WwV+R2oZzBQ5X85v+dIZ+Tfepsr6J
         urZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
        fh=M5Ev+bK95etWT8ng6/ZLQRVX3CpSSfnnNN/XMpvSgCo=;
        b=Dnbd/527oe9OQ69FEly7+ba5TRCBJkVLSncCp6OJI05CxfQJmaWK17O7DL4EJDm14J
         hUWXWv61ebm1/MYJXgEWcFlBZm13F8UvGUuZXsgJKETy/5c+FPDon73cWPqQ7+mIfF/E
         cDATB93WO5K8jd0/XPj0+kzonj5FoMeIvDeGVLnEvK8sej8Wq8Nd6R6rDuqS3XwX0nW8
         Ln2kN1HMh2SKGuyEB+y+EH3AERFIvsRzv4j60jSepmheD/QvwonQFaMmah2wbdKVbr1d
         uTivGB1c431J8i4JBXOM/eYHGV93FidSqJQJIAmnm1joN19WvXqh5JsFcpHQPLdW7gMm
         3yow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887673; x=1792492473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
        b=modQlBSGfgzv3q0bNjcyiwK30WKaPqitYEsHfpfBs/TQmJTgRJEumDwiDTqIfJc7wO
         1VL0Y0Na0+Zjuj/UYULc6EZ6QP3/7abos+mTyJb3dpspZ8FOJ3KpLtIaan+N3vyZ+zAh
         r8ZKo3dwoLAkUqHep1xMNoxsSXwwJb7M109U3Y81061wTtiVunL+QQL2Uq+EeU4wcpCX
         OAPs/V4+BNonjTHuEouVUreJZkY0rW3X0KmIdI7Leyc+eHm+RzzcjQt7QLRkSCX/kVMF
         pUZRIMzXzSTBlEpiY4kyFDRkejNyYQ6BHe51FtH2dIru6Gt5V6gtkyex3HUHWZLLSbZd
         +RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887673; x=1792492473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
        b=hvfNa9PnSAjRJ3NTwPUmfksKk5+TqCQMldmYF+bKRg6u6pREhj71MVXf/OVyZlUkrv
         u/KGeBHCN7j42higNi0b1NNlCpK8IEK3i26g1ZaO3WJOjQUzuCMbW+2EXDt+HWa23xPQ
         sBaSj7VRtTvzkvbibztwMWNEw6erpVXV59KsT4samTj/539T8zcDFROsbrnLYeefkyFP
         /n3H9WWKyTmlrUZsh1EX0q+tJXu0l1pTMWKh9GvIU9FqhwDLRr+65R7u1Hf82A6PTb4B
         RnmwWJGDI2OkraMvGLvH2NZ2PfQI3JQ51ZJ8PDH3vtIyIF4p1FzIl59pGdS4v2QwHFEP
         XKmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjKzKeGj8P6xIaPmDiE9/+TLre7v44TWowBqiaFXo1DNFd9yWG/bMNpUR0WuY2aZfYYbw6xQh3HIMd@vger.kernel.org
X-Gm-Message-State: AFq9FYK3CU6Heow8JrxCp7veXBfX9c6SYeYnhcv5EY0dmJLad3UDACpI
	Wa3V7RdDcW9GcKgxptf2P3grew3+ruoow1LDGVmgQju9WMFDKduUbgTFnTp+HCO8FYatjiLxxiR
	v0jJJElnmzRsdzYhAay5i1yqP3mNKGQ0=
X-Gm-Gg: AYBFou1x2Bl4Nm+o4EjB4RgDpUIXxUnzDXmKKfAUSmUFNl4idG4FplARN97Tl4J5pAW
	iAGa+AG+fRPJWWCH7UdVDSTvHsU1eU0eHLn/uXUMzTltNNjbR9CuIw6cQV7c+CeWwuqdN3xETS7
	Epou867TnOBw8qyTloN/Lju7uqEuCRSd+6CVwe4nOnf+manZ3G/3GCXqxxEs2JUiGxvQJynbipZ
	F8xkIdQx5NdRIny07yjBUVCY+mbD7p0nsJEMMOwrfZqmmD4BL5W66qvwnsCVM6sEDN2hckvqvXm
	hql5iY+BHqnOYLWu4oU7SXh+54aLONmqO5dWXO0/zIHYS4PGerLrbpCXsf1wC8zCBwrbRX7ux4E
	pJ3Xc9Sxy/z/NetEittR5pL1li3E9k3+RK+pwjuPeZOTDjdjbg48PH/wA2GYMlGJMTnY43AisEC
	NAEZUbgmwdJFMp0B569a+/RcSVLhY5CElN0M+06o2Q3UvbUa21I2I=
X-Received: by 2002:a17:906:6206:b0:c2e:7da9:6e6 with SMTP id
 a640c23a62f3a-c31a9b0b9bcmr1021852966b.11.1791887672983; Tue, 13 Oct 2026
 03:34:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com> <20261013-gpio-mxc-cleanup-v7-3-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-3-c4d769587d3e@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Oct 2026 13:33:55 +0300
X-Gm-Features: AclHuK_kuegeo_16KZLM0-Cx7ehUYRa3QfvyF2aUqaBfecJPa1rxTPSqFEfgNHU
Message-ID: <CAHp75Ve6KduhGHyaNDBM9MqjQV4dTzOz-_1o2Zieq0EKyCtiSQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] gpio: mxc: fix wakeup_pads bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:04=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port. The writer-vs-writer race is the concern: two concurrent
> gpio_set_wake_irq() calls for different pins on the same port both do
> a non-atomic read-modify-write on the same wakeup_pads word. The old
> |=3D and &=3D compile to separate load/modify/store instructions that can
> interleave, losing one CPU's update.
>
> assign_bit() uses an atomic RMW instruction, so concurrent writers to
> different bits in the same word are safe.
>
> The reader side (for_each_set_bit in noirq_suspend, wakeup_pads > 0)

for_each_set_bit()

> runs in noirq context where no concurrent writer can execute, so
> reader atomicity is not needed.
>
> wakeup_pads is a u32, while assign_bit() operates on unsigned long
> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
> on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
> wakeup_pads to unsigned long and reorder to avoid wasting words.
>
> And fix the enable/disable path unconditionally sets/clears the
> wakeup_pads bit even when enable_irq_wake()/disable_irq_wake() fails.
> Only update the bit on success.

--=20
With Best Regards,
Andy Shevchenko
