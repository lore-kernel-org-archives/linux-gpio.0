Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C964853A894
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 23:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933065; cv=none; b=JZKmftPjLYJOY4iI4ImfcNmB0JeonXgxyoLtm4FOCmHNOF25KE2pn2UtmCp0ZE7n+zxKr1v4uKyxq+V9/VBfke/33H0fabCLKy0ZjK+1vwxwuMXK6C9bLXbckQHL7jf4ffjNMbwocQukynni96u6QyN/neS9H6NYj2vR0G+9Lgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933065; c=relaxed/simple;
	bh=L9F6PA2N+WOVHYi9v7Bq2XrIKM0xEoyFhvJzFmeoaAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4xSIEacYqPnvSaoGsS5BYv8Ao1oBwfkoLPmWBeMDvIo9hB8mfp84uCRiob+JLKPBZb9u1UWXs1DDvBSJwNjr6fIDmexxMtAKg9BYiCQ2q8pPI/KVGCaXYsHnlK3VKe6HCp3KYvcJ9gPdRrznBfaF8+ckvTEXOzkVPLtIOm9XiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXnoMKNU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXnoMKNU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0591F008A2
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 23:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791933064;
	bh=tQzVrs0c3UvtqevA7XvTO2dEu5Cjq2oDofNx0flPKCg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cXnoMKNUewpGzi0kloDWjmhf/SKeTwdAKWxZK63VS3RqXI1gGkv9WbEss/R+6NtR5
	 afV8Xzak+mL1HcsPdSp3rfi/MDJSfxhvtOd/OApINRNvaemiYhrj5zxjh5Ab6isQ/d
	 43/RrcdFOTfW6rRhkyGbA446qMibkxdBosJUebvyj8ypY2Q0RKkjG3FyHVVgSLuaTW
	 Fjj1ki7atePwDeCeOF2BGAXzuC/UnB4J9eX2hNkmE5GJ5NS3izVSe2aBgyhhR+j1X9
	 p8+N41kn5vQntFvsR6l2BNYwhq3xn8q18tRqjDxPDzwiQqiyhsxksyPHlyoDn4xyU/
	 +jslPJBjMyGQw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcb2eceb3eso3077795e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 16:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQ5jwU1VpuB/gMPBYCJYRBeT2otDBY5rWantH1MAVb1t+lutuyVkw+dj2mUDfF2JvgMbUlTgS1H6cE@vger.kernel.org
X-Gm-Message-State: AFq9FYKfeUT0CSF+M9ONnNV2UknuwO7o9VMgqOSV8QbxNG2e1Y+8Dq9e
	1PmDpzRAGP9py5DegpXwZzUbQFFOkX70F2yye0KsjLF77PEa8UndwoeMHvsC2WJt/i9RMD73JCP
	Cpt0wkgazD6p/RNGBucucT+zFrtHFIl0=
X-Received: by 2002:a05:6512:1586:b0:5ba:3c5e:2b20 with SMTP id
 2adb3069b0e04-5bcde6c08a8mr4390697e87.29.1791933063163; Tue, 13 Oct 2026
 16:11:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:10:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLnDxTAz2=ge5RgvO02mp+BJyLBV0zR8xqsm8LSsSEcRYQ@mail.gmail.com>
X-Gm-Features: AclHuK849G_ijc3QWZ7kME4RYf6sglZkaE0fzQjq6-hvA40gFn4QJl3T4CzdDQE
Message-ID: <CAD++jLnDxTAz2=ge5RgvO02mp+BJyLBV0zR8xqsm8LSsSEcRYQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Sun, Oct 11, 2026 at 1:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

>  static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
>                 unsigned int offset, unsigned long conf)
>  {
> -       struct device_node *np =3D port->dev->of_node;
> +       int ret;
> +
> +       if (!mxc_gpio_has_pad_wakeup(port))
> +               return false;

Why is the entire call to mxc_gpio_generic_config()
bailing out here if the port does not have pad wakeup?

> -       if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> -           of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> -           of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> -               return (gpiochip_generic_config(&port->gen_gc.gc,
> -                                               offset, conf) =3D=3D 0);
> +       ret =3D gpiochip_generic_config(&port->gen_gc.gc, offset, conf);
> +       if (ret)
> +               return false;

Then no generic config can happen.

This looks weird, isn't it just some of the configs that
don't work?

Yours,
Linus Walleij
