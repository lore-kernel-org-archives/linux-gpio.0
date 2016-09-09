From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 3/3] pinctrl: sh-pfc: r8a7794: Implement voltage
 switching for SDHI
Date: Fri, 9 Sep 2016 17:26:36 +0200
Message-ID: <20160909152635.GB13747@verge.net.au>
References: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au>
 <1473334608-24638-4-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdW4=89ro4E2zLRs6fPZk3fPfkHmowNybO107nkJtZqGbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38199 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753560AbcIIP0n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2016 11:26:43 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdW4=89ro4E2zLRs6fPZk3fPfkHmowNybO107nkJtZqGbw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>

On Fri, Sep 09, 2016 at 10:08:03AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, Sep 8, 2016 at 1:36 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> > All the SHDIs can operate with either 3.3V or 1.8V signals, depending
> > on negotiation with the card.
> >
> > Based on work by Wolfram Sang for the r8a7790.
> >
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > ---
> >  drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 34 +++++++++++++++++++++++++++++++++-
> >  1 file changed, 33 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> > index 8bc2cf0c594e..c02b367837b7 100644
> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> > @@ -5160,8 +5162,38 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
> >         { },
> >  };
> >
> > +static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
> > +{
> > +       if (pin < RCAR_GP_PIN(6, 0) || pin > RCAR_GP_PIN(6, 23))
> > +               return -EINVAL;
> > +
> > +       *pocctrl = 0xe606006c;
> > +
> > +       /* GP6_16-23 -> bits 31-24 of pocctrl
> > +        * GP6_06    -> bit  23    of pocctrl
> > +        * GP6_00-05 -> bits 22-17 of pocctrl
> > +        * GP6_07    -> bit  16    of pocctrl
> > +        * GP6_14    -> bit  15    of pocctrl
> > +        * GP6_08-13 -> bits 14-09 of pocctrl
> > +        * GP6_15    -> bit  08    of pocctrl
> > +        */
> > +       if (pin == RCAR_GP_PIN(6, 6) || pin == RCAR_GP_PIN(6, 14))
> > +               return 31 - 2 - (pin & 0x1f);
> > +       else if (pin == RCAR_GP_PIN(6, 7) || pin == RCAR_GP_PIN(6, 15))
> > +               return 31 - 8 - (pin & 0x1f);
> > +       else if (pin < RCAR_GP_PIN(6, 14))
> > +               return 31 - 9 - (pin & 0x1f);
> > +       else
> > +               return 31 + 16 - (pin & 0x1f);
> 
> While your code is correct, I think it's easier for the casual reader to use
> a plain switch () statement, and let the optimizer handle the rest.

Like this? If so I don't particularly mind but it doesn't seem clearer to
me.

+static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+{
+	*pocctrl = 0xe606006c;
+
+	switch (pin) {
+	case RCAR_GP_PIN(6, 0):
+		return 22;
+	case RCAR_GP_PIN(6, 1):
+		return 21;
+	case RCAR_GP_PIN(6, 2):
+		return 20;
+	case RCAR_GP_PIN(6, 3):
+		return 19;
+	case RCAR_GP_PIN(6, 4):
+		return 18;
+	case RCAR_GP_PIN(6, 5):
+		return 17;
+	case RCAR_GP_PIN(6, 6):
+		return 23;
+	case RCAR_GP_PIN(6, 7):
+		return 16;
+	case RCAR_GP_PIN(6, 8):
+		return 14;
+	case RCAR_GP_PIN(6, 9):
+		return 13;
+	case RCAR_GP_PIN(6, 10):
+		return 12;
+	case RCAR_GP_PIN(6, 11):
+		return 11;
+	case RCAR_GP_PIN(6, 12):
+		return 10;
+	case RCAR_GP_PIN(6, 13):
+		return 9;
+	case RCAR_GP_PIN(6, 14):
+		return 15;
+	case RCAR_GP_PIN(6, 15):
+		return 8;
+	case RCAR_GP_PIN(6, 16):
+		return 31;
+	case RCAR_GP_PIN(6, 17):
+		return 30;
+	case RCAR_GP_PIN(6, 18):
+		return 29;
+	case RCAR_GP_PIN(6, 19):
+		return 28;
+	case RCAR_GP_PIN(6, 20):
+		return 27;
+	case RCAR_GP_PIN(6, 21):
+		return 26;
+	case RCAR_GP_PIN(6, 22):
+		return 25;
+	case RCAR_GP_PIN(6, 23):
+		return 24;
+	}
+
+	return -EINVAL;
+}
+
+static const struct sh_pfc_soc_operations r8a7794_pinmux_ops = {
+	.pin_to_pocctrl = r8a7794_pin_to_pocctrl,
+};
+
 const struct sh_pfc_soc_info r8a7794_pinmux_info = {
 	.name = "r8a77940_pfc",
+	.ops = &r8a7794_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
