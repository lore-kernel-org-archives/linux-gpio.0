From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] pinctrl: sh-pfc: r8a7795: Add SDHI0-3 support
Date: Wed, 30 Aug 2017 16:14:28 +0200
Message-ID: <CAMuHMdWb1kLNSRpBB4uaqmHPPGn3dK17snFgStHskT6SckEwzw@mail.gmail.com>
References: <20170829155157.6272-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170829155157.6272-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Dirk Behme <dirk.behme@de.bosch.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 29, 2017 at 5:51 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> Add SDHI0-3 support for R-Car H3 ES2.0 based on a patch from the Renesas
> BSP. SDHI pin config is identical to H3 ES1.*.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I.e. will queue in sh-pfc-for-v4.15.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
