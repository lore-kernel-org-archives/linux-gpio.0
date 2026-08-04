Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6012C3B0AE9;
	Tue,  4 Aug 2026 18:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867557; cv=none; b=jiSun72PY/Ny6tLtOXYUXnJRXJV+A/1/238Q06j6xDGquu37rpFpHGeDW19aeeWEGXcKXDpJC5Z/RIZUchD1d8gkXw2gcWiCBpFzPf43nE1j88TKwY+Dk6pXQ9JQohlCfO+7GJ4W9GohJCttsgf1R9sNoYgZEsIIracjoT5tBjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867557; c=relaxed/simple;
	bh=IHNmoinBiS5yU4rUy5lNfnt0mQUIOn7JcR7Elda8a04=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=h7+Z0tS+WKNxdwnmIq4uLXOfIWfmTkyX4DFQ7HlU/R4iXpYsTdhaT0vsFEMqhSuKB8bt7v9RKd1zJ0zkoacs7qeG78/ogM3uc2joUqyOGn5aX1UMHgi+Dp/wdippFDVQfIVhdeVI+shsb4QMWhaWkZqMqDfRHl0BJvBauqPNk0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrmPXysU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrmPXysU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9601F00A3D;
	Tue,  4 Aug 2026 18:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785867554;
	bh=KLWdgoj72X7gYA+zfXeLMZVYaknsrJZqnd69HBm6HNk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=FrmPXysUCZEt8mNYBDx1sY1oyp8ARekQX+9LKmuw7LLRlZrfPtbXbYi4nQG3bs/eF
	 HBbp4HRFXnUNpKxzpNHkt4I41TzrbkjZUXEpQNJ/iKgruEw7qJyGpsi6oReMa31QYW
	 TLIEIt0bF5N28uIr3Rhk2eku+u4ZgSxOEyds56GW5FENal6BTeVCFDA/TQWGrU4U/m
	 RdbGv8iAgTx77UJEWzH9t5afbJbHU/3kBk9/FZwDFctmk/4nGarsUQgrkYEX0X57Bi
	 wwOZyOEW+XVqBzoV5s7tLDChuPwMkvBLbfmKYzsMR/V/jPMOBAZ5qyNr3jMRceWR+z
	 eY6uQy0+Mc2/Q==
Date: Tue, 04 Aug 2026 13:19:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 Christian Marangi <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, 
 devicetree@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-mediatek@lists.infradead.org, 
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>, 
 Linus Walleij <linusw@kernel.org>, Markus Gothe <markus.gothe@genexis.eu>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260804160419.3592327-37-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-37-mikhail.kshevetskiy@iopsys.eu>
Message-Id: <178586755228.1262850.17111662755765518608.robh@kernel.org>
Subject: Re: [PATCH v9 36/36] dt-bindings: pinctrl: airoha: add support of
 an7563 pin controller


On Tue, 04 Aug 2026 19:04:19 +0300, Mikhail Kshevetskiy wrote:
> This patch adds device tree binding schema for Airoha AN7563 SoC pin
> controller.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,an7563-pinctrl.yaml        | 348 ++++++++++++++++++
>  1 file changed, 348 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260804160419.3592327-37-mikhail.kshevetskiy@iopsys.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

