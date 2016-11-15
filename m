From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv2 2/2] pinctrl: sh-pfc: r8a7796: Add bias pinconf support
Date: Tue, 15 Nov 2016 12:43:55 +0100
Message-ID: <CAMuHMdVmjd1v+HxX+n7BRCm83BSBd2mUm8qHVNsK-UheRLFVoQ@mail.gmail.com>
References: <20161112161002.13070-1-niklas.soderlund+renesas@ragnatech.se> <20161112161002.13070-3-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36268 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932164AbcKOLn5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2016 06:43:57 -0500
In-Reply-To: <20161112161002.13070-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

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

> -       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 38, FSCLKST#, SH_PFC_PIN_C=
FG_DRIVE_STRENGTH),

> +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 38, FSCLKST#, CFG_FLAGS),

> +       { PIN_A_NUMBER('D', 38), PU3,  2 },     /* FSCLKST# */

"FSCLKST" (without "#")

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
