Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706376;
	b=ijxOCoGRcyhhi25yjKW7btCK7wq1KAp+PK2yoY16DIeE3BWeU7eYUcqbxHDcXc0FR5cM
	 n0XXBXQYqkJwBPJGNEScwhXo7lUEaa/fg6xE4TEnr3BpXRYF6NA8RhQSW+0FaYH8DmfkF
	 eGC4EzbfwEX2oYI5aBVcCeONW1l6gCIZbFQq4UDq3/oUatbnuTCZlkA6B3x6ZjEY4TRLv
	 BwT2XkxeuDet2FLAn+WUsLEHy38xxGDPtSi/DB1UPfoB6wZXnwZmyC9KymFq6Jy8GgC4g
	 x1+cP7mQo4wdPjZe7n/wGrHz8JuKoelV76+zRoY15yCKt3G2e+FaB5nec4C3XeP3f3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706376;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qQLHpmsRNMu4pGQ7TUF0TsUadlNWD5NyYDTXP525YNs=;
	b=0LvBpSBryHpULMUBBNTbPkWivqHaDLj05qWET6LpKHNWZIxzMGNVmVEuTMdNXaPmUCg4
	 pV3SpvT1CsBUaoo+P5A8/abzjaPrW0F4WYRbxlYE5r/Nk02W5KC7aZ/OkSn31gl2lJ4fD
	 L+qDnI3G7lLdg3exCb5E/NyqNu2fEw/2SAsVghsVjMP/bIuVLpd775ugAcvSROaLr2ZDl
	 vPJ8s1DbC45mAaY3IncQQ+wDU5C04gh4TKG/5AaGiwHQDlJcOvhnzRYfyrHNC5vn1pww4
	 5P+9P9i81BBSBU0WyweIUpaLdVERAxYV8z05XPD/swYju2g6IAv/FPLh7nT+ZaHb5FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xkl1z5GF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE20606A326;
	Tue,  3 Nov 2026 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xkl1z5GF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23891F00A1C;
	Tue,  3 Nov 2026 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706375;
	bh=qQLHpmsRNMu4pGQ7TUF0TsUadlNWD5NyYDTXP525YNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xkl1z5GFh4pKn1TYNw3OoNJiPltUB9eGDOMkZhcxVY/Zt2ToX2fVtIzc5Z63ZPr2q
	 pVz1szeeWaRZdU3Gv4jb6TVgKHi+/STjG/II3sOkY0IL/ga2/NBiJrjvIDwWD6Tm8t
	 4jtHeopZ+IEKKUB2yCzP5UNERZQQz/EhwHfsl7t3cu1Pk57nR6HNgdkfary79Higrv
	 hkfzH6ilDVckEmmtQ9r/pHlHOX6sDO3NUDHrGKdXep2FnTJS4MLivH1Qcp4CcWeT8m
	 x78qVOJCxw3wD4/FHB+W6xNMrWAK3/6jb3bVmSjv9Psix11grsGMpy93cJtP5zzDSd
	 CthwY/XvYedMw==
Date: Tue, 3 Nov 2026 12:46:12 +0100
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
Subject: Re: [PATCH v2 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Message-ID: <20261103-venomous-hyena-of-fortitude-063eae@quoll>
References: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
 <20261103-gpio-vf610-fixes-v2-1-7c71fb36e184@nxp.com>
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
In-Reply-To: <20261103-gpio-vf610-fixes-v2-1-7c71fb36e184@nxp.com>

On Tue, Nov 03, 2026 at 07:44:05AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
> while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
> a single "gpio" clock. The VF610 controller has no gateable clocks,
> so keep clocks optional there.

Same second comment.

> 
> Describe the clock items with minItems/maxItems, require exactly two
> clocks for i.MX7ULP, and require exactly one "gpio" clock for the
> i.MX8ULP family.

Drop sentence, redundant.

> 
> Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-vf610.yaml       | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> index a31f64b6d40b..822fa11d18d9 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> @@ -57,11 +57,13 @@ properties:
>      maxItems: 32
>  
>    clocks:
> +    minItems: 1
>      items:
>        - description: SoC GPIO clock
>        - description: SoC PORT clock
>  
>    clock-names:
> +    minItems: 1
>      items:
>        - const: gpio
>        - const: port
> @@ -116,6 +118,36 @@ allOf:
>          reg:
>            items:
>              - description: GPIO register base address
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx7ulp-gpio
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2

So you ignore not only my feedback... Good to know, the more the
merrier.

Best regards,
Krzysztof

