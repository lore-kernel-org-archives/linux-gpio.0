From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7795: Add CAN support
Date: Fri, 26 Feb 2016 10:09:11 +0100
Message-ID: <CAMuHMdU9yth0fT3=kB8xhBRFsEN-gmgQQimBzW_vJF2D-9ZvQA@mail.gmail.com>
References: <1456418933-3948-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
	<1456418933-3948-2-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1456418933-3948-2-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Paterson <chris.paterson2@renesas.com>
List-Id: linux-gpio@vger.kernel.org

Hi Ramesh,

On Thu, Feb 25, 2016 at 5:48 PM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram@bp.renesas.com> wrote:
> This patch adds CAN[0-1] pinmux support to r8a7795 SoC.
>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

Sorry, I spoke too soon. While the pin data is correct, I noticed the following
while applying:

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 58 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> index ce4f5cd..fbe8e95 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -2913,6 +2913,43 @@ static const unsigned int scif_clk_b_mux[] = {
>         SCIF_CLK_B_MARK,
>  };
>
> +/* - RCAN ------------------------------------------------------------------ */

Please use "CAN" instead of "RCAN", and insert in alphabetical order.

> +static const unsigned int can0_data_a_pins[] = {
> +       /* TX, RX */
> +       RCAR_GP_PIN(1, 23),     RCAR_GP_PIN(1, 24),
> +};

> @@ -3322,6 +3359,10 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>         SH_PFC_PIN_GROUP(ssi9_data_b),
>         SH_PFC_PIN_GROUP(ssi9_ctrl_a),
>         SH_PFC_PIN_GROUP(ssi9_ctrl_b),
> +       SH_PFC_PIN_GROUP(can0_data_a),
> +       SH_PFC_PIN_GROUP(can0_data_b),
> +       SH_PFC_PIN_GROUP(can1_data),
> +       SH_PFC_PIN_GROUP(can_clk),

Please insert in alphabetical order.

> @@ -3636,6 +3677,20 @@ static const char * const ssi_groups[] = {
>         "ssi9_ctrl_b",
>  };
>
> +static const char * const can0_groups[] = {

Please insert in alphabetical order.

> @@ -3664,6 +3719,9 @@ static const struct sh_pfc_function pinmux_functions[] = {
>         SH_PFC_FUNCTION(sdhi2),
>         SH_PFC_FUNCTION(sdhi3),
>         SH_PFC_FUNCTION(ssi),
> +       SH_PFC_FUNCTION(can0),
> +       SH_PFC_FUNCTION(can1),
> +       SH_PFC_FUNCTION(can_clk),

Please insert in alphabetical order.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
