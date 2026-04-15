Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236952192F9;
	Wed, 15 Apr 2026 22:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776292314; cv=none; b=TQ6OR3TjGDgBBlb6gN6gci6hUyeJJFQycx4js1wWrdN++D3K/Nl5q3xg2I6GblaiRQ473F0bjs2xmb9s9rF+R44wX9MHW8YV8t5Y8O4EwrhokwDqhDrKdBLoHVbFKTNEF9noc15z1iUUnTnz4McC0gFbFu0LgpT+Q52ngbNrX6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776292314; c=relaxed/simple;
	bh=usjqRhUrHdefvg550NoYkdLrbpoiUwaN7du2pNz9Hfk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=FFe0WwwkA3GBBvGmu8N7ZzaMedNC1wtX8YKsilAJpL6kIsZaXnDBy5KyJwjfIb6p9LKBW92N9cVjZmC1Um3YtUjj0aSfIB9RdqNeDifeD6I2U3KQ6d+LjYkS1xY94AKEIwuuRQPofd9di7VOGd17o2nMeH5m71iwLveCoWS3e3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RgPGHcG7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RgPGHcG7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A6BC19424;
	Wed, 15 Apr 2026 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776292313;
	bh=usjqRhUrHdefvg550NoYkdLrbpoiUwaN7du2pNz9Hfk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RgPGHcG7qAh3Bm8lSOD0W1RTlWds35ZM7iCvHAVan/F0bxi5KjXOn14BpCMHdLTYm
	 MnM1nW03Pq8s0gQLoZzGlLYk9YFR94+YdPqh1eI/zmMzkI4kvKbwNYK1WhY8gOQcSk
	 bImXyxcThqQ17u22HZLrtys2sZzNOmSYiHojjyziivyWExaAbK3bVYS0aoPLYEGzP3
	 YmdpuQ1BSjJByAnJVErMpOiLlQO6EhyX5YbHZNsGdGG0+skpFMsfRhFdsiTUyPUS5m
	 o3tikdeBqR56sbjiyt1e82q/CayP2M4xNeBK5EnJxIMZOjoeJ0KeMd7xJ3/jL6p1mM
	 P7udaw+Ph2+Vw==
Date: Wed, 15 Apr 2026 17:31:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Joel Stanley <joel@jms.id.au>, Conor Dooley <conor+dt@kernel.org>, 
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
 Andrew Jeffery <andrew@aj.id.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20260414-upstream_pinctrl-v6-1-709f2127da33@aspeedtech.com>
References: <20260414-upstream_pinctrl-v6-0-709f2127da33@aspeedtech.com>
 <20260414-upstream_pinctrl-v6-1-709f2127da33@aspeedtech.com>
Message-Id: <177629231003.934121.15016914373469082341.robh@kernel.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl


On Tue, 14 Apr 2026 17:38:59 +0800, Billy Tsai wrote:
> Add a device tree binding for the pin controller found in the
> ASPEED AST2700 SoC0.
> 
> The controller manages various peripheral functions such as eMMC, USB,
> VGA DDC, JTAG, and PCIe root complex signals.
> 
> Describe the AST2700 SoC0 pin controller using standard pin multiplexing
> and configuration properties.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 170 +++++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$:allOf:2: 'then' is a dependency of 'if'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$:allOf:2: 'then' is a dependency of 'else'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260414-upstream_pinctrl-v6-1-709f2127da33@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

