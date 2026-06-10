Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D398940D580
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 21:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126418; cv=none; b=hV49bn3Pbklv+3T/a2GERowPewtm4eiLzfPtDfrAaMUUFMJ2fmOdVFZ5qX4uS/qhov+yA0QPGNGJ5wNMVwAlej4j73aQWBpoBsJj/s4ryUyfkbAab4iTZ8FXO7D4xqHpBhizl+fXCVXYRvuUubyj+0RCOE4iqfseJc6ss07rnI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126418; c=relaxed/simple;
	bh=v1gqv24Ddr2MKYsZRsj427gjTwvco1fGLOh0zO2Uyd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BETEj9VCNG6G76qa43Z8W0GEIGoR7aLlEZpK0puPEorvL2Nu3JpLDDwaxQ2e47V39u0p+NcV6kVOpJ3NpdHJDmcjGRp+rThSVsdMDHTx9EEhIoBwkdXucSDp8QNce4DgT3JuEkdsduLtGrFW7LADJ60JuNNTqS+AdSz2JDKRvDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L98w+oGd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L98w+oGd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A861F0089C
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781126416;
	bh=HJ9lnraU3gL3V2XICu485Q4fmt5CBL1cj0w1pFLmiZ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=L98w+oGdNbE26c37oAyfU+vfdavpJ7spTqX4xkhmoNyoUfwyBOQArEiV0AYAyclC/
	 LrkEHredTASanLash6pIcaydEJk2cu8oe9yzusMVQomxCQEfh0znw+kRtZeO2AkG8b
	 dvI2rmTWu8jeErxXzkJWYbQ3mZPhzc/RbICTESLERSOzy4TVdlZ1qdfGP/Vkf+xNn1
	 G8OA7sYW2qoeFODuAwjhB6CfAZ+NjFx55wwTxpqmgxAurawp5IynXYVFs+XIzdfe7f
	 6b8kuuXCSu3GXtcsRL33Mp6AyuOOlP/w+ANvGM71ZK1m5s9yOGBmVrfhxKyGEtUn1N
	 moKr0u+uXMp6A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa68cf03bfso7855065e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 14:20:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ85XNnQaQgIstm0djNtohMfBmK83Cw50JrAR1g3e/Dt3pgqjb5c9nGXxKmY/YotqtqhrVSt8EcUeyCf@vger.kernel.org
X-Gm-Message-State: AOJu0YyrruAKSwq360MOBtIfQNCdDLzJSwYiOp5GljcVXMbQs0TYDr10
	+hEXfA0dG80ONWcpgGWhAA3/z5b9TSwuJsjKedM4A7+94MrALMRlI6OBUpMYHHvWVkQ5PADLYHY
	RImQjxxrQytTbQPVdCSlqBg1i7b0r2iM=
X-Received: by 2002:a05:6512:15a1:b0:5aa:77b2:fec8 with SMTP id
 2adb3069b0e04-5acf82ed837mr2557659e87.27.1781126415414; Wed, 10 Jun 2026
 14:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com> <20260610155708.151067-2-prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260610155708.151067-2-prasad.kumpatla@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 23:20:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLkFPb4CZqTsAh_qX1Jt9pWxhwhgbhREe9uybL_S7-t60Q@mail.gmail.com>
X-Gm-Features: AVVi8CcL4md9evY3o4CKNj7rvxGr0XyH7uAL4ERhPsq_jxr4deyl4L86i4tDiqY
Message-ID: <CAD++jLkFPb4CZqTsAh_qX1Jt9pWxhwhgbhREe9uybL_S7-t60Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: add qcom,wsa885x-i2c
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prasad,

thanks for your patch!

On Wed, Jun 10, 2026 at 5:57=E2=80=AFPM Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> wrote:

> Document the Qualcomm WSA885X I2C smart amplifier binding.

Skip I2C? We don't need to tell e.g. "PCI" in some device on PCI and
there is no reason to mention I2C for this device, the fact that it sits
on an I2C bus will be apparent later.

> Describe the required supplies, powerdown and interrupt GPIOs, the
> optional battery configuration, and the optional init-table property
> used to program the device during codec initialization.
>
> This matches the driver programming model and documents the DT data
> needed to use the codec on platforms with Audio IF playback.
>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Perhaps add
Link: https://www.qualcomm.com/audio/applications/compute-and-mobile-audio/=
products/wsa8815

(...)
> ---
>  .../bindings/sound/qcom,wsa885x-i2c.yaml      | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa885x-=
i2c.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yam=
l b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml

Drop the -i2c suffix on the files.

> new file mode 100644
> index 000000000..1069f470d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wsa885x-i2c.yaml#

Drop the -i2c suffix.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm WSA885x I2C smart speaker amplifier

Drop I2C.

> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> +  - Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> +
> +description: |
> +  WSA885x is a Qualcomm Aqstic smart speaker amplifier with an I2C contr=
ol
> +  interface and a digital audio interface exposed through ASoC DAI callb=
acks.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,wsa885x-i2c

Drop -i2c

> +  reg:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  powerdown-gpios:
> +    description: GPIO controlling the SD_N powerdown pin.
> +    maxItems: 1
> +
> +  interrupt-gpios:
> +    description: GPIO used for the codec interrupt output.
> +    maxItems: 1
> +
> +  vdd-1p8-supply: true
> +
> +  vdd-io-supply: true
> +
> +  qcom,battery-config:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Speaker battery configuration, 1 for 1S and 2 for 2S.

What is a "1S" and a "2S"? Include description here.

> +    default: 1
> +    enum: [1, 2]
> +
> +  qcom,wsa885x-init-table:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 256
> +    description: |
> +      Sequence of register/value pairs applied during codec hardware
> +      initialization. Entries are encoded as alternating register addres=
s and
> +      register value cells. The number of entries must be even (register=
/value
> +      pairs); maxItems is 256 (128 pairs).

Can this just be a table inside the driver, if it will be the same
array for every user? If this is board-unique then it needs to describe
what each value is actually doing well enough so engineers can use this
documentation right here to configure their board without looking through
register maps and what not.

Something more abstract using SI units etc is probably needed here.

Yours,
Linus Walleij
