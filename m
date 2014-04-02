From: Yegor Yefremov <yegorslists@googlemail.com>
Subject: Re: tca-6416: interrupt device tree configuration
Date: Wed, 2 Apr 2014 12:06:03 +0200
Message-ID: <CAGm1_kvwU2S0qqo4idDZpKMKmPEn67jaYYgrBHTjnjmBDNvG7g@mail.gmail.com>
References: <CAGm1_ksGDCfgTNpue_zEUTho88G3juSJ6qLttHb7ACFawdgKzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:42478 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758104AbaDBKGZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Apr 2014 06:06:25 -0400
Received: by mail-pa0-f44.google.com with SMTP id bj1so11274335pad.31
        for <linux-gpio@vger.kernel.org>; Wed, 02 Apr 2014 03:06:24 -0700 (PDT)
In-Reply-To: <CAGm1_ksGDCfgTNpue_zEUTho88G3juSJ6qLttHb7ACFawdgKzw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>

On Tue, Mar 18, 2014 at 4:02 PM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> I've an am335x-based board with tca6416. The interrupt output of the
> tca is connected to GPIO0_20 on my SoC. How should I configure this
> wiring in device tree file?
>
> I've already managed to hook it on I2C and it is working so far:
>
>  tca6416: gpio@20 {
>                 compatible = "ti,tca6416";
>                 reg = <0x20>;
>                 gpio-controller;
>                 #gpio-cells = <2>;
>   };
>
> Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt describes
> following properties:
>
>   - interrupt-controller: Identifies the node as an interrupt controller.
>   - #interrupt-cells: Number of cells to encode an interrupt source, shall be 2.
>   - interrupt-parent: phandle of the parent interrupt controller.
>   - interrupts: Interrupt specifier for the controllers interrupt.
>
> and following example:
>
>         pcf8575: gpio@20 {
>                 compatible = "nxp,pcf8575";
>                 reg = <0x20>;
>                 interrupt-parent = <&irqpin2>;
>                 interrupts = <3 0>;
>                 gpio-controller;
>                 #gpio-cells = <2>;
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
>         };
>
> Where does irqpin2 come from? How to specify GPIO0_20 in "interrupts" context?

Maxime, I've seen your irq domain related patch. Could you please
provide an example/hint for my question?

Thanks.

Yegor
