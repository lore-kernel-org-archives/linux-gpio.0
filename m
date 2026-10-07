Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4192C36AB56;
	Wed,  7 Oct 2026 21:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791407789; cv=none; b=K/0225Rd7rW0CuX0tqIkuTB++uRVP04u+bHSqeq0vOP1VCx6yk8sNFKprt/N+5FBczir2T+GrUoaR/MXbW0cDhcjdgcX1EHLOJIKirtXf7qOZ5ep/UDm3AkvMfBWGZ1gCU33Vco5F5xvn6Qp3/QQVeFA433AN/IlesDO6Vrip3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791407789; c=relaxed/simple;
	bh=A9ur5YXenQEPt2eByzSvRquHlue2d9t74fAMjCVEtZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CE1I50rWfJo7Ysg6ZPNsv/s4UxSUrhlgnngGthZk6Gs2rBSFwtS91575UM9zbYSXhPHi3lk/7KMbMOgD0oj8mD+zhgCRrFl3rI7ev97MhwOmmyuNO8/YCLQiM6XblOJBmV7Ty2xEr8+C+mRy8IbbGc0mBJLLAmeQ+70Q4mvb/g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKzSOlHP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKzSOlHP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D121F000FF;
	Wed,  7 Oct 2026 21:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791407787;
	bh=sh7OcP05sIODDer+3VldhG3V1dgjHWKL0MSwN6BBMfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NKzSOlHPEGa43U7ioH6nGfz0tcwBItsldEnne07IhXL/9ZDKkefYmZR6iM2KBohDN
	 G/cw/u2S4B9aEw1E+ad8XNFqDDsuA0VfUuhTYsd7jhFvmKhEHBj5hO2fSGbxhMFpA6
	 eX6AgdWp5RlcCOUFlrzQvQe5sYedWHBywKPXgsVBNqNXmZnkBnujsaqSrqMJDxswAt
	 FgVDhwKC0cOXSw+QXttsWVEg2AINRsEc6138Scs8oYwgSkJmsOmtsTLYyw0dyAvqz7
	 ecMrXuPsh3PpYXDz9niC7/MWqm/cUCBYBPD2Emcgbdq73SOdg1/JLyV29eij5cXysw
	 utzydwk3OOmuA==
Date: Wed, 7 Oct 2026 16:16:26 -0500
From: Rob Herring <robh@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner
 B288
Message-ID: <20261007211626.GA338242-robh@kernel.org>
References: <20261005202731.153971-1-pmazzini@gmail.com>
 <20261005202731.153971-4-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005202731.153971-4-pmazzini@gmail.com>

On Mon, Oct 05, 2026 at 09:27:23PM +0100, Pablo Mazzini wrote:
> The B288 driver takes its mux values from the DT, so allwinner,pinmux
> becomes an allowed property here, required for this compatible only.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> index 45b7a0b6c626..b1f093d218f5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> @@ -39,6 +39,7 @@ properties:
>        - allwinner,sun8i-a33-pinctrl
>        - allwinner,sun8i-a83t-pinctrl
>        - allwinner,sun8i-a83t-r-pinctrl
> +      - allwinner,sun8i-b288-pinctrl
>        - allwinner,sun8i-h3-pinctrl
>        - allwinner,sun8i-h3-r-pinctrl
>        - allwinner,sun8i-r40-pinctrl
> @@ -120,6 +121,15 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [10, 20, 30, 40]
>  
> +      allwinner,pinmux:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          Pinmux selector value, for each pin. Only used by SoCs whose
> +          driver takes the mux values from the DT instead of an in-driver
> +          table. Almost every time this value is the same for all pins, so
> +          any array shorter than the number of pins will repeat the last
> +          value, to allow just specifying a single cell, for all cells.

Perhaps new platforms should move to the common 'pinmux' property?

Rob
