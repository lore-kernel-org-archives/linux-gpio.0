From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7795: Add CAN FD support
Date: Fri, 26 Feb 2016 10:11:19 +0100
Message-ID: <CAMuHMdUrxU08T1f_9r0+23FZas3J5b90xHTYdCohNS9qU+iT7w@mail.gmail.com>
References: <1456418933-3948-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
	<1456418933-3948-3-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1456418933-3948-3-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Paterson <chris.paterson2@renesas.com>
List-Id: linux-gpio@vger.kernel.org

Hi Ramesh,

On Thu, Feb 25, 2016 at 5:48 PM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram@bp.renesas.com> wrote:
> This patch adds CANFD[0-1] pinmux support to r8a7795 SoC.
>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

Sorry, I spoke too soon. While the pin data is correct, I noticed the following
while applying:

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -2940,6 +2940,36 @@ static const unsigned int can1_data_pins[] = {
>  static const unsigned int can1_data_mux[] = {
>         CAN1_TX_MARK,           CAN1_RX_MARK,
>  };
> +
> +/* - RCAN FD --------------------------------------------------------------- */

Please use "CAN" instead of "RCAN", and insert in alphabetical order.

> +static const unsigned int canfd0_data_a_pins[] = {

> @@ -3362,6 +3392,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>         SH_PFC_PIN_GROUP(can0_data_a),
>         SH_PFC_PIN_GROUP(can0_data_b),
>         SH_PFC_PIN_GROUP(can1_data),
> +       SH_PFC_PIN_GROUP(canfd0_data_a),
> +       SH_PFC_PIN_GROUP(canfd0_data_b),
> +       SH_PFC_PIN_GROUP(canfd1_data),
>         SH_PFC_PIN_GROUP(can_clk),

Please insert in alphabetical order.

> @@ -3686,6 +3719,15 @@ static const char * const can1_groups[] = {
>         "can1_data",
>  };
>
> +static const char * const canfd0_groups[] = {
> +       "canfd0_data_a",
> +       "canfd0_data_b",
> +};
> +
> +static const char * const canfd1_groups[] = {
> +       "canfd1_data",
> +};

Please insert in alphabetical order.

> +
>  static const char * const can_clk_groups[] = {
>         "can_clk",
>  };
> @@ -3721,6 +3763,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
>         SH_PFC_FUNCTION(ssi),
>         SH_PFC_FUNCTION(can0),
>         SH_PFC_FUNCTION(can1),
> +       SH_PFC_FUNCTION(canfd0),
> +       SH_PFC_FUNCTION(canfd1),
>         SH_PFC_FUNCTION(can_clk),

Please insert in alphabetical order.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
