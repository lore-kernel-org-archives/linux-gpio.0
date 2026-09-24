Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D224CC62E
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281019; cv=pass; b=jtrSQASxbB7ErLJbk4ZHbOzhBedkmeRdPZUnmo1R9n35mcxQHeXVgE8Rn5r96fmlR2Lpv0qTTiZnqdqJKzlIOOm9BuS7ZE0Ziz4hohKPodpRxwO0K8dgCA1jZoFGXurXGlBRLe0SmBS/fowrPlVGNa7dxRKn0otEDRVye+5kApk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281019; c=relaxed/simple;
	bh=WS/57KdXBBwGfRZNL7QHE0ldeTLI0dMl0tLbZXWOYHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bayNu5NjbgXwK8V/HullaXM6AyPFk//pcd5S2i9mtfDTF2m8MJTUsFRqLO4v3j+fjTtOhRFHHB5dFdW26ijWMMySSO8buLPStIpQXEhQaepskzfvTfh1+zrAgF3ZbwXPew5zq0zIi7frGjw1ndpwAa4wJNpDY4SQ3bsIBJgD/lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDptfiZo; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDptfiZo"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f01363so858715ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 13:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790281012; cv=none;
        d=google.com; s=arc-20260327;
        b=ON1G25kUXn1XeWc2JTyfHS6eYa/4UzdKdkGZ3+u1S+nZ91EDWRNa5TDjREtdGzfogj
         ulODt1e0C5Wud0BtwNH2nDl7fUOKxoXK9oWSFiiX03vWcF74qwBTctE+RhMJPsW/jsY5
         oocqGVQ9/wPICxifkrNwJoP64Ur4oymAgtrShuz8O5BQWOd2IAZFC7FiHLg/rqSpYDD4
         j1bm4K3ceWb5CgRHclmzSKWCAP0vsasQJyZ9U7+Gt5dfq1x9dWyofEZlyD352sxgIezR
         WSWvTp7DyfgR6DLuoUOqGft9ibyMvAAAayVhnBFhEIpdkjygaMzdRb/1SmkVcO6MtRod
         naNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        fh=1JJ8bi7W/0VjC/uT3gybJtl3h6pLtc6LsyDfP/5e/GM=;
        b=JCeymPyo81AC/doRiNBilrzm1UfusTU+q8tloLbyc61KcHTlk7Io6KgWgTnRoMC4Oa
         7sOF1Bg4XtnnaeCEB9wCdGOZr/Cx/HWxnYx1zXC3FU50xRZWR+uf5X3rxwW+FZvTE1t1
         esk+Qc+c/gnwO8+nHEy30hIM1NO4ocMFqzGIB/TLvyld/xx7vw0RX/n0qxZuq1rIp0Pb
         hNoOT+F7xTnhJe18DUCBm0TRnRdjHU7lYOpVt/Y4yjrnhwvJHNM/NYlv+B60mHHiqM8v
         n1BbfamLJmaaTTh8qMyeB78OwCUPRL26Nfp6eBa8h7u/bmB+weTFw828mLrGwzh9oGz1
         4OQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790281012; x=1790885812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        b=FDptfiZoUBFpKzdVITD1XRMVOIjxusJPJxSOhaSvbP7KCi/f3/QcB8hUPWlSjFoi41
         vnZw2SLdexrhgfsW2YwmWYkvkmUKD5NGjNsNDVaKk/R3KsouniekBMluP3ZJ3xqyNeN2
         GfFCZ9ISKZY7REOjKuqVm1mTRx8cSOnCoC5XC36PW7JQoOIZPOUZ3t6PBa+/Y9VZsXBe
         +4bF5CFsjq7J7UkDtBWfumIN8dSximBL79u3mQmSMM6+/cWfbZOAszU/eIu3fa+mdsy9
         vYiWlEN/WLEmyHOiA0eJC9cdLIpZweuI4T0GefxDd7A4RZE6bQK6EgyTPitj7AITBHgK
         hJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281012; x=1790885812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        b=Rj2JBRIlJgpRLbef7pmwPM9Aje8oQhO4W9fScrnACLYptSS9wzqUIQQfT3DXXlVl9k
         SyiBeNYxikvKUKNvdh7cIAdMOnLTaQclpjVwd4wcO4yE/CQUwj6ikmpHHl8kmMGs7g7q
         npUjLaghpiLB+Tb1S/PPAhR7mVXsfZ/5nRUpuDQOax+PuWfvzZWq5n9/IqEvN/dGSnsZ
         NdviUbzt+NyArFOMFtXViRslI2q9IlH6LNBRlC4ugg8FtYeTGUknzg454wfpQjnZhCoC
         +0Fpw9IjPUTe5jNE5dXzeU3zcNe3h555lGc0dU/+UXr70h6TAm0ALG8csL6xoDNNoFY2
         CUZw==
X-Forwarded-Encrypted: i=1; AKwUvBz7lyeduhQKW0cs92RS/8RdnIrS7YfpXZFCG0D/WYo5UomT2l8ftQTCDXG13cFVGrxzd63CySxtEqH8@vger.kernel.org
X-Gm-Message-State: AFuF++m+0KKgP7JfrBwSgdiY6FCGWBO81JTtfO4rVsFmJKuU30iRrCC7
	GN1cG/3MUwv2ckbtvJjv59z1q5iYrzccEQtfvUi86PPYxWDibpJ3Luw//KBbR1NotQP7MtzPQSK
	y1dajbec6CSht1eCXgqWi/AtwWgJNCv4=
X-Gm-Gg: AYBFou3Qkg1mroG6E/672l5eM16aV/7FB8vy/QZun7YkedMg2ZWLiPvMGGb281Wu5Ym
	Ey56t+kAuS+XfzxycZCM+9ZHUI+ZFYCIsF6/vy+E66sT5Pl1k2UPEa3Be7WpsryqrSFWulTD8uv
	Hu1/xW8f35Ieeb0yyQ+QViDCIOrJWvNoa+f3h5+9MKRZND9yXmvhdFj3OloX7EFsexy2/+HsaVh
	tkr9ccQ14pP3DeMfZQ25AzxkhSYa1BY0cOOpVK0DQGpHOFf7ZQjbs0ejMb43478btuNtluyDx99
	EhnuHyVU79MvX5lNBj1COlAhg+072lDkhsNHol6AxVrzhf6Uo4PmhmkpWwG5C7qRCuwImUg=
X-Received: by 2002:a17:903:22cb:b0:2dd:c100:943d with SMTP id
 d9443c01a7336-2df7e6632cemr33132005ad.59.1790281012320; Thu, 24 Sep 2026
 13:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923201701.43391-1-pmazzini@gmail.com> <20260923201701.43391-3-pmazzini@gmail.com>
 <30c42b73-204d-4531-bd1a-1ee160a4b000@arm.com>
In-Reply-To: <30c42b73-204d-4531-bd1a-1ee160a4b000@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 24 Sep 2026 21:16:17 +0100
X-Gm-Features: AclHuK9Ix7omORkFeC8AEjcG9VWZQpvYqS7tGdczHTc-lHozfzxFcTWbaDF7Pzg
Message-ID: <CAAxh=ju7+vQ=_opueqK-3Fe-qj9_OJiVunBWDmdmxk86dRqWxw@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] dt-bindings: pinctrl: add Allwinner B288 pin controller
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

> Can't you just add the new compatible string to the existing
> allwinner,sun4i-a10-pinctrl.yaml binding?

Done for v2.

Thanks,
Pablo


On Thu, Sep 24, 2026 at 10:07=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi Pablo,
>
> On 9/23/26 22:16, Pablo Mazzini wrote:
> > One controller at 0x01c20800 with four external interrupt banks.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   .../pinctrl/allwinner,sun8i-b288-pinctrl.yaml | 108 +++++++++++++++++=
+
>
> Why is this a new file? Can't you just add the new compatible string to
> the existing allwinner,sun4i-a10-pinctrl.yaml binding?
>
> Cheers,
> Andre
>
> P.S. Since we have seen this a lot lately: please wait with a new
> version of your series for a few days, to allow other people to comment,
> and to allow discussions to settle down. Not everyone can respond quickly=
.
>
> >   1 file changed, 108 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinne=
r,sun8i-b288-pinctrl.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-=
b288-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun=
8i-b288-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..806da97ab708
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pi=
nctrl.yaml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/allwinner,sun8i-b288-pinctr=
l.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner B288 Pin Controller
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: allwinner,sun8i-b288-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description:
> > +      One interrupt per bank of external interrupt capable pins.
> > +    maxItems: 4
> > +
> > +  clocks:
> > +    items:
> > +      - description: Bus Clock
> > +      - description: High Frequency Oscillator
> > +      - description: Low Frequency Oscillator
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb
> > +      - const: hosc
> > +      - const: losc
> > +
> > +  gpio-controller: true
> > +  interrupt-controller: true
> > +  gpio-line-names: true
> > +
> > +  "#gpio-cells":
> > +    const: 3
> > +
> > +  "#interrupt-cells":
> > +    const: 3
> > +
> > +patternProperties:
> > +  "-pins$":
> > +    type: object
> > +    $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      pins: true
> > +      function: true
> > +      bias-pull-up: true
> > +      bias-pull-down: true
> > +      bias-disable: true
> > +      drive-strength:
> > +        enum: [10, 20, 30, 40]
> > +
> > +    required:
> > +      - pins
> > +      - function
> > +
> > +  "^vcc-p[bcdfg]-supply$":
> > +    description:
> > +      Power supplies for pin banks.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - gpio-controller
> > +  - "#gpio-cells"
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/sun8i-b288-ccu.h>
> > +
> > +    pio: pinctrl@1c20800 {
> > +        compatible =3D "allwinner,sun8i-b288-pinctrl";
> > +        reg =3D <0x01c20800 0x400>;
> > +        interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
> > +        clock-names =3D "apb", "hosc", "losc";
> > +        gpio-controller;
> > +        #gpio-cells =3D <3>;
> > +        interrupt-controller;
> > +        #interrupt-cells =3D <3>;
> > +
> > +        mmc0_pins: mmc0-pins {
> > +            pins =3D "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
> > +            function =3D "sdc0";
> > +            drive-strength =3D <30>;
> > +            bias-pull-up;
> > +        };
> > +    };
>
