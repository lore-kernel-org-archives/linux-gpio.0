From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 4/7] arm: dts: r7s72100-genmai: SCIF2 PINCTRL configuration
Date: Wed, 11 Jan 2017 16:58:37 +0100
Message-ID: <CAMuHMdXPBfmdDXfh8VBf71hVDT83bFSgUyEoOZD47D4vVvCH9A@mail.gmail.com>
References: <1484128633-22683-1-git-send-email-jacopo+renesas@jmondi.org> <1484128633-22683-5-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1484128633-22683-5-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <chris.brandt@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

On Wed, Jan 11, 2017 at 10:57 AM, Jacopo Mondi
<jacopo+renesas@jmondi.org> wrote:
> From: Magnus Damm <damm@opensource.se>
>
> Configure the r7s72100 PINCTRL hardware and select pin function
> for the SCIF2 serial console.
>
> Signed-off-by: Magnus Damm <damm@opensource.se>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/r7s72100-genmai.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
> index 118a8e2..8d8fcc7 100644
> --- a/arch/arm/boot/dts/r7s72100-genmai.dts
> +++ b/arch/arm/boot/dts/r7s72100-genmai.dts
> @@ -59,6 +59,16 @@
>         };
>  };
>
> +&pfc {
> +       pinctrl-0 = <&scif2_pins>;
> +       pinctrl-names = "default";
> +
> +       scif2_pins: serial2 {
> +               renesas,groups = "scif2_txd_p3_0", "scif2_rxd_p3_2";
> +               renesas,function = "scif2";

Please drop the "renesas," prefixes
The "functions", "groups", and "pins" property names have been standardized
since the initial r7s72100 support was written.

Obviously this comment applies to all relevant patches.

> +       };
> +};
> +
>  &scif2 {
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
