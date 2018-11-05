From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] pinctrl: sh-pfc: r8a77965: Add VIN4 and VIN5
Date: Mon, 5 Nov 2018 18:19:22 +0100
Message-ID: <CAMuHMdUWP=zBfn8ff1PZ-f7WegQiYU7omGkAM-Fh1uNUxF2XNQ@mail.gmail.com>
References: <1540836824-4636-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540836824-4636-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms@verge.net.au>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

On Mon, Oct 29, 2018 at 7:14 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>    this two patches add supports for VIN4 and VIN5 interfaces to R-Car M3-N.
>
> On this SoC (and in the forthcoming support for E3 R8A77990) the VIN groups
> could appear on different sets of pins, usually the 'a' and 'b' one.
>
> With the existing VIN_DATA_PIN_GROUP macro we have to specify group names as:
>
> VIN_DATA_PIN_GROUP(vin4_data_a, 8)
>
> which results in the group being named as "vin4_data_a_8" which is
> un-consistent with the canonical group names (eg. "vin4_data8_a").
>
> This series adds a macro that allows to specify the group 'version' along with
> the pin and mux numbers in patch [1/1]. I haven't been able to find a better
> term than 'version' as 'group' was already taken. Suggestions welcome.

Yeah, the datasheet also calls these groups :-(
A possible alternative is to use "variant"?

Or, what about avoiding the name issue by making the VIN_DATA_PIN_GROUP()
macro varargs, and passing the "variant" as the (optional) third parameter?
That way existing users work as a before, while you can also write e.g.

    VIN_DATA_PIN_GROUP_VER(vin4_data, 8, _a),

> As I cannot test VIN4 nor VIN5 on Salvator-XS as the parallel pins are not
> wired, I made sure the macro creates correct names and fields not only by
> compile testing it, but with a small C program [1] that replicates the VIN data
> layout defined in the PFC module and access fields (and has helped me testing
> more easily the preprocessor stringification/concatenation process).
>
> Final note: Simon, you took the E3 patches in your tree, and I expect them to
> land on v4.20-rc1. They use the old macros, are follow up patches ok?)

Which patches are using these macro names, and are in v4.20-rc1?

BTW, "grep vin._data_[a-z][0-9] drivers/pinctrl/sh-pfc/*o" tells me we already
have broken groups names on r8a7792, r8a7795, and r8a7796.
Fortunately we have no known users of them, so they can be fixed.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
