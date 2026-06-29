Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA1938911B;
	Mon, 29 Jun 2026 06:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715810; cv=none; b=TJxaLSQhktJk1JoMKwYAGwsoag3iURjdLhmWW+mcbWvM5zWIZs9Qlvu04O1/LdDdjOQxhdgM4aCN+aI1dLqs/LTQR5hdjZLg1TLNeLjPeCZZGiab8v8xm8mAxtXmUU/duqJfeVRCdRfq4mhE2WDWtmdv6AD6rhhdcYvtD5wsL+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715810; c=relaxed/simple;
	bh=2PUIEsCAAuuZf89di6vgXYkaxF4f1h54dt+Xdr4q1Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZcgtKiupPqeVDHBN+ltNBTA1PLON5emTTFqpz+3Mw6Xa7r97uuCp9Mrw4eArwBEXLA4EOWhHumTjIg7d1kMTDjtzjAvs8RyFX+SYjgOKNpPdmiNEUk1w5UGB2cUgE0tzUj43XSKwD0MMbPoQtIrtwRUybVT/CRxbS+N0HEvHUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJoESfbZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJoESfbZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC1A1F000E9;
	Mon, 29 Jun 2026 06:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782715809;
	bh=hKkyiI/yiTP7cDIO4RjTJ77BW4c8hbO3ztakDA5/1iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OJoESfbZdO83HNh7oKMhYGdqPfgIf1wHRDiEo4WkmviQ+4zoYRgCN6vF3DeNkWYf+
	 GldlaWWMZEpb7U7+EZri1NmLJdb4AXLucWpp7KC54QzO4GM8kw9fqQa+2TURqLvNww
	 yRHCpqjTe9osQmWa1xkn+OEpLj7Gt01cRFS1SsSoQkugVb0vd1msS3JmZPtk2CjMZy
	 zSC9G16OjzDms4saM/0PiXkw0UAFpgHgbcpuJFBapeMceMXuRYj0/h02jv9DPPrFvf
	 XdHYwuso1WWzT3CGcvCdDVrb7en/g0GetjF5hPFiRtTdQgZPAMe5l9pEMOU1vbPsv8
	 zOBromKNtxIWA==
Date: Mon, 29 Jun 2026 08:50:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v6 15/17] pinctrl: airoha: add support of en7523 SoC
Message-ID: <20260629-ambrosial-ambitious-jackrabbit-821d2b@quoll>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu>

On Sun, Jun 28, 2026 at 05:37:31PM +0300, Mikhail Kshevetskiy wrote:
> This patch adds support of Airoha en7523 SoC pin controller.
> Also it adds corresponding device tree binding schema.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,en7523-pinctrl.yaml        |  375 ++++++
>  drivers/pinctrl/airoha/Kconfig                |    6 +
>  drivers/pinctrl/airoha/Makefile               |    1 +
>  drivers/pinctrl/airoha/pinctrl-en7523.c       | 1124 +++++++++++++++++

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.


> +    pinctrl {
> +      compatible = "airoha,en7521-pinctrl";

Wrong compatible.

> +
> +      interrupt-parent = <&gic>;
> +      interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;

