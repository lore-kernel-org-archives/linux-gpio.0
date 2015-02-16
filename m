From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7791: Remove non existing GPIO pins
Date: Mon, 16 Feb 2015 20:59:11 +0100
Message-ID: <CAMuHMdVEK7SaiqXQfv6fn0gJ5UExob9Ee3RZwQVEUbM=cVvjdg@mail.gmail.com>
References: <1424115661-21928-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<1424115661-21928-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1424115661-21928-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-sh list <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi Laurent,

On Mon, Feb 16, 2015 at 8:41 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> GPIO banks 1 and 7 are missing pins 26 to 31. Remove them.

BTW, one intriguing thing is that the description for GPSR7 seems to suggest
that GP-7-26 to GP-7-31 do exist, but cannot be configured for a peripheral
function. But I cannot find an actual pin on the chip's package these GPIOs
are connected to.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
