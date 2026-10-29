Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269386;
	b=OOIF1odSc/wlj3RnL3PfeMogcFcj9m3Vzo0ukb0pZkfzYaBkOoXNGfuOairo4mrsOwrp
	 buhKZFoF5dcgbMeGkBt/De//cuhWzATGM8T8A0KETLScGjiHodXpe4ya+Q700RoSK1jtF
	 aJ/v91z3cXEGzKWBjaEe39WpjIH6GULJyeqwu2UziBU6xS93dWQb8mVIWdR3OKWRPQ60y
	 Df7FyZMXGaZrIvqsLjtGbnqox7nfO5bN2RdA4KmRiHtm3GbSLql30R3VxVBmRp/LOBtbz
	 u602LwM+wta1baZxKREgxL7pCA+3B/NewFcbj1ReelFlca4kILDABW0WKfN2njXtydg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269386;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pm4shQIXu/YBtkkHvvK7yJLwXmgaG24l6vzhneZ0tVs=;
	b=juv/iURd8RKtswozVAgK5f5lzxUqWyhSFVsdWKqrHwasfT7FsZWnZlECN3wO7BRmgkeW
	 Ylkqo/Xae1btzFM7GpFS9zf01y9dqK++YhOwKmq/sCZz7sEydMkyRsPWclaBMWUN6DMFa
	 wWtrH7UR8X1EDVY8hN4l3KO+JGRtCQtVmdmGFGz0sk7XC+sinVMSonun5MOr6ys5Wo4R1
	 Fq74LruH3EUWGObkibp1goqzSVmmwewg5V7s8bXxa2y6D9HzHMc7fJ0YhLQDssxKx5b82
	 sCye1qFtM5TeKREzNTtQ7FdjiBHco1JPPqTdDaWTOnG+I3pYemYkJGhVtb8U8Wfv3DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IEnKcu8U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBA9606A31A
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IEnKcu8U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BF91F031E0
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793269384;
	bh=Pm4shQIXu/YBtkkHvvK7yJLwXmgaG24l6vzhneZ0tVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IEnKcu8UtP76yNacDP5k4gfV7AdJ4dG9zb2qYDS6ok7II+UGUNCRd8PV2c7yHLdsJ
	 0uF4O2iSxZBdcmD7rbwJuXpZB8xmDqK84ZcZxsfYZdB9izO0JeQGr59FaBalxzBr8s
	 GFLUeCDE0yzhJVox7/gtYTyW7zapd9sTJXy2NNTyAkSXP+lQ3WFs67vPn5aoV4VqYt
	 uNtbTV9p4Z3J2sTf8/dsDVW86nRsrjbdBybazolXdH5Oaq4jOCXihYHsLJAqiFnA58
	 z0fjEDbokRqSu6+CRON7oA5vk+Pd0b2Gh7hBncs9m+h9caCq7v6yeALhG2byAZzhS3
	 UmOGju9HwMzrg==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6df7f544919so1218882eaf.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 03:23:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZxAOfL35C3JjwGlgItPqpUsvpoRylb3lnYqvfkXZn+HUexq6ZgyXzXE90h/O8K9pxjVvtYDyfCpe6@vger.kernel.org
X-Gm-Message-State: AFq9FYLruzZS7bpEFUsiNJMGRhyKzmY8RzDoRx48amBZwfeKI62Nocnv
	ezTI3k5uooYCst9xZBlsAJF9wxrkjsrQkgD6hAp9FT7fZJe5k4f2BROxVr+kwMlfS6cnJZswtNX
	9bvhrLZklTzFKN7mcx7V3MaJl/XQPw/0=
X-Received: by 2002:a05:6820:1501:b0:6dd:3534:478f with SMTP id
 006d021491bc7-713f1f4f57dmr2819317eaf.73.1793269384310; Thu, 29 Oct 2026
 03:23:04 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com> <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 29 Oct 2026 11:22:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLngEKZOQm6QK7BzMdCRqNj9-9Ui8JxP+yvCtOOvGFPWxA@mail.gmail.com>
X-Gm-Features: AclHuK_F2FYCXxfvG5vSK3S2hpbujv-j-QBd2VPacOk9bLxQe1BEL834ojBgIss
Message-ID: <CAD++jLngEKZOQm6QK7BzMdCRqNj9-9Ui8JxP+yvCtOOvGFPWxA@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] gpio: mxc: use 'unsigned int' instead of bare 'unsigned'
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 1:13=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> The kernel coding style prefers 'unsigned int' over bare 'unsigned'.
> Fix all instances in struct mxc_gpio_hwdata and mxc_gpio_to_irq().
>
> No functional change.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
