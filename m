Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549F52F39C7;
	Mon, 10 Aug 2026 08:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349946; cv=none; b=KV8E+ZC1Co8WmDVB3KAvbO4HerSY4dYiY6ZmS+0Io7+TXLufXKD9ibddQLwHm6qu8g32E/t2Oa7HlL2Um6n8lgNeSt1yiOwnwaNnH/NzIreMzI1r3cXxMYmu7A3M26zGanGH3PCmJOJJ28H0kCb2pfZMv/nAKQJQ31Wjns5Q3CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349946; c=relaxed/simple;
	bh=V0WeaO61albYcfiiUjnddAS9XrnLR26Gid9kXkvz9Ug=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bQM6YhkQ1/wDRro8zEJTPFeeMScKKAaXxRvAAaABzV16FwhICpXc0Xmv1bMZM3U6vW07lWbZE2f8XCsAbgSwuTHAIaMeQmB9Wtl8RiQ79AnEnULxr10vRu+MeFsD26EHMiUm0bK1HXnVMMTJo85X/8A9XP/JDj/pqQ88zt4gYOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MG+cswrL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MG+cswrL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783791F00A3E;
	Mon, 10 Aug 2026 08:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349937;
	bh=16GdKRirYa/a3qq5+CzoQN7C2wPXdk5VZ3g+Hd884Mo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=MG+cswrLEu4XgsyTn8jcxz0ZuVPEfpy1c6B64fezZcBJedjNy0krGd7nymKyQJCi/
	 URrBlm+AuGuyBxfX1pVA0Qv95MedbWNtE2jpnxyA1tFMpdREVM2hKLIkAsO10K+3iq
	 1XlaEyaMrjoTlBDftOHCFpNN4dwUY1YHuOfEDI9ZiouGLg+qIu0uUEU6RTFzHzKxN5
	 RHxjnl7Ls1HtbAfpUMDfi1ece9lIuC1XzIw2xxtHrSZdno7Zz9BHX3dWiZFOiZ91ot
	 6xO/RyPR++iUmsW7YIylN4mYG1O1v4ucG9d5mmqItL/sPukz/Df1CGwG+2nLBrd/6U
	 QtdamwwBZCS/g==
Date: Mon, 10 Aug 2026 03:18:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-20-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-20-changhuang.liang@starfivetech.com>
Message-Id: <178634992981.1016673.12958798845773014034.robh@kernel.org>
Subject: Re: [PATCH v5 19/21] dt-bindings: pinctrl: Add
 starfive,jhb100-per3-pinctrl


On Sun, 09 Aug 2026 23:36:48 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per3-pinctrl.yaml | 166 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
>  2 files changed, 180 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.example.dtb: pinctrl@11c42000 (starfive,jhb100-per3-pinctrl): gpio-ranges:1: [11] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-20-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

