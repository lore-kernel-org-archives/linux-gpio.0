From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Right amount of info in the DT
Date: Mon, 24 Apr 2017 18:45:41 +0200
Message-ID: <CACRpkdY2Q1tcX40C8JLfa110pyMhzpxmJj41RqTt+MOwcoFxyw@mail.gmail.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
 <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com> <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:37107 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S974884AbdDXQpn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2017 12:45:43 -0400
Received: by mail-it0-f43.google.com with SMTP id x188so60280523itb.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2017 09:45:43 -0700 (PDT)
In-Reply-To: <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>

On Mon, Apr 24, 2017 at 3:03 PM, Yves Lefloch
<YvesMarie_Lefloch@sigmadesigns.com> wrote:

> OK I see now that I have to do this kind of stuff in a pinctrl/pinmux driver.

Great!

> in
> my SoC there is no central hw pin controller, and pin control registers are
> scattered all over the address space because they're in different IPs. How am I
> supposed to deal with so many different addresses?

I've herd about this happening sometimes... I haven't seen a perfect solution
for it.

> I have considered hardcoding
> them in the driver but that seems counter-productive, so I thought I could do
> something like this, with the address of the function-select register as a
> resource (it's the only pin property I can change besides direction and data):
>
>
> pincontroller {
>         compatible = "foo-pinctrl";
>         #address-cells = <1>;
>         #size-cells = <0>;
>
>         uart1 {
>                 reg = <0x10001>;
>
>                 state_0 {
>                         groups = "uart1";
>                         function = "uart1";
>                 };
>                 state_1 {
>                         groups = "uart1";
>                         function = "gpio";
>                 };
>
>         ... other IPs (SPI, ethernet, etc.) ...
>
> };

Maybe, I would have to check the final result. It will need some serious
documentation so that we can establish this way of dealing with this type of
hardware.

> Furthermore, I was wondering how it's possible for pinctrl drivers to map registers
> possibly used by other drivers.

We usually use syscon approaches for that. Especially when it considers
individual bits in a single register.

If you just have one single 32bit register  in each hardware blocks,
then certainly
it can be remapped by several drivers, or you can leave a "hole" there in the
main driver register definitions, but that seems very awkward.

> For example, the "GPIO pad mode" register of my
> ethernet pins is right in the middle of the address space requested by the ethernet
> driver. Meaning that if I try to "devm_ioremap_resource" when probing the GPIO or
> pinctrl drivers, I will get an error saying that the memory region is already taken.
> Do you have any insight on that?

Isn't the best approach to add a pin controller as a subnode of the ethernet
controller in the device tree, so that the probe() of you main driver looks
for it and instantiates a pin controller that is then referenced by the
driver itself?

We have similar constructions with e.g. PCI irq controllers inside of PCI
bridge nodes.

Then, if the same type of pin control is
sprinkled all over your drivers, maybe turn it into a library in drivers/pinctrl
that you can reuse from each driver so as to centralize the code?

Yours,
Linus Walleij
