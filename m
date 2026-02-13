Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32E91E520C
	for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770990472; cv=none; b=hr7jZR/+ZNBtDi+p8GtiFqWY8M6pua5Bam3op/mEDCIcPPu423KTaa+Z00OiwZBjGRpr+E+1CJ91kQ8mbMMGiLtnT57BANA5QPAVHHKp6bXdBV/Y/yAKrIGnhP3WTUQwC53+7tfLjmAEIXU10jK5MzDqbT0V3e4uHRRnzl7B7/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770990472; c=relaxed/simple;
	bh=DyzFY+7qXZ/I87ykE9tTTX/te+3kpL/x6B8NDHwgSQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qc/wbXMjHqupAka67e6EOYK3RIjAIoOH3Ot/UikluFVNVT6oek7Brnrso4ORkBNonF0SB8w8jJi+sCL9iMAQgrrXQ1LOYUoJM9TGkhxwD1tzZ7kVloDGLJW84bcRcMIQ3BYeOPUBHaDe93AVeXAvo//FNfaIZurx1zCwnRoq9qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QINFr95D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QINFr95D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D06C19423
	for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770990472;
	bh=DyzFY+7qXZ/I87ykE9tTTX/te+3kpL/x6B8NDHwgSQE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QINFr95DCTmDGpJZL+syZ6w4OMbiyEaGahW44SzHXpgajJ2dD5vASaBSSOblTtzhJ
	 mEmISzqm/Rt05EPpL6OnY220wUlUKaw8KJPqyXaZUxb9RkyRQ3mrNGP/kBkyw5KDxZ
	 gD0qa7b8j6Rthu62yPbLUoVNaL5PKbjPYPkjBNBFcOVkrP5QUi2XFs4fa+pJXrw6+j
	 NgLRDKl6uyODeVCVJ2tEJRELPeN33fMl7ZyC5sfhiCV1Wo/OU9LFCwXtM3QGaJyfrG
	 l7/pNkeQchzKS1aNT7jZ0qwN5YdeeYoLYqKPQVMtZhNEy23R0m2gVXMgPAaSjHXDKD
	 T+ghE+E29rlvA==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7950881727cso6902407b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 05:47:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXv/TOMiT2RpKO83Kju4PrSFBdiXJJc5o0c1rAk+6UG3zInulbZcJ/vkVeifTajlcn5/QFiomqS4Oji@vger.kernel.org
X-Gm-Message-State: AOJu0YxcV/6yAwC300qZdbIS+wm2toYzuwfLcQHY9sqxD6fNyCtrcKh+
	sVc4TN4tB3RNwwv7pk0LbT8WJPr6VMLmoTSJADZEbzK+CQ2MRZ77Dcz+DjKHsZ/2Knr8g4eSS0s
	62D3ino8qA9lZHYw0iMwwyyf/A3GeDdE=
X-Received: by 2002:a05:690c:18:b0:796:3f2f:a33b with SMTP id
 00721157ae682-797a0be9c0amr31425307b3.18.1770990471723; Fri, 13 Feb 2026
 05:47:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com> <20260213-pinctrl-single-bit-v1-1-c60f2fb80efb@aspeedtech.com>
In-Reply-To: <20260213-pinctrl-single-bit-v1-1-c60f2fb80efb@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Feb 2026 14:47:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6=YLh1EER2_cQZAprWfgmy-_XawreM5YpcTG2XA=uqA@mail.gmail.com>
X-Gm-Features: AZwV_QhsixaqIxYeaVbNx--W7SxSEC1W_-pI5Tu0Vlx-qt-_T_CJ0Ra3jwQddw8
Message-ID: <CAD++jLn6=YLh1EER2_cQZAprWfgmy-_XawreM5YpcTG2XA=uqA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctrl: Add pinctrl-packed
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, patrickw3@meta.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Billy,

thanks for your patch!

This approach is better than trying to extend pinctrl-single in my
opinion, but it has a bit of road to cover.

On Fri, Feb 13, 2026 at 9:18=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> Add a Devicetree binding for a generic pin controller where pinmux and/or
> pin configuration are represented as fixed-width fields packed
> sequentially within shared registers.
>
> The binding targets controllers that are typically exposed as subnodes of
> a syscon node and accessed via regmap-mmio through the parent.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
(...)
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - pinctrl-packed
> +          - pinconf-packed

Why do you need two? Can't you just use one, pinctrl-packed.

> +  pinctrl-packed,function-mask:
> +    description: Mask of the allowed register bits for a single pin.
> +    $ref: /schemas/types.yaml#/definitions/uint32

To me this could be static data in the driver but I guess the whole
point is to do what pinctrl-single is doing and store all of this
information in the device tree, because reasons.

I guess the DT binding maintainers need to decide on this and
also what to name it.

> +  pinctrl-packed,gpio-range:
> +    description: Optional list of pin base, nr pins & gpio function.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of a gpio-range node
> +        - description: pin base
> +        - description: number of pins
> +        - description: gpio function

Just use the standard gpio-range.

> +patternProperties:
> +  '-pins(-[0-9]+)?$|-pin$':
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      pinctrl-packed,pins:
> +        description: Array of pin index and function selector pairs.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array

Just use pinmux =3D <...>; from pinmux-node.yaml
(make sure to use the ref include.)

> +      pinctrl-packed,bias-pullup:
> +      pinctrl-packed,bias-pulldown:
> +      pinctrl-packed,drive-strength:
> +      pinctrl-packed,input-schmitt:
> +      pinctrl-packed,input-schmitt-enable:
> +      pinctrl-packed,low-power-mode:
> +      pinctrl-packed,slew-rate:

Just use the existing configs from
pincfg-node.yaml and abstain from any new
inventions here.

Yours,
Linus Walleij
