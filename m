From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/2] pinctrl: sh-pfc: r8a7795: Add CAN support
Date: Fri, 26 Feb 2016 13:13:11 +0100
Message-ID: <CAMuHMdX_cTg_EieXZD53_hq3dxb1QTBvDkUnx-B6U2GSerJR2g@mail.gmail.com>
References: <1456485005-37035-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
	<1456485005-37035-2-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f196.google.com ([209.85.213.196]:34121 "EHLO
	mail-ig0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751139AbcBZMNM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2016 07:13:12 -0500
In-Reply-To: <1456485005-37035-2-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Paterson <chris.paterson2@renesas.com>

Hi Ramesh,

On Fri, Feb 26, 2016 at 12:10 PM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram@bp.renesas.com> wrote:
> This patch adds CAN[0-1] pinmux support to r8a7795 SoC.
>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

Thanks for the update!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -1535,6 +1535,38 @@ static const unsigned int audio_clkout3_b_mux[] = {
>         AUDIO_CLKOUT3_B_MARK,
>  };
>
> +/* - CAN ------------------------------------------------------------------ */
> +static const unsigned int can0_data_a_pins[] = {
> +       /* TX, RX */
> +       RCAR_GP_PIN(1, 23),     RCAR_GP_PIN(1, 24),
> +};

[...]

> +static const unsigned int can_clk_mux[] = {
> +       CAN_CLK_MARK,
> +};
> +
>  /* - EtherAVB --------------------------------------------------------------- */
>  static const unsigned int avb_link_pins[] = {
>         /* AVB_LINK */

However, "can" should be below "avb".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
