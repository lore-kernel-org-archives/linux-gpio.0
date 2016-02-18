From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7794: add EtherAVB pin groups
Date: Thu, 18 Feb 2016 09:36:06 +0100
Message-ID: <CAMuHMdVdqYJ8S0Vps9B8+L_nApaXFrE9M82iDb6_iWjAfXHCVA@mail.gmail.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
	<3010555.FcVIno0yOe@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <3010555.FcVIno0yOe@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Hi Sergei,

On Wed, Feb 17, 2016 at 11:32 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the EtherAVB pin groups to the R8A7794 PFC driver.
>
> Based on the patches by Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>.

Thank you for your patch!

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> +static const unsigned int avb_avtp_capture_pins[] = {
> +       RCAR_GP_PIN(5, 11),
> +};
> +static const unsigned int avb_avtp_capture_mux[] = {
> +       AVB_AVTP_CAPTURE_MARK,
> +};
> +static const unsigned int avb_avtp_match_pins[] = {
> +       RCAR_GP_PIN(5, 12),
> +};
> +static const unsigned int avb_avtp_match_mux[] = {
> +       AVB_AVTP_MATCH_MARK,
> +};
> +static const unsigned int avb_avtp_capture_b_pins[] = {
> +       RCAR_GP_PIN(1, 1),
> +};
> +static const unsigned int avb_avtp_capture_b_mux[] = {
> +       AVB_AVTP_CAPTURE_B_MARK,
> +};
> +static const unsigned int avb_avtp_match_b_pins[] = {
> +       RCAR_GP_PIN(1, 2),
> +};
> +static const unsigned int avb_avtp_match_b_mux[] = {
> +       AVB_AVTP_MATCH_B_MARK,
> +};

BTW, the capture pin seems to be available on R-Car E2 only.
The match pin seems to be available on R-Car E2 and V2H only.
The EtherAVB section in the datasheet doesn't clarify this.
Do you know more?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
