Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654972;
	b=f7qAepylOhUM83jeEyKnNfjXSnGpbobBV+c7mc2qA80pyf7DUNFwekZzRlkp8hnG/YML
	 zYv3K2M5R75VgCaN7hlO9ufVm3H5USWWddwMrjpx4UXPg7ZZ1zXiI+mBtZx/LxqPhtxEA
	 lmdWIoPyu3hRfRe9AWd3DzzCiNj43xNrGzqCly8SbAHpQarLhtInmaVtezOybsp/vhCf0
	 am4fRiqOUHaOy1RmaCBC0HhIPsDRIYhpW1iPKnV9vA7PN9Txf/f4k7cv14UDX6iG8eefM
	 p3KoW0QrQ2CmQJP4+pZzSbbYc4Hzt8Rt4M9GIVgyYJIFUnXTP/m7wb0egoMT7P0VUlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654972;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=szOvPNyxohILp8ypzy0QBe0wsGgv+77VvcXMFL1pBiI=;
	b=nctrFrGfaJW/mZj8+IjBceHSDsdGPFFhQcMwxV4p0s5wWz2dAVvVrTDShD9DQOXdqiIo
	 Brx9DkAE+ohZbsWqi0IRhyglME9MLioQxo4qky6byGFh37aPpQhPFtrDR1vkvBs43mL4M
	 6u3yaEfMb9GuhtFcpelnGbK4MvdiTcdmMYsRatWuPE9kK1OiFrwrTOlbKhEQGbfagbEF0
	 jYHKWU0Qc2wLy8CUcd9VSjOgWz0mM19AowDAh6NaHBYAgD4zeb/qcv/mBcEmjT5Dy5umA
	 ICU3iFtBYErkzkaRLlNgkJhVDVHyepTFW8Q9GEC5d6Y8l5CA7Bz70NEIvKdtXQLnGAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GxivgSKK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9C7606A323
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 01:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GxivgSKK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1161F000D2
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 01:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654972;
	bh=szOvPNyxohILp8ypzy0QBe0wsGgv+77VvcXMFL1pBiI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GxivgSKKpMAbosqUk66Yg4iqBddCw16F7dBmuZ/OIP0+CNyedhqtebgAKbjN+lZA2
	 XzrsTS5KEpJLSeD7i+R2egKS22N6blaIWVzB/WxRu41zP6lA0V7+QCkPZvpkqw7h5Q
	 DcOPg02AYjxyC9fGtPeZRjn5JjC4cMvQzgeZQxsOnejhZh008h9JVM8EDPJVQul17m
	 7Q/84bX6YEho/gL8wI/w9xIbCWrZKQ6eQ6loBY+e89YwfZc5xTsc96jiVKhMtbisPC
	 5IYou1zn8i7X+GbyR/XnCH4jYewJzSOCfd0jwZdQwc4RUmVL5gRGW+fKTKoc70yQ3j
	 Fom+4k4F7afMA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c31cdbeec9so1867577e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 17:02:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHRHiPLmHQp0HIRU/LdFS4WlXr+qzksdND9/IUaEQ10EVSDq4IeKK16djk0JsbUo38sSNbb8c1XNX5y@vger.kernel.org
X-Gm-Message-State: APuU4Z85Ac7yu5wg+vUe9ik8XWIBRK1i3u+i9VEI7jws+whyVDK+M8L9
	7pzxaJQtwvtpy3nlNeqTzPCvCXywb/XKdZAwRVpl/bP/1paXyA4CdkVoUkOMgPPQlijI9Lkt9gx
	h72Qpnh20WdQMp16g8ojmVQ9zkIATghE=
X-Received: by 2002:a05:6512:b9d:b0:5c1:5975:a6d0 with SMTP id
 2adb3069b0e04-5c1bc813d73mr5576689e87.49.1795654970525; Wed, 25 Nov 2026
 17:02:50 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-0-fbdce4565a5c@free.fr>
 <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-3-fbdce4565a5c@free.fr>
 <avs4l1otw6ACW5P4@SMW015318> <avs9fmJqYShOIPMK@l3017729.home>
In-Reply-To: <avs9fmJqYShOIPMK@l3017729.home>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 02:02:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLnF07h3Ng5O=xcgKhTEkV9ij2ptzktAfi2Kt45smdEjpw@mail.gmail.com>
X-Gm-Features: Aa3M54pY2u0gcwGTwDEHxrFaQf4DHIpe5Fj8K7AAC6iAolS08Y7XLFFoVNzoAr8
Message-ID: <CAD++jLnF07h3Ng5O=xcgKhTEkV9ij2ptzktAfi2Kt45smdEjpw@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] soc: fsl: guts: add the RCW override of the pad muxes
To: Vincent Jardin <vjardin@free.fr>
Cc: Frank Li <Frank.li@oss.nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 6:30=E2=80=AFPM Vincent Jardin <vjardin@free.fr> wr=
ote:

> Then, since it was unclear for me if the patch 1..4 are through
> pinctrl and 5 thru imx (please, Linus Walleij) ?

I could do that as long as I have the proper ACKs.

Yours,
Linus Walleij
