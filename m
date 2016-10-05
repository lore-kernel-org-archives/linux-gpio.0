From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: r8a7795: Support none GPIO pins with
 configurable drive-strength
Date: Wed, 5 Oct 2016 11:51:49 +0200
Message-ID: <CAMuHMdVWze2HGhxgdvOAyENM0c7K10kpYEEmJ5eddqudVYkPrA@mail.gmail.com>
References: <20160913140314.22035-1-niklas.soderlund+renesas@ragnatech.se>
 <20160913140314.22035-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUtJo4_RrGZC__qf+T8Y35_ae4rQ96sUGmagzowJTotag@mail.gmail.com> <20161005083338.GD7241@bigcity.dyn.berto.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:37916 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752428AbcJEJvv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2016 05:51:51 -0400
In-Reply-To: <20161005083338.GD7241@bigcity.dyn.berto.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>

Hi Niklas,

On Wed, Oct 5, 2016 at 10:33 AM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2016-10-04 21:13:18 +0200, Geert Uytterhoeven wrote:
>> On Tue, Sep 13, 2016 at 4:03 PM, Niklas S=C3=B6derlund
>> <niklas.soderlund+renesas@ragnatech.se> wrote:
>> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
>> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
>> > @@ -518,7 +518,22 @@ MOD_SEL0_3         MOD_SEL1_3 \
>> >  MOD_SEL0_2_1           MOD_SEL1_2 \
>> >                         MOD_SEL1_1 \
>> >                         MOD_SEL1_0              MOD_SEL2_0
>> > -
>> > +/*
>> > + * These pins are not able to be muxed but have other properties
>> > + * that can be set, such as drive-strength or pull-up/pull-down enabl=
e.
>> > + */
>> > +#define PINMUX_STATIC \
>> > +       FM(QSPI0_SPCLK) FM(QSPI0_SSL) FM(QSPI0_MOSI_IO0) FM(QSPI0_MISO=
_IO1) \
>> > +       FM(QSPI0_IO2) FM(QSPI0_IO3) \
>> > +       FM(QSPI1_SPCLK) FM(QSPI1_SSL) FM(QSPI1_MOSI_IO0) FM(QSPI1_MISO=
_IO1) \
>> > +       FM(QSPI1_IO2) FM(QSPI1_IO3) \
>> > +       FM(RPC_INT) FM(RPC_WP) FM(RPC_RESET) \
>> > +       FM(AVB_TX_CTL) FM(AVB_TXC) FM(AVB_TD0) FM(AVB_TD1) FM(AVB_TD2)=
 FM(AVB_TD3) \
>> > +       FM(AVB_RX_CTL) FM(AVB_RXC) FM(AVB_RD0) FM(AVB_RD1) FM(AVB_RD2)=
 FM(AVB_RD3) \
>> > +       FM(AVB_TXREFCLK) FM(AVB_MDIO) \
>> > +       FM(CLKOUT) FM(PRESETOUT) \
>> > +       FM(DU_DOTCLKIN0) FM(DU_DOTCLKIN1) FM(DU_DOTCLKIN2) FM(DU_DOTCL=
KIN3) \
>> > +       FM(TMS) FM(TDO) FM(ASEBRK) FM(MLB_REF)
>>
>> FM(FSCLKST)
>
> This won't work as FSCLKST is already defined as a part of IP7_15_12, so
> adding it here will result in 'error: redeclaration of enumerator
> 'FSCLKST_MARK'. It matches the datasheet I have that FSCLKST is part of
> the ISPR7 register, but I can't find it as GPIO so I'm a bit confused
> how to handle it and chose to leave it out. Any suggestion on how to
> handle it is appreciated.

IPSR is not about selecting GPIO vs. another function (we have GPSR for tha=
t),
but about selecting between multiple functions.
This pin seems to need to be programmed for this function, while it is
documented to be single function (or secret multi function ;-)

So I think we can just use the existing FSCLKST_MARK definition?

>> > +#define PIN_A_NUMBER(r, c) PIN_NUMBER(ROW_GROUP_A(r), c)
>> > +
>> >  static const struct sh_pfc_pin pinmux_pins[] =3D {
>> >         PINMUX_GPIO_GP_ALL(),
>> > +
>> > +       /* Pins not associated with a GPIO port */
>> > +       SH_PFC_PIN_NAMED_CFG('A',  8,  A8, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_TX_CTL */
>> > +       SH_PFC_PIN_NAMED_CFG('A',  9,  A9, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_MDIO */
>> > +       SH_PFC_PIN_NAMED_CFG('A', 12, A12, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_TXCREFCLK */
>> > +       SH_PFC_PIN_NAMED_CFG('A', 13, A13, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_RD0 */
>> > +       SH_PFC_PIN_NAMED_CFG('A', 14, A14, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_RD2 */
>> > +       SH_PFC_PIN_NAMED_CFG('A', 16, A16, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_RX_CTL */
>> > +       SH_PFC_PIN_NAMED_CFG('A', 17, A17, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_TD2 */
>> > +       SH_PFC_PIN_NAMED_CFG('A', 18, A18, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_TD0 */
>> > +       SH_PFC_PIN_NAMED_CFG('A', 19, A19, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_TXC */
>> > +       SH_PFC_PIN_NAMED_CFG('B', 13, B13, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_RD1 */
>> > +       SH_PFC_PIN_NAMED_CFG('B', 14, B14, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_RD3 */
>> > +       SH_PFC_PIN_NAMED_CFG('B', 17, B17, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_TD3 */
>> > +       SH_PFC_PIN_NAMED_CFG('B', 18, B18, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_TD1 */
>> > +       SH_PFC_PIN_NAMED_CFG('B', 19, B19, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* AVB_RXC */
>> > +       SH_PFC_PIN_NAMED_CFG('C',  1,  C1, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* PRESETOUT# */
>> > +       SH_PFC_PIN_NAMED_CFG('F',  1,  F1, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* CLKOUT */
>> > +       SH_PFC_PIN_NAMED_CFG('H', 37, H37, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* MLB_REF */
>> > +       SH_PFC_PIN_NAMED_CFG('V',  3,  V3, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* QSPI1_SPCLK */
>> > +       SH_PFC_PIN_NAMED_CFG('V',  5,  V5, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* QSPI1_SSL */
>> > +       SH_PFC_PIN_NAMED_CFG('V',  6,  V6, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* RPC_WP# */
>> > +       SH_PFC_PIN_NAMED_CFG('V',  7,  V7, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* RPC_RESET# */
>> > +       SH_PFC_PIN_NAMED_CFG('W',  3,  W3, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* QSPI0_SPCLK */
>> > +       SH_PFC_PIN_NAMED_CFG('Y',  3,  Y3, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* QSPI0_SSL */
>> > +       SH_PFC_PIN_NAMED_CFG('Y',  6,  Y6, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* QSPI0_IO2 */
>> > +       SH_PFC_PIN_NAMED_CFG('Y',  7,  Y7, SH_PFC_PIN_CFG_DRIVE_STRENG=
TH),                      /* RPC_INT# */
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('B'),  4,  AB4, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* QSPI0_MISO_IO1 */
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('B'),  6,  AB6, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* QSPI0_IO3 */
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  3,  AC3, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* QSPI1_IO3 */
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  5,  AC5, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* QSPI0_MOSI_IO0 */
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  7,  AC7, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* QSPI1_MOSI_IO0 */
>>
>> + SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'),  38,  AD38,
>> SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* FSCLKST */
>>
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  4,  AE4, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* QSPI1_IO2 */
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  5,  AE5, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* QSPI1_MISO_IO1 */
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  7,  AP7, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* DU_DOTCLKIN0 */
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  8,  AP8, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* DU_DOTCLKIN1 */
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  7,  AR7, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* DU_DOTCLKIN2 */
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  8,  AR8, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* DU_DOTCLKIN3 */
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 30, AR30, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* TMS */
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 28, AT28, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* TDO */
>> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, AT30, SH_PFC_PIN_CF=
G_DRIVE_STRENGTH),        /* ASEBRK */
>>
>> All these pin numbers match R-Car H3SiP, while there exists also a plain
>> R-Car H3, which uses completely different pin numbers.
>>
>> How are we gonna distinguish these two variants?
>> Perhaps we can refer to these pins in some other way, to have consistent
>> numbering?
>>
>> Or don't we have to? Are these numbers visible in userspace (sysfs)?
>
> Unfortunately both the number and name are show in sysfs under
> '/sys/kernel/debug/pinctrl/e6060000.pfc/*', example from the pins node:
>
> <snip>
> pin 1906 (PIN_AP7) sh-pfc
> pin 1907 (PIN_AP8) sh-pfc
> pin 1984 (PIN_AR7) sh-pfc
> pin 1985 (PIN_AR8) sh-pfc
> pin 2007 (PIN_AR30) sh-pfc
> pin 2083 (PIN_AT28) sh-pfc
> pin 2085 (PIN_AT30) sh-pfc
> </snip>

Thanks for checking!

> So yes a way to present consistent names is needed if this driver should
> match both H3 variants. But I'm not sure the numbers needs to be
> correlated to the pin matrix they only need to be unique I think, please
> correct me if I'm wrong. And if that is the case then maybe a solution

Yes, I also think they just have to be unique.
Having some system to make it easier to have unique numbers is nice.

> to the problem is to simply change the name of the pins from there pin
> matrix location to there function:
>
> - SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, AT30, SH_PFC_PIN_CFG_DRIVE_S=
TRENGTH),        /* ASEBRK */
> + SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, ASEBRK, SH_PFC_PIN_CFG_DRIVE=
_STRENGTH),      /* ASEBRK */
>
> That would keep the names and numbers consistent on both H3 varinats.
> The names would correlate to function and the numbers simply serve as a
> pin identifier which is unique and derived from the H3SiP pin layout,
> probably a comment about this in the source is a good idea :-)

So "the system" would be H3SiP pin numbers.
Looks good to me.

Laurent, do you agree?

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
