From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Right amount of info in the DT
Date: Sun, 7 May 2017 12:26:15 +0200
Message-ID: <CACRpkdaZWh24SSCSeaM3NeLkiLSkyTYzDVkQmzj33=6m4qMraw@mail.gmail.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
 <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
 <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com> <CACRpkdY2Q1tcX40C8JLfa110pyMhzpxmJj41RqTt+MOwcoFxyw@mail.gmail.com>
 <d8d9f35c-a901-dc77-646e-ea09836ee9cf@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:34567 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756148AbdEGWEm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 May 2017 18:04:42 -0400
Received: by mail-io0-f169.google.com with SMTP id k91so40363518ioi.1
        for <linux-gpio@vger.kernel.org>; Sun, 07 May 2017 15:04:42 -0700 (PDT)
In-Reply-To: <d8d9f35c-a901-dc77-646e-ea09836ee9cf@sigmadesigns.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>

On Wed, Apr 26, 2017 at 5:47 PM, Yves Lefloch
<YvesMarie_Lefloch@sigmadesigns.com> wrote:

> I've put together a first draft, would you mind taking a look at it?
> I haven't documented the DT binding yet, though.

OK

> +       pins {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               pinctrl@10500 {
> +                       reg = <0x10500 0x8>;
> +                       compatible = "sigma,smp8758-pinctrl";
> +                       label = "sys";
> +                       tango,pins = <0 16>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       gpio {
> +                               gpio-controller;
> +                               #gpio-cells = <1>;
> +                       };
> +               };
> +
> +               pinctrl@15b8e0 {
> +                       compatible = "sigma,smp8758-pinctrl";
> +                       label = "tdmux";
> +                       reg = <0x15b8e0 0xc>;
> +                       tango,pins = <16 2>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       gpio {
> +                               gpio-controller;
> +                               #gpio-cells = <1>;
> +                       };
> +
> +                       alt_function {
> +                               function = "tdmux";
> +                               groups = "tdmux";
> +                       };
> +               };
> +
> +               pinctrl@6c130 {
> +                       compatible = "sigma,smp8758-pinctrl";
> +                       label = "spi";
> +                       reg = <0x6c130 0xc>;
> +                       tango,pins = <18 8>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       gpio {
> +                               gpio-controller;
> +                               #gpio-cells = <1>;
> +                       };
> +
> +                       alt_function {
> +                               function = "spi";
> +                               groups = "spi";
> +                       };
> +               };
> +
> +               pinctrl@6c230 {
> +                       compatible = "sigma,smp8758-pinctrl";
> +                       label = "uart1";
> +                       reg = <0x6c230 0xc>;
> +                       tango,pins = <26 7>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       gpio {
> +                               gpio-controller;
> +                               #gpio-cells = <1>;
> +                       };
> +
> +                       alt_function {
> +                               function = "uart1";
> +                               groups = "uart1";
> +                       };
> +
> +               };
> +
> +               pinctrl@6c358 {
> +                       compatible = "sigma,smp8758-pinctrl";
> +                       label = "smcard";
> +                       reg = <0x6c368 0xc>;
> +                       tango,pins = <71 8>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       gpio {
> +                               gpio-controller;
> +                               #gpio-cells = <1>;
> +                       };
> +
> +                       alt_function {
> +                               function = "smcard";
> +                               groups = "smcard";
> +                       };
> +               };
> +       };


Does all of these really have gpio controller functionality?
You do not have to compulsively add that. Just make it
a pin controller.

But I was not meaning you should collect them all under a
"pins" node like this, but inside each peripheral.

So for example:

mmc@80114000 {
        compatible = "mmc-sd-card";
        reg = <0x80114000 0x1000>;
        interrupts = <....>;

        pinctrl {
                compatible = "sigma,smp8758-pinctrl";
                label = "smcard";
                (....)
        };
};

So it lives inside the node of the peripheral. It can then
access the register range by simply looking at the parent,
and maybe when making the Linux driver, the parent simply
calls a library function to set up the pin controller for itself
providing the child node as reference. (Child nodes are not
automatically spawning devices, you have to do that with code.)

Yours,
Linus Walleij
