Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3E93A48F6;
	Mon, 10 Aug 2026 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349944; cv=none; b=OfZLV8AwGW4tmz/N9wnAe1kiSs3qioyiTrlG0kW2X1/mCAmPv8I16+02PQzbnMQRN3/8CLwYxRpqtgbQbFQjQKQ7NJ73YOa6Z74gbySJ79ZjhWfnLJ2NuQWJCRsEtPVX359UEMKENR8T8/st426FnBm/nZeZTc1Dm7ULk7a46jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349944; c=relaxed/simple;
	bh=635qkTgQwZY8pXI0Xl0LWEzUm0/H09eJzZmGPNFXtBc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tTP7jh59dak9Tz7ZmiM2Rucmwv0bzYiJFTDoe8OP6pBHLh+XePqUNOHD8udGwINEfWZldq+D64C9C/bQDA1zPYv/djGLnKHQngLXyAvOi+K/gsib9IQhDDiz0JVxADn+hIJTPFcIL7QaN0oibSnhZ1T6JJ6/jWJMfNG026o5cT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emvcmelt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emvcmelt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884C61F00A3A;
	Mon, 10 Aug 2026 08:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349936;
	bh=MBOxvzFvzqzYrkTgs+h4l3HsL4fIXNlewyBtSxQMax0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=emvcmeltCBGI/OJ2D0jL+Ak/k1lfbmODttBmGcRSvggj1XbTtZ/uYNpfzork/567i
	 AXypBwenK+4SrVvGqUIMWtgPicJ57WIah7f7PfIwInsCLkvkqYf7uydSCg7hx1dpjD
	 1cZe8J92ITq+Oifn1utuYd0YVuSQZ8891/vQRFjH6q7P7em7pxcHbDZuRSRn+zRgY+
	 XxV9KmWpwfhcM3p3qf6/CYIl4qj4P2OxdZZRhKPIXZh4MEvKNbLeeWXjFZw9PmvSga
	 DBJFrNn61Y9bBxYv0OedtTU2ZvI+hTtCeuUQ3qZ7E5lfKYxMFkVBuTJF3Tot1xg2l1
	 xRadpOc1GTwmw==
Date: Mon, 10 Aug 2026 03:18:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, linux-kernel@vger.kernel.org, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 linux-gpio@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-18-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-18-changhuang.liang@starfivetech.com>
Message-Id: <178634992843.1016409.38224131283215948.robh@kernel.org>
Subject: Re: [PATCH v5 17/21] dt-bindings: pinctrl: Add
 starfive,jhb100-per2pok-pinctrl


On Sun, 09 Aug 2026 23:36:46 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2 Power OK
> (per2pok) pinctrl controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../starfive,jhb100-per2pok-pinctrl.yaml      | 162 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  20 +++
>  2 files changed, 182 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.example.dtb: pinctrl@11bc2400 (starfive,jhb100-per2pok-pinctrl): gpio-ranges:1: [18] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-18-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

