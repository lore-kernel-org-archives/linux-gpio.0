From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: rcar: reinstate generic compat string
Date: Mon, 14 Aug 2017 13:44:52 +0200
Message-ID: <CAMuHMdWQ=UksGVGUxR0DQYfbhPSZY=rsgHVq=gO3sHRndOfZ+Q@mail.gmail.com>
References: <1502266866-11277-1-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1502266866-11277-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Simon,

On Wed, Aug 9, 2017 at 10:21 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> commit d10bbd156926 ("gpio: rcar: add gen[123] fallback compatibility
> strings") deprecated the generic compat string, renesas,gpio-rcar. After
> further discussion this appears not to have been desirable as that compat
> string is compatible with all R-Car SoCs supported in upstream.

While "renesas,gpio-rcar" is treated as a GPIO controller on R-Car Gen1 SoCs,
it can indeed be used on R-Car Gen2 and Gen3, with reduced functionality.
In se this is compatible with the spirit of multiple compatible values.

> This commit partially reverts that commit, and updates related
> documentation and examples.
>
> Fixes: d10bbd156926 ("gpio: rcar: add gen[123] fallback compatibility strings")
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  .../devicetree/bindings/gpio/renesas,gpio-rcar.txt     | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> index 48634b01f1bf..347d8ede2982 100644
> --- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> +++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> @@ -16,11 +16,13 @@ Required Properties:
>      - "renesas,rcar-gen1-gpio": for a generic R-Car Gen1 GPIO controller.
>      - "renesas,rcar-gen2-gpio": for a generic R-Car Gen2 or RZ/G1 GPIO controller.
>      - "renesas,rcar-gen3-gpio": for a generic R-Car Gen3 GPIO controller.
> -    - "renesas,gpio-rcar": deprecated.
> +    - "renesas,gpio-rcar": for generic R-Car GPIO controller.
>
> -    When compatible with the generic version nodes must list the
> -    SoC-specific version corresponding to the platform first followed by
> -    the generic version.
> +    Nodes should list all of the following that are compatible
> +    in this order:
> +    - A SoC-specific version
> +    - A generic R-Car generation version
> +    - The generic R-Car version

The main objective of commit d10bbd156926 ("gpio: rcar: add gen[123] fallback
compatibility strings") was avoiding the need to add more SoC-specific
compatible values to the match table in the driver, when adding driver
support for more R-Car and RZ/G SoCs.

With this amendment, this objective is met at the expense of adding a third
compatible value to each and every GPIO device node in R-Car .dtsi files :-(
IMHO keeping "renesas,gpio-rcar" everywhere adds little value.  The only
exception might be running an old kernel on a new SoC, but that is ruled out
for a few core components like clocks and PFC anyway.

Of course the driver has to keep matching on the deprecated value, which is
already the case without this amendment.

>    - reg: Base address and length of each memory resource used by the GPIO
>      controller hardware module.
> @@ -50,7 +52,9 @@ interrupt-controller/interrupts.txt.
>  Example: R8A7779 (R-Car H1) GPIO controller nodes
>
>         gpio0: gpio@ffc40000 {
> -               compatible = "renesas,gpio-r8a7779", "renesas,rcar-gen1-gpio";
> +               compatible = "renesas,gpio-r8a7779",
> +                            "renesas,rcar-gen1-gpio",
> +                            "renesas,gpio-rcar";

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
