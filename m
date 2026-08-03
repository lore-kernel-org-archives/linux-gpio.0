Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1111B6D1A;
	Mon,  3 Aug 2026 22:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795850; cv=none; b=naXDeaVTnY14zWOUupv5n/5xSVD51Fv+b8Gcdsyi36LKqFvM/Dlf1Erl8NajGUZOMJcozuAN4wPU4ziIJR1/VsACEduEPpmvF21mjk/5Eq4yUGmqdyqMbqUBo93Exl5lGDtpC33XNsSnlM78P86TQEZxSgJQhBWpr1wiflLxzF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795850; c=relaxed/simple;
	bh=aJkl5gRn+VcOGCg13Zdf6sLZO2TKK2rHFEUDEzqBIKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdmxqOzGjP05vSXjgUJeM3bLFC2OuYC32jzC6olEj/CjmJRlP3wlmQ2maAuUk1GPX5KdkkPyPbQY1GO3drtEodrGriOWInmV7tzLDDglNhaDO78w++S9tBs2ozXQ/QIleU0kTtryxxtPq5gkpt/Nd93fCnFXNBdbdAO+akG0/Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQa+TQ81; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQa+TQ81"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF091F000E9;
	Mon,  3 Aug 2026 22:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785795848;
	bh=R94IlekbWd6B+ezeziJk6ZhYx96RrpntxAF24GM2Niw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UQa+TQ81NyW+hCZlBVSLbbWRmofVfyqVhLee5e4pzx7WK37WyTFd+xrBDfDOU9wH/
	 IPkPb8z746tNHy7Lc5izaYgUybiR0PBSvSAhMnkaCO4/Ms/SJs5zviXyDZ/Fqhwgvs
	 CzXzbxcTtSxvGaQbsngfNJVnCkfdkWmj5eeL81aNofJdTIPVfMuLOQEg9+9d3AuQfE
	 a39GVtjuHomwslwi4x/VDhs57UoAv+a8sPVICbxSAHm8yYoJpq9M/p7pdEgikFh2mZ
	 q3Y2Nru5GN2P8C3thp7IXQK+fUn4stWy/2yBOy4zcxaJOhAxmBsp2vw/vTGEr2tsI0
	 eRhAsAHizvWrA==
Date: Mon, 3 Aug 2026 17:24:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: conor+dt@kernel.org, me@brighamcampbell.com, skhan@linuxfoundation.org,
	linusw@kernel.org, linux-gpio@vger.kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl:
 microchip,pic32mzda-pinctrl: Convert to DT schema
Message-ID: <178579584771.736715.6031577704790719107.robh@kernel.org>
References: <20260731174551.86367-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731174551.86367-1-challauday369@gmail.com>


On Fri, 31 Jul 2026 23:15:51 +0530, Udaya Kiran Challa wrote:
> Convert Microchip PIC32 Pin Controller devicetree binding
> from legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> Changes since v4:
> - Add reference to pincfg-node.yaml
> 
> Link to v4:https://lore.kernel.org/all/20260722123243.341346-1-challauday369@gmail.com/
> 
> Changes since v3:
> - Drop "|" from description fields
> - Remove '#address-cells' and '#size-cells' properties from the schema
> - Consolidate repeated pin-node property definitions into a single
>   $defs/pin-node entry
> - Replace the two patternProperties blocks with additionalProperties
>   using oneOf to allow either:
>   - container nodes holding nested pin configuration nodes, or
>   - direct pin configuration nodes.
> - Update $ref to use the absolute schema path
>   /schemas/pinctrl/pinmux-node.yaml#
> 
> Link to v3:https://lore.kernel.org/all/20260719183431.124061-1-challauday369@gmail.com/
> 
> Changes since v2:
> - Add container node for grouped pin configuration sub-nodes
> - Correct regex patterns of direct and nested child nodes
> - Fix interrupts values in uart2 example
> 
> Link to v2:https://lore.kernel.org/all/20260707144223.120417-1-challauday369@gmail.com/
> 
> Changes since v1:
> - Add interrupts and clocks to uart2 example to satisfy uart schema validation
> - Corect regex patterns to accept standard DT node naming conventions
> - Add function property to top-level pin configuration nodes
> - Remove restrictive enum from function property to support all mux functions
> 
> Link to v1:https://lore.kernel.org/all/20260705132521.159522-1-challauday369@gmail.com/
> ---
>  .../pinctrl/microchip,pic32-pinctrl.txt       |  60 ----------
>  .../pinctrl/microchip,pic32mzda-pinctrl.yaml  | 109 ++++++++++++++++++
>  2 files changed, 109 insertions(+), 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

