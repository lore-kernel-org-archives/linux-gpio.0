From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCHv2 2/6] pinctrl: sh-pfc: Add helper to handle bias lookup
 table
Date: Sat, 12 Nov 2016 14:41:27 +0100
Message-ID: <20161112134127.GA26498@bigcity.dyn.berto.se>
References: <20161111203021.3384-1-niklas.soderlund@ragnatech.se>
 <20161111203021.3384-3-niklas.soderlund@ragnatech.se>
 <4161854.1CIEq2dT0e@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35668 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965294AbcKLNla (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Nov 2016 08:41:30 -0500
Received: by mail-lf0-f54.google.com with SMTP id b14so30185937lfg.2
        for <linux-gpio@vger.kernel.org>; Sat, 12 Nov 2016 05:41:29 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <4161854.1CIEq2dT0e@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Hi Laurent,

Thanks you for the feedback.

On 2016-11-12 03:46:11 +0200, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Friday 11 Nov 2016 21:30:17 Niklas Söderlund wrote:
> > From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > On some SoC there are no simple mapping of pins to bias register bits
> > and a lookup table is needed. This logic is already implemented in some
> > SoC specific drivers that could benefit from a generic implementation.
> > 
> > Add helpers to deal with the lookup which later can be used by the SoC
> > specific drivers. The logic used to lookup are different from the one it
> > aims to replace, this is intentional. This new method reduces the memory
> > consumption at the cost of increased CPU usage and fix a bug where a
> > WARN() would incorrectly be triggered if the register offset is 0.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/pinctrl/sh-pfc/core.c   | 16 ++++++++++++++++
> >  drivers/pinctrl/sh-pfc/core.h   |  4 ++++
> >  drivers/pinctrl/sh-pfc/sh_pfc.h |  6 ++++++
> >  3 files changed, 26 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
> > index f3a8897..8e38df7 100644
> > --- a/drivers/pinctrl/sh-pfc/core.c
> > +++ b/drivers/pinctrl/sh-pfc/core.c
> > @@ -389,6 +389,22 @@ int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned
> > mark, int pinmux_type) return 0;
> >  }
> > 
> > +int sh_pfc_pin_to_bias_info(const struct sh_pfc_bias_info *pullups,
> > +			    unsigned int num, unsigned int pin,
> > +			    struct sh_pfc_bias_info *info)
> 
> How about returning a const struct sh_pfc_bias_info * instead ? This would 
> avoid copying the data into the *info argument. You could then rename pullups 
> to info (I don't really like the pullups name as the table can contain 
> pulldown information as well).

Good idea, I will update the patch in this way.

> 
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < num; i++) {
> > +		if (pullups[i].pin == pin) {
> > +			*info = pullups[i];
> > +			return 0;
> > +		}
> > +	}
> > +
> > +	return WARN_ON_ONCE(-EINVAL);
> > +}
> > +
> >  static int sh_pfc_init_ranges(struct sh_pfc *pfc)
> >  {
> >  	struct sh_pfc_pin_range *range;
> > diff --git a/drivers/pinctrl/sh-pfc/core.h b/drivers/pinctrl/sh-pfc/core.h
> > index 0bbdea58..d902cd2 100644
> > --- a/drivers/pinctrl/sh-pfc/core.h
> > +++ b/drivers/pinctrl/sh-pfc/core.h
> > @@ -33,4 +33,8 @@ void sh_pfc_write_reg(struct sh_pfc *pfc, u32 reg,
> > unsigned int width, int sh_pfc_get_pin_index(struct sh_pfc *pfc, unsigned
> > int pin);
> >  int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned mark, int pinmux_type);
> > 
> > +int sh_pfc_pin_to_bias_info(const struct sh_pfc_bias_info *pullups,
> > +			    unsigned int num, unsigned int pin,
> > +			    struct sh_pfc_bias_info *info);
> > +
> >  #endif /* __SH_PFC_CORE_H__ */
> > diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h
> > b/drivers/pinctrl/sh-pfc/sh_pfc.h index 2345421..fc82b6d 100644
> > --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> > +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> > @@ -189,6 +189,12 @@ struct sh_pfc_window {
> >  	unsigned long size;
> >  };
> > 
> > +struct sh_pfc_bias_info {
> > +	unsigned int pin;
> 
> You should make this a u16, otherwise the structure will be padded to 8 bytes 
> anyway, removing the benefit of storing reg and bit in 16 bits.

Thanks I did not know that, will update.

> 
> > +	u16 reg : 11;
> > +	u16 bit : 5;
> > +};
> > +
> >  struct sh_pfc_pin_range;
> > 
> >  struct sh_pfc {

-- 
Regards,
Niklas Söderlund
