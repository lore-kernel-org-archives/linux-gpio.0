From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 5/6] pinctrl: sh-pfc: r8a7791: Add tpu groups and function
Date: Mon, 18 Dec 2017 12:15:16 +0100
Message-ID: <CAMuHMdW8tfg9AnJbLF=yMFbS2R=F37tzfcxYpF6yDtm1WLoY7g@mail.gmail.com>
References: <1513248976-26700-1-git-send-email-fabrizio.castro@bp.renesas.com> <1513248976-26700-6-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1513248976-26700-6-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Fabrizio,

On Thu, Dec 14, 2017 at 11:56 AM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds tpu groups and function to r8a7743/r8a7791/r8a7793.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

With the sort order fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> @@ -3892,6 +3892,32 @@ static const unsigned int sdhi2_wp_mux[] = {
>         SD2_WP_MARK,
>  };
>
> +/* - TPU -------------------------------------------------------------------- */
> +static const unsigned int tpu_to0_pins[] = {
> +       RCAR_GP_PIN(6, 14),
> +};
> +static const unsigned int tpu_to0_mux[] = {
> +       TPU_TO0_MARK,
> +};
> +static const unsigned int tpu_to1_pins[] = {
> +       RCAR_GP_PIN(1, 17),
> +};
> +static const unsigned int tpu_to1_mux[] = {
> +       TPU_TO1_MARK,
> +};
> +static const unsigned int tpu_to2_pins[] = {
> +       RCAR_GP_PIN(1, 18),
> +};
> +static const unsigned int tpu_to2_mux[] = {
> +       TPU_TO2_MARK,
> +};
> +static const unsigned int tpu_to3_pins[] = {
> +       RCAR_GP_PIN(1, 24),
> +};
> +static const unsigned int tpu_to3_mux[] = {
> +       TPU_TO3_MARK,
> +};
> +
>  /* - SSI -------------------------------------------------------------------- */
>  static const unsigned int ssi0_data_pins[] = {
>         /* SDATA */

Please use alphabetical sort order (also below).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
