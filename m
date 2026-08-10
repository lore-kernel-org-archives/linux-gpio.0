Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC721F8755;
	Mon, 10 Aug 2026 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349933; cv=none; b=mRYDUfwSCj+yzA4QGzwvBDgwgySBlcCAfXlDHEdP27GoM73JSLlDvaznq6r3fLV80ceZpmiD4xTiho60lZPn8G1m8XgyJsP/plgKFLevZ9Jm11DSvjt8xQ+tsMfoDTVGXCME4xS/s22OhxjkwkahQkeJfMGy4hE6ba5oLDPHqQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349933; c=relaxed/simple;
	bh=w1uE1LOnD8L1kjB6NNyCEgcJJTdA4JJHit57yk/vwpI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=K4iBFGFI7pIya7H6zNMiwlGfnw56SqNHuXZnz81SBudWBTsfiFHb2AIUyaGglb3u6worp8COXXPbjfaCJrUXQsp5j4mqbGESf9hjT+AhzzQ/S+RLS9YPlBjcz/qDKvfWl8PKH8BJ3oWR/sTZ95OF5vSJ2rC2kzd71rU8Qv6eaWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Alaw2iRl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Alaw2iRl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9317F1F00A3A;
	Mon, 10 Aug 2026 08:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349930;
	bh=t5hQzkM8kqZsALP2IzAn1KYkxb1hxLJQ+U5fl5TA/gA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Alaw2iRlY3lHayBoBEmQdpBiMhSGkabQnbM8kgL/0SkaXHe7LxcHA60JghV1w1fZy
	 m/6SIuNuKWc3+J+tZidruFuW7gXBYlElFpoSeRgAw22cJcMh9pxCVr5qylGq/lp6HJ
	 2raf8RdKN50nNqyF4E42guVqc3/gb37D9iiOqQvsLRGy3PVFzByIwYzlxDhSrRW7B6
	 B5+TvGsm4sfuUPzuIpTAx8rwmtj6qvfOUaS4WNfwCECXw1PrufC2NHHPjICbDdKIPD
	 7mvSA3HcME+3H4FTQHwdwkWdoSyZsnIdrP9ag51gwVuBtI2oxlFPAxteEFMv8C+ry7
	 z2h4FX5u5cDcQ==
Date: Mon, 10 Aug 2026 03:18:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Bartosz Golaszewski <brgl@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-4-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
Message-Id: <178634991918.1014951.7989635238440361454.robh@kernel.org>
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl


On Sun, 09 Aug 2026 23:36:32 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
>  2 files changed, 181 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.example.dtb: pinctrl@13080000 (starfive,jhb100-sys0-pinctrl): gpio-ranges:1: [4] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-4-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

