Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794741579;
	b=h5OaNHA2Uv236bp6aCqN9HW0C56ScovIAXz4fEuUtB89OBfDcE0ROxxJ3zk+rezTIkoi
	 8OD/G+1bU6JqtmXTl/+EOCcW/6pCEKQvWxeBXwamHJN9WDyzzAjLPqT7Qtg+g5CDz7r8M
	 qwud9TRtGvk2mGy2T0WojvmJ4jDeF8DsrKhjAi0rumkYTyUl62xskkJLlPzTlkaoEp5d1
	 2wwvegZD11j/rC9luqNvpdeII44ZalkM3QYigNuIbdo2/uwZswdYnYfLxcL3mvgDnYCqI
	 Nb//fotXdJeCuYnprs17DcQihK8MY3IwuQVyw+FpDQZPQXe6yAvkAbaYHIMM3TnwSWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794741579;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=I6M9drfNN7zCNsaSrSObIiphbvQS2j9fYF//SvIIVu0=;
	b=0CeFJTSL4ePFM7sJiXn3TElcxLlwu4Pq6rS2sGDO/Q1QQK3XjBsmeuSzy4XBuLQhjp+Z
	 5bs0mQGybkv0e2QF6akeC/0+EWGa824NeAiqlBWVZARiQyFFvBuztW7ZIajBrPhHbf6Hc
	 eGMfggoHSOLPPCU+BEltq1OIPSq/fNHkY5pl8alsaMimOlEZdT5tulTQp1WBVHbRxQ1nJ
	 xiWRMKzaHQSc4+TZHYeUl3etwW1N5iMwMhcj12o2/G1zclIT+D87SBDyRnIPMa88tloPX
	 jfRGAng5Y73stYs07xcquwW7nj/EmrLr1W0UgWPwj1u/eH73uh891sJf8d+8qqi61Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=ik6dsrXJ;
	arc=none smtp.remote-ip=212.27.42.1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB8A606A31A;
	Sun, 15 Nov 2026 11:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB8A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=ik6dsrXJ
Received: from L30177.local (unknown [78.242.88.98])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id D792CB0051B;
	Sun, 15 Nov 2026 12:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794741571;
	bh=JQD3/EFXCa4lxF1FzAPYk7PWu+NKW3cxCD9tTy0x1cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ik6dsrXJYrk/VQXyRed2GD1Pp5tDkQSbJ83ictljm1FKfb4Ox8x+nlLt0T2YU9kJR
	 rvmjalYzY7TiZJfQAbCUy1e2Zt84pL9OLjTa20g1DK2yews6kwKo/vq20kUD9jonZL
	 C46MPyDT7DhMhbvQOOqe6zl38xuHODDxKCvm8MTp8HuV003/CEC1zxqnvfncFbp4uR
	 TOIgfbpbbZ1do+E1PYz0KZTcBnbc79rLlddNWRWGBeCMkjN3nAjd7ARCpRdywXrX63
	 xo/tKnRt+jx2nfY5H7izHPB8sfV3RfaNPrIK0MBzXPHbN/jYZbsEyHnJBMRKnw+v7t
	 Gn8OC0dkrijwg==
Date: Sun, 15 Nov 2026 12:18:57 +0100
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
Subject: Re: [PATCH v4 3/5] soc: fsl: guts: add the RCW override of any RCWSR
Message-ID: <avmVIb5-l2DUq75m@L30177.local>
References: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-0-eefcea066a55@free.fr>
 <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-3-eefcea066a55@free.fr>
 <avi9N8P34X5uel7a@skbuf>
 <avjy-lCL2A9gEhcL@L30177.local>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <avjy-lCL2A9gEhcL@L30177.local>

Hi Vladimir,

Le 15/11/26 00:47, Vincent Jardin a écrit :
> Hi Vladimir,
> 
> > I cannot agree with your API proposal. It exports to the rest of the
> > kernel a blanket API for RCW override of any RCWSR1-RCWSR31 register,
> > *including* the SerDes fields for which the fsl_guts module already
> > exposes an API. So with your proposal, what can be done with
> > fsl_guts_lane_set_mode() can also be (un)done with fsl_guts_rcw_override().
> > The possibilities of abusing this API design are endless, and I don't
> > want to have to deal with them when I can avoid them.
> > 
> > At a minimum, I would recommend renaming the API as fsl_guts_pmux_override(),
> > and make guts enforce which register fields it permits overriding via
> > this API. Example:
> > 
> > static const struct fsl_soc_pmux_mask lx2160a_pmux[] = {
> > 	{ 12, GENMASK(29, 0) }, /* IIC2..SDHC1_DIR */
> > 	{ 13, GENMASK(29, 0) }, /* SDHC2_DAT74..EVT43 */
> > 	{ 14, GENMASK(10, 0) }, /* EVT20..IIC1 */
> > 	{ 27, GENMASK(7, 0) },  /* EC1, EC2, USB_EXT, GTX_CLK, SDHC1_DS <- your series is missing these */
> > 	{}
> > };
> 

I did test it on the board and sent the related v5 based on your suggestion.

For instance, when I did a forced bus recovery of IIC1, it
moves only its related field of RCWSR14, and the first override of RCWCR27
does not touch USB3_CLK_FSEL.

The v5 is here:
https://lore.kernel.org/all/20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-0-d246166ea469@free.fr/

thanks for you help,
  Vincent
