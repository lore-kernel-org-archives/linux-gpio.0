From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 4/5] arm: dts: r7s1000: Add pincontroller node
Date: Thu, 26 Jan 2017 20:54:39 +0100
Message-ID: <CAMuHMdW3WtBp=cLpqFuuLxQq-=by3wwE1mQtwKJN4znDVrF6LQ@mail.gmail.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <1485367787-8109-5-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:35780 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752950AbdAZU0U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 15:26:20 -0500
In-Reply-To: <1485367787-8109-5-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Jacopo,

On Wed, Jan 25, 2017 at 7:09 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add pincontroller node compatible with the new Renesas RZ/A1
> pincontroller driver.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index 3dd427d..764006d 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -171,6 +171,18 @@
>                 };
>         };
>
> +       pinctrl: pinctrl@fcfe3000 {
> +               compatible = "renesas,rza1-pinctrl";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               #pinctrl-cells = <2>;

Souldn't that be <3>?
E.g. <RZ_PIN(3, 0) ALTERNATE_FUNC_6> expands to <3 0 5>, i.e. 3 numbers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
