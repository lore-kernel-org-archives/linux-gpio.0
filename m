From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: pca953x: add required properties to example in bindings
Date: Wed, 3 Jan 2018 11:36:08 +0100
Message-ID: <CAMuHMdURWa9z5_zewz-MQph_g=3MTk3f+QnUmULMbugb6qmNOQ@mail.gmail.com>
References: <20171222200900.8367-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:45207 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751154AbeACKgK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jan 2018 05:36:10 -0500
In-Reply-To: <20171222200900.8367-1-wsa+renesas@sang-engineering.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

Hi Wolfram,

On Fri, Dec 22, 2017 at 9:09 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The binding documentation was missing two required properties in the
> example. Fix it and add them also to the list of required properties.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> index 0d0158728f897b..a3d51e1cafe972 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> @@ -30,6 +30,11 @@ Required properties:
>         onnn,pca9654
>         exar,xra1202
>
> +- gpio-controller: Marks the device node as a GPIO controller
> +- #gpio-cells: Must be '2':
> +       - First cell is the GPIO line number
> +       - Second cell is for optional parameters (currently unused)

Is it really unused?

I'd expect at least GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW to work,
cfr. Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt

> +
>  Optional properties:
>   - reset-gpios: GPIO specification for the RESET input. This is an
>                 active low signal to the PCA953x.
> @@ -44,4 +49,6 @@ Example:
>                 pinctrl-0 = <&pinctrl_pca9505>;
>                 interrupt-parent = <&gpio3>;
>                 interrupts = <23 IRQ_TYPE_LEVEL_LOW>;

Note that interrupts is also not documented.

> +               gpio-controller;
> +               #gpio-cells = <2>;
>         };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
