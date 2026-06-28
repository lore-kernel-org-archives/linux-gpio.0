Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718EE2FFDE3;
	Sun, 28 Jun 2026 20:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782679891; cv=none; b=LzMNSBD0KgsjMXPVCYJfuexlTGQGlYEB50eVxPUmV9iXSavK2mBserFPGQr5CkKk0eT3Yi+9w6t9KB3uMoxammbX27qU2LfjBawD+2dg67Uhz9SuO4XGs0akWE629amrxmAElGBuj6MWoatwU3wr22Fi6IhdutS+m1+4Y0WH1wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782679891; c=relaxed/simple;
	bh=/Psvts4bK0De9buR/Tb14Gff3P1NfGViWnpQhQj3bbg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tbcR/WgD+sYtJrBXQZmTLuabxesVTMcD8jnY07bnhwX+bIs1DQclbaWLHYFfergdMKbCaEcaT/ZYqkBexa38yeH68FZTdEHXk+fEYXc+8j1lx6y6yamQ+1aR+fUKXkOJquOkgJpNU+FDN1CoZc9ZQVeXNXeALYkKYIDpm4C/G+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H11eCqCw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H11eCqCw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF13A1F00A3A;
	Sun, 28 Jun 2026 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782679890;
	bh=cV5nLM46V6v/htc0lFctV0QauB6Y72+YuHxfHLCch3w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=H11eCqCwY1jc/+hlN4DaU9CVWUaM5QBNrKK6D7zyITL8TzgdMVTvM0Ta6kjU13c/Q
	 KRKDZe7OQZytTmS/I/KD7V+2XB4+E7+PIMzEtHhgQOqwMZ0HMWA60f8gJTHng+35Rh
	 aX/qNg9SuiN7MYnS+etDBgMXQ2UnxFiPNOQoxb8gd7Wrmxnf9seeiaHRvwCGkMOoiQ
	 yB0gVqIqI7vKsh8FKItB0VepxKqaM+BzKpWvmyQynuLdef30/6KnQKoT4SnC0eUjtJ
	 EdDIXkD/lgjHGy6hQ8OBBgsHeLlpzTbZI55P64RAFovUc1OzIKpEi1jkE3kGkQIC36
	 tEPq2zOItg+BA==
Date: Sun, 28 Jun 2026 15:51:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matheus Sampaio Queiroga <srherobrine20@gmail.com>, 
 devicetree@vger.kernel.org, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, 
 Markus Gothe <markus.gothe@genexis.eu>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linusw@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu>
Message-Id: <178267988796.4168242.2437491560145176405.robh@kernel.org>
Subject: Re: [PATCH v6 15/17] pinctrl: airoha: add support of en7523 SoC


On Sun, 28 Jun 2026 17:37:31 +0300, Mikhail Kshevetskiy wrote:
> This patch adds support of Airoha en7523 SoC pin controller.
> Also it adds corresponding device tree binding schema.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,en7523-pinctrl.yaml        |  375 ++++++
>  drivers/pinctrl/airoha/Kconfig                |    6 +
>  drivers/pinctrl/airoha/Makefile               |    1 +
>  drivers/pinctrl/airoha/pinctrl-en7523.c       | 1124 +++++++++++++++++
>  4 files changed, 1506 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
>  create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.example.dtb: /example-0/pinctrl: failed to match any schema with compatible: ['airoha,en7521-pinctrl']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

