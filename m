Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B253E0745;
	Thu, 14 May 2026 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764651; cv=none; b=W+J1NIxXgbUMpCs4JjjXq+j0Zsdv633ieIrCXY3TAAIb8NwaCep7dCcKSRT0LHamSF2w8oJxJ/ETWZyZSqIbiEhEKlKGCBSjOzG3EJs0kbaiJ1h7bePMj0iWO6ELd2abXCLqvX2GIC7s7ya6XvTZng70VUvF2b/VAg4c5h9c1Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764651; c=relaxed/simple;
	bh=GK+pcqSgFJkVn54Slq5nyvwaQWsp/qlPoexNRpOCAOg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=daPPjfLXL1KEEklUAbA/TyVatQi4Y0SP6E/u2UYmGDVSVZj5MUDzGfORsB3S7mljHNXpt3GUhYvu44xI8jghj1qQznB9qn+k4zYgi3f/RTXwUnAQ4A8B1FAI3bN6QebzEBnCC4AMbqT5VGdYpy7AsJwz8PFfUX+fKzgjfseQNVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bun2uiHX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bun2uiHX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BEEC2BCB8;
	Thu, 14 May 2026 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764651;
	bh=GK+pcqSgFJkVn54Slq5nyvwaQWsp/qlPoexNRpOCAOg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Bun2uiHXReT3cQ7hmE4On5Pj6AgD0axSugnB/1bEulhqpU5DEnwxUymmAQhqfOUg0
	 HDxAQoAESbU47r3YR4F8pw2rXCslvM5mRFN08hqvseanirCI2kGd+AA8Io2gK2xFBb
	 CXNLYIvS4uz7O7djvZTWnIGWoDdhjdboQcXZ/1Q4zSgbc7WLlqKL8nMHkQxQviw+M1
	 1qoDxpTl0iEaYnFKa03UR1tOUvBQ+Ft0RB5pZ4x9wKZ/KeZ4h+g3h3MLuG/9WOkwip
	 vdHvfZfBplaL035BR64XA3tRkkmhiihxo22Nh+pMaLRS9O7hUfIMsxythdg09VZo+z
	 mHQR4hblNjFOg==
Date: Thu, 14 May 2026 08:17:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <brgl@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260514111218.94519-13-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-13-changhuang.liang@starfivetech.com>
Message-Id: <177876463989.125858.724905267935459432.robh@kernel.org>
Subject: Re: [PATCH v2 12/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per0-pinctrl


On Thu, 14 May 2026 04:12:08 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 176 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  62 ++++++
>  2 files changed, 238 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml:135:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.example.dtb: pinctrl@11a0a000 (starfive,jhb100-per0-pinctrl): gpio-ranges:2: [32, 28] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.example.dtb: pinctrl@13081000 (starfive,jhb100-sys1-pinctrl): gpio-ranges:1: [8] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.example.dtb: pinctrl@13082000 (starfive,jhb100-sys2-pinctrl): gpio-ranges:2: [32, 5] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260514111218.94519-13-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

