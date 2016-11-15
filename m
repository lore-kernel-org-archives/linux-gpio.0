From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv2 2/2] pinctrl: sh-pfc: r8a7796: Add bias pinconf support
Date: Tue, 15 Nov 2016 12:01:48 +0100
Message-ID: <CAMuHMdUExh7_M8RwNbDRd_WicjZ2+eF9C6OGnEjRSdRD6ZS-9Q@mail.gmail.com>
References: <20161112161002.13070-1-niklas.soderlund+renesas@ragnatech.se> <20161112161002.13070-3-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161112161002.13070-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 12, 2016 at 5:10 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Implements pull-up and pull-down. On this SoC there is no simple mapping
> of GP pins to bias register bits, so we need a table.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 355 +++++++++++++++++++++++++++++=
++----
>  1 file changed, 316 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pf=
c/pfc-r8a7796.c
> index f06559c..676a4a6 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c

>  enum {
>         PINMUX_RESERVED =3D 0,

> +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  7, DU_DOTCLKIN2, CFG_FLAG=
S),

DU_DOTCLKIN2 is AR8.

> +static const struct sh_pfc_bias_info bias_info[] =3D {

> +       { PIN_A_NUMBER('R', 7),  PU3,  0 },     /* DU_DOTCLKIN2 */

PIN_A_NUMBER('R', 8)

If you fix the above:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
