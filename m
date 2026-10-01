Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7528949BD6D
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 20:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887936; cv=none; b=cqH+DC50+drdj7y2gUVEiyVtXW/xvujAsJ086EL1CjV6awDLxGr9/wkZ66x82LIi0uz6eppTd14PhHzFYWyJ8kkUVQVdVLZd6s0leU4H1H9pDjCiWj9YY78iN/S0F8ASK1/6WU7gYAbSHuPexycFQBMjWbfU7t9nqraVtM9fnc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887936; c=relaxed/simple;
	bh=Pgvycu9NIFRzaxwimfgVVVuiiso0JZizJ0BD4uYoiLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8H6k1ZFknnLhU0MlTsX4qjGB7Q93EKvgSKqrjvSr0FLutQt/na8JEr5GBbQ6nxJSL375xhSpNtLQXg4yJg8r5O+4AsCO2ojGQCxV049G1baK+eUxaQGHTzfdTigotRMc2XkHeyBK+E+9hs3/39XdYGYOMKLTFaUwdqPZqhLyCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xf6brGex; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xf6brGex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0B01F00898
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 20:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790887935;
	bh=q9ttC13+Szmw2q5jUZhmuOOwnwu09uPEZ6e3y79ttiA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Xf6brGexee1jd+IvaGPNkVrQy2PKgADseSQpBcrVIUySxZEOoK+mUTJJ8dFVoK/FD
	 xDfepoA02FoD1kqrELvMAkNMx2YzlS8445JeyM5t2P7RzT1qe6FWWFp9OGfYYHazmS
	 QE/zmoCILsspP0+qkz7sG/9pLu79ypqesVEaqXp83dGUyPpWDEJTNVq35Qp8X0WuK8
	 7vlgM+W4cZB4rCFXOaI+di92p/5bAOohYDBo1jWKBks9KO2PjqaZGYzEhhZslPSHBB
	 m7cvQffYCsoAYVyXD3XD7ehB6OhlOn8u8Dy+u0OG5SWJiGnugM1gDa+bXp92AJw0Pd
	 tJ2BvXaszahTA==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a652b710a5so69991541fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 13:52:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxZQmtdt7g/N4Ae6ddwbGFCqV2qOuQv8pPaYJRVpNkhmO6odmAcp+yauHDmFYnQhDZAE6WeXpsOlJB5@vger.kernel.org
X-Gm-Message-State: AFq9FYKpv08tZtrdrVFw/OrsBVe+FT9ywIzQHLudwY8IrYLu0D/jsnvs
	2AE4Pgcz5+syndg49JzswV/5G1IbewqsX6tYc83UkRhTZdMNrXiuR7HNAPuejMyNvRL3mdSgqw+
	SQqI8uFKeQBdnX9hidm12paBeKv0rItg=
X-Received: by 2002:a05:651c:2115:b0:3a6:6011:fc98 with SMTP id
 38308e7fff4ca-3a8877f67f7mr1329021fa.26.1790887933882; Thu, 01 Oct 2026
 13:52:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com> <20260930092020.1047221-3-y-abhilashchandra@ti.com>
In-Reply-To: <20260930092020.1047221-3-y-abhilashchandra@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 22:52:02 +0200
X-Gmail-Original-Message-ID: <CAD++jLm462gGw38acBk1VzwKZq0WE6xfFUKoMsoiVxy4iqfEtg@mail.gmail.com>
X-Gm-Features: AclHuK9E9lhAW9EXXB412B7L3puPb3e0XQeQk3VcMKZ_aaAndt5SX5qECoYPyw8
Message-ID: <CAD++jLm462gGw38acBk1VzwKZq0WE6xfFUKoMsoiVxy4iqfEtg@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: ti: Add TDA54 pin controller driver
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, 
	vigneshr@ti.com, kristo@kernel.org, brgl@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, afd@ti.com, 
	u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yemike,

thanks for your patch!

On Wed, Sep 30, 2026 at 11:21=E2=80=AFAM Yemike Abhilash Chandra
<y-abhilashchandra@ti.com> wrote:

> The TDA54 pin controller splits the pad configuration across two register=
s:
> PADCFGA holds the mux mode and the functional pin configuration, PADCFGB
> holds the wakeup and retention configuration. The controller also support=
s
> two proxy addressing regions and claiming of registers. A register claime=
d
> through proxy 1 becomes read-only at proxy 0 and can only be written
> through proxy 1.
>
> Add support for the pin controller in the TI TDA54 SoC.
>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Overall this looks pretty nice.

Check the Sashiko reviews, there is always something
interesting there.

> +config PINCTRL_TDA54
> +       tristate "TI TDA54 pinctrl driver"
> +       depends on OF && (ARCH_K3 || COMPILE_TEST)
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF

Just

select GENERIC_PINCTRL

and you get all three.

> +static int tda54_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                               struct device_node *np,
> +                               struct pinctrl_map **maps,
> +                               unsigned int *num_maps)

What is so unique here that you need your own node to map function?

Can't you use pinctrl_generic_pinmux_dt_node_to_map()?

Please consult the code in drivers/pinctrl/pinctrl-generic.c.

Yours,
Linus Walleij
