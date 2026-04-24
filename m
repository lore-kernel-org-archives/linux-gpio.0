Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2332427FD74
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015594; cv=none; b=jWLkBK1e8G49ipsdnFZRWVOCgbZohG3hn8L77dyt31GOwPbA77THHLSu1rlZNLKdrZ3/sEUMho8Tpom0h8xpSUYepoi3M2FP5EbYWQa/n+z1Eb8cWtj/Vp4/PBOSp22b1WcVGXHPLvQG+VQOJImJyXd4THRur9RvEgATaBCtpMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015594; c=relaxed/simple;
	bh=m3OnOKNjVkQfvjbC8vrwVb5oJK6foDK0Kguq8tXWdSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4Z7TEg/T7UF3cgTExareRrrinQip74H+mNNG737tcy0UZdQHWbbgIdrBoLOw4+DprzYC4I3oWp0hKtkebWCKf6BLcaAqgiB0Wro4Ay+OoBPmyKU8mGvPsfh8NycMXj4Fip0ur2Ahk5LwwisTsg7NeU94ncjcgjCGdKvNddWlBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e11Bde3d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e11Bde3d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C54C4AF0C
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777015593;
	bh=m3OnOKNjVkQfvjbC8vrwVb5oJK6foDK0Kguq8tXWdSo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e11Bde3dkLLbc0SCXq7yrsallptlVV4pT7hOvAZ9EQdzToIQzZv7oNhx6TJXA7DY/
	 9QrcDG9bjBKqhxqUI/PPyJPHvSslG0BPu0KL6OnPNardT++2KXIgJ1LQJfXCmvwobN
	 /r/vOHl+6hxWWFark0qRvXcTcCTukHcfYHfu/hbWFg3/HRhbloHfX/H4foY49ACqTL
	 VvljpCWKZa7NnBa8FM87h/y+yJkEBTLGqoeHP8ZkqkrO2G9yD4V7AibjBa7N22rMab
	 xcKyF/koJ4YpSigvP3ylBQ5Zch6sec+weo+rWWvZMAMszOFIwbYPHQW0mjqgD0Aehp
	 OQ3tchQtpW/SQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a415fd6bceso8378390e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 00:26:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/p84VhcKoOrSmpaV4aPF4K32xU2Wa9BEkq3JW3Spwf9943o6vV1r7beOqczlDIcHsV6bmq5kYRjnmG@vger.kernel.org
X-Gm-Message-State: AOJu0YyRXaJfJDSK8sIvi55dNDEIwaa5tuxvLJk/mUCSKhHJKBdit80e
	6gwrfgGcqA0t5PZepSwZvQyT84A6nGvzT169g/7Lvhvw3YKDcxu+aELOyR1hhoQiT66fRE2wf80
	lMJTrhY6uFVQCAQf1NyxLFOAqwqpx+0U=
X-Received: by 2002:a05:6512:3a86:b0:5a2:9b98:f280 with SMTP id
 2adb3069b0e04-5a4172ac06fmr10262099e87.22.1777015592508; Fri, 24 Apr 2026
 00:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
In-Reply-To: <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:26:18 +0200
X-Gmail-Original-Message-ID: <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com>
X-Gm-Features: AQROBzCvj1UqvLHeNE2eWeWx72NKzjKr6xPICatDGA6Oq4KfxHHermVnTdGUct0
Message-ID: <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add Axiado SGPIO controller
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petar,

thanks for your patch!

On Tue, Apr 14, 2026 at 3:49=E2=80=AFPM Petar Stepanovic <pstepanovic@axiad=
o.com> wrote:

> Add device tree binding for the Axiado SGPIO controller.
>
> The SGPIO controller provides a serialized interface for
> controlling multiple GPIO signals over a limited number of
> physical lines. It supports configurable data direction and
> interrupt handling.
>
> The binding describes the properties required to instantiate
> the controller and register it as a GPIO provider.
>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

(...)

> +description: |
> +  The SGPIO controller provides a serialized interface for controlling
> +  multiple GPIO signals over a limited number of physical lines.
> +  It supports configurable data direction and interrupt handling.

This is pretty generic, can you write some details on how this happens?

> +  '#gpio-cells':
> +    const: 2

Are you sure you don't want to use 3 here instead and split the 128
GPIOs into 4 "banks" second cell being the bank number?
<&gpio 2 4>; ?

Maybe this also solves the 512 GPIO by grouping the GPIOs into
8 banks...?

> +  '#interrupt-cells':
> +    const: 2

Same there.

> +  design-variant:
> +    description: SGPIO design variant size in bits (e.g. 128 or 512).
> +    enum: [128, 512]
> +    $ref: /schemas/types.yaml#/definitions/uint32

Just use two different compatible strings and infer the variant from
that string instead.

> +  ngpios:
> +    description: The number of gpios this controller has.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Same here, certainly the 128 variant has 128 gpios and
the 512 has 512 GPIOs? Just use the compatible string
to infer this.

> +  bus-frequency:
> +    description: The SGPIO shift clock frequency in Hz.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Don't you want to use the clock bindings and a clk property
for this?

> +  apb-frequency:
> +    description: The APB bus frequency in Hz.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Dito.

> +  dout-init:
> +    description: Initial values for the dout registers.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 4
> +    maxItems: 4

In:
Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml

you find:

  lines-initial-states:
    $ref: /schemas/types.yaml#/definitions/uint32
    description:
      Bitmask that specifies the initial state of each line.
      When a bit is set to zero, the corresponding line will be initialized=
 to
      the input (pulled-up) state.
      When the  bit is set to one, the line will be initialized to the
      low-level output state.
      If the property is not specified all lines will be initialized to the
      input state.

If this is what you want, use this standard binding instead.

Yours,
Linus Walleij
