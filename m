Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9000745DF63
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797182; cv=pass; b=WmPqUPT6hnqYWnEW2PaYIRyP55k2t2x3OnnYEyTHAUDfTME1NKVyNUZw2hpBPRSAYc7/yqjCv/f97Q09df/VororU7FuewWkVcFRobjYkZ77+rwZBsxAUMYRldXWnKokIIvNwntR7w23nVlFzAohdqx0PeV/0cJaojkcTB/oRV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797182; c=relaxed/simple;
	bh=DK3zBs5Q5Ki8kuPnph8eZ24Oy0HqvpqhIG3ePWhuHBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcBn9qU58BfIDArkbfziseY1nG2sUsgZlQKaIlGiAPEIYc4NGrYrmoyVubYt6KSmq6pQk1MDqGaUXcxxLzFiBWItwJyvNm6eOQbRJyj1LbzXfxEsPZRStTRrRiI9fiTBXOjCYQGg6bGyPSXPZ0vkO2uPUjgCSOfBfd+0PEA7EGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/z/fuYU; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/z/fuYU"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a9e87ba7f2so3652871fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 02:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797178; cv=none;
        d=google.com; s=arc-20260327;
        b=ncP4psui0JCKSJb4H1E51S4FWfzUGmjM2rkmsKuYlsodOj1ksklp2aIyszzf2lHQ6S
         CUKaezCD7w1ANOFZjI2c2uMWACNv6ZoF9aiATh8E5DUvdvq7mdKfyBqpS20yJ9bsDOBR
         EjpuO3QvtnOO3JCZ3lWlqkgLlyiFHv8pB/vRvHSvlsHX+sb1DBcn5HcyAD09BDrCtLzM
         Zo52ujx/r6Eu/yjFnEukjSmYS84jqS+u4FqjaerB8m0VfQjkwWPClUcC4O+J8zpU6M84
         BbBkoY3iE+3gnPg9jF+L+8428q5XnzUDrK5+Wjisyb28jIsrk9jICUWG4Y3Ma7PxnNtj
         FOiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1DLHRcFWGRMXj45+dEiiprV4k2SPY5qTAHRqmLZ7S0=;
        fh=MYr6ru9/ixAiCUVVlKxZYcqu2O/z0BjBajzWlRFOtBs=;
        b=sdKjPyUKjO6kqWKbi1lJFcF9CS7yjvMwLlfxMpb9+bLW1NoepB47truEiDrlu0uhLg
         YpeifXYdwaw/p5aecwRrZkFuYy532i+fljLBorBD2+jx/DBRSYawbL24uVLErNQFcAK0
         Wbkg1YfUEooxSEImOkO/9V76oYkM0Co/smJTiqptHgHnpd6/fTeYYZyG/mIEAIlXil68
         SYjfX6NHXnOQAuy+YUQf7lCqZyBybXIuAhqDkiq5a0XEyKnRD1SelcYvnB16lX2xd/q7
         AB+vuWSO2R1vn8PIOWP2aw/fJF5YgwgUBmXBwFfEdMlr5BPO9l2fkfGif0nSXvtnpxdP
         MafQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797178; x=1792401978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1DLHRcFWGRMXj45+dEiiprV4k2SPY5qTAHRqmLZ7S0=;
        b=A/z/fuYUh1wxDQRcYOC0JSCiBb5akQHm2vkscE3JR1uYNxvXq4CkDUyT/kJeQm61ZQ
         XTwYuN7zs0APLCuvy6VNGM7igEvHBt80TRGJAMDRgjzA/ESBRM38XrZEkOuq8XhnLqG7
         OZA2bycqNJMMd9U1kAbAY3Hn+OAzRx1x2wxMpIN01gCAj7OkY9N74gJVnJZ6fcFiBMvS
         uBTp8DTaHtm/gjTxCkFY9v7aj40+8PYnXEUz7wJycwS1jHM3IECB271q6LIEo+c/EeCx
         Ii4U0GGpl0YtsoZfFCYNsehB6kR/+t/c7uxq6Yk+lUnB2oHejikVgOWGoFHnB9V0Xjaj
         qpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797178; x=1792401978;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1DLHRcFWGRMXj45+dEiiprV4k2SPY5qTAHRqmLZ7S0=;
        b=sRWcwwXy2z80KW1bHqsKx3F9yQz0rU+OAHP+Gtu4L5kMcJB3Ph+nSptUg2LU0oftWV
         3ghIIXJMRHMs/dB041ZtpCoKu1TRmcvvPV2YDtfvMafr/aYQsOYuqGhKnnrUHgfbUJqK
         k6WOGuhV4X6G4C0PvEOwoccPW/FNsaxClBF3NWlZSjUlzqPoY29c6vaVZHADBilqWpwr
         3x7IkJjKAb8PGS3mJvP9KhLsRO8VjJdVPAlxWZnpz0Pyw4G7fUQe/zbkzlvavjkx6UZ4
         GwHU+7c0NFm8m2u1AM7vf5RTJaV+ckiM1iQxXCdyvAIi2vTDqNvTnWHDNrtqF/Z8ntqO
         RzWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzo55rjztaZLDkedQPAiojzhqDNdgyaudG0SQekfGzOcZVxA0GwDTURzjTeo4w/oNf8ZMy4mdlYhc+b@vger.kernel.org
X-Gm-Message-State: AFq9FYJRul5aG943rHZPGmHqpCy1+Qroxzqb2GHaBbFS0RgXy1wlap62
	t8iUZhr8REdwmoza6FbUC8mFjuEDa72CLJfhzryx29Kbf7PdqY17oW13RFCcPqoRa+8Fd4A0x3o
	+lg6cwBBgUVO3qjhh8Xzytvd1Uja3jUs=
X-Gm-Gg: AYBFou3m+AvhEZeR2DgoOEozIWQBny47CycjCKZXIk3H8QAQOZhNK3Y4Icn7UkTIxvi
	n5WvXSmdR2kbYK3h2hKvyLw+e9MLg+dLac+CiSgQm91klWTaZlVMXO6WJeg1PQ8NMYJxbXGVqDc
	gJd9pOWHWV2yu3N6FeGK6v43ryibHAZ8VxNNJWAdIyKp2Vsu5EordBHHFCYFVcz5NNNJmqAl5xj
	9F5FOm5lVuE17WaeiUQ88QieDvyckkTkxazHl8S3C5DM62EAGz3Q273PCsLihCGK4j6KoK0v5Bn
	acSy10nB+oGy1sGdoNkUfDsgFEtESYbhfjgAlsjf+4QNd3vXCg4isrrcr46KVgn2bImF4tykIx6
	NNTH2AaE5E7zjK66idcVSvEkF9dgc5Pggyiwz/k98k/LFolpgwTbK4d8LeuUpTNvOjHUd8GW7Cn
	aI4YFX0PQq44V6Uye/xPQLj1YRNxtl7aLbgyCLjNmZ
X-Received: by 2002:a2e:b888:0:b0:3a9:9b74:b035 with SMTP id
 38308e7fff4ca-3a9c5352a7dmr19646981fa.10.1791797178338; Mon, 12 Oct 2026
 02:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-6-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-6-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:25:41 +0300
X-Gm-Features: AclHuK9GwblMnTPQvaiV3jDrr3vRaqwQVyHQB-cZx-ew8f4fHdAz2Ca3vyaKuZQ
Message-ID: <CAHp75VcadkqzMxShq1PLzqgNZypB+vqr3a_m1utu-NOx39iK1g@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] gpio: mxc: replace of_device_is_compatible()
 with hwdata flags
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
> Replace the runtime of_device_is_compatible() check for "fsl,imx7d-gpio"
> with a flags field in mxc_gpio_hwdata to move the power-off capability
> from a per-instance bool populated at probe time to static per-compatible
> data.
>
> Introduce MXC_GPIO_HAS_POWER_OFF and a dedicated imx7d_gpio_hwdata
> instance that carries it, along with a mxc_gpio_has_power_off() helper
> that replaces every former port->power_off test.
>
> While at it, factor the register offsets shared by imx35 and imx7d into
> a MXC_GPIO_HW_DATA_COMMON macro to avoid duplicating twelve identical
> initializers.

...

>  struct mxc_gpio_hwdata {
>         unsigned dr_reg;

>         unsigned high_level;
>         unsigned rise_edge;
>         unsigned fall_edge;
> +       unsigned int flags;

Obviously you need another precursor patch to move from 'unsigned' to
'unsigned int' in the whole driver.

>  };

...

> +#define MXC_GPIO_HW_DATA_COMMON        \
> +       .dr_reg         =3D 0x00, \
> +       .gdir_reg       =3D 0x04, \
> +       .psr_reg        =3D 0x08, \
> +       .icr1_reg       =3D 0x0c, \
> +       .icr2_reg       =3D 0x10, \
> +       .imr_reg        =3D 0x14, \
> +       .isr_reg        =3D 0x18, \
> +       .edge_sel_reg   =3D 0x1c, \
> +       .low_level      =3D 0x00, \
> +       .high_level     =3D 0x01, \
> +       .rise_edge      =3D 0x02, \
> +       .fall_edge      =3D 0x03

Why?! Just to save a few lines? This makes it harder to follow the data par=
t.

--=20
With Best Regards,
Andy Shevchenko
