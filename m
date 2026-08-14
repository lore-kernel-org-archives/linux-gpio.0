Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFCD81ACD;
	Fri, 14 Aug 2026 19:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735864; cv=none; b=TwuIV1DKJneJ7bv5ss3oBVRv6+86b8RwyPlHVz36lZBbTp3V2yOrHhbWX94Az6rVZ3ZtpM4U+yTv7z3TfFYh+RpesjOY9NOCpABQa2z+fNNnE/ijMj33FRbTHS/LJks5oH6cUimbS3/iNVQCDAf2T6ktlFV06eZY4VCGt4fLF74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735864; c=relaxed/simple;
	bh=J9f5mL0ngcw9Mh0FNVVO0FHw8s2NMX/cKF2yQfDF8bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9C6Wlayykij9z1jJGaz/qAk0PTxUCzoWyLQlNyOpnSFnSLpIN57MMnF9CUJ0DSpmubpzDSqiVPFCqiQf1vh5H4CcpBpmKkNnUMEAT6TG7wwbQX/wl0ZhyngAM9Hx7TxGlAjFQBnQq9HxPbusi+zaTIvZdiWl+q9rEBl6fcU6mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CowSnHj6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CowSnHj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E091F000E9;
	Fri, 14 Aug 2026 19:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786735862;
	bh=MmJ/55T9EJFOaHr11Acs+fMpQj4ookVIIEHd1e2H5VM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CowSnHj6geerbDfDwzPKfU9IamEn7ABwx6rUrgE68moFOeUGxraeUvZvTB9bshGDs
	 lg7kgRuE3z5Y/DDCQRbMD+HZBABvFvf2uOXJH8uAH2U1HczwKf+c1BkINLGafBqhyJ
	 AiIbm8pPu0MkLK+aT3WkPDv/pXn6h4mIOeF9n2vXL86jAOrjuhTlT5hsKjNYyhCD85
	 acTbDXGaD5EKqroIJwuOG+pPyGx7wAQ/Uc8ENTN4kAxm+fpRx4Sg6nLTie3jKEmKIx
	 rD1sQwEUJPBVT9b0CBf6wKgYpw59sfgceRYZ8cX2b5hxoDdXm7NV2I8u8TUsIflumA
	 R1D84YPvNe5AA==
Date: Fri, 14 Aug 2026 14:31:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: linux-gpio@vger.kernel.org, daniel.baluta@nxp.com,
	Linus Walleij <linusw@kernel.org>, goledhruva@gmail.com,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, simona.toaca@nxp.com,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	m-chawdhry@ti.com
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Convert TI DA850 pupd to DT
 schema
Message-ID: <178673585963.2716087.6846700220405859566.robh@kernel.org>
References: <20260812103621.1096140-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812103621.1096140-1-egbostina@gmail.com>


On Wed, 12 Aug 2026 10:36:21 +0000, Eduard Bostina wrote:
> Convert the Texas Instruments DA850/OMAP-L138/AM18x pullup/down
> controller bindings to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
> Changes in v3:
> - Restricted the pin group node names to 'disable', 'pull-up' and
>   'pull-down'.
> - Switched the pin group nodes to 'additionalProperties: false' since
>   all of the valid properties are listed.
> 
> Changes in v2:
> - Excluded the 'phandle' property from the pin group node pattern so
>   it is no longer validated as a pin configuration node. This fixes
>   the 'make dt_binding_check' failure.
> 
> Link to v2: https://lore.kernel.org/all/20260811111023.721262-1-egbostina@gmail.com/
> Link to v1: https://lore.kernel.org/all/20260811092057.687155-1-egbostina@gmail.com/
> 
>  .../bindings/pinctrl/ti,da850-pupd.txt        | 55 --------------
>  .../bindings/pinctrl/ti,da850-pupd.yaml       | 74 +++++++++++++++++++
>  2 files changed, 74 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

