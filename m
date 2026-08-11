Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC33B2EBBB7;
	Tue, 11 Aug 2026 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445233; cv=none; b=Txolt6AY04goEURaNl1o/jF1QrRCkKXwz7073n3nxjBN4mk5dOS1+pZqW/IehSnyzTK0QJ2lLV7l6aIEH3r64wEHF+skCgVSSn5culWhoDzFHOM0U9pbJOwGEoMUhDDfxdQmShc3OYNQ/uZGAOcxKeEIHTdSUVwJm2WHxIEOVZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445233; c=relaxed/simple;
	bh=uq/6L7LsS7MPokPDOD7kqpoN4FIh4OTHmYZC7AfgJjo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=CA+gn3uLajQrtMWPXsHAuRp7kV65UFG+kAXSNDww1R5OYoURut6eoS+YcKM3TCLjMsX3p74UgG6nYfapDw70cfNFk8NmJXivvyqTABlcMdcj2BhvcG/dhWPy01xpj24DkYDmZ5CMnJ76DVpplTSrXO3ODS+qfsTC4a6XyvziXII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwLQwIID; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwLQwIID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B0B1F000E9;
	Tue, 11 Aug 2026 10:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786445232;
	bh=8e/QUIozB9pAOyPirFSaLSvJCK7uvlhu4fI2tvbeTM8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=mwLQwIIDL0GJBLcEBKb2wmf5wTHMnzkVpq/GAmQ2r1fv0H3taiXsP4nA0f74fgzQI
	 ynt4AgF4HLxwHMK6sJN9sCCQS8KxYQjVQshQm2pMssYoTCbqxWyATl2mszoICKohQg
	 tmj2vDNViISTNGs6APPltBH36m/slBjWG0WSjrDY6j/3yuOVBush9KaiZ6AqtXx8eL
	 N31W5r4L48F6hfWjKLwwFz/ng5IaJKNfutcrsEE2CPNTEnd03UgJeG8YrRN2Nm+/Ri
	 ZwH1kUdWr9d6u6BIaB0ZuXYwvgltEVA4TfnjIC8iK+A5prFQv3LYWfqHiY7yv0Sliu
	 RO24hhfvYysng==
Date: Tue, 11 Aug 2026 05:47:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: daniel.baluta@nxp.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 goledhruva@gmail.com, m-chawdhry@ti.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 linux-gpio@vger.kernel.org, simona.toaca@nxp.com, 
 Conor Dooley <conor+dt@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
In-Reply-To: <20260811092057.687155-1-egbostina@gmail.com>
References: <20260811092057.687155-1-egbostina@gmail.com>
Message-Id: <178644523153.1349816.655993681272679789.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert TI DA850 pupd to DT
 schema


On Tue, 11 Aug 2026 09:20:57 +0000, Eduard Bostina wrote:
> Convert the Texas Instruments DA850/OMAP-L138/AM18x pullup/down
> controller bindings to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../bindings/pinctrl/ti,da850-pupd.txt        | 55 --------------
>  .../bindings/pinctrl/ti,da850-pupd.yaml       | 74 +++++++++++++++++++
>  2 files changed, 74 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.example.dtb: pin-controller@22c00c (ti,da850-pupd): bias-groups:phandle: 1 is valid under each of {'required': ['drive-open-drain']}, {'required': ['drive-push-pull']}, {'required': ['drive-open-source']}
	from schema $id: http://devicetree.org/schemas/pinctrl/ti,da850-pupd.yaml
Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.example.dtb: pin-controller@22c00c (ti,da850-pupd): bias-groups:phandle: 1 is valid under each of {'required': ['bias-bus-hold']}, {'required': ['bias-pull-up']}, {'required': ['bias-pull-down']}, {'required': ['bias-pull-pin-default']}, {'required': ['bias-disable']}
	from schema $id: http://devicetree.org/schemas/pinctrl/ti,da850-pupd.yaml
Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.example.dtb: pin-controller@22c00c (ti,da850-pupd): bias-groups:phandle: 1 is not of type 'object'
	from schema $id: http://devicetree.org/schemas/pinctrl/ti,da850-pupd.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260811092057.687155-1-egbostina@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

