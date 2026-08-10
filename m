Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236453A2549;
	Mon, 10 Aug 2026 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349936; cv=none; b=VTUAvfv/62SZ4VN9zDBekn2jCqWdDCDwp7rFJdwlQe7LMBhZDIxh5/14U52ejNHC6ljLsL+dibBPaZHv9/XnnjNRmrrUbJSIm2Uxgsmdna7ZwtEMAFN5E1vtBmdvC4XeL93G1BqiMKmSKVao14iY7o6TUyieABAiE0wnFsJxDJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349936; c=relaxed/simple;
	bh=qbpPIFzbOOI1AfSAENINk3NfVE4YAxCbem1s+Rt6zvM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GjwnvBgRvdeIcSvB+5v8VSy5cSNIfCPwkzVXdFUTXFGU8lnjhJQ2k3KQaiA/eMJz0ggmNdGaE1rZEkVrZagTT4sXJAO23RHDzpqAg0zsSA3zzD0y7MvZthFNYanrkW+hIXHDFte2OtE7WiOcNiZjItboH+/LmgLb1w4LyFUH71w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mW9FRI7M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mW9FRI7M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89ABE1F00A3A;
	Mon, 10 Aug 2026 08:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349934;
	bh=5IFZsDTW0Op/VJFdoNkzwSLLCb3qBarU/KVg6VCJXxI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=mW9FRI7MykVnKz7VAssJhrb1GhvgszMJ2ZZZ+tIwvBAPvKVXX0IzRyoppTOU3lvhu
	 Da0Ld63ClSfSx34wQs0I1R/x1v3VwoNWBUCKy0/aKiuSi0FtH69Omp5tKMcQuhYrt5
	 idbuVU7ZHMqdRLCM3XQyfCN/wDWpgvixZMsQOVSHul4+WUs2RaQJNonL9yfqoYXM5K
	 D9gfNJbvBLw9TjyrYCYpbX9zQKALhKvXxu6P+Sm2RHFmJayiH3YwbOQ5Uz7b6qfDPu
	 aQ6jnNhboO9WgKCd6ExGn+keNXN7B1U0b1QUEJtASQMJbTnJgjhkha4WLlOvSgJz+3
	 8atNSEfRC2eHg==
Date: Mon, 10 Aug 2026 03:18:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Linus Walleij <linusw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-14-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-14-changhuang.liang@starfivetech.com>
Message-Id: <178634992524.1015926.17874974537496810774.robh@kernel.org>
Subject: Re: [PATCH v5 13/21] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl


On Sun, 09 Aug 2026 23:36:42 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 179 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  38 ++++
>  2 files changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.example.dtb: pinctrl@11b42000 (starfive,jhb100-per1-pinctrl): gpio-ranges:2: [32, 4] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-14-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

