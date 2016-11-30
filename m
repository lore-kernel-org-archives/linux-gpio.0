From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv3 0/2] pinctrl: sh-pfc: r8a7796: Add drive strength and
 bias support
Date: Wed, 30 Nov 2016 08:58:48 +0100
Message-ID: <CAMuHMdU3BHaHCa1xAQV=-WQfOCnL8XjNKKXB+0SidM8sK-OhNA@mail.gmail.com>
References: <20161117150920.18748-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161117150920.18748-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2016 at 4:09 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> These patches add drive strength and bias support for both GPIO and none
> GPIO pins to r8a7796. Similar to the none GPIO pins for r8a7795 the
> system to derive unique pin numbers are the R-Car M3SiP pin layout.
>
> Tested on M3-W and the series depends on the series '[PATCHv3 0/6]
> pinctrl: sh-pfc: Fixups for bias handling and preparation for none GPIO
> pins'.

Thanks, queued in sh-pfc-for-v4.11.

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
