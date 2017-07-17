From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] pinctrl: sh-pfc: propagate errors on group config
Date: Mon, 17 Jul 2017 10:51:21 +0200
Message-ID: <CAMuHMdWj_qRaba99Rjw1jSm+wi29c6sBSX7m-Gxpn-FBzM1H_w@mail.gmail.com>
References: <1466404822-2540-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1466404822-2540-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jun 20, 2016 at 8:40 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> On group configuration, bail out if setting one of the individual pins
> fails. We don't need to roll-back, the pinctrl core will do this for us.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Tested on a Lager and Salvator-X without problems. Needs probably more testing
> on various HW to avoid regressions?

Queueing in sh-pfc-for-v4.14, now commit 13132b3f44d36009 ("ARM: dts:
armadillo800eva: Split LCD mux and gpio") is in v4.13-rc1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
