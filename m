Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61014A3D43
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 14:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052199; cv=none; b=ahURv3u0S0Qe7sAKyjEMI/rfOYVXwpyQrCd+ukq8eU5Uv36aMKBivVowf71Ok7LtiGpP3Hly7eAZjnMDGg7dU0yhBmvidpsFIhbOmVZ+0Z1CWgHvXXw1k9eQSRlxvWh/DHRD0rJIXLMniwPO+hcX7qBDgkAoyJpFvj1UcAPWrk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052199; c=relaxed/simple;
	bh=Ur1FK2Vb36Dlj83ptZ0RSokZjoGbnlY4jEOBvOGY4so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixuhuM+h3MTLD0fbXT62lkpKgjRd4gPvp3618MFaA9xkZaGsNsjRlIQzUg8aUwEt/l+j+4H5AqPV8T/NlIP3FvcmOhweVPl7kwYNwLaTo+3eTpEgugJVKYlcDsw1ZSBdZR54hzrpoxU0vV6zNcxMvjtrI+bQzsCjmUOcrfaCaVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gud4YOhf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gud4YOhf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810AB1F0089F
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 14:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789052197;
	bh=VQGnh1v+xWgpqyvd+v1a8KFIwYoiDSLdjcPF+i7yTr8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=gud4YOhfwHB7qVYJ7wi7xRKAlCKWfl2s7BPemRw4LjXuk9medos1rib5UhBnJUaj9
	 349/l3qbUpl2QGdAzLQnXdJwhTUCrmEiXWRM2Jy3386dP+eeZxw1Zhr4WidR3Wmdrt
	 kMDoCNv7fw99UgB6ShRxJ06ORGDw+nshRCnHRm4Ham4hxyHcQBHA/65Z8vOGQxb/Dc
	 ASud4JoQxLAb6cs/ahPZUoH7G06KlwruWFskHDZoVmiG+DlLAlKEBQ2Q9B/FNkI+C1
	 DzA3zS0rj8UziRUmRefzoyEbQ+VpcLoUlQ2MMiwOMLDCdt6y3gEGBXXzkYmoAnvAWp
	 KWBGjTeAQhmGQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so8497871fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 07:56:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3jLupro/JuJsfM712xAvnn0LUcR2csn/N9r520iHtD4QJlRSlYuBwWvDBb84unev3z/Y3h+v5JEdo@vger.kernel.org
X-Gm-Message-State: AFuF++k2k4mRMmLvQmNjYRxvanfaIZcfUKrhZthuIG+64z5zmO8j02so
	opLgrkohADFKyu9BvgtI/xRRVfQh7VpKZ5n1PwOWSDRa4lxkAX0HcPcjX7qyB7jTLNsrQ8feTMb
	BZHqa7koyuc7td+ww8/T4B3DIp1xkuNY=
X-Received: by 2002:a05:651c:a181:b0:3a3:61ec:43c8 with SMTP id
 38308e7fff4ca-3a5913b346emr6027311fa.25.1789052195781; Thu, 10 Sep 2026
 07:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910133519.459011-1-andre.przywara@arm.com> <20260910133519.459011-3-andre.przywara@arm.com>
In-Reply-To: <20260910133519.459011-3-andre.przywara@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 10 Sep 2026 22:56:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v64K0+Yo2spDgSLexeeq--kLRvt-94f+WSU05xWTCPCrWw@mail.gmail.com>
X-Gm-Features: AcwNN1VUd6sDMk9t5-6JvMgkw7l_YsvlayUQ2EjayllqYZtgNrEVzXFuv7UPwfE
Message-ID: <CAGb2v64K0+Yo2spDgSLexeeq--kLRvt-94f+WSU05xWTCPCrWw@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: sunxi: only use PortK special handling on A523
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Yixun Lan <dlan@gentoo.org>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 9:35=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A523 pinctrl IP requires an exception for addressing PortK,
> since the registers for this GPIO bank did not fit anymore in the
> existing MMIO frame. Since the A523 was also the first SoC to actually
> implement PortK, we just enabled this quirk unconditionally.
> Now the new Allwinner A733 changed the MMIO frame layout, so PortK can
> and must be handled without any special code.
>
> Mark the special casing for PortK with the ELEVEN_BANKS quirk flag we
> introduced, so that it will only be used on SoCs using the A523 pinctrl
> IP.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index bc6948e3fb495..2524e0b3a2a5a 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -67,7 +67,7 @@ static u32 sunxi_bank_offset(const struct sunxi_pinctrl=
 *pctl, u32 pin)
>  {
>         u32 offset =3D 0;
>
> -       if (pin >=3D PK_BASE) {
> +       if (pin >=3D PK_BASE && (pctl->flags & SUNXI_PINCTRL_ELEVEN_BANKS=
)) {
>                 pin -=3D PK_BASE;
>                 offset =3D PIO_BANK_K_OFFSET;
>         }
> --
> 2.47.3
>
