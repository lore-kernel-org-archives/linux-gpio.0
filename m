Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122EC40A936
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 07:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234703; cv=none; b=LWrJr0K+lPE3eQK0V5IMF03oHYeks2JsEv+JSe3acJUmsinXhFNH1XoNY5K+4QbYybzmN+ayscMltYH8I+3i7B6CtS4J3MLfUIVqaTfNzVENV6e2b0xFzn0Koj8eLXRWhZmffT3YxUb1Jzo5rasal94CD/N1QWgv4XYoODPOPTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234703; c=relaxed/simple;
	bh=01/R82TeHhROgNQF3uy3h/i3EyxG+iwb6k0Ax46Jn+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4/vC5XbGL/tnkR4ccmtLiwTQf4nx6qVL0OlLrL/dPWpYFqzb/FJM6zRIX04vC6wJ+Z/OTAeEUE4qGootnx0gI17fCEiYef3IiaxbLiBMo0zxULf5yQXCqAjMtDZu10FfHpM5AVzxKUQQedq4qW1Bdo59Cc5MBCN/gARjtdi1FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRYwzdPx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRYwzdPx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AA51F0089B
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 07:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790234701;
	bh=yQMowPqgZdYNrkxP5ST5mspk24n+HmmxbCYkp3Xwb+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DRYwzdPxcjVuRm0sA8dWvayidva3Tx1Lk8Cn0hL8kg19nijQYTNvLg9cnHtMt/mSX
	 Tg2XuuxGHvh3gvvKg/M1nyunPuYdFSfkj5Q4IiquD67wXsa8o76ul/QcH4+51CQxZF
	 d1PRPA2H5/2JqCy86RY0DkHbSoyZq9HhjSKf5ryF3/6b+12htCNDMUFjqTafM7n1k5
	 N5myq2v8nLHwHMSmxRWkejUZj3VqfGt/boP/A5kRCPXnpZuLl6Em3bS+/lcEsD4mnJ
	 g7pDzqLETXCn1cC6OrAY/GvvkO1EjPJPd2FL1ZvIsReeSFIdvSu7d/JMVV5EsaKpFL
	 e8AtL53VayGiQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso2296332e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 00:25:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByEQS4k22ri9t7Hcz26RXkfxbzOm0hxS5J/9ihQD/BDI8VilKPouJX3LI0zX/EMLi+miZ7jBnevmafH@vger.kernel.org
X-Gm-Message-State: AFuF++m0xDYUdKeUv/gl4AwHjW8G+JPU4tapzq/C3g3YSc2MNMaTP+eO
	QVPbnTrkJIc9/JptUSsvZzK+AUVYPgr+dv/XIut7ZFP/gPBREqZkpdw+SoiiI50Paq4SJTvHNqI
	iB8QBRyNyv+CoeX5zjVIk71e2n836L7k=
X-Received: by 2002:a05:6512:3088:b0:5b8:d9b9:957e with SMTP id
 2adb3069b0e04-5b8e0a06c9dmr374427e87.43.1790234700381; Thu, 24 Sep 2026
 00:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921232551.3129244-1-robh@kernel.org> <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>
In-Reply-To: <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 09:24:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLmvZAen+p_Z-aVSqUnXMChAa7qbNvgv=mEQr9tFMiJFwQ@mail.gmail.com>
X-Gm-Features: AclHuK8D-TL2v0xIAyyD3bDWuJmwCU-eoWhxt_gfs4heZf_y_vgN3oOcLkjTEXw
Message-ID: <CAD++jLmvZAen+p_Z-aVSqUnXMChAa7qbNvgv=mEQr9tFMiJFwQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas: Allow power-source
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:19=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> > +        power-source:
> > +          description: I/O voltage in millivolts.
> > +          enum: [ 1800, 3300 ]
(...)
> drivers/pinctrl/renesas/pinctrl-rzv2m.c does not implement support
> for PIN_CONFIG_POWER_SOURCE yet.  So I'd rather not advertise the
> power-source property in the DT bindings until the driver is fixed.

The DT bindings are used by U-Boot and BSD too, what if
their drivers use it?

It's a bit confusing but we're essentially maintaining the bindings
for those other projects as well, and it's why, for a good reason,
DT maintainers originally wanted to split out the bindings to a
separate repo. (This didn't happen because nobody wants the
job of driving and maintaining that, binding maintainers have
enough trouble as it is.)

I'd say just apply the patch.

Yours,
Linus Walleij
