Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD84399CED;
	Mon, 10 Aug 2026 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349933; cv=none; b=lKlV4bAWCZEuFu5x9dGiiHu0V9ezr342Qq6vMWrDRFSQnft4s0o2zaVxGjXD5IOufm62/LIlUErW9sNgxr6OAre3VAFMTty4PVS+Bpa3Z7h6D3PzQgr3+8xlbAhdwouDA0HenlBo1LGWXaHhEOI3M3+CmwSWQYqBqRRnMytP3VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349933; c=relaxed/simple;
	bh=t+NrKjZvsTswaDBdLjiMymZgWZvVb8RLbuWOSzlLqSo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MmreFL0xTIeEkfwgV7NCbAn24QdFKJZzaJ/UA3OsiCWXCVzU4YdJNfWkFo4HpwnnUlHuBW1R7TwT59egzsgNgWhvV2Bh4pyiF4a5cLdCJ8GCs41tLk8eAT4ijwG2KxUnPGAuWeVqYx1cXlViRZC7ktAWs415c40KLjQ2VZxWgiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMLKkpzA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMLKkpzA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9434A1F00A3D;
	Mon, 10 Aug 2026 08:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349931;
	bh=zsbvzpOdwPJ1RyoVXPhUIn0xSG6eiE3sItoM/JvSSG0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=JMLKkpzAzuT54dnA6mBpO+ii1Yt7MtSNVbgtaQz/dEp/zRlxFNxXuYMo6lqDYycJy
	 Mwxy+21MTyRXLXyA+fBUXijvMC3wxahx2TSZYn8BsOkV8FIhsqWOmACikPb37F8m6P
	 5yp1POk64hD22+QCelSPCaRZetdg7kufQqsp0fKvFFgZ7uhB/6tAxGP5FoxXIG0fq6
	 NAn/N4px1d/1k6sAQE35dM5jd0t9coBtwTUP+QXNmUbzc9CA2NNVmDDBneMTcIVjAW
	 Fbz05DN05UtAj5r6gjB2F7k2MW5eSvxhNA9X1SBjLI0oc0dZ/kqmDiOjvu7KKk5M3e
	 Pl1wQK/n6wYqg==
Date: Mon, 10 Aug 2026 03:18:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Paul Walmsley <pjw@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org, 
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bartosz Golaszewski <brgl@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-6-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-6-changhuang.liang@starfivetech.com>
Message-Id: <178634992084.1015192.2135350891770274269.robh@kernel.org>
Subject: Re: [PATCH v5 05/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0h-pinctrl


On Sun, 09 Aug 2026 23:36:34 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../starfive,jhb100-sys0h-pinctrl.yaml        | 162 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
>  2 files changed, 176 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.example.dtb: pinctrl@13080800 (starfive,jhb100-sys0h-pinctrl): gpio-ranges:1: [12] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-6-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

