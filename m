Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B35C43CE41
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582335; cv=pass; b=bBQrpOLQX6jmwhrbT3tloSxbsa2KXdYnZ7Ssr53V2G3cPZkHEDY1/vpehPuIPmccdAQUTKoJgcijNXVTE5LGDwtaJwn3d6/8x5OZwYsba/0r9R1HM3L/AnWMorUedsgwFxVU/ab3wGzJzeIGdzl5q0mPdblCko2TMpH+tzVo6AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582335; c=relaxed/simple;
	bh=uIVVpMDmMGX0h/fu4HXu0BYDldpKQW0ZxH1umBAPys0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ECAHotUGr438acyxBIZ9/LwFO+728zUOwI0K+LjncZ6GmPF9iGDwoDzeW9Xiu9o6j+SoUIdgrDtM9pzdJbOFNOMx3ZruC3hQUio0SeaqRm5r5uFVSIiI/e7kTfTqmIMW4dpc+Iso/sMjKrCYBWhCt/80cAotFzDgn6LwT/x7fYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VvZkwirj; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VvZkwirj"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso5754188a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787582330; cv=none;
        d=google.com; s=arc-20260327;
        b=LOyoqAfVkhXb0VRC4got+9Xvw7PbwO/Kr8GMyNK8xGFRU9kYChQNdPMhXIyq43n1Wv
         N7m5nqmSxvk73qsPyMtroM/EOKplAXF4F1XGjT/vlc3cSfHQXOKJVSOoRyBvoaC+gQbW
         EvvRql6S7evONIsdLR4g1lyoKNle6Rv1XdhxYpvqRIsvT0+IzA3986jNiC3KEbCg5AZw
         toR1r0XyXtNOVxN27XUAEGaBbSXdWcyrLfjjHo7gHbBAdGdwXYbvfNgquWlwOEyBIqxB
         cSm72vwG4V/olVgBSrfU6QgWcOWTdKz03U3melT/glFayqra/gupl2N1vmvJqrWhi13x
         lCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        fh=gtR7Ui2T1QRtjA939lMeWbgNagp1wSCWixYi5Cb1oBw=;
        b=LXOusIhSUEzDLPtlX4piuxvjiYS+b+GIWIqhHqbQ1u/5G/KDGdHIdwPvDOfGalYsSt
         Ri/GsaTG37yEojq88g+0/yX7sfHUt9KTosnpzpplzmcbFQWt7aaFgoUg+h7oFJ3oLotT
         WN+I+h8Usa2yCv7Ll+DTNoV/oE3M/auEbF8X2b/FRMXIJPOgUJSsnFbkJMXE69dCOcml
         XzAVmb1cSOEXKZa7kfoU+ZmX8C58yBr2oQ0JmSJFoy+lVjXhVSySu4u1BoY4Hna7QamK
         +uWQsjns0Tc0PhjQcSEG9V5dBJ+j2B53cDmSa5O0aktkYSFqAHf4DfEU7+IPuDJzDw0k
         Z/MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787582330; x=1788187130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        b=VvZkwirjYSsd3dI2r3gNzvi5pI3wSfJrsSArNnW9Y2ROIlS/8QRqNL7LGDH9aypVsc
         23FFX6uhpzplKWd9Tpj7WM7Upx/qo58j3lnRS+OpS2bSjfCKL2vV60oEyXYqJFvszkS3
         sOj43oeVmWALH3aG3FgepLaidHbJf1cZ1J2UMl+DbxeRlgCMuebqjY0i3h492P9LXFSD
         Ku5qlv5/1IaE5Bryclv5tUNCFYY1gbwZYrSNXeAWy40WyrDTiPMH0h9YsmThxk+ATW1s
         pzvzRncB89LCfhFdxCyWHj2T2ytuIhdFRSNun2OBa5y4UKTa9XL1y6pTWgkNMqdkytUa
         Tqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582330; x=1788187130;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        b=UKPF8HlRmpZrf34G5n9Zcf+0VOoh6rXSFfCKhwcGWhqc3E5EqjCw3KXBm9QIwyn4Gz
         27AWZj3Tt1x8bw4R99kqaJE+d0pctuYw2zUeC+/rvH6cg0XZ5J4opemXRD4rDn7NoCqB
         WYkzVrKnLmjtCwqnvQGzfkfSupeOwv1ywaUM5wJx/cNNRI/XreW89REi4kPD3U8u22Rk
         8wD2YgI1D380TTbqy54C++fXs0/PZJTWRzjDN0ZL/iHoKDP3IVmG7aPZg1nV0CkDxcsS
         fHjxPKxxfyPfZOupL7voLzdPXLPgpnnDeiWU3pVIDbjUFCLzdQrFlcbYtgHIEtNva9/5
         7ETg==
X-Forwarded-Encrypted: i=1; AHgh+Rpas4TgoJcI7KEvNpqv9B3CuBHC78oRFRCrU4Wa77/6Y7+52FankuCeLIHFFlohk8cTKcI6sbTrJKEK@vger.kernel.org
X-Gm-Message-State: AFuF++kuyOhG5DENXdqcNZ4uIp+OxUOyVJRS4xYeiXuROdiN0gYuKzUj
	UuUJZTJHkQTijij/PBKhxmcSpinZCcsvnt8FdhPEI+iwA2iVY1Xmohd4lLqZ6dLY5H4wfPrMxLc
	EqIQhCoSMjUvqsLqTv1gDSeo2aJ1KSQjFuQxscUgBag==
X-Gm-Gg: AR+sD12g1cuHk5XzNmk9Usn1mZcUBjKwoWdShB6DkCPQtW2lOdBdLslXZe5USaN+kjx
	HcjMhkocmY7U0d5OuiDH/ILldiP/HsIwgRWQlZdtE2qZ9NUTtyKzgdf31zbS24LohvGPMH8jpPZ
	EElabT0AHIIftpyPOFmE+wNBTo02SCVraVb0zh/S36i8yokUvrLcl+hyEiUZ3GAoeCtE4mX7NHx
	J0v+gCNi4cWOgIiDgAqZYTL1YWPF4OB+cWwdxB4K/0jKgOt6kbf3KgW+g5cU6n5COj3sOkSYSw0
	AnLM+VfaJPwoW+z1gwgiz2RhUkABqzalCnFZPoaX89A5MngKhKJhKDvXeXz5oLs1vPy9D+BqQoM
	2TZQ=
X-Received: by 2002:a05:6402:a50a:10b0:6a4:cc9:e32b with SMTP id
 4fb4d7f45d1cf-6a582b608b0mr13946214a12.9.1787582330522; Mon, 24 Aug 2026
 07:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com> <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 24 Aug 2026 08:38:38 -0600
X-Gm-Features: AcwNN1WkCFZbvWxe4PQA8OwbQcV2Qi4oWD0S_a9VEHwbP89HadQ5rWBGiqMxI74
Message-ID: <CANLsYkxZbr9hKaJJGXwYXErLwQ-A07eb-oeNXY1CceHHa0Tdmg@mail.gmail.com>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jul 2026 at 14:48, Shenwei Wang <shenwei.wang@oss.nxp.com> wrote:
>
> From: Shenwei Wang <shenwei.wang@nxp.com>
>
> Remote processors may announce multiple GPIO controllers over an RPMSG
> channel. These GPIO controllers may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
>
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node. Each subnode within "rpmsg" represents an
> individual RPMSG channel. The name of each subnode corresponds to the
> channel name as defined by the remote processor.
>
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
>  2 files changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> new file mode 100644
> index 000000000000..41eb2e149942
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic RPMSG GPIO Controller
> +
> +maintainers:
> +  - Shenwei Wang <shenwei.wang@nxp.com>
> +
> +description:
> +  On an AMP platform, some GPIO controllers are exposed by the remote processor
> +  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
> +  structure and communication flow between Linux and the remote firmware. Those
> +  controllers are managed via this transport protocol. For more details of the
> +  protocol, check the document below.
> +  Documentation/driver-api/gpio/gpio-rpmsg.rst
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,rpmsg-gpio
> +          - const: rpmsg-gpio
> +      - const: rpmsg-gpio
> +
> +  reg:
> +    description:
> +      The reg property represents the index of the GPIO controllers. Since
> +      the driver manages controllers on a remote system, this index tells
> +      the remote system which controller to operate.
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml#
> +
> +unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..b9b559b186af 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -88,6 +88,34 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Represents the RPMSG bus between Linux and the remote system. Contains
> +      a group of RPMSG channel devices running on the bus.
> +
> +    properties:
> +      rpmsg-io:
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "^gpio@[0-9a-f]+$":
> +            type: object
> +            $ref: /schemas/gpio/gpio-rpmsg.yaml#
> +            unevaluatedProperties: false
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
>  required:
>    - compatible
>
> @@ -150,5 +178,30 @@ examples:
>                  &mu 3 1>;
>        memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>        syscon = <&src>;
> +
> +      rpmsg {
> +        rpmsg-io {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          gpio@0 {
> +            compatible = "rpmsg-gpio";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +          };
> +
> +          gpio@1 {
> +            compatible = "rpmsg-gpio";
> +            reg = <1>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +          };
> +        };

As I (and Arnaud) have stated before, I don't think this is the best
way to lay out bindings for rpmsg-gpio nodes.  I am currently thinking
about a representation that aligns better with other virtio devices.

> +      };
>      };
>  ...
> --
> 2.43.0
>
