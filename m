Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259D8238166;
	Fri, 24 Apr 2026 13:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777036642; cv=none; b=rTxQYEy7CvQDGJKHmdf8ZmtQFQ/JSN6AHxcB78/aI59pPYqHcefmjcduBgj5oEe+tomfcBvD+WLunrbeIrQpuDU/z6EuQ3m8ZeOOIdzOtssMwMcT3HrZ8eVd4QzPB1JMBQu+L+8SZ9w0DZTt92cjdHDauUv6iXlGPzfwXd6KRNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777036642; c=relaxed/simple;
	bh=ybYWfkYopakx2x/H9iLMUuFNckKVrkrunJzGWNRPBPw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PGcdtfwfKqrRlxriiwa1s0vsN9d6WZzF7fZdOX+KgBu4L1W7fv/RHwDjaVQ50sjwVaxoqABv4GTWMhrT6iQFsntO14fDzwqbWduRhjX2qjnkCmo/ILqNYH0yveTbZmrh/ItjNsd5F8AdZLM2ly/fkI3ZKWduTEMibo6wJ3vhOv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYbGyF7Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYbGyF7Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA5DC19425;
	Fri, 24 Apr 2026 13:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777036642;
	bh=ybYWfkYopakx2x/H9iLMUuFNckKVrkrunJzGWNRPBPw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MYbGyF7ZKB0B0T2ST0hSVrw6H53j9rp3+/VXCTELXocoSQ2yHnKefjWCXlymyiiR/
	 96CIXSwsKl8xUwfhcdxeWNna84uz0TursRhUw1rdZzujWCK13OMr78211ZRv/oydyF
	 StrM1723kFoXeybwKQUPxnZlJ70bVZeVcRuGXKQpa3+Lz5CiGX7Ois1iqRPqsJ+dY8
	 +LxKO0X16rS4ctu/9bLwetR9PajyI6YQqHyTfE6SwxCWc9kN03QwTITLfesJ3CcbVE
	 GRaZxXdyYWLAKxRjc89GbcFXPDg8nRnvlh6XBTK8UywaweOMXrMygs+IFbOZOenp8K
	 lRivV19PiZhEA==
Date: Fri, 24 Apr 2026 08:17:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260424111330.702272-14-changhuang.liang@starfivetech.com>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-14-changhuang.liang@starfivetech.com>
Message-Id: <177703663942.3732468.14128027555396661004.robh@kernel.org>
Subject: Re: [PATCH v1 13/20] dt-bindings: pinctrl: Add
 starfive,jhb100-per2-pinctrl


On Fri, 24 Apr 2026 04:13:23 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per2-pinctrl.yaml | 178 ++++++++++++++++++
>  1 file changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,ether.example.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
	from schema $id: http://devicetree.org/schemas/net/micrel.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260424111330.702272-14-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

