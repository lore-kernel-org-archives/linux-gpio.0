Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D05D44F54A
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797449; cv=pass; b=pbWDaqmp9o2ZswBLPT+TV7PRd8lPhpJCRIXeQYZ8ag3U8i49bwxazaFkKAYUNyBXFBVebx8AaaRh3cG9XshYd4PTMCl58VHpGzpeszLutagiP0kmrCE+XGR8jweOOfjXGeMp9ZbCf0SDfmgKjEL1E1YKmYZ0x1gUQaP8f4B+HnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797449; c=relaxed/simple;
	bh=z49hML89cIN3imf7VrsC7tsy8ZMFjhTuJK1MAzYH5qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4fMlJLgEXfHWmq7sKs+7Awo0oQoBxnuVouNsy/w5vMqub18u/N3YHk1ORO0m5ipFDWDUNxz681mRwd4NSIHdcSSRo/YiKjc2OiDJ/xoWKL7JSriukyMcfXQJWmSdDH5qmOMXgHj+KPyZk3XwBGyxzChhYlIu4jl5a+WBS5pqtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqamOTHn; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqamOTHn"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a1eb6fa0f4so18177171fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 02:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797446; cv=none;
        d=google.com; s=arc-20260327;
        b=s2EEbD2PEwvP/gGGtbp6w3a/RKK3b+IgqFh2yAPW3t12TnUaG/EdklF3AJ2kHHbRhl
         JMfNiN6ajOUbPxwf4LzeicXkMlGrBGuQbZSz4Xa7/uYb2+RP81mI6JXl8LueZU3woSRd
         EwbkpiVnnD1dgV7S3UdhRb6quQDG1nVphyCHlD3jtiky49MXfJ/n+cFC4qe36YylXUx2
         erVrL9a89zGmFsaks2coYQBJlxJvbB+CZ1j3HcxbmeGpDcruRJB2PYvrPWmSdcDwf8ca
         RBE84hVKeYkCiMeJA6V+deB0S1eIhAWwc/Hg3sHVNH4VEG1OhHjv67E8e49miagDt1ex
         2rVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kV/daCkEcG+SwQxwP8rLI06AhxP77k2xK+9iHAJSDFM=;
        fh=3euwLAiFESsyJ6CxZDrqSfgeZl3Y8ljAtoyFY0ul6XE=;
        b=htA5E/5Nq4gbqi9jvQoNZZjPhTLB5tzeAB6yLkcHbZfIPJHhIR4irocXTiDtzZmVBD
         pU6KriPn+y+lMkU3iPtYMf1a0vdofppXBSxlFZ8dduoVF7TRBsBd04jP4pg/vRXJGik+
         xor5bxwOPdfPKv9teM0U3jSrSHLmOBhLj6K/2ZtNDitaBM9OjBQ0zB3DS1R8o7VvkaXM
         8kEofuZSA408nCdw3qzumLR54+9p1TEj70ZH1nhOfjz84JnpVzM9Dn3ecZ757Ia/YCcT
         py/ubLs7o8Bn2QctYk7K8D1PglAbRDfwYbCoYAq8B2RN22WFVeIqI/Vao1pFl+EyuWlx
         Q5Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797446; x=1792402246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kV/daCkEcG+SwQxwP8rLI06AhxP77k2xK+9iHAJSDFM=;
        b=iqamOTHnYT5wtxoTw/cH8Wf/55odU75yA9D0HYYAjAeiW3HjX5YsYeBVyBjzOTUQW+
         49W/RYx1FvJbr8X1odDwtU1h5KQbnGIlWAp1XzjiZ5ePVILUivYDhV8ZgjoeL94q6DBC
         UrB6sFas3aehCsYoQ0in6meFtR3wAzsDauKwd8PD9R1vO9NArzxDjvYrcsCjT8Vh3A5+
         cEdJJwPyP4nhlfC3iyTuqoZHa9bhFqMpeO2ar4GWtudpGd3gQ4O3ZAJ/KqpN8eegWiFj
         y4iByI8Fz+d0fi0fI9KUvQV89Bz3RKgR3yDezxLgyIknfat7HtlZyjguK8Hz3mWcjNWc
         C8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797446; x=1792402246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kV/daCkEcG+SwQxwP8rLI06AhxP77k2xK+9iHAJSDFM=;
        b=tb0cfHxOW5jZSNA4X2dX+GXgybA/+6hfSa4FmaI4qt3WZgDcMURwVUTcjx6/+o3p/K
         3J1AOSQ55TfQSd9MsH5W7bBFlRhearv1Wfl01bU9x1v2wrOktiBh56D3sHdjgOC/zx4L
         alOz7WwrI42mD4CpsGmBdsMP2tlmvImCo6EZKjgih8BUap+77uMkbdBa0G2B5dZRTvCR
         TAgJPH+f+mquR0M8cKovZv9ScPFHglB9q5yOtUnem18fFJW97M7d5ANgUIw1GTzekav+
         YLivC7dFYOB0cy3wtOBDlm3Crdv2C0D6/6gTnjt4Wy4qOkRlKKngEgHNpbyzqfxqy6B4
         8dJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCYoB9ZoAYyzsD45bL/9BtD11U0/osOcwdBxR/8jBFw9sy/vXXE/MID28DEc1ZWRhDNo7Vpwy4xz2B@vger.kernel.org
X-Gm-Message-State: AFq9FYKshfC+v2lijjNFeDtbASTDp4rELcw+M73/FwpeNWnBUSlzgIia
	jdBZuH711BBpd+9Jd/0qIyCFMm1ngqMeJa3/Tnyg6JKUOY44KoF51rWlJY1qAJ+Qci/ww8FIApn
	rrxz3rdlXHQQPD7wGh0Ri0v1MPnN8W8o=
X-Gm-Gg: AYBFou0I7wcSQQtrZV6SkZT2QdxJa1nmq6j4NB/OGQ6mnHf5l6ZcZowBr8deIxdlMX4
	jK/69G5mr8W5TovCbBovCwOOYXUK7HlraRFass1Dlp3qAbi8D2OsMg5vK2lgEfsgSE7Qiznzoxf
	HKVoLOB26juzwqRIGuAfN+2PMtpWhj1rDaWK5RNZsQtFEgSo2vAzs59kK8Au0nW0dW+a/k3YOmh
	Ho72g8/YuWmXkKIHcrVIyQoccT7OUYLBPLjSxUAsK89wYvtfo7j87zZtROyIypYDAA09yw14c/X
	oVeRZu7CyfGU3IGjuWhpvF5omJSlet2K2qTaR7BUv93wFyq4HqhgJocgVvMtJ7FS7EKbRBM23rz
	/BlKUVMI7qw5j4ioyXfOcncnrhQk0VWOjXYnsEsNUWMoVLz3Ia+N+4IY3EsBjC3t8ohTiWHJnRu
	NSB2JP4M/UrUXDm4rqUtvVuVakHWSrvk9QaFjvd6KJ
X-Received: by 2002:a05:651c:3251:b0:3a9:8167:62a with SMTP id
 38308e7fff4ca-3a9c539d80dmr19489771fa.28.1791797445959; Mon, 12 Oct 2026
 02:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:30:07 +0300
X-Gm-Features: AclHuK9e_oZT5Sa46rEJHVX3lFg1Q7os3EVH632mfdiuI60h5GYQ15qLL0jo-NM
Message-ID: <CAHp75VeonKZtX8moOdXrmTJbjH5Ew5iVdDDc3KfqQ9r_tvHg1g@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] gpio: mxc: use local dev variable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> Introduce a local 'struct device *dev' variable to replace repeated
> '&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
> readability.

...

>  {
>         struct gpio_generic_chip_config config =3D { };
>         struct device_node *np =3D pdev->dev.of_node;

Why not this one? Is it even used? Perhaps you want to have

  struct fwnode_handle *fwnode =3D dev_fwnode(dev);

here?

> +       struct device *dev =3D &pdev->dev;
>         struct mxc_gpio_port *port;
>         int irq_count;
>         int irq_base;
>         int err;

...

> -       dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
> +       dev_info(dev, "%s failed with errno %d\n", __func__, err);

This message simply needs to be killed, with initcall_debug in the
kernel command line you will get something similar from driver core.

--=20
With Best Regards,
Andy Shevchenko
