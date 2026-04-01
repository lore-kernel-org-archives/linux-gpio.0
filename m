Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D513C555A;
	Wed,  1 Apr 2026 08:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033524; cv=none; b=oTsjaPue0UXA8NrDD3iMoBjlBtKInDYnUPonkMEZsl21DoGhXLR9chQilftlOCC9dX9BvQEGzgvsV7NhLqBb8t+3ZcqZzEuhJN2mq5X04sJ4u1h8FNpFdr+wpMi7bR10rV1Iy1sgeNBximU6n4vNBIsatQVTa9GFd5D8khwNOGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033524; c=relaxed/simple;
	bh=PJKB1yFEIsW0Wsg2SCBlQHgXyOwUjo42GLl8UW6TOXo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=f0rg8bzONJKgYdmT5ytY5SlQpsEpf0iVY4HjkLg0NexJRZjZfnHjLwNo6PVBFqewel69gebIXORTJsfXEynNxEo6Qm8a6rU1tqNsNDV1BbbmXpRlPbWzv31Ou6Mfpfrn7LWm1AmoybOk8JyK7kN3WiRwscUR1nTf72XFep8W48Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIgzQyC3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIgzQyC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7BCC2BCB0;
	Wed,  1 Apr 2026 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775033523;
	bh=PJKB1yFEIsW0Wsg2SCBlQHgXyOwUjo42GLl8UW6TOXo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hIgzQyC30yKnEaCEdhL1iEiB3/IS5OtP4cR3lgJUJwdI7+Qd+8SDvI+FlKATEjM4Y
	 oAQ7eOlRg3WhmlVYAKWV2vdOTTwzpnuI/FRGz3WhqB7qPKHe9faBYCaYxvn1Q10npd
	 JrEL9KeiR8nJZ5Ubs1bXKjdsLVG8cpp7zdSgw6TQfSlQT2ropcTY59pajWhA0CkxE6
	 udemyB1Y50kTnTSYGqbBeAV3OuZaD3N0qu1SlRmQoYg+Zlsnkwt9h4myXM50I0bVWS
	 L1bhPHiR3qRPmxW+UXwSN1sPuMwH7LVGOGe1cFW6v5qm22bCiEcBSzjb54SXmS31XL
	 LClYXeaSVIRbQ==
Date: Wed, 01 Apr 2026 03:52:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 Jagan Teki <jagan@edgeble.ai>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Ondrej Jirman <megi@xff.cz>, Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-18-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-18-5e9119b5a014@oss.qualcomm.com>
Message-Id: <177503352038.3337366.3471011938955097586.robh@kernel.org>
Subject: Re: [PATCH 18/19] dt-bindings: gpio: describe Waveshare GPIO
 controller


On Wed, 01 Apr 2026 10:26:37 +0300, Dmitry Baryshkov wrote:
> The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> controller, which controls power supplies to the panel and the touch
> screen and provides reset pins for both the panel and the touchscreen.
> Also it provides a simple PWM controller for panel backlight.
> 
> Add bindings for these GPIO controllers. As overall integration might be
> not very obvious (and it differs significantly from the bindings used by
> the original drivers), provide complete example with the on-board
> regulators and the DSI panel.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    | 100 +++++++++++++++++++++
>  1 file changed, 100 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.example.dtb: dsi_panel@0 (waveshare,8.0-dsi-touch-a): 'iovcc-supply', 'reset-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/jadard,jd9365da-h3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.example.dtb: dsi_panel@0 (waveshare,8.0-dsi-touch-a): 'vccio-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/jadard,jd9365da-h3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.example.dtb: dsi_panel@0 (waveshare,8.0-dsi-touch-a): 'reset-gpios' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/jadard,jd9365da-h3.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260401-waveshare-dsi-touch-v1-18-5e9119b5a014@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

