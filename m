From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2] pinctrl: single: support GPIO for bits pinctrl
Date: Tue, 7 Jul 2015 00:42:29 -0700
Message-ID: <20150707074228.GP10705@atomide.com>
References: <1436191025-9024-1-git-send-email-jun.nie@linaro.org>
 <20150706154205.GE10644@atomide.com>
 <CABymUCNxe1onc+tBT3_Nt9JADhBVaT3cLof7oAYPfGdWNyoi_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:33530 "EHLO muru.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754201AbbGGHmc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 7 Jul 2015 03:42:32 -0400
Content-Disposition: inline
In-Reply-To: <CABymUCNxe1onc+tBT3_Nt9JADhBVaT3cLof7oAYPfGdWNyoi_A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jun Nie <jun.nie@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, "wan.zhijun" <wan.zhijun@zte.com.cn>, Jason Liu <jason.liu@linaro.org>

* Jun Nie <jun.nie@linaro.org> [150706 18:59]:
> 2015-07-06 23:42 GMT+08:00 Tony Lindgren <tony@atomide.com>:
> > * Jun Nie <jun.nie@linaro.org> [150706 06:59]:
> >> Support GPIO for one register control multiple pins case
> >> with calculating register offset first, then bit offset.
> >>
> >> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >> ---
> >>  drivers/pinctrl/pinctrl-single.c | 22 ++++++++++++++++++----
> >>  1 file changed, 18 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> >> index 13b45f2..4f23ef0 100644
> >> --- a/drivers/pinctrl/pinctrl-single.c
> >> +++ b/drivers/pinctrl/pinctrl-single.c
> >> @@ -494,7 +494,7 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
> >>       struct pcs_device *pcs = pinctrl_dev_get_drvdata(pctldev);
> >>       struct pcs_gpiofunc_range *frange = NULL;
> >>       struct list_head *pos, *tmp;
> >> -     int mux_bytes = 0;
> >> +     int offset, mux_bytes = 0;
> >>       unsigned data;
> >>
> >>       /* If function mask is null, return directly. */
> >> @@ -507,9 +507,23 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
> >>                       || pin < frange->offset)
> >>                       continue;
> >>               mux_bytes = pcs->width / BITS_PER_BYTE;
> >> -             data = pcs->read(pcs->base + pin * mux_bytes) & ~pcs->fmask;
> >> -             data |= frange->gpiofunc;
> >> -             pcs->write(data, pcs->base + pin * mux_bytes);
> >> +             if (pcs->bits_per_mux) {
> >> +                     int pin_pos, byte_num, num_pins_in_register;
> >> +
> >> +                     num_pins_in_register = pcs->width / pcs->bits_per_pin;
> >> +                     byte_num = (pcs->bits_per_pin * pin) / BITS_PER_BYTE;
> >> +                     offset = (byte_num / mux_bytes) * mux_bytes;
> >> +                     pin_pos = pin % num_pins_in_register;
> >> +                     pin_pos *= pcs->bits_per_pin;
> >> +                     data = pcs->read(pcs->base + offset) &
> >> +                             ~(pcs->fmask << pin_pos);
> >> +                     data |= (frange->gpiofunc & pcs->fmask) << pin_pos;
> >
> > I don't quite follow you here.. The pcs->fmask is for the whole register,
> > so I think the fmask should be checked the same way in this case also:
> >
> >                         data = pcs->read(pcs->base + offset) & ~pcs->fmask;
> >                         ...
> >
> > I don't think we can safely assume the fmask would behave differently
> > in this case.
> 
> My understanding to bits_per_mux flags here is that one 32bits
> register shall control 16 pins if every pin takes 2 bits for function
> config, where we shall have dts data:
> "pinctrl-single,function-mask=<0x3>".

Hmm function-mask needs to be for register-width to avoid confusion
and to avoid trying to write to register reserved bits. It seems we
need a new property here in addition to function-mask, and also need to
correct the function-mask usage.

The confusion seems to be introduced in 4e7e8017a80e ("pinctrl:
pinctrl-single: enhance to configure multiple pins of different
modules").

> In this case, pcs->fmask is 0x3 for all pins for we have only one copy
> of pcs->fmask in driver. If we want to configure pin to gpio that
> controlled by bit[3:2], we shall have below value set with shifting
> mask to clear bit[3:2] first, then set desired value to configure it
> as gpio.
>                     data = pcs->read(pcs->base + offset) &
> ~(pcs->fmask << pin_pos);
>                     data = pcs->read(pcs->base + offset) & ~(0x3 << 2);

Yeah OK we need some new property to deal with this. And need to
fix up 4e7e8017a80e usage and ideally get rid of of all the if
(pcs->bits_per_mux) else confusion. 

Regards,

Tony

