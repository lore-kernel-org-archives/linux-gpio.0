From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/3] pinctrl: sh-pfc: r8a7795: add Audio clock pin support
Date: Thu, 17 Sep 2015 10:00:50 +0200
Message-ID: <CAMuHMdX7O+iA1B3kKm9LPgOTkYrJHPM8kTPEk1jdLGwhLr-exA@mail.gmail.com>
References: <87mvx4qkzo.wl%kuninori.morimoto.gx@renesas.com>
	<87y4g57kqn.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <87y4g57kqn.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-sh-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Linus Walleij <linus.walleij@linaro.org>, Laurent <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Magnus <magnus.damm@gmail.com>, Linux-SH <linux-sh@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Morimoto-san,

On Thu, Sep 17, 2015 at 6:10 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c

> +/* - AUDIO CLOCK ------------------------------------------------------------ */

> +static const unsigned int audio_clkout_c_mux[] = {
> +       AUDIO_CLKOUT_C_MARK,
> +};

You missed audio_clkout_d at GP5_21.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
