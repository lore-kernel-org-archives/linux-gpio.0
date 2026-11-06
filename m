Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971727;
	b=hezJXoR8cr4GI5GpwbWVj825WCo7XsfDHgkFiETTHb08p3NQUJ9G9o/DG2n9oHNSKEpW
	 tRZxgsD2DK1dTxO7y58DTJv02EPto8POYp/5D9q24JXTb9JWpVDbkn9fKyIehus0rX2yI
	 MvugB9R594PaTlRItwuw1bG/UmurpXpMVqqdJ3NmOiquHIMsQnkVi0OykH4naIAA4BPJy
	 PeT/Oe3IM2/8uddbo4G66SRXSRzjclWKx0csxozzcRiuj4XOMjXCa4PZVf8Dwzheucpj3
	 dyExFAuesenHmKPUh8z9Fbxv548YdBt4gIdi4kzLnwyN75nq9ba9XppdiuqIvNcCMDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971727;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/oknbUn4S13Tsp1GjEbyztprp/5ERIantWGXpvB95Ak=;
	b=oxQafbfm7wV9pswMa+z4drrygl8JRfNmULQMPlbfhbCEn5VPUCm/AGc5lPfyWYJjeUz/
	 X9BjRPyu49HumqXwq+Di2tNPandz8frBqca9JkmZ2XBGGddOjBlngOG1VcAOLqhaG3/RE
	 R/kM5/TCAOVxWvSkTbN6TFfB5hjGg/MyzkQVPtF6GoUGcqQ7nfRf8kTIQ2kTXrT/RPZAD
	 z/8GuFHhamztMmgGEAi/CiJkS5RtRRO2X4zOS1rufNspVE8qsXrWvqWj0ZqIfWtAW9m2Q
	 kavLBSxoIvgy7bDMUvDfJSsx9vG5xWq7R5xqslbuJhcD0BkWwNdy8AG7AEyV25/C2/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xsk6b2WL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62207606A326
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xsk6b2WL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2CA1F008AB
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971727;
	bh=/oknbUn4S13Tsp1GjEbyztprp/5ERIantWGXpvB95Ak=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Xsk6b2WLdMAU4byOQXFsAVBOCMsOww4BdhGplRm2sYAjr/aOUAyDyNz0ENwDFmdpJ
	 uQ35GT/ceuesF256fWfT72bhDVA2Xo7RVVLWBeCGB9XrI7E0dZBe42LJ21tWZTpryG
	 +yx6o4Gf92UH5BXPyE/Q+uiJ5l0/vpchGTV1qJUY1V+Eh7xVfdbhFwGx0cJuk76Yqv
	 +SVB1GQGmj7DTaEGlhBgrBsTLi8hze80HFgUX8yjUbPC9MrSV1irN20Ydlvam1meBF
	 CyxDANeYjqi47U3dX1cqrJHuMHLjCq+2OoOnnt8mTsXSdeY/gN4F2+h5CxsscorroI
	 j/ppankneYVhg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be47aa555cso525815e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 05:28:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByVxdU5WblLs+FKUWFsl3b7KPJn5OYgfqc0aHQ8EYHDHsBP9WgdO1HsUn6KpPF7d8FGI/N9qk0JvTzq@vger.kernel.org
X-Gm-Message-State: APuU4Z+MN9JQUSm4ImUNEF1tS33iMKLmDakL8zW1/QL2jAvi2Lm2Jnsy
	53nDJHpbtFoHqqV/CQ4wNE9W8m7Bn2SmbifG+h6Mw8HxOBb2Tm859ToeIS7h3QjBq3JtQyUbhVl
	ojljgNSeZG1yNOnBFhiLO7XdJHuJuvbs=
X-Received: by 2002:a05:6512:3a90:b0:5bf:9fc1:3938 with SMTP id
 2adb3069b0e04-5c003b0477dmr712282e87.38.1793971726003; Fri, 06 Nov 2026
 05:28:46 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com> <20261105-gpio-vf610-fixes-v3-2-504e19de5ad5@nxp.com>
In-Reply-To: <20261105-gpio-vf610-fixes-v3-2-504e19de5ad5@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:28:34 +0100
X-Gmail-Original-Message-ID: <CAD++jLkyU54qmoaLSOBdXay1oecZDiPQJds94wCiZbyXyXrowg@mail.gmail.com>
X-Gm-Features: AclHuK9EgoyL3Lf6bUzcYEkXfVXFNufjNdYyDc_zbikouVfosUjqSHJJBS9wocU
Message-ID: <CAD++jLkyU54qmoaLSOBdXay1oecZDiPQJds94wCiZbyXyXrowg@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] gpio: vf610: simplify with irq_set_irq_wake()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:56=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual enable/disable irq wake logic with a single call to
> irq_set_irq_wake() to simplify code.
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
