Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070853;
	b=AsdGaF5dSUs7GrG7lcvnTWzOMxkSBa2NQSVGJM+O0ycD6kBQHGVPWBWsPYanLE9he5mA
	 o/S2iXu3QgLExcypHGzMrCvIAm+Bgys8rSml02LJ+wDVF99c1iPiii+7K6ffhGbOcZWA0
	 GWzov0EGuxwq0m1RUmibDU101Vrr+NNO7gyZ1Higj5+9iUL6s4VtfO402KFQhYUO+Kp+h
	 ZwSaDA5usf4DLcvPpMjSZwXA9Ka1bWZD1kaTWImH39yZRA0ObsDghRA8OW3x0+ipfNayk
	 5noF+dwoV4q0YgNsJwEbn7dgc52wqmmna+S4RO8qnX+6H39vpX3TDzZyrqisBpRNRhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070853;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=69YlIhpcdRp84o4ABpJJqYwv378wcIs9fm+ouT0CtWw=;
	b=ZZNzadTRYOfQwzCaEqit9nrn5iRyYFs5imDcy8C9etO+gnAnV9ZfQhh5apcx2vBH0rgu
	 78VQ1a7QWTs2bDGzDvF9GQTdy57xxesv3vgWzch4wKwW8ArE+6MnRKQrKy7q1Geim8YcK
	 W5GzikfnropOKOfgqTHB6++tbVYv8fmb3bNRf4IXwXYBr5xH5fU4BQRxdzXzqnwhZG/oy
	 NWLKHHz5IqJL5UYwEwqZ8Ef0JWHtOzTeWVWTlqImbFY8Ci3in0pM9JXG+DI8dCBAJJKC5
	 B87AGHDdcNQrLCJW1VlnmoyY+27fsA2TlWzNDt0ol05PJxknUk0ygPrNkGNeSubo5Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=udgMF85L;
	arc=none smtp.remote-ip=212.27.42.4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADAE606A32C;
	Sat,  7 Nov 2026 17:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ADAE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=udgMF85L
Received: from l3017727.home (unknown [IPv6:2a01:e0a:ac2:22b0:71d9:bc2b:4a47:20c2])
	(Authenticated sender: vjardin@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 763DE19F59C;
	Sat,  7 Nov 2026 18:00:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794070850;
	bh=syJyVGNndyaT76xcg3TviaWZJbrAimIaATWckjraIYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udgMF85LazaNU0ZXoRcnJhuQA21gmX/PlbKegAK+KxJJ1+kt3COSyM4r3yyBlo2SB
	 joV2E0iybcwLRKiZcjGbvmlrcGxsmWSkcK2v5/e3MIhT5YCjV5e7ZldqYPSaac9n9a
	 xDGJv45X/pXl86eCC/AxwhHdynJkl5q/tN3nuuWtCWd89D7XzGQadqvNz1rQU4IIzx
	 7oFSepoRUUNROi/gKYXlhpl+FV/iEPGc2KDIJuBNR1uwt3vJ3451smaTQYDYSEU2NN
	 ji35jqiD+doB8aTdWL2ARgfPqfFI/dNsp/9F49p4yxGEP/N5dm5LIH/1zxtb/bT6kR
	 4lz15iEri2+Yg==
Date: Sat, 7 Nov 2026 18:00:28 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: soc: fsl: layerscape-dcfg: add the
 LX2160A pad-mux child
Message-ID: <au9ZLBSJ_nTuMaVc@l3017727.home>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-2-3aad0860b984@free.fr>
 <20261106-smiling-infrared-dugong-48ee5c@quoll>
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
In-Reply-To: <20261106-smiling-infrared-dugong-48ee5c@quoll>

Hi,

> > @@ -32,6 +32,7 @@ properties:
> >        - items:
> >            - enum:
> >                - fsl,ls1028a-dcfg
> > +              - fsl,lx2160a-dcfg
> >            - const: syscon
> >            - const: simple-mfd
> >  
> > @@ -62,6 +63,12 @@ properties:
> >  
> >    ranges: true
> >  
> > +  pinctrl:
> > +    $ref: /schemas/pinctrl/fsl,lx2160a-rcw-pinmux.yaml#
> 
> Why other children are bus-addressed and this one not? Such mixing is
> messy. Either this is a subdevice with its own addressing or not. Keep
> bindings consistent.

ok, I'll provide a v3 accordingly.

thanks for this comment,
  Vincent
