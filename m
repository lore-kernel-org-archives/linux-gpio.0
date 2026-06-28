Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A44C296BCC;
	Sun, 28 Jun 2026 20:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782679890; cv=none; b=i2+EWy+zBSHMvtCmPbWa2KOo/acMfwgTmCv7DdrLT25ef5/AsH3lbsJuY53ur5xf+jasSPUA9jzNDDh2Xs5uTRX0TPKQpc3IdqlVKAa2r6gt8scV7DzaMJLSu6WAl0LxH8rc1FsdHcQ4idNJb+EJ8ET4l/47+OYBgaBYFVMXKxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782679890; c=relaxed/simple;
	bh=NuSoezA6CsEri4HJSkCqu929MiDPypJ9nW5yGSepTgk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=h9ca1s0y6gkN+KVZjpmmog2BCJhNdUGq3oTVp28R0ZtOjKWN2RQhSnuVjDnxEYvQgw/Qp5R3GKwYBqButuu5rnZa0IV65FBnJjZgPbHddLIdGekZ6oC/DdsxGx54XZ5GGYGU2RBnS2YU8pJiUUc9O2zZ3hXBE3aUNdOHal4mi1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rt5qoxJU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rt5qoxJU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C852F1F000E9;
	Sun, 28 Jun 2026 20:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782679889;
	bh=RnAKkvp3tjg0tQG+8c9vd7fLfC+BW+vCdDsM8cjhipw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Rt5qoxJUbZhSdIBOWkSkrlQNxi/j6+hZdwXs+zCnBI9k/yplflXEzLFAk1ZrVAt4b
	 VonK3qFQaM2VAqVGi7n7RwQROmWV5zZcWvPTUp+dwfiTNyKMqT6IKDVC9UZv+nc45b
	 vgHAj7K3bZbDlBigGEW9QYKJTV1v7cmHqii5gEBT81VX64vHte+KdFx+eRszUFxNT3
	 qyeTzKCThUGySt0UooEIX9eVRr0FQ7j0ARp8WuxS4jShw5ueT14y5c7K3/vg0QaKww
	 uTtzVV9sz/ItBnLfQRsaI99B5qmfvhzH+OngjK8LkmWY5zORlQEQdXi4IIvYItULgL
	 nv2rLXDhwOOsg==
Date: Sun, 28 Jun 2026 15:51:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Markus Gothe <markus.gothe@genexis.eu>, Linus Walleij <linusw@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260628143733.273651-18-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-18-mikhail.kshevetskiy@iopsys.eu>
Message-Id: <178267988674.4168191.17911240000077972868.robh@kernel.org>
Subject: Re: [PATCH v6 17/17] pinctrl: airoha: add support of an7563 SoC


On Sun, 28 Jun 2026 17:37:33 +0300, Mikhail Kshevetskiy wrote:
> This patch adds support of Airoha an7563 SoC pin controller.
> Also it adds corresponding device tree binding schema.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,an7563-pinctrl.yaml        |  348 +++++
>  drivers/pinctrl/airoha/Kconfig                |    6 +
>  drivers/pinctrl/airoha/Makefile               |    1 +
>  drivers/pinctrl/airoha/pinctrl-an7563.c       | 1115 +++++++++++++++++
>  4 files changed, 1470 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
>  create mode 100644 drivers/pinctrl/airoha/pinctrl-an7563.c
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.example.dtb: /example-0/pinctrl: failed to match any schema with compatible: ['airoha,en7521-pinctrl']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260628143733.273651-18-mikhail.kshevetskiy@iopsys.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

