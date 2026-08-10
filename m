Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E123A1D05;
	Mon, 10 Aug 2026 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349935; cv=none; b=MimULi6/D1qmA59/HDT+u3VJ25kJ3Pu0IBtIz+Dcx01XmxkACSQZbmvg2E3qAA4iAqWqE5olJ2C4cShh1daBgKMi89Oy7jUWSuOrGm+TLDXeo6ju05FgBh7Fd843iVfq2sKmM3hF9c5nlPMtchaUxUfArqZZI6UDnezWUoC9h6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349935; c=relaxed/simple;
	bh=WTKRcWKAyH9AuHnmEc1PKZ4zfguvVKxhQHYLiS55sBw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=gqfEx2abynsZUj/tIniA8LuufuFdXNNv6+Nrkq8fJ/NgE11w9t3/Yc4CWw02Z1ExJJJ5cT4MGV/3LGqHBt9PdIYps7OSU+kRBro1F5lP65KknmmXsp1dKIg9E1KmWKhK3+6QALzStqMuBuBILQNUeikVkjLE+QDbq+5z8SRbuGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTrUaKY3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTrUaKY3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865CE1F00A3F;
	Mon, 10 Aug 2026 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349933;
	bh=w5TmhqduLxJhLY/20/Yh3esA5TuvEJmnXf0uqG3F2/I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=CTrUaKY3MKo3xIPliZwE11ufzUhs2ZhUdIi9Hhg5+n2rRAAqOSQ88gD/Que44NI0M
	 +MB4IciVoyFYTTmg0mZLlp2PisWRkI6vvcH2EOKh+LMivgFVANiX8Nb6Jc6R+voHex
	 l3TXkbboXzPT1TyAfLx5z0bv1NW0dfddzObna9E2502yaWob+JdNjQfgJDkvSYeBS0
	 xfHTgY3Soy0BjTcdHw1ZBYkztTaQK++6mc2pYHo7lIyp9TuVfyv4D1Y8kWb0lY8hXV
	 ir3Ah4o9CNOvcc/gdADL6X6g1f44QaCw+RuqjI+sf8F/c3tG0WC50eQv3A3sHDfDpC
	 AOc8pWlcpXoKw==
Date: Mon, 10 Aug 2026 03:18:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-12-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-12-changhuang.liang@starfivetech.com>
Message-Id: <178634992385.1015685.8678439562395483337.robh@kernel.org>
Subject: Re: [PATCH v5 11/21] dt-bindings: pinctrl: Add
 starfive,jhb100-per0-pinctrl


On Sun, 09 Aug 2026 23:36:40 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 180 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  62 ++++++
>  2 files changed, 242 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.example.dtb: pinctrl@11a0a000 (starfive,jhb100-per0-pinctrl): gpio-ranges:2: [32, 28] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-12-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

