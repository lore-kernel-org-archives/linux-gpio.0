Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995949;
	b=1X8GFvnBt7zDG3Y3CsJ7sBmWnDHsE1twJIRqe97KQIk3/P/MvWdySzLrvNFQcoxXuUyC
	 2/qy2qEH5MWho5heHtQWEwyDsQB5VD+4Ov8GP//6cwnHVE8DDkVYzWIS+Ps9935ZUhZgz
	 DHKm0GYitzwDEjlQNNOc/yH6wWGOU38oQ9d4cRzNc5jokGVEpEOowwHkJ7pz6P7ug/9pG
	 EChcWsfAA9wSc5jCrgmTRj99lDfdNCUSVeA0U5yThfNMM5+KoEqFLM3fgncvzhObEgJQn
	 q5qmUBfEtWD0QTGeGUpxJlaKhqkWP05wuifT2npCQg99FheRmfAkq3UPz+qPNFIZXvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995949;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=wVxSIi4bRaqI2NNvgQHyFiPGPX0+mZZDkHVHA/9ddgo=;
	b=0rs5zeiBuFVEmSNRZRvuk76MQw27puvmHig1nat4Wstg52koo2DJccFs3YqncBwmN3cv
	 rWyCtPxUASfZ4eCo4s0ozHPAPAbTSN7v2dvoj1CaWnfp7616WvGciBtRqRmdxtPeb5r+q
	 bylXx5mkRTDvR89jJM0sAiRLVAXOTC94A0wofiFszQROB+YEYVc4mogytn8Wr1iB8ldFu
	 FPX37gcecnYaqrpWPBwl3+81j43zLHGKU2VBbxlFqVaOIqcLtdmucie/q/+NarSkSLA0a
	 +udXQU1usdAxitAS91p1gLFXOnjlL3W625n/pdlCcJj2iMtWlHsYhbTdmv9/v8Ozx3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=oaQnw3aV;
	arc=none smtp.remote-ip=212.27.42.6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E824C606A31C;
	Wed, 18 Nov 2026 09:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E824C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=oaQnw3aV
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5A024780331;
	Wed, 18 Nov 2026 10:58:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794995946;
	bh=PWhoRlLKNjf+e4xV0f2mSPdPAM1c5SfrVYrUMaV3T4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oaQnw3aVfnOts8ga92P93O8AsnQL0oPXuJ2clCNHXXjkpLKYQe43SdAtntcQBrCVG
	 TsEz074ulTs4/KGu+ZYB0bkpWZpFkESyq8Uv7ovgeaLAvLNjEqZ8I82QZfygu8hMiQ
	 0Q6ipzXv/xH/91tlCu9+GOjPNHQvE0j1kPxmP5IViu4koP/AOtBRG4AGv+wImgdnO2
	 030X2btsdTzQ8xSttdiJK22GJfzm6z4YLXY8HEbcQmnj/k3xhsq4JcCCsP1FKnoETK
	 aLaLKCGzr/OYT1etXlU8MOuD7ubI5ppHt8Bc3xqUiDZQUo9Iif4h3gUmjQeGO64DmV
	 UziCaH6xhDHvg==
Date: Wed, 18 Nov 2026 10:58:41 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: pinctrl: add the NXP LX2160A RCW pad
 mux
Message-ID: <av120SMcb31YLAWK@L30177.local>
References: <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-0-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-0-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-1-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-1-5d7201970629@free.fr>
 <avzBgDksGfXb-MxZ@lxl00025.wbi.nxp.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avzBgDksGfXb-MxZ@lxl00025.wbi.nxp.com>

Hi Vladimir,

> It's a bit difficult to manually follow all the constraints, which are
> listed in the opposite way as the RM would have them (function -> valid pads
> rather than pad -> valid functions), but AI says it's OK and I'm not
> spotting any obvious problems either.

I am trying a small update into the yaml file, that should be easier to
follow. You are right that this serie is having an heritage that
should be simplified to ease the maintenance. I'd prefer to improve
it before merging it.

I'll send the update later today.

best regards,
  Vincent
