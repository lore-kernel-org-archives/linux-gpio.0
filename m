From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 3/4] ARM: dts: Add NextThing GR8 dtsi
Date: Thu, 8 Sep 2016 12:46:14 +0800
Message-ID: <CAGb2v64h7kq2jWzUJ74vDdOOQOXPxjx3ruSsJMXvyr7fP63BGg@mail.gmail.com>
References: <20160907145400.27192-1-maxime.ripard@free-electrons.com>
 <20160907145400.27192-4-maxime.ripard@free-electrons.com> <CACRpkdZsxA7avmO85R=-Quu7FQwSVMPhQMDmmgL+xbkVTB-2HQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:53222 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752017AbcIHEql (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2016 00:46:41 -0400
In-Reply-To: <CACRpkdZsxA7avmO85R=-Quu7FQwSVMPhQMDmmgL+xbkVTB-2HQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mylene Josserand <mylene.josserand@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexander Kaplan <alex@nextthing.co>

On Thu, Sep 8, 2016 at 3:37 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Sep 7, 2016 at 4:53 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>
>> From: Mylène Josserand <mylene.josserand@free-electrons.com>
>>
>> The GR8 is an SoC made by Nextthing loosely based on the sun5i family.
>>
>> Since it's not clear yet what we can factor out and merge with the A10s and
>> A13 support, let's keep it out of the sun5i.dtsi include tree. We will
>> figure out what can be shared when things settle down.
>>
>> Signed-off-by: Mylène Josserand <mylene.josserand@free-electrons.com>
>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>
> Acked-by: Linus Walleij <linus,walleij@linaro.org>
>
> I was just thinking:
>
>> +                       i2c0_pins_a: i2c0@0 {
>> +                               allwinner,pins = "PB0", "PB1";
>> +                               allwinner,function = "i2c0";
>> +                               allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>> +                               allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>> +                       };
>
> It would be *NICE* if the sunxi driver would start to support the new standard
> bindings for this stuff, see
> Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>
> So you could just use pins, function and the drive-strength and
> bias-disable in this case.
>
> Since I know the AllWinner support is a community project I have much higher
> tolerance with this legacy binding sticking around for the new generation of
> SoCs but still, if you find time.
>
> I mean it like supporting these in *addition* to the custom ones, so there can
> be a smooth phase-over.
>
> Check for example Laurent's commit for SH-PFC:
> commit 16ccaf5bb5a52372bfebd3dfbb79dd810ad49c09
> "pinctrl: sh-pfc: Accept standard function, pins and groups properties"
> It's awesome, and since, they have improved the looks of Renesas
> DTS files a lot.
>
> It could look a bit like this nice thing from
> lpc4337-ciaa.dts:
>
> &pinctrl {
>         enet_rmii_pins: enet-rmii-pins {
>                 enet_rmii_rxd_cfg {
>                         pins = "p1_15", "p0_0";
>                         function = "enet";
>                         slew-rate = <1>;
>                         bias-disable;
>                         input-enable;
>                         input-schmitt-disable;
>                 };
>
>                 enet_rmii_txd_cfg {
>                         pins = "p1_18", "p1_20";
>                         function = "enet";
>                         slew-rate = <1>;
>                         bias-disable;
>                         input-enable;
>                         input-schmitt-disable;
>                 };
> (etc)

This looks nice. I've slightly looked at the generic pinconf stuff.
I think we should be able to support them, though the sunxi pinctrl
driver currently doesn't work well with it though. For example,
it doesn't declare ".is_generic = true", it doesn't filter
unsupported pinconf parameters, and it doesn't reply to queries
correctly. I will fix these bits.

Also, I think we are needlessly using pin groups, 1 pin per group.
Can pinconf/pinctrl work without them? Would there be any harm
converting the sunxi driver to work directly with pins? This would
make it match generic pinconf parsing, and make it easier to get
both working together.


Regards
ChenYu
