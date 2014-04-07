From: Yegor Yefremov <yegorslists@googlemail.com>
Subject: Re: tca-6416: interrupt device tree configuration
Date: Mon, 7 Apr 2014 17:00:13 +0200
Message-ID: <CAGm1_ksqtkLRgqy=-TY4CNV4MV6AE1sL-iQE49rB3G1Xo5QbmQ@mail.gmail.com>
References: <CAGm1_ksGDCfgTNpue_zEUTho88G3juSJ6qLttHb7ACFawdgKzw@mail.gmail.com>
 <CAGm1_kvwU2S0qqo4idDZpKMKmPEn67jaYYgrBHTjnjmBDNvG7g@mail.gmail.com> <20140402160153.GS26751@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:47295 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753143AbaDGPAd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Apr 2014 11:00:33 -0400
Received: by mail-pa0-f48.google.com with SMTP id hz1so6881965pad.35
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2014 08:00:33 -0700 (PDT)
In-Reply-To: <20140402160153.GS26751@lukather>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-gpio@vger.kernel.org

On Wed, Apr 2, 2014 at 6:01 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Wed, Apr 02, 2014 at 12:06:03PM +0200, Yegor Yefremov wrote:
>> On Tue, Mar 18, 2014 at 4:02 PM, Yegor Yefremov
>> <yegorslists@googlemail.com> wrote:
>> > I've an am335x-based board with tca6416. The interrupt output of the
>> > tca is connected to GPIO0_20 on my SoC. How should I configure this
>> > wiring in device tree file?
>> >
>> > I've already managed to hook it on I2C and it is working so far:
>> >
>> >  tca6416: gpio@20 {
>> >                 compatible = "ti,tca6416";
>> >                 reg = <0x20>;
>> >                 gpio-controller;
>> >                 #gpio-cells = <2>;
>> >   };
>> >
>> > Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt describes
>> > following properties:
>> >
>> >   - interrupt-controller: Identifies the node as an interrupt controller.
>> >   - #interrupt-cells: Number of cells to encode an interrupt source, shall be 2.
>> >   - interrupt-parent: phandle of the parent interrupt controller.
>> >   - interrupts: Interrupt specifier for the controllers interrupt.
>> >
>> > and following example:
>> >
>> >         pcf8575: gpio@20 {
>> >                 compatible = "nxp,pcf8575";
>> >                 reg = <0x20>;
>> >                 interrupt-parent = <&irqpin2>;
>> >                 interrupts = <3 0>;
>> >                 gpio-controller;
>> >                 #gpio-cells = <2>;
>> >                 interrupt-controller;
>> >                 #interrupt-cells = <2>;
>> >         };
>> >
>> > Where does irqpin2 come from? How to specify GPIO0_20 in "interrupts" context?
>>
>> Maxime, I've seen your irq domain related patch. Could you please
>> provide an example/hint for my question?
>
> <&irqpin2> is called a phandle, and it's actually a reference to
> another device tree node. So the answer to your question is from
> somewhere else in the device tree.
>
> It will be the parent interrupt controller, so in your case, I guess
> you will have to do two things:
>   - Say that your interrupt comes from
>
> interrupt-parent = <&something>;
>
>   - Say the actual interrupt it is using inside that parent
>
> interrupts = <42>;
>
> In your case, I guess something like:
> interrupt-parent = <&gpio0>;
> interrupts = <20 GPIO_ACTIVE_HIGH>;
>
> Will work, but I'm not familiar enough with the am335x platform to
> know for sure.
>
> In any case, you should probably go through this talk:
> http://elinux.org/images/a/a3/Elce2013-petazzoni-devicetree-for-dummies.pdf

Thanks. My setup is working now. At least I can see interrupt counting
in /proc/interrupts.

Now I'm trying to find out, how to assign base GPIO number right after
the last CPU's GPIO. By default I get 496, though am335x has only 4x32
GPIO blocks.

Yegor
