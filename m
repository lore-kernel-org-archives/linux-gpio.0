From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] pinctrl: sh-pfc: r8a77965: Add VIN4 and VIN5
Date: Wed, 7 Nov 2018 09:39:35 +0100
Message-ID: <CAMuHMdUd=bYrKu4v0OssWPA=ZAYuiUANahy8x8xNGUoUoXmLCA@mail.gmail.com>
References: <1540836824-4636-1-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdUWP=zBfn8ff1PZ-f7WegQiYU7omGkAM-Fh1uNUxF2XNQ@mail.gmail.com>
 <20181106090756.GP20885@w540> <CAMuHMdWbrA1hgh3kw+fvL0x3ciNKHV52uhDX0FNJzU_Grb_+qQ@mail.gmail.com>
 <20181106093121.GA24024@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181106093121.GA24024@w540>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms@verge.net.au>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

(sorry, seems I prepared a reply, but forgot to press "Send")

On Tue, Nov 6, 2018 at 10:31 AM jacopo mondi <jacopo@jmondi.org> wrote:
> On Tue, Nov 06, 2018 at 10:24:30AM +0100, Geert Uytterhoeven wrote:
> > On Tue, Nov 6, 2018 at 10:08 AM jacopo mondi <jacopo@jmondi.org> wrote:
> > > On Mon, Nov 05, 2018 at 06:19:22PM +0100, Geert Uytterhoeven wrote:
> > > > On Mon, Oct 29, 2018 at 7:14 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > > >    this two patches add supports for VIN4 and VIN5 interfaces to R-Car M3-N.
> > > > >
> > > > > On this SoC (and in the forthcoming support for E3 R8A77990) the VIN groups
> > > > > could appear on different sets of pins, usually the 'a' and 'b' one.
> > > > >
> > > > > With the existing VIN_DATA_PIN_GROUP macro we have to specify group names as:
> > > > >
> > > > > VIN_DATA_PIN_GROUP(vin4_data_a, 8)
> > > > >
> > > > > which results in the group being named as "vin4_data_a_8" which is
> > > > > un-consistent with the canonical group names (eg. "vin4_data8_a").
> > > > >
> > > > > This series adds a macro that allows to specify the group 'version' along with
> > > > > the pin and mux numbers in patch [1/1]. I haven't been able to find a better
> > > > > term than 'version' as 'group' was already taken. Suggestions welcome.
> > > >
> > > > Yeah, the datasheet also calls these groups :-(
> > > > A possible alternative is to use "variant"?
> > > >
> > > > Or, what about avoiding the name issue by making the VIN_DATA_PIN_GROUP()
> > > > macro varargs, and passing the "variant" as the (optional) third parameter?
> > > > That way existing users work as a before, while you can also write e.g.
> > > >
> > > >     VIN_DATA_PIN_GROUP_VER(vin4_data, 8, _a),
> > >
> > > Indeed.
> > >
> > > Would something along the following lines fly for you?
> > >
> > > #define VIN_DATA_PIN_GROUP(n, s, ...)                                   \
> > >         {                                                               \
> > >                 .name = #n#s#__VA_ARGS__,                               \
> > >                 .pins = n##__VA_ARGS__##_pins.data##s,                  \
> > >                 .mux = n##__VA_ARGS__##_mux.data##s,                    \
> > >                 .nr_pins = ARRAY_SIZE(n##__VA_ARGS__##_pins.data##s),   \
> > >         }
> > >
> > > It can be used as:
> > > VIN_DATA_PIN_GROUP(vin4_data, 8, _a),
> > > VIN_DATA_PIN_GROUP(vin5_data, 8),
> > >
> > > With your ack on this, I'll send v2.
> >
> > Thank you, that is exactly what I had in mind.
> >
> > > > > As I cannot test VIN4 nor VIN5 on Salvator-XS as the parallel pins are not
> > > > > wired, I made sure the macro creates correct names and fields not only by
> > > > > compile testing it, but with a small C program [1] that replicates the VIN data
> > > > > layout defined in the PFC module and access fields (and has helped me testing
> > > > > more easily the preprocessor stringification/concatenation process).
> > > > >
> > > > > Final note: Simon, you took the E3 patches in your tree, and I expect them to
> > > > > land on v4.20-rc1. They use the old macros, are follow up patches ok?)
> > > >
> > > > Which patches are using these macro names, and are in v4.20-rc1?
> > > >
> > > > BTW, "grep vin._data_[a-z][0-9] drivers/pinctrl/sh-pfc/*o" tells me we already
> > > > have broken groups names on r8a7792, r8a7795, and r8a7796.
> > > > Fortunately we have no known users of them, so they can be fixed.
> > > >
> > >
> > > On v4.20-rc1 the grep returns none for me :/
> > > git grep v4.20-rc1 "vin._data_[a-z][0-9]" drivers/pinctrl/sh-pfc/
> >
> > I grepped the .o files, to make sure it would see the final strings, which
> > obviously works in the build tree only ;-)
>
> Ah yes, stupid me.
>
> >
> > For the source tree, please try:
> >
> >     git grep -w VIN_DATA_PIN_GROUP.*_[a-z] v4.20-rc1
>
> Argh, there are quite a few of them, but fortunately no users so far.
>
> Is it ok fixing them in v2 of this series with follow-up patches, or
> would you like a single patch that introduces the variadic macro and
> replaces all the occurrences in the per-SoC PFC modules in one go?

Given the r8a7795 and r8a7796 issues were introduced in v4.17:

    a5c2949ff7bd9e04 ("pinctrl: sh-pfc: r8a7796: Deduplicate VIN4 pin
definitions")
    9942a5b52990b8d5 ("pinctrl: sh-pfc: r8a7795: Deduplicate VIN4 pin
definitions")

while the r8a7792 issue date back to v4.9:

    7dd74bb1f058786e ("pinctrl: sh-pfc: r8a7792: Add VIN pin groups")

I think separate patches are easier for backporting.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
