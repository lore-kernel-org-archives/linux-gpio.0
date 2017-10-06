From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: add newlines for better diff view
Date: Fri, 6 Oct 2017 13:35:06 +0200
Message-ID: <CAMuHMdVLCX_sjyOC+-bJoEF6O9jRZqM2WQ1-u2Lq6ictcNuyeg@mail.gmail.com>
References: <20171006103725.13804-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:34455 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751901AbdJFLfI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2017 07:35:08 -0400
In-Reply-To: <20171006103725.13804-1-wsa+renesas@sang-engineering.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

Hi Wolfram,

On Fri, Oct 6, 2017 at 12:37 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Be consistent with the newlines after structs. This makes diffs a lot
> easier to parse when comparing with other SoCs/versions.

I'm all for consistency, but...

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -1678,6 +1678,7 @@ static const unsigned int audio_clkout2_b_pins[] = {
>  static const unsigned int audio_clkout2_b_mux[] = {
>         AUDIO_CLKOUT2_B_MARK,
>  };
> +

That's a stray newline in both drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c and
drivers/pinctrl/sh-pfc/pfc-r8a7796.c, which should be removed from the latter
instead.

>  static const unsigned int audio_clkout3_a_pins[] = {
>         /* CLKOUT3 */
>         RCAR_GP_PIN(5, 19),
> @@ -2967,6 +2968,7 @@ static const unsigned int msiof3_rxd_d_pins[] = {
>  static const unsigned int msiof3_rxd_d_mux[] = {
>         MSIOF3_RXD_D_MARK,
>  };
> +

drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c has a newline here because H3 ES1.x
doesn't have the fifth set of MSIOF pins, thus msiof3_rxd_d_mux() is the
last entry of the MSIOF section.

>  static const unsigned int msiof3_clk_e_pins[] = {
>         /* SCK */
>         RCAR_GP_PIN(2, 3),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
