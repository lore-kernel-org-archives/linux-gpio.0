From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/4] ARM: dts: Add NextThing GR8 dtsi
Date: Wed, 7 Sep 2016 21:37:19 +0200
Message-ID: <CACRpkdZsxA7avmO85R=-Quu7FQwSVMPhQMDmmgL+xbkVTB-2HQ@mail.gmail.com>
References: <20160907145400.27192-1-maxime.ripard@free-electrons.com> <20160907145400.27192-4-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:35795 "EHLO
        mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753627AbcIGThU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 15:37:20 -0400
Received: by mail-oi0-f42.google.com with SMTP id s131so40846028oie.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 12:37:20 -0700 (PDT)
In-Reply-To: <20160907145400.27192-4-maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mylene Josserand <mylene.josserand@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexander Kaplan <alex@nextthing.co>

On Wed, Sep 7, 2016 at 4:53 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> From: Myl=C3=A8ne Josserand <mylene.josserand@free-electrons.com>
>
> The GR8 is an SoC made by Nextthing loosely based on the sun5i family.
>
> Since it's not clear yet what we can factor out and merge with the A10s a=
nd
> A13 support, let's keep it out of the sun5i.dtsi include tree. We will
> figure out what can be shared when things settle down.
>
> Signed-off-by: Myl=C3=A8ne Josserand <mylene.josserand@free-electrons.com=
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Linus Walleij <linus,walleij@linaro.org>

I was just thinking:

> +                       i2c0_pins_a: i2c0@0 {
> +                               allwinner,pins =3D "PB0", "PB1";
> +                               allwinner,function =3D "i2c0";
> +                               allwinner,drive =3D <SUN4I_PINCTRL_10_MA>=
;
> +                               allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL=
>;
> +                       };

It would be *NICE* if the sunxi driver would start to support the new stand=
ard
bindings for this stuff, see
Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

So you could just use pins, function and the drive-strength and
bias-disable in this case.

Since I know the AllWinner support is a community project I have much highe=
r
tolerance with this legacy binding sticking around for the new generation o=
f
SoCs but still, if you find time.

I mean it like supporting these in *addition* to the custom ones, so there =
can
be a smooth phase-over.

Check for example Laurent's commit for SH-PFC:
commit 16ccaf5bb5a52372bfebd3dfbb79dd810ad49c09
"pinctrl: sh-pfc: Accept standard function, pins and groups properties"
It's awesome, and since, they have improved the looks of Renesas
DTS files a lot.

It could look a bit like this nice thing from
lpc4337-ciaa.dts:

&pinctrl {
        enet_rmii_pins: enet-rmii-pins {
                enet_rmii_rxd_cfg {
                        pins =3D "p1_15", "p0_0";
                        function =3D "enet";
                        slew-rate =3D <1>;
                        bias-disable;
                        input-enable;
                        input-schmitt-disable;
                };

                enet_rmii_txd_cfg {
                        pins =3D "p1_18", "p1_20";
                        function =3D "enet";
                        slew-rate =3D <1>;
                        bias-disable;
                        input-enable;
                        input-schmitt-disable;
                };
(etc)

Yours,
Linus Walleij
