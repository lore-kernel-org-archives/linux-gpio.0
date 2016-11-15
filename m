From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCHv2 1/2] pinctrl: sh-pfc: r8a7796: Add drive strength
 support
Date: Tue, 15 Nov 2016 13:18:10 +0100
Message-ID: <20161115121810.GD27089@bigcity.dyn.berto.se>
References: <20161112161002.13070-1-niklas.soderlund+renesas@ragnatech.se>
 <20161112161002.13070-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUmw14iv7P+anCF6X9XBD7wFSKuDjCk-N_vqCUqOZYHmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUmw14iv7P+anCF6X9XBD7wFSKuDjCk-N_vqCUqOZYHmQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your feedback.

On 2016-11-15 12:43:42 +0100, Geert Uytterhoeven wrote:
> On Sat, Nov 12, 2016 at 5:10 PM, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Define the drive strength registers for the R8A7796. Add pins which are
> > not part of a GPIO bank nor can be muxed between different functions but
> > which still allow for there drive-strength to be configured.
> 
> their
> 
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 361 +++++++++++++++++++++++++++++++++--
> >  1 file changed, 349 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> > index dc9b671..f06559c 100644
> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> 
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
> > +       FM(AVB_TXCREFCLK) FM(AVB_MDIO) \
> > +       FM(PRESETOUT) \
> > +       FM(DU_DOTCLKIN0) FM(DU_DOTCLKIN1) FM(DU_DOTCLKIN2) FM(DU_DOTCLKIN3) \
> 
> M3-W does not have DU_DOTCLKIN3.

You are correct, I got confused since there are lead which are named 
"DU_DOTCLKIN3_18". I must have looked at those names instead of the pin 
names. For example the lead "DU_DOTCLKIN3_18" is connected to pin 
"DU_DOTCLKIN2" which is AR8.

Will drop the DU_DOTCLKIN3 from this series.

> 
> > +       FM(TMS) FM(TDO) FM(ASEBRK) FM(MLB_REF)
> 
> > +/*
> > + * R8A7796 has 8 banks with 32 PGIOS in each => 256 GPIOs.
> 
> s/PGIOS/GPIOs/

Thanks for spotting this.

> 
> >  static const struct sh_pfc_pin pinmux_pins[] = {
> >         PINMUX_GPIO_GP_ALL(),
> > +
> > +       /*
> > +        * Pins not associated with a GPIO port.
> > +        *
> > +        * The pin positions are different between different r8a7796
> > +        * packages, all that is needed for the pfc driver is a unique
> > +        * number for each pin. To this end use the pin layout from
> > +        * R-Car M3SiP to calculate a unique number for each pin.
> > +        */
> 
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  7, DU_DOTCLKIN2, SH_PFC_PIN_CFG_DRIVE_STRENGTH),
> 
> DU_DOTCLKIN3 is pin AR8.

DU_DOTCLKIN2 is pin AR8, right?

AR7 is NC on M3-W but is connected to lead named "DU_DOTCLKIN2_18" which 
confuses me, will update so DU_DOTCLKIN2 is pin AR8.

> 
> > +       SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('R'),  8, DU_DOTCLKIN3, SH_PFC_PIN_CFG_DRIVE_STRENGTH),
> 
> M3-W does not have DU_DOTCLKIN3.
> 
> 
> > @@ -2631,6 +2718,255 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
> >         { },
> >  };
> >
> > +static const struct pinmux_drive_reg pinmux_drive_regs[] = {
> 
> > +       { PINMUX_DRIVE_REG("DRVCTRL12", 0xe6060330) {
> > +               { PIN_A_NUMBER('R', 7),  28, 2 },       /* DU_DOTCLKIN2 */
> 
> DU_DOTCLKIN3 is pin AR8.

DU_DOTCLKIN2 is pin AR8, right?

> 
> > +               { PIN_A_NUMBER('R', 8),  24, 2 },       /* DU_DOTCLKIN3 */
> 
> Probably this is a bug in the datasheet, as M3-W does not have DU_DOTCLKIN3?

No bug in the datasheet only me who is confused by the naming of the 
external leads and pins described above. Will fix this up and resend 
after your feedback, sorry for the confusion and thanks for spotting it.

> 
> > +               { PIN_A_NUMBER('D', 38), 20, 2 },       /* FSCLKST# */
> 
> "FSCLKST" (without "#")
> 
> > +               { RCAR_GP_PIN(5,  3),  0, 3 },  /* CTS0 */
> 
> All RTS/CTS signals are active low, hence "#".
> But it seems there are many more inconsistencies w.r.t. this.
> Do we care?

Maybe I should follow that convention and drop the # from all pin names?  
Let me know what you think and I will update and resend.

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
