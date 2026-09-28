Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD0F3F1048;
	Mon, 28 Sep 2026 05:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790574693; cv=none; b=LDreLGECquNXfZFfvRmIBbSGi+6qxGYKYEhyYiL3i+tBQLxK0HIfijkrYyn4Pe/r/JhFDDn3GYPUBBmti5TFAKU5+D+mQdVStwxnEpuelq86i55eI4XRuq1S2n++pB7eQmE7Qg/TPIy/7WEs8PJ6cMI4dSl6H3B1c2nfztx6pLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790574693; c=relaxed/simple;
	bh=nVOq0IloLg+NshvRJerNrJibOVRsYaapA/ZZ1DPvguw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUl9d/UO+Xson3EMXZm/7ThHGOGFQ4DXlVBJnJy2zopwBAMYs0uaCqlKG5lzsmknsb4L8vQXiBJELfAAitQmptGnK6cR9OLBou4vvrrG/P2VgMBoiOR7+HDqcdtfiH2tpIqe9u09let20P9jhB7lPiXCgKqA5YK28TukkIIcUkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyM3grQ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyM3grQ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D3C1F000FF;
	Mon, 28 Sep 2026 05:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790574688;
	bh=OdX7uCgtFkFd2aH+O4C66iT1zLtDyfne3dT1QXJOzso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VyM3grQ1CphVfmohqtVtXq3BioMvKGXxxTbnzYvJcXyiQfBlxeA5UtvY6LEXrXZv7
	 R9aaUx5365fvFoPGdt739m8D0k1b0U2pVY6ywjELRQHxmZpNkedGMxe5VrsC0aYrwz
	 Om1wF7BjoEmUDkxogPewe/np5LoXvKdnb1s2OtpkWyH3N+pSfz6o3F9vl8ouQ0DEnp
	 ztCYjZKqcvM1Gsv+bAlXyR6duF//+oEPBajEs1GD7TMsN/1MfqCTjUWJLiQE0HHjPY
	 jFlJgMCLm8eUsu0vyxhMZkdCaAiIYp3ds/mRhGxv8R8TpB6uKZRFwxT8ulZAa7Ip34
	 +RUFljIDWhsgw==
Date: Mon, 28 Sep 2026 07:51:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	kernel@pengutronix.de, linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <20260928-vigilant-ultramarine-cockatrice-dca7c9@quoll>
References: <20260921-clk-cdce6214-v9-0-f2ea74fd38a2@pengutronix.de>
 <20260921-clk-cdce6214-v9-1-f2ea74fd38a2@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-clk-cdce6214-v9-1-f2ea74fd38a2@pengutronix.de>

On Mon, Sep 21, 2026 at 08:49:59AM +0200, Sascha Hauer wrote:
> +properties:
> +  compatible:
> +    enum:
> +      - ti,cdce6214
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - enum: [ priref, secref ]
> +      - items:
> +          - const: priref
> +          - const: secref

Entire oneOf can be simpler:
minItems: 1
items:
  - enum: [ priref, secref ]
  - const: secref

> +
> +  '#clock-cells':
> +    const: 1
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '^conf':

Style prefers suffixes after hyphen, so:
'^conf-'

> +        type: object
> +        additionalProperties: false
> +        $ref: /schemas/pinctrl/pincfg-node.yaml#

...

> diff --git a/include/dt-bindings/clock/ti,cdce6214.h b/include/dt-bindings/clock/ti,cdce6214.h
> new file mode 100644
> index 0000000000000..41ec4f8868bbb
> --- /dev/null
> +++ b/include/dt-bindings/clock/ti,cdce6214.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +#ifndef _DT_BINDINGS_CLK_TI_CDCE6214_H
> +#define _DT_BINDINGS_CLK_TI_CDCE6214_H
> +
> +/* Clock indices for the clocks provided by the CDCE6214 */
> +#define CDCE6214_CLK_OUT0	2

Please start at 0 or 1

> +#define CDCE6214_CLK_OUT1	3
> +#define CDCE6214_CLK_OUT2	4
> +#define CDCE6214_CLK_OUT3	5
> +#define CDCE6214_CLK_OUT4	6
> +#define CDCE6214_CLK_PLL	7
> +#define CDCE6214_CLK_PSA	8
> +#define CDCE6214_CLK_PSB	9

Best regards,
Krzysztof

