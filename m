Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A13B71D9;
	Mon,  6 Jul 2026 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353418; cv=none; b=GXlJ2qSINgAZpGMjrlnaGVG2RsKnwrC66Kl6oltefyqy4j0wnh79w9Yhc9wLWoAnnHBFnD9lBBev6nddkeXmIeTSvyDyXyUXYV6ApLX+WJ9MKQhJLVnbDfYQKmQHpE6SGvtRDT2kGrvAtzGX3f9XvYJ7f+AQXd7tx3ThVzzsrBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353418; c=relaxed/simple;
	bh=2kFLrfr2SmRE0cZj3dKv067Bp9MA9JMZgbktTc+AwTI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=edDbP43ipe/+ida80wutd1SVO7H1f3DObdy5IW3GZo72I9u7G1Ue+WAiKYHITtpo+dSI76AJn5MGbuy1Ah74MjffN1yZ+DYhkoeOOO12wCkpRoyQj8SJJ4VUzGyJnbfsuS4G9B0iRE9FbUKnGPvGHwsQMea7UhB5o8mOFT2pYkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqT1GJ1b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqT1GJ1b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D5A1F000E9;
	Mon,  6 Jul 2026 15:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783353416;
	bh=nzzdP7uvLDDy9UL4t9qBVucGAuCunMPD4JQqpl+vDcM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=MqT1GJ1bJRdM9xmfUyrkptepYB8rQuP58TiM3OO3GSgwI0hO57MQJRVIh/NqXA5vq
	 IJfhTHqLw0HdmpR1kRDKlTWFING2AWZd7K26eRvJ2lpENh+rL9adpv9IDSluwTowmM
	 E6nQsSQq3KqCWB4o6UEtBkp6gPxIQvI4NHfRbWgj0UIctg4Zy8T3U6OOBrgp9j5WYC
	 GA6ChGEn7i9OnVvagil2o/rXxBbv8WLdewrAXRKnj2veT5/lYJMmNC4B+W3T3FtvvN
	 hFhsEkzzz/RRtca2rnmoWn9TGOqNmxmntnszm3uIXoS1KWFTqxWHVEoWCB4HznaYCl
	 5koCKuiYNrGGQ==
Date: Mon, 06 Jul 2026 10:56:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: me@brighamcampbell.com, skhan@linuxfoundation.org, linusw@kernel.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, linux-gpio@vger.kernel.org
To: Udaya Kiran Challa <challauday369@gmail.com>
In-Reply-To: <20260705132521.159522-1-challauday369@gmail.com>
References: <20260705132521.159522-1-challauday369@gmail.com>
Message-Id: <178335341606.6594.1044367992969150438.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema


On Sun, 05 Jul 2026 18:55:21 +0530, Udaya Kiran Challa wrote:
> Convert Microchip PIC32 Pin Controller devicetree binding
> from legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
>  .../pinctrl/microchip,pic32-pinctrl.txt       |  60 --------
>  .../pinctrl/microchip,pic32mzda-pinctrl.yaml  | 141 ++++++++++++++++++
>  2 files changed, 141 insertions(+), 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.example.dtb: serial@1f822200 (microchip,pic32mzda-uart): 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/serial/microchip,pic32mzda-uart.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.example.dtb: serial@1f822200 (microchip,pic32mzda-uart): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/serial/microchip,pic32mzda-uart.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260705132521.159522-1-challauday369@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

