From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: r8a7795: Support none GPIO pins
 with configurable drive-strength
Date: Wed, 5 Oct 2016 10:33:38 +0200
Message-ID: <20161005083338.GD7241@bigcity.dyn.berto.se>
References: <20160913140314.22035-1-niklas.soderlund+renesas@ragnatech.se>
 <20160913140314.22035-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUtJo4_RrGZC__qf+T8Y35_ae4rQ96sUGmagzowJTotag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUtJo4_RrGZC__qf+T8Y35_ae4rQ96sUGmagzowJTotag@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your feedback.

On 2016-10-04 21:13:18 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Sep 13, 2016 at 4:03 PM, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > There are pins on the Salvator-X which is not part of a GPIO bank nor
> 
> s/Salvator-X/r8a7795/
> s/is/are/

Thanks.

> 
> > can be muxed between different functions. They do however allow for the
> > drive-strength to be configured. Add those pins to the list of pins and
> > to the drive-strength configuration registers.
> >
> > The pins can now be referred to in DT by there physical location and the
> 
> s/there/their/

Thanks.

> 
> > drive-strength modified.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 155 +++++++++++++++++++++++++++++++----
> >  1 file changed, 139 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> > index b74cdd3..4a60f15 100644
> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> > @@ -518,7 +518,22 @@ MOD_SEL0_3         MOD_SEL1_3 \
> >  MOD_SEL0_2_1           MOD_SEL1_2 \
> >                         MOD_SEL1_1 \
> >                         MOD_SEL1_0              MOD_SEL2_0
> > -
> > +/*
> > + * These pins are not able to be muxed but have other properties
> > + * that can be set, such as drive-strength or pull-up/pull-down enable.
> > + */
> > +#define PINMUX_STATIC \
> > +       FM(QSPI0_SPCLK) FM(QSPI0_SSL) FM(QSPI0_MOSI_IO0) FM(QSPI0_MISO_IO1) \
> > +       FM(QSPI0_IO2) FM(QSPI0_IO3) \
> > +       FM(QSPI1_SPCLK) FM(QSPI1_SSL) FM(QSPI1_MOSI_IO0) FM(QSPI1_MISO_IO1) \
> > +       FM(QSPI1_IO2) FM(QSPI1_IO3) \
> > +       FM(RPC_INT) FM(RPC_WP) FM(RPC_RESET) \
> > +       FM(AVB_TX_CTL) FM(AVB_TXC) FM(AVB_TD0) FM(AVB_TD1) FM(AVB_TD2) FM(AVB_TD3) \
> > +       FM(AVB_RX_CTL) FM(AVB_RXC) FM(AVB_RD0) FM(AVB_RD1) FM(AVB_RD2) FM(AVB_RD3) \
> > +       FM(AVB_TXREFCLK) FM(AVB_MDIO) \
> > +       FM(CLKOUT) FM(PRESETOUT) \
> > +       FM(DU_DOTCLKIN0) FM(DU_DOTCLKIN1) FM(DU_DOTCLKIN2) FM(DU_DOTCLKIN3) \
> > +       FM(TMS) FM(TDO) FM(ASEBRK) FM(MLB_REF)
> 
> FM(FSCLKST)

This won't work as FSCLKST is already defined as a part of IP7_15_12, so 
adding it here will result in 'error: redeclaration of enumerator 
'FSCLKST_MARK'. It matches the datasheet I have that FSCLKST is part of 
the ISPR7 register, but I can't find it as GPIO so I'm a bit confused 
how to handle it and chose to leave it out. Any suggestion on how to 
handle it is appreciated.

> 
> > @@ -1408,10 +1424,70 @@ static const u16 pinmux_data[] = {
> >         PINMUX_IPSR_MSEL(IP17_7_4,      STP_ISSYNC_0_E,         SEL_SSP1_0_4),
> >         PINMUX_IPSR_MSEL(IP17_7_4,      RIF2_D1_B,              SEL_DRIF2_1),
> >         PINMUX_IPSR_GPSR(IP17_7_4,      TPU0TO3),
> > +
> > +/*
> > + * Static pins can not be muxed between different functions but
> > + * still needs a mark entry in the pinmux list. Add each static
> > + * pin to the list without an associated function. The sh-pfc
> > + * core will do the right thing and skip trying to mux then pin
> > + * while still applying configuration to it
> > + */
> > +#define FM(x)  PINMUX_DATA(x##_MARK, 0),
> > +       PINMUX_STATIC
> > +#undef FM
> >  };
> >
> > +/*
> > + * R8A7795 has 7 banks with 32 PGIOS in each = 224 GPIOs.
> 
> No, it has 8 banks => 256 GPIOs

Yes, sometime calculating is hard for me, GPSR0-7 is 8 banks not 7...  
Thanks for pointing this out.

> 
> > + * Physical layout rows: A - AW, cols: 1 - 39.
> > + */
> > +#define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
> > +#define PIN_NUMBER(r, c) (((r) - 'A') * 39 + (c) + 300)
> 
> Fortunately 300 >= 256 :-)

:-)

> 
> > +#define PIN_A_NUMBER(r, c) PIN_NUMBER(ROW_GROUP_A(r), c)
> > +
> >  static const struct sh_pfc_pin pinmux_pins[] = {
> >         PINMUX_GPIO_GP_ALL(),
> > +
> > +       /* Pins not associated with a GPIO port */
> > +       SH_PFC_PIN_NAMED_CFG('A',  8,  A8, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_TX_CTL */
> > +       SH_PFC_PIN_NAMED_CFG('A',  9,  A9, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_MDIO */
> > +       SH_PFC_PIN_NAMED_CFG('A', 12, A12, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_TXCREFCLK */
> > +       SH_PFC_PIN_NAMED_CFG('A', 13, A13, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_RD0 */
> > +       SH_PFC_PIN_NAMED_CFG('A', 14, A14, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_RD2 */
> > +       SH_PFC_PIN_NAMED_CFG('A', 16, A16, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_RX_CTL */
> > +       SH_PFC_PIN_NAMED_CFG('A', 17, A17, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_TD2 */
> > +       SH_PFC_PIN_NAMED_CFG('A', 18, A18, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_TD0 */
> > +       SH_PFC_PIN_NAMED_CFG('A', 19, A19, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_TXC */
> > +       SH_PFC_PIN_NAMED_CFG('B', 13, B13, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_RD1 */
> > +       SH_PFC_PIN_NAMED_CFG('B', 14, B14, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_RD3 */
> > +       SH_PFC_PIN_NAMED_CFG('B', 17, B17, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_TD3 */
> > +       SH_PFC_PIN_NAMED_CFG('B', 18, B18, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_TD1 */
> > +       SH_PFC_PIN_NAMED_CFG('B', 19, B19, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* AVB_RXC */
> > +       SH_PFC_PIN_NAMED_CFG('C',  1,  C1, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* PRESETOUT# */
> > +       SH_PFC_PIN_NAMED_CFG('F',  1,  F1, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* CLKOUT */
> > +       SH_PFC_PIN_NAMED_CFG('H', 37, H37, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* MLB_REF */
> > +       SH_PFC_PIN_NAMED_CFG('V',  3,  V3, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* QSPI1_SPCLK */
> > +       SH_PFC_PIN_NAMED_CFG('V',  5,  V5, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* QSPI1_SSL */
> > +       SH_PFC_PIN_NAMED_CFG('V',  6,  V6, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* RPC_WP# */
> > +       SH_PFC_PIN_NAMED_CFG('V',  7,  V7, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* RPC_RESET# */
> > +       SH_PFC_PIN_NAMED_CFG('W',  3,  W3, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* QSPI0_SPCLK */
> > +       SH_PFC_PIN_NAMED_CFG('Y',  3,  Y3, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* QSPI0_SSL */
> > +       SH_PFC_PIN_NAMED_CFG('Y',  6,  Y6, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* QSPI0_IO2 */
> > +       SH_PFC_PIN_NAMED_CFG('Y',  7,  Y7, SH_PFC_PIN_CFG_DRIVE_STRENGTH),                      /* RPC_INT# */
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('B'),  4,  AB4, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* QSPI0_MISO_IO1 */
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('B'),  6,  AB6, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* QSPI0_IO3 */
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  3,  AC3, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* QSPI1_IO3 */
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  5,  AC5, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* QSPI0_MOSI_IO0 */
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('C'),  7,  AC7, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* QSPI1_MOSI_IO0 */
> 
> + SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'),  38,  AD38,
> SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* FSCLKST */
> 
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  4,  AE4, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* QSPI1_IO2 */
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('E'),  5,  AE5, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* QSPI1_MISO_IO1 */
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  7,  AP7, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* DU_DOTCLKIN0 */
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('P'),  8,  AP8, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* DU_DOTCLKIN1 */
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  7,  AR7, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* DU_DOTCLKIN2 */
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  8,  AR8, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* DU_DOTCLKIN3 */
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'), 30, AR30, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* TMS */
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 28, AT28, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* TDO */
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, AT30, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* ASEBRK */
> 
> All these pin numbers match R-Car H3SiP, while there exists also a plain
> R-Car H3, which uses completely different pin numbers.
> 
> How are we gonna distinguish these two variants?
> Perhaps we can refer to these pins in some other way, to have consistent
> numbering?
> 
> Or don't we have to? Are these numbers visible in userspace (sysfs)?

Unfortunately both the number and name are show in sysfs under 
'/sys/kernel/debug/pinctrl/e6060000.pfc/*', example from the pins node:

<snip>
pin 1906 (PIN_AP7) sh-pfc
pin 1907 (PIN_AP8) sh-pfc
pin 1984 (PIN_AR7) sh-pfc
pin 1985 (PIN_AR8) sh-pfc
pin 2007 (PIN_AR30) sh-pfc
pin 2083 (PIN_AT28) sh-pfc
pin 2085 (PIN_AT30) sh-pfc
</snip>

So yes a way to present consistent names is needed if this driver should 
match both H3 variants. But I'm not sure the numbers needs to be 
correlated to the pin matrix they only need to be unique I think, please 
correct me if I'm wrong. And if that is the case then maybe a solution 
to the problem is to simply change the name of the pins from there pin 
matrix location to there function:

- SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, AT30, SH_PFC_PIN_CFG_DRIVE_STRENGTH),        /* ASEBRK */
+ SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('T'), 30, ASEBRK, SH_PFC_PIN_CFG_DRIVE_STRENGTH),      /* ASEBRK */

That would keep the names and numbers consistent on both H3 varinats.  
The names would correlate to function and the numbers simply serve as a 
pin identifier which is unique and derived from the H3SiP pin layout, 
probably a comment about this in the source is a good idea :-)

Let me know what you think about this solution and I will work it in to 
the next version of this series.

> 
> > @@ -4932,20 +5045,29 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
> >                 { RCAR_GP_PIN(0, 13),  0, 3 },  /* D13 */
> >         } },
> >         { PINMUX_DRIVE_REG("DRVCTRL11", 0xe606032c) {
> > -               { RCAR_GP_PIN(0, 14), 28, 3 },  /* D14 */
> > -               { RCAR_GP_PIN(0, 15), 24, 3 },  /* D15 */
> > -               { RCAR_GP_PIN(7,  0), 20, 3 },  /* AVS1 */
> > -               { RCAR_GP_PIN(7,  1), 16, 3 },  /* AVS2 */
> > -               { RCAR_GP_PIN(7,  2), 12, 3 },  /* HDMI0_CEC */
> > -               { RCAR_GP_PIN(7,  3),  8, 3 },  /* HDMI1_CEC */
> > +               { RCAR_GP_PIN(0, 14),   28, 3 },        /* D14 */
> > +               { RCAR_GP_PIN(0, 15),   24, 3 },        /* D15 */
> > +               { RCAR_GP_PIN(7,  0),   20, 3 },        /* AVS1 */
> > +               { RCAR_GP_PIN(7,  1),   16, 3 },        /* AVS2 */
> > +               { RCAR_GP_PIN(7,  2),   12, 3 },        /* HDMI0_CEC */
> > +               { RCAR_GP_PIN(7,  3),    8, 3 },        /* HDMI1_CEC */
> > +               { PIN_A_NUMBER('P', 7),  4, 2 },        /* DU_DOTCLKIN0 */
> > +               { PIN_A_NUMBER('P', 8),  0, 2 },        /* DU_DOTCLKIN1 */
> > +       } },
> > +       { PINMUX_DRIVE_REG("DRVCTRL12", 0xe6060330) {
> > +               { PIN_A_NUMBER('R', 7),  28, 2 },       /* DU_DOTCLKIN2 */
> > +               { PIN_A_NUMBER('R', 8),  24, 2 },       /* DU_DOTCLKIN3 */
> 
> { PIN_A_NUMBER('D', 38), 20, 2 },        /* FSCLKST */
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
