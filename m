Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FAA41F37D
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801213; cv=pass; b=NOG5O+gYkSVBLwOC6+P+txZ9qFxsMCxrnWfFDz56X6oxd8fDgHhkzQSEPyFTwSAYEEZDOIagii09n48844NM7Qf1O0voGigGDlFNfWAifkZC7EE+/2qXYcNhvjWFKo78MSvN/4NxMDeyOg5zjFJmFFfjr6+bcKmswPKw9pNWFEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801213; c=relaxed/simple;
	bh=K58spMtUXSSstSD13s5KRjPSopvKSNrgFnbERIc/EfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ov9mtHtv3Mkl2S+mMCIX/dIgd40rG/jB39unQLwbQmYv1lOApne3M3KVPli46duTXQ/aw0mTQf8hFaFmlFjeY6F+TPXqNZ9vY65XnLBcyI0UpGgw+YPXmC1MfG4HWWARYmQ4reeXW72rCoSj5JNZbCm8ChZZdlF1hwcXNQekVPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyOsDOqV; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyOsDOqV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c3156e7705cso277476766b.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 03:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801204; cv=none;
        d=google.com; s=arc-20260327;
        b=s4J0hk5BxaWpenGWkIE17vjcnd6LEpCim/Sq5fyZmviJ9WTE8ty/fWSfDRXZGpfZTe
         7e8gojGjLR+KweBVp9dS5PaMGpjRI8Iut7KeFrmWFTgMDAP9EOXZlVnTDMRB+IKReT2R
         dSaYLByXQ3B5WIsK2DXAHUpuroj49eqggG6k5IdzQ4gSTztxjY+j6Ct4Y0QG3slf0+Ia
         O9uf6+35fnEIqLhQlllMQaK87SHGQP7MOGwgDzGQtzvJZegelktUTVWOxc8qSpR4SBng
         FFc0zSb+312+xCTLQbTi2Gx9gVyQ+q5iM01vVqcGaAtMGSl4WuBaYLsmaJkA3u7foFEX
         LkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WCb6XoubVQ4Mh43VO0uwVKASyleTbzUvSNlnrWOxN8o=;
        fh=N6o3BY9Dxc7oACiMqFnr3imNiVJiTiIDOWNVSItMTKU=;
        b=RNJmYgX8agEwnfa5ptuq6+OnwfFU0WiSRUkubonfRGjcAzAYav8qLOcwJvql7ncsnk
         Kw+C6JNshyBi8ugpKp/A8IJ0xqyFI4/sX6uTpIciExWhoLaudi74Lp5fygM8JdfDlr6A
         8kgB5LQeX74sPJLr9xah3V6CtmmuHpxcwTtdIBoP4d2xHTRehqgj9KLnfVQ7DNjFOm+q
         6XQjQ4SRdeUqnAoeVvIwqfDNJI8lVqk2QZ5d2az3nILbJ3p2totyxOqO3cAN1yOxb4n7
         HtupFuR+m+XN1eY/rbJ3pDyh7eCgYwdUgN6f1LAHjIpqv31hYQDYustcBeEjzTW7Ktaq
         mjMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801204; x=1792406004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WCb6XoubVQ4Mh43VO0uwVKASyleTbzUvSNlnrWOxN8o=;
        b=QyOsDOqVPbs5F7/Mbyf5pAowaPjAOBQRB1civGx0dw2T3f66kyBZOEnNUkIsfMshCi
         pPD/1eZhIQcBhaz60OG79w+vIA8u9qkNc5bZqjKctTUNeUmkKLLM79TS5tNFm/PlNwGu
         4LfzZf+v/A0oZFqzp+SBylvb+wO8/2v2c98p1/Xr4g+HUqZpJxOTT6PlgDsPx2eRC1y5
         BcF4PcKCyoddxie+AWlWgYfgGzB9i+Rb4bBKys8Foua1ZqKq18UhE4lYBUnXToWYpGHk
         /TOjIhMJ1FFYDvOMndvZlqy+KbWAzxKDjuSON34Mjb4qxUkEmrMM14r8NiTlTGQZlzPj
         0Otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801204; x=1792406004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCb6XoubVQ4Mh43VO0uwVKASyleTbzUvSNlnrWOxN8o=;
        b=zVOvPCuiZMa43UY7XEC9AkmoyiIVy3KJgqqnOGNn6LiukMBtf4YtCUtnbFMdo6mNeS
         t1r6KV74pFwC26OLNrprnFVRlGvRVDB9Ta+u6p8CDu6JpDfZ3gceqJVGttmuj4ZDKqPq
         1CojhJfyhoGZGXJcts7DCiyMn/LjxMNlYLqHUVLRbHQBhYvqg3dJdOvyJ5hfhyGNOjBW
         Dz3J7uS0MZiyw9wRppsCAJHGxqZ1NqdUkm7NLxMtX8moSuacwl/tPANahYNTm8Z7ao8+
         sxF1mzqacI4aibldBzSlTgwa8iYDc/wdfGG+CM4tE2IwCUC1RKlu/fZHBlsovoHuOUi4
         34lg==
X-Forwarded-Encrypted: i=1; AKwUvBykdFvzdxSxR1B7Q72wKa5LrPJvU12+FeEIvhI7Mwvc4ootSEy9SZLs3nRR1Ldbscin/sKt+DU1n8Lj@vger.kernel.org
X-Gm-Message-State: AFq9FYI+1rPWvuwvxnub+Svmc8aNERO2ah9/ZlLtO6ravXmTbGK0iYw2
	xJ9thklNdSHriIyrSWPiZ4uIYDP1mhOIvpdnLV1FfLVRZHapwUyWWrWO8JLUota6/OX1ZhDCBUI
	kkkGGQIKqkbUvoqJisRpKmvhx97hctv0=
X-Gm-Gg: AYBFou2bVzYlhfRhkaOWJksO2Jz3j6Sr3eFXmCOwxD+WvExCaLSLRKNMYm7SdQDL2A8
	4OMlWHYo2yjV7GlPgtiTjPbTKmVrbC1GjLLqOiiDSdr7ZygdeVZn+4xh0yiIuHGmjELSlJrM5yZ
	NGEk+3SBEeIzu+yu80NYiRMXfdHWV6XR02jthGrf5LRWwGuLgYCFQQ3Z1v8hU3rHkki3RL8SX5r
	sUYB9d61JihzJZRwV+If5lObwfoOoP6ejQQKHRfH+ho+Qpxs0ILXCMapYkq4Cn6fxnjKmvyIJCP
	uV9JZ21KuBmakppoIWkVIa4Tt/9HwaZlQrpGYdFBZpXgdT43+d4qjuZrSvS/QydlNZu04uCtwcZ
	bkyweVszyrnAyIESpOvX1hKl2CT3UVab/g+6dhK3oW3L85gjoVhFKEaZZ2+AglmPqx0NF9cy5K7
	ZRWaAdUcTXUJt6vbtFjddzI83+RY2P5EVfTZSsL6mS
X-Received: by 2002:a17:907:2d88:b0:c2e:4373:521 with SMTP id
 a640c23a62f3a-c31aa0d2286mr787580766b.46.1791801204012; Mon, 12 Oct 2026
 03:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-6-cb47ce2ad758@nxp.com> <CAHp75VcadkqzMxShq1PLzqgNZypB+vqr3a_m1utu-NOx39iK1g@mail.gmail.com>
 <asyvcJxbM5aD8pzE@shlinux89>
In-Reply-To: <asyvcJxbM5aD8pzE@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:32:47 +0300
X-Gm-Features: AclHuK8bE2RNRViMXGduuI7Gu1WFvoqdAJYcBik89ymBcvSwk0SX4J83VWey8Go
Message-ID: <CAHp75Vfi8xqFU7nUjE1ktYKWgXGYy3XQKnz4nAJZeR2_o3ywkA@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] gpio: mxc: replace of_device_is_compatible()
 with hwdata flags
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:54=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wr=
ote:
> On Mon, Oct 12, 2026 at 12:25:41PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:

...

> >>  struct mxc_gpio_hwdata {
> >>         unsigned dr_reg;
> >
> >>         unsigned high_level;
> >>         unsigned rise_edge;
> >>         unsigned fall_edge;
> >> +       unsigned int flags;
> >
> >Obviously you need another precursor patch to move from 'unsigned' to
> >'unsigned int' in the whole driver.
>
> Could we keep as it is? I try to avoid adding more changes if not critica=
l.

No, be consistent. You can add a new member with just 'unsigned' type,
but it's discouraged, sooner or later you should provide such a change
anyway.

> >>  };

...

> >> +#define MXC_GPIO_HW_DATA_COMMON        \
> >> +       .dr_reg         =3D 0x00, \
> >> +       .gdir_reg       =3D 0x04, \
> >> +       .psr_reg        =3D 0x08, \
> >> +       .icr1_reg       =3D 0x0c, \
> >> +       .icr2_reg       =3D 0x10, \
> >> +       .imr_reg        =3D 0x14, \
> >> +       .isr_reg        =3D 0x18, \
> >> +       .edge_sel_reg   =3D 0x1c, \
> >> +       .low_level      =3D 0x00, \
> >> +       .high_level     =3D 0x01, \
> >> +       .rise_edge      =3D 0x02, \
> >> +       .fall_edge      =3D 0x03
> >
> >Why?! Just to save a few lines? This makes it harder to follow the data =
part.
>
> If I expand the macro the imx7d, imx8qm, imx8qxp hwdata, 24 lines will be
> duplicated. I would keep as it is.
>
> The current hwdata as below:
> static struct mxc_gpio_hwdata imx7d_gpio_hwdata =3D {
>         MXC_GPIO_HW_DATA_COMMON,
>         .flags =3D MXC_GPIO_HAS_POWER_OFF,
> };
>
> static struct mxc_gpio_hwdata imx8qm_gpio_hwdata =3D {
>         MXC_GPIO_HW_DATA_COMMON,
>         .flags =3D MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WA=
KEUP,
> };
>
> static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata =3D {
>         MXC_GPIO_HW_DATA_COMMON,
>         .flags =3D MXC_GPIO_HAS_PAD_WAKEUP,
> };

Yes, I saw it in the next patch(es) and commented there that what
should be done is split of the common part to another data structure
(or be wrapped into one with a .flags member).

--=20
With Best Regards,
Andy Shevchenko
