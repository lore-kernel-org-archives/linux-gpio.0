Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30F45372CF
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 21:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889053; cv=none; b=sx9sLU74G+jqMkIlV1P4kX10SqSp9O0WXOT/Wz9fVRZ2k2DevuP/KsMbWH8njCO3ERt0kRurNR9tn6Iuwdo7NvWh0Lj0Djl89Op6JPbMpYofStm38+T4U/jLAMkS/BpkZXUx4xQaitZAwaYx0NtXSOV5BUaHsfHrwp7IfZRciww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889053; c=relaxed/simple;
	bh=092/HcEilVmakxy5W8wqV0dSID2JMH7R03jCCFy4RxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRh+yyd7TZ2mYvteBm4iA41O11d6EAJnB/SHCQqO5J2W8p2Nx9I4b9LCfPuPi0Ko29pJvpDUk/gXXMiJPV0KwK3V6LZksxwsYK9lSisHoRB8gESWwCo3MORptzvN/ntCT3vh2uDPWPb7gL/HVFjs5lmyfU+IjgB31NG7sxaKKso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddwwBZ84; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddwwBZ84"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FA51F0089E
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 21:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790889051;
	bh=Cv/AHEsBbnYG0BEg3b4FxMz/rNctK75WTcep6/1Bhe4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ddwwBZ84yvtt1R2029E/eH4Z+7yntVZy5kecE9fWb7IL/X16zEkvTHQm2s0UHtQcX
	 Ns3orOrmaydJVkrCWEDl6C806roFrNuPim6F6ENsrWrS7t56jLiQE9VU/lUKpmXFl7
	 khh93F5bLaJv8wQY13t6bODnKGs5sXQPlUYw6Xo9X/ffULFOENIxyxCtAi3upzuMeb
	 Ve57/0L90zvXbqCoRR/SvxUZhkXP3Laankhc3W7eAMoQ3YOXShX/MYw8oblcX6CtGr
	 1NFg6hxgZx/asuCWf+DC13XBQjof4Bvh5Y6nOceYYZYVnHHiuKcIGbDd8sug65MmCx
	 rpEiVfol3riDw==
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a87e1f5c81so2601351fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 14:10:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwFn0LvfQi8+IZ/915pu44bgMc++ePy1dMmk7xXOUr51ELYvhOe+Pz7oIh1FAPe/CYKAk6ccGfhDiUw@vger.kernel.org
X-Gm-Message-State: AFq9FYIYBmoyIduFsixf+nTaqQ7iCV2iUJ6+FgLS7GefhDq+wcUREYrZ
	V8el3OXzy5jDmLpY1xauNIZDCNxnwNdYAyUFKqUUKAlfRk7LAXiVZHDDuBQ5wbMTKfI4pSqjK3F
	PmGx/EHhjilOAvF1sSC++M67Q3J/bUZY=
X-Received: by 2002:a05:651c:1987:b0:3a5:b187:c7a3 with SMTP id
 38308e7fff4ca-3a87f7d8b35mr1130761fa.2.1790889049900; Thu, 01 Oct 2026
 14:10:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com> <20260930092020.1047221-2-y-abhilashchandra@ti.com>
In-Reply-To: <20260930092020.1047221-2-y-abhilashchandra@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 23:10:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLnok0bz9kXiW=O8+4fPBYvm9nG-AA-8CopDpc-DBvBiJA@mail.gmail.com>
X-Gm-Features: AclHuK_xn_-CKnIZzt8Aiza52a34qEVHcG5dNEDn3VR0fTXp_jLDfo12LQfvZZ0
Message-ID: <CAD++jLnok0bz9kXiW=O8+4fPBYvm9nG-AA-8CopDpc-DBvBiJA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add TI TDA54 pin controller
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, 
	vigneshr@ti.com, kristo@kernel.org, brgl@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, afd@ti.com, 
	u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yemike,

thanks for your patch!

On Wed, Sep 30, 2026 at 11:21=E2=80=AFAM Yemike Abhilash Chandra
<y-abhilashchandra@ti.com> wrote:

> +      ti,debounce-select:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3, 4, 5, 6]
> +        description:
> +          Selects which DBOUNCE_CFGn period register in the control modu=
le
> +          drives the debounce filter for this pad. 0 disables debouncing=
,
> +          1 to 6 select DBOUNCE_CFG1 to DBOUNCE_CFG6.

What's wrong with the existing input-debounce property?

  input-debounce:
    $ref: /schemas/types.yaml#/definitions/uint32-array
    description: Takes the debounce time in usec as argument or 0 to disabl=
e
      debouncing

Just translate usec:s into your custom format in the code, problem solved.

> +      ti,virt-gpio-instance:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +        description:
> +          Selects which virtual GPIO instance controls this pad, allowin=
g
> +          protection between multiple virtual views of the GPIO control
> +          registers. Has no effect unless the pad is muxed to GPIO mode
> +          (muxmode 7).

Wow crazy stuff. OK keep it :D

> +      ti,wakeup:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]
> +        description: |
> +          Wakeup event configuration for this pad.
> +          0 - wakeup disabled
> +          1 - wakeup triggered by any change of the pin input value
> +          2 - wakeup triggered by a low value on the pin
> +          3 - wakeup triggered by a high value on the pin

I just have the feeling this should be a generic property. It seems so usef=
ul.

Can you just add this as wakeup-mode =3D <custom value> in
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml

> +      ti,retention-bias:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2]
> +        description: |
> +          Enables the internal I/O pullup/pulldown resistor when pin ent=
ers
> +          TDA54 I/O retention mode, and configures the I/O pull resistor
> +          direction.
> +          0 - OFF mode pad pull resistor disable
> +          1 - Select OFF mode pulldown resistor
> +          2 - Select OFF mode pullup resistor

Use names inspired by the generic config types and flags instead
of enums.

ti,retention-bias-disable;
ti,retention-bias-pull-down;
ti,retention-bias-pull-up;

> +      ti,retention-offmode:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        description: |
> +          I/O behaviour when retention mode is active.
> +          0 - I/O maintains its previous state
> +          1 - I/O state is forced to the OFF mode value

Behaviour of *what*?

The driver stage?

I suspect you should make two bool flags
ti,retention-output-hold;
ti,retention-output-disable;

> +      ti,retention-output:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2]
> +        description: |
> +          Output driver behaviour while the pad is in retention mode.
> +          0 - output driver disabled
> +          1 - output driver enabled, pad driven low
> +          2 - output driver enabled, pad driven high

Make three flags:
ti,retention-output-disable;
ti,retention-output-low;
ti,retention-output-high;

> +      ti,retention-force:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        description: |
> +          I/O retention controls.
> +          0 - gated by the Device Manager logic
> +          1 - forced active, overriding the Device Manager gating logic

This is clearly a bool flag. It should contain device-manager as that
magic entity is involved.

ti,retention-device-manager-enable;
ti,retention-device-manager-forced-active;

Both seems to be related to the device manager whatever that is.

> +      ti,isolation-bypass:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        description: |
> +          I/O isolation for this pad.
> +          0 - isolation preserved
> +          1 - isolation bypassed

What does this even mean electronically speaking? Explain in a description:
statement.

ti,isolation-preserve;
ti.isolation-bypass-enable;

perhaps?

Some of the retention settings seem *very* generic, c.f. this
from include/dt-bindings/pinctrl/nomadik.h that has been
around forever:

#define SLPM_DISABLED           0
#define SLPM_ENABLED            1
#define SLPM_INPUT_NOPULL       0
#define SLPM_INPUT_PULLUP       1
#define SLPM_INPUT_PULLDOWN     2
#define SLPM_DIR_INPUT          3
#define SLPM_OUTPUT_LOW         0
#define SLPM_OUTPUT_HIGH        1
#define SLPM_DIR_OUTPUT         2
#define SLPM_WAKEUP_DISABLE     0
#define SLPM_WAKEUP_ENABLE      1

SLPM means "sleep mode", yeah pretty much retention...

I think the corresponding retention settings for things that are really
quite generic should just be added to the generic pin config bindings.

Yours,
Linus Walleij
