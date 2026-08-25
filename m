Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974B92E7393;
	Tue, 25 Aug 2026 07:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641791; cv=none; b=OwHCv0C/sPHFL9/Scf5T0ORfwswccjR871mSADrZ562IaW7lWEOMAeuEeGQpL/Qv9MRWDPoV0RnoIwBfChn3226HQchfP2RI2Xo2JtWkWBPr0siI+ut6Qrgo/67pMosMOAG/FstUNxAsGcuD/FhE7zRu7QAAOOXoGaqWA76h0t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641791; c=relaxed/simple;
	bh=wx8SR8PcZp/jz8SlhlyLf3bzIbbvpJR43bexhli1ynI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqRCzCfcFCk8ONdEfaeggqbcYeDdQOJUuYkGxUrcOTDUDQXSheih5GZUakfv9wqR7e+MSbhCqAjoDUZpkq+rRH0Tsg1afI9hOB4zTaWHgUR48TN2U6T/uRRADqigh6eEEPSNkgy0IoTi9tRQcdHu6K8fShWio7dDvaCu+5ZuNJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxodJHWx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxodJHWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9B71F000E9;
	Tue, 25 Aug 2026 07:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787641790;
	bh=u4ZuQEat42JuHZMGpxRWYn5OzZA6j98dAzUPn/4GKHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mxodJHWxPrJAZROUvg2FCQ5GkRDq+AhwM6U+txm0VmnpAE/OWTvbbWJYkXHPjVDKS
	 ZHyNUE0SVnuxgvtG8d9F94opM1D9V+IgWSIlgzRwv11jMi++ENrh9b7opdOmc7uQrX
	 DT/RVrAm7HFg63Gf0nl8YuSKAMvCZyTcfHwg+A0cStS9iRItEf1zOAFoQ4155ZKdsP
	 v9N5PwwrpHAixX/CYB+LyrIZDE6e9UQgjkpxvYmQOpCSzhKITVFyYqBzThf3sOKGzl
	 g4SSRV9dv7nRkrzXvy07+3kb7pFwOwJd2vDKJuJ7UNJFxjxFPcUGjjr3Wod2UD3EuV
	 mSZneQXbPPqqg==
Message-ID: <2ab08d92-ffe4-4992-9702-c2020d22720d@kernel.org>
Date: Tue, 25 Aug 2026 09:09:43 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog
 child nodes
To: vjardin@free.fr, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260824-for-upstream-dt-qoriq-gpio-hog-v2-1-58bbc82b881e@free.fr>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260824-for-upstream-dt-qoriq-gpio-hog-v2-1-58bbc82b881e@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/08/2026 23:54, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> The binding sets additionalProperties: false and describes no child nodes,
> so a gpio-hog on a QorIQ/Layerscape GPIO controller is rejected by
> dtbs_check as an unmatched node name, even though the hardware and the
> kernel both support it.
> 
> Hogs are not a controller feature and need nothing from the driver:
> gpio-mpc8xxx.c does not mention them at all. A hog on this controller
> works today, only the schema rejects it.
> 
> QorIQ and Layerscape boards do need them. These SoCs bring board-level
> reset, enable and mux-select lines out on the SoC GPIOs, and those lines
> have to be driven to a safe level at boot before any consumer claims them,
> which is exactly what a hog is for.
> 
> Some boards in the tree already express this need where they can:
> fsl-ls1088a-ten64.dts and the tqmls1012a/ls1028a boards all carry hogs, but
> on I2C GPIO expanders, because that is the only place the schema currently
> supports them. No board uses one on this controller yet, so this fixes no
> current failure.
> 
> Other GPIO bindings already carry the same block. gpio-mvebu.yaml and
> gpio-davinci.yaml use the identical "^(.+-hog(-[0-9]+)?)$" object requiring
> gpio-hog.

This paragraph is redundant. Frankly speaking, half of the entire commit
msg is redundant, because it states the obvious - GPIO controller may
have hogs in device nodes and this is a GPIO controller. Efficient
commit msgs are preferred over long ones.

> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
> Changes in v2:
> - Change the commit message. Drop the dmesg excerpt: those hog names come
>   from my out-of-tree dev git repo and are not in the tree (Frank Li)
> - Note: the hog call path is: gpiochip_hog_lines(), called from gpiochip_add_data_with_key()
> - Explain why these QorIQ SoCs need it
> - No change to the diff
> - Link to v1: https://lore.kernel.org/r/20260824-for-upstream-dt-qoriq-gpio-hog-v1-1-d75923bcecad@free.fr
> ---
>  Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
> index 4cb2a6b9fabfb..a6252440e099b 100644
> --- a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
> @@ -63,6 +63,13 @@ properties:
>        GPIO registers are used as little endian. If not
>        present registers are used as big endian by default.
>  
> +patternProperties:
> +  "^(.+-hog(-[0-9]+)?)$":

Pattern is: "^.+-hog(-[0-9]+)?$":
(outer brackets are redundant)

With these two fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof
