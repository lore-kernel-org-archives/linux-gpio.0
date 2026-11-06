Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966100;
	b=YFxUsIG5mPE0ndIoS5HXBDgtvmH7v30V20ZZrlWc/pJ3hgIq2YMeElh4tN2MkiAj9oAy
	 yboOqBjXti6K4eKeQJYi4aGa1wGu/etcy5x6aCtb7kJp8fNF1PeAoqLLHG+6IBRdIpM1L
	 rvpi9sf0nfoeiTF2nbDmWwNx/uFShF2Orl374ZBFTufaIz+RJXIDtzG4oC1j5u/sgnsbM
	 MgLhbNzIWmWAv3LPNUY4hvINXuiD4uLGlwuwd9UZwq4fRVB81rIcCCaonv2FVYFmT3oT7
	 VBdwfdY6dE+YEOgTtLswEnOUpna18Nrh5TmyWTiKU0xdWjO33awIifn9O/ZCEzVnVnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966100;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SR6xEuyBw6oIvKMIL/6nS4NrG69DKzs+pSRIP+OzCzk=;
	b=Wum5WYVPTINaPCxrQzXxjuTOuzEtruIkwxEA7EzxyBk478x/AXYfrK/n40mUJ8DESkcx
	 rhSzma4mM0124c2mgGyEqxdTI5vQ9uUEiXC/aeeFWc7LggvChZLQr1yMwqDKBOnZzMjIm
	 JJ8g0zEGnDxXOSdhwyw1v550wLWd0voWZ0WMoQn4ImwxaLqyIgV4z1zUx+KVi2i6HRpl3
	 oXSGCB14EsFYZeMM8Q4I00Uiq7ECnIBlm5XCCyQ4U6cpaZIBJXOVfMX7FvQOKeLqRnJDP
	 9xrJvSHha7EybgmP9VJhGm7Rwf8TGP2uTPBGGl76wYdZyXCaUofwTDKdlNPcBMYYDSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALNRanyN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4CB606A326;
	Fri,  6 Nov 2026 11:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALNRanyN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0521F008A1;
	Fri,  6 Nov 2026 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793966099;
	bh=SR6xEuyBw6oIvKMIL/6nS4NrG69DKzs+pSRIP+OzCzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ALNRanyNmzty5a07tMoU5lStDzErmG7k0viAPR7NaSlvv2c+tHrwbgQf4zg1MnPDj
	 RhpkyVw56yt5GGT5DIJ6r61cz1S+qxxH6xJjt4jiTK9BwhDOX26oeDYiUIid8OJeWz
	 QsnVG8TgekI8swgGDiSZH2tx6GgzwiANiiwsdAEnJtrrmId1sE3QvFcPkmKaZJMvA8
	 Zf602FJMrDhF7We3LbBn4EzZT458kgdPTrTKZUw2GkeKJjJ+xin6ii4Xx4oRSIac0G
	 IMcLjBjv6S2iWgvRN3yHaJIbjOY01nt9Fxu5Ubi9lszqfG1hEL8rxmx23k+ot/ILvx
	 OytGND0Qs6xSQ==
Date: Fri, 6 Nov 2026 12:54:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stefan Agner <stefan@agner.ch>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Message-ID: <20261106-athletic-kakapo-of-lightning-364a48@quoll>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
 <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
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
In-Reply-To: <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>

On Thu, Nov 05, 2026 at 11:52:59AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
> while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
> a single "gpio" clock. The VF610 controller has no gateable clocks,
> so force clocks and clock-names false.
> 
> Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-vf610.yaml       | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

