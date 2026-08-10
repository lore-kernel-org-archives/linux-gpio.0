Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDBF3A1E81;
	Mon, 10 Aug 2026 08:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349945; cv=none; b=MZ3NUnshN/kfUBbkmx7RS+8CSHYh1N3YxXFxzhuFk8uobsA4iXoZ1Y3+30rF0ZabMk7TCBywz8eT+QWvyYmQpN1vhH3wDLikxGrPNPFfNE8LNHIFtphdPG2RLQmkP8fuMqsg5qCeRe8AOIGcRsNDw6uw79UOBqh6XY10m+JPCnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349945; c=relaxed/simple;
	bh=ouJTlyZiuCuO//8zuUZLkACl6Zj5C+FWEpmP855sJI8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fiJ9tqQhcFjexcETkukPUZHGoHFsK9FuYf7nvR2UY9wjHOQUWKI25CNCGPT/CGRch9eryWAGE+zMuZUjnbPpGBvR7zySNZvUMloyBxtG7fp7orYL/3RbtUPDfiU0P57WX8hs1HLRx+fnewdjdWWZyke7yk6nWx5LP3J5qC2k1R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OeXYeHaX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OeXYeHaX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8779E1F00A3D;
	Mon, 10 Aug 2026 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349935;
	bh=voSYQybsySkGQkTw1+t7MCYlEUEMiHXsca6jcPqvV74=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=OeXYeHaXeQpIabWYYARzPOFIwMfEcM6kfw/YVgzmGUbSt9KVf2zesJY4byEcJb7B8
	 GV3HP1zMwWV5+EEA5vmTiaoTxmBsNMIhIWyJxtQ63P+q9kC/DxaR0AqiM0Ocr8QaAl
	 YxWGicDMAADcQAa326XpjT1fKvi1tcAj86dVjoH4lhEuXL9SG2JCjQqXJP9WTAvjmh
	 R53g8gIcMjq3qsBybf8WWfJg9f4N+Ft/yi9o/RZAYMaUsC0OdlgQS2/jLm0UwpOKMJ
	 iW8qAx6oIBN6e8HlxK4U0ZzQE4OHFsNFb02VwO0x0AZTUtB9bd9ya/DGRkSU5PZ27t
	 xUkkK7PUVVmTQ==
Date: Mon, 10 Aug 2026 03:18:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-gpio@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 linux-riscv@lists.infradead.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-16-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-16-changhuang.liang@starfivetech.com>
Message-Id: <178634992688.1016154.3852418862095471474.robh@kernel.org>
Subject: Re: [PATCH v5 15/21] dt-bindings: pinctrl: Add
 starfive,jhb100-per2-pinctrl


On Sun, 09 Aug 2026 23:36:44 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per2-pinctrl.yaml | 168 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  33 ++++
>  2 files changed, 201 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.example.dtb: pinctrl@11bc2000 (starfive,jhb100-per2-pinctrl): gpio-ranges:1: [31] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-16-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

