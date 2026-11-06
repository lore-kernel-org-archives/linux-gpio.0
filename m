Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971778;
	b=ilTFQnfwlpMPYyN/VYodPH+zNYpuJEqiDVRGnJK+A1gp+/yH7exMAD3IEt1HTlOWtA03
	 GJug0Pe16wE2ndSRUYeI3XufUoVzca+4PEPXKjbhPo8PzwhuGJa0pSdr6miS8SQE1WTDS
	 A8tC8AiXwQlvMoggTdOqF82HEPHfswM+JYF7xPk/Rr9XTm5zXSEIFTEuz++tqVegpDPuq
	 sd4A2MEO6Id8jnthZO9zVdwq28NbofuUxiz+FKPXOWmTiyPasKS10E314lhyz2Qqa22eN
	 xFPMN1ksKAHzcvJKGOpC0CIBlPqxpUNRhwAELwVc6aAr7QLkgNG04kuGZ/kLvjiaFoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971778;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9VVN1Qt5s3G19mMDbxU/lzocOYANDZG3AchnpUi2eHw=;
	b=SwuAjVVY0AjjCMMUvlJIob7xMLru9UUX/RnyXe/4UtsnSHgatIUfPy3Qi/oIWcboWyto
	 oydjFtU75V5OfrQAz1YbwKthaWk47pzPCgJ8TU6/HL8aYzxUn2w3ccOTrNCG9AdHge2l3
	 sS0hl+mqKqlQ/t9P2z93GpUG9H+FQMZmhYpGvyzHKxHsGd8YZsKkUypq28i1h0a0+rM3m
	 YK4haTdwaLh4G3D1WPjEefh2TT0p/tJ4etS9Ef/DVgkxJ82QlyBjjKV6fyjC/Px3VX94D
	 07bEAAkOVo6YiCQjuQzLHbRyFRA4onLjrjfME+y+31tKbKDfEPTZ5QV+5oiLXrKPXlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dpKVtSB0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B753606A32F
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dpKVtSB0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8141F008A7
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971777;
	bh=9VVN1Qt5s3G19mMDbxU/lzocOYANDZG3AchnpUi2eHw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dpKVtSB0TJS9RXsqGV21BPeypigLT1MKlsDUFBdmKdYOxS3nCIOaxx/bNlEZNmBj4
	 PFtHjkAXLFV2SgoG+LbAYg+BNQFlRjzDjH8XcSbfqnCYzEAN0JoH5p87NRZnspeBHq
	 wSX1OgYJQAvyAcs5R+1RBrI6tczk3nVPKkQyoYXXJqBp7eQCtR/Z8rzEtQ9DiOHiN6
	 t+lQ4XutQcMwA6hei8voK7esgQKt4sxaGuBLbyWz2FgeB+KnvjBU6JYO3B5+mNvZ7i
	 1B4AzRD1jAs5DVh2ilB2K3zO04G1QthchK7KhnLjLGDApGBnPzfemx1GTeM3XRoBWv
	 cul3uD7D31vVQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso490072e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 05:29:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzKF7usxQlai40MURBUkpxEzfSrQIMMXEDoybfOIr4OO+gUjOqek/RSoj/atczW9ug1gNlg6DnFg19m@vger.kernel.org
X-Gm-Message-State: APuU4Z9G5u1sJnHu4biOwaPwd3P50xaQ0sqAkMqsqrRLtOPU8Dv3Ccv8
	wrehQz9OyBBOvPm1NEgwmPasXFpflrLKpiuqaU+D4myhTfozWhQNZ24HXUb+xb/b9Mj5peFRk1K
	I3StrVcYfWH/7F798P1+L+CEWWdzqqkk=
X-Received: by 2002:a05:6512:33d1:b0:5bf:a12b:9ba8 with SMTP id
 2adb3069b0e04-5c003aef4d1mr778706e87.65.1793971776504; Fri, 06 Nov 2026
 05:29:36 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com> <20261105-gpio-vf610-fixes-v3-3-504e19de5ad5@nxp.com>
In-Reply-To: <20261105-gpio-vf610-fixes-v3-3-504e19de5ad5@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:29:24 +0100
X-Gmail-Original-Message-ID: <CAD++jL=qUShzXutAz568YepQgYvn0Sv4hU43kfxWm+ZL3D3-fg@mail.gmail.com>
X-Gm-Features: AclHuK8gGR8RrYWVb4JB0yl9dd6W-8aSN-PytpvJXvTm5IBU_II2QIjGbup39dA
Message-ID: <CAD++jL=qUShzXutAz568YepQgYvn0Sv4hU43kfxWm+ZL3D3-fg@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] gpio: vf610: use devm_clk_get_optional_enabled()
 for clock handling
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:56=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual clock acquisition, enable and cleanup sequences with
> devm_clk_get_optional_enabled() for both the port and gpio clocks. The
> helper treats a missing clock as NULL and automatically disables and
> unprepares the clocks on driver unbind, so the vf610_gpio_disable_clk()
> helper is no longer needed.
>
> Unlike the previous code, propagate all errors from the helper,
> including clk_prepare_enable() failures. The old code only tolerated
> lookup errors and failed probe when enabling the clock failed; continuing
> with a disabled clock could fault when accessing the PORT/GPIO registers.
> The optional helper already covers the "clock not described" case, so
> there is no need to silently ignore other errors.
>
> The clock pointers are only needed during probe now that devm manages
> their lifetime, so drop them from struct vf610_gpio_port and use a local
> variable instead.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
