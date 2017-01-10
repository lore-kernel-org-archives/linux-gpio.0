From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] arm: dts: r7s72100: Add peripherals nodes
Date: Tue, 10 Jan 2017 16:07:01 +0100
Message-ID: <CAMuHMdVWVsHqdOTxeiD6zXaVJqdHPLvry9EjjPc9XvF8QsXkDw@mail.gmail.com>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org> <1483990318-26927-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36080 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754704AbdAJPHD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2017 10:07:03 -0500
In-Reply-To: <1483990318-26927-4-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <chris.brandt@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Jacopo,

On Mon, Jan 9, 2017 at 8:31 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> From: Magnus Damm <damm@opensource.se>
>
> This is a squash of several commits, adding peripherals groups
> configuration to r7s72100 device tree, and enabling some of them on
> Genmai evaluation board
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for the rework!

>  arch/arm/boot/dts/r7s72100-genmai.dts |  51 ++++++++++++
>  arch/arm/boot/dts/r7s72100.dtsi       | 151 ++++++++++++++++++++++++++++++++++

This path should be split in multiple parts:
  - Add the pfc node to r7s72100.dtsi,
  - Add the gpio nodes to r7s72100.dtsi,
  - 4 patches for r7s72100-genmai.dts, adding support for LEDs, SCIF,
    Ethernet, and SPI.

> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -20,6 +20,19 @@
>         #size-cells = <1>;
>
>         aliases {
> +               gpio0 = &port0;
> +               gpio1 = &port1;
> +               gpio2 = &port2;
> +               gpio3 = &port3;
> +               gpio4 = &port4;
> +               gpio5 = &port5;
> +               gpio6 = &port6;
> +               gpio7 = &port7;
> +               gpio8 = &port8;
> +               gpio9 = &port9;
> +               gpio10 = &port10;
> +               gpio11 = &port11;
> +               gpio12 = &jtagport0;

Please remove this hunk.
GPIO aliases are deprecated, and I don't think the driver uses them.

>                 i2c0 = &i2c0;
>                 i2c1 = &i2c1;
>                 i2c2 = &i2c2;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
