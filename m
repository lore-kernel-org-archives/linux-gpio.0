Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210BD23D7FF;
	Mon, 10 Aug 2026 08:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349935; cv=none; b=lKcSVUbs+zWkXw8+/LOPlM/xRE7XL9dvJ8Ra7RL3WHxyvuhKtpjqxQAg5sIYJdTrdVUVQcH5s4w9Hn41dACNPkiBQI/inW3Ex4K98tP7L4pGNPVMnrfwBrOulbU+5HJMuZoo9VGem1vgtDH0DssMb7zqHQhftwtFTkF0yKQLRPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349935; c=relaxed/simple;
	bh=mTbvGyChyB1v2hnFn0bfwPsuXYf3j/ispA3tc0zfxYg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=NfHuEfqXGB1Z1eXqtk7FC+Eo1H72UfUxFMsXxNlwx2br+8fnmd9aULoe7vjzSqre+yTDV4nBxhqtVzllanjKAg/QW6UlxCyqM+/Yi1CxHIS21ZopefGC2C2ReIq18VX5RGlISuJuQQAsBYrE1Td7uNxfiRA7OwlnTVlZHkK3u1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OyR+sTmE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OyR+sTmE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B971F00A3E;
	Mon, 10 Aug 2026 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349932;
	bh=bL5iDnQSLurIbEG5A0MWo7orrQQ3W86EhZH7bR17TfY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=OyR+sTmEd71E8PVLwQUKeBmQm9aeq2HCCypicT/nI1JMqVMkLYFp7QABXVm3xj7g3
	 jvPWYx6464LCo1pOs16cYkprs+HZjNFI3P/1alqzV4p1GVxlLCwMaeg3Y/v55uxtMy
	 uySX2MBayrdywhkZawLaVnokqslXbSVhBgCvaNU6x5YP4c6vFVcCdElxVm1EE04epU
	 v3s1rbwL1SImDYH4pKOLi5uYTltKn1Zb2LaptMDhoB23luLAWb8NH2tAZt8QAFUgKe
	 RsCK0V5mbGF2EhgaAkSQRgQ2hmlm0sRes83f8+lKf5HRQt0wxBs9gP52MLh1+sLex8
	 1Jr3z8ziXD1SA==
Date: Mon, 10 Aug 2026 03:18:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij <linusw@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bartosz Golaszewski <brgl@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-kernel@vger.kernel.org, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-10-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-10-changhuang.liang@starfivetech.com>
Message-Id: <178634992239.1015459.10158155030303832333.robh@kernel.org>
Subject: Re: [PATCH v5 09/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys2-pinctrl


On Sun, 09 Aug 2026 23:36:38 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-2(sys2) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml | 166 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  39 ++++
>  2 files changed, 205 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.example.dtb: pinctrl@13082000 (starfive,jhb100-sys2-pinctrl): gpio-ranges:2: [32, 5] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.example.dtb: pinctrl@13081000 (starfive,jhb100-sys1-pinctrl): gpio-ranges:1: [8] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-10-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

