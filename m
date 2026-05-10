Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761583EA66;
	Sun, 10 May 2026 19:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442364; cv=none; b=N4Ws0hRbUHb/JBw+i1Ee/m8lwTIjMsYolrUB4hePbgH0MQK+CuNjgRaqo0rWrcaV4fZs9hXzy2BU0gKi3eNyUrcdfPJZZv2ZMFJM27gJPthggJJSSG3lAsLvO/jZ2Vm7zjBaOQnO7DZuIAkW1taciY6hH5sHp6wdU67HO3xa08c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442364; c=relaxed/simple;
	bh=++55q2EV37VjjCBJkxUrN4jayg1vRCIIl4/FmHGSMNo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=s0PgB6dm+7sj6J5uuV7f4247XmNtFwX9yunR+2TAsBzoygVKlC+6H7cm5ZBoR7VDWdhJOvRuze316f4jPX7WvzctsPt+yM8L3O5rNmLJqC+G9gDK1gB3pDjiSafTf2JW6zvTxQJ79UhWos1biQ0KeiMscYVhdq7ewcw9Ulgp7a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnm8JwRm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnm8JwRm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5679C2BCB8;
	Sun, 10 May 2026 19:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778442364;
	bh=++55q2EV37VjjCBJkxUrN4jayg1vRCIIl4/FmHGSMNo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mnm8JwRmNV+6NSXr0r7v7exzxbXi5j80Vf5Sfa5Sug7hDl+6jj3JBsrFxw1+0JqGK
	 6EkGmYqJkHtbFr3VD/gdSu8uNGx/3vMhys3Zg/ZxUnfc6DSQk7qEuuBgON4oBnUTLE
	 hVTd7vz4rBQg6nHBwoMt9H9Sh0KCfO9VAzFooNsioKx9l/saHsZK4YiKMThg8aBYSo
	 Ft5IEL9N7ZupmntPQz+fi/GyK++l3cqIJj8S8Vi/9vH3CD/9g7WLJNabEDtHocaPN4
	 RaQIHzxMClfVmQJkpH65Mcb/5pHkbyN2IM4mkRTR2rhhSPdBQfeEu9UEH6zRuV4TF8
	 3c3hcoYcbd2qg==
Date: Sun, 10 May 2026 14:46:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, linux-usb@vger.kernel.org, 
 Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 CTCaer <ctcaer@gmail.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexandre Hamamdjian <azkali.limited@gmail.com>
In-Reply-To: <20260511-bm92t-v2-2-2145e4f4386b@gmail.com>
References: <20260511-bm92t-v2-0-2145e4f4386b@gmail.com>
 <20260511-bm92t-v2-2-2145e4f4386b@gmail.com>
Message-Id: <177844236182.3519904.11223844313176518441.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: add Rohm BM92TXX Type-C
 controller


On Mon, 11 May 2026 01:32:10 +0700, Alexandre Hamamdjian wrote:
> Add the device-tree binding documentation for the Rohm BM92TXX family
> of USB Type-C and Power Delivery controllers. The device is controlled
> over I2C and signals state changes through a dedicated interrupt line.
> 
> Document the rohm,* properties consumed by the driver: the optional
> VCONN-enable GPIO, the DisplayPort alternate-mode toggles
> (rohm,dp-disable, rohm,dp-alerts-enable, rohm,dp-signal-toggle-on-resume,
> rohm,dp-lanes), the suspend/dock tunables (rohm,led-static-on-suspend,
> rohm,dock-power-limit-disable) and the four
> rohm,pd-{5,9,12,15}v-current-limit-ma per-PDO charging current limits.
> A graph port is required to link the controller to a USB role switch
> consumer.
> 
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>  .../devicetree/bindings/usb/rohm,bm92t.yaml        | 128 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 129 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml: rohm,pd-5v-current-limit-ma: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml: rohm,pd-9v-current-limit-ma: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml: rohm,pd-12v-current-limit-ma: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml: rohm,pd-15v-current-limit-ma: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260511-bm92t-v2-2-2145e4f4386b@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

