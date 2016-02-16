From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add support for INTC-EX IRQ pins
Date: Tue, 16 Feb 2016 14:16:42 +0100
Message-ID: <CAMuHMdX01+vqJC78mLVvWDCLXn3B07eLRqKsS07YU8Uecyu6jg@mail.gmail.com>
References: <20160215121719.27056.43809.sendpatchset@little-apple>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160215121719.27056.43809.sendpatchset@little-apple>
Sender: linux-kernel-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 15, 2016 at 1:17 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Most pins on the r8a7795 SoC can be configured in GPIO mode for
> interrupt and GPIO functionality, while a couple of them can also
> be routed to the INTC-EX hardware block (formerly known as IRQC).
>
> On r8a7795 the INTC-EX hardware handles pins IRQ0 -> IRQ5 and
> this patch adds support for them to the PFC driver as "intc_ex_irqN".
>
> Tested on r8a7795 Salvator-X with an external loop back adapter on
> EXIO_D that connects pin 9 (IRQ2/GP2_02) and pin 26 (ExA22/GP2_06).

Thanks!

> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Will queue for next renesas-drivers and sh-pfc-for-v4.6.

Gr{oetje,eeting}s,

                        Geert
