From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 1/3] pinctrl: sh-pfc: refactor voltage setting
Date: Mon, 6 Jun 2016 09:15:41 +0200
Message-ID: <CAMuHMdUH8V0potD361qzqXT=xRXPPb0VQh8KbV41NWVw3iHjrA@mail.gmail.com>
References: <1465195811-3041-1-git-send-email-wsa@the-dreams.de> <1465195811-3041-2-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1465195811-3041-2-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jun 6, 2016 at 8:50 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> All known hardware being able to switch voltages has the same POCCTRL
> register. So, factor out the common code to the core and keep only
> the pin-to-bit mapping SoC specific. Convert the only user, r8a7790.
> In case POCCTRL should ever get more complex (more voltages to select?),
> we should probably switch over to a describing array like drive strength
> does currently.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
