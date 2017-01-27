From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/3] pinctrl: baytrail: Debounce register is one per
 community
Date: Fri, 27 Jan 2017 15:27:19 +0200
Message-ID: <1485523639.2133.355.camel@linux.intel.com>
References: <20170126172409.132136-1-andriy.shevchenko@linux.intel.com>
         <20170126172409.132136-3-andriy.shevchenko@linux.intel.com>
         <20170127102109.3fb3d018@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:45394 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754976AbdA0N26 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Jan 2017 08:28:58 -0500
In-Reply-To: <20170127102109.3fb3d018@endymion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, Cristina Ciocan <cristina.ciocan@intel.com>

On Fri, 2017-01-27 at 10:21 +0100, Jean Delvare wrote:
> On Thu, 26 Jan 2017 19:24:08 +0200, Andy Shevchenko wrote:
> > Debounce value is set globally per community. Otherwise user will
> > easily
> > get a kernel crash when they start using the feature:
> > 
> > BUG: unable to handle kernel paging request at ffffc900003be000
> > IP: byt_gpio_dbg_show+0xa9/0x430
> > 
> > Make it clear in byt_gpio_reg().
> > 
> > Note that this fix just prevents kernel to crash, but doesn't make
> > any
> > difference to the existing logic. It means the last caller will win
> > the
> > trade and debounce value will be configured accordingly. The actual
> > logic fix needs to be thought about and it's not as important as
> > crash
> > fix. That's why the latter goes separately and right now.
> > 
> > Fixes: 658b476c742f ("pinctrl: baytrail: Add debounce
> > configuration")
> > Cc: Cristina Ciocan <cristina.ciocan@intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/pinctrl/intel/pinctrl-baytrail.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c
> > b/drivers/pinctrl/intel/pinctrl-baytrail.c
> > index 958db4f5ee9b..a1f85a79f186 100644
> > --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> > +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> > @@ -731,16 +731,23 @@ static void __iomem *byt_gpio_reg(struct
> > byt_gpio *vg, unsigned int offset,
> >  				  int reg)
> >  {
> >  	struct byt_community *comm = byt_get_community(vg, offset);
> > -	u32 reg_offset = 0;
> > +	u32 reg_offset;
> >  
> >  	if (!comm)
> >  		return NULL;
> >  
> >  	offset -= comm->pin_base;
> > -	if (reg == BYT_INT_STAT_REG)
> > +	switch (reg) {
> > +	case BYT_INT_STAT_REG:
> >  		reg_offset = (offset / 32) * 4;
> > -	else
> > +		break;
> > +	case BYT_DEBOUNCE_REG:
> > +		reg_offset = 0;
> > +		break;
> > +	default:
> >  		reg_offset = comm->pad_map[offset] * 16;
> > +		break;
> 
> That break isn't needed ;-)

Would be better to have in my opinion. I already did myself some
mistakes regarding to missed break.

> > +	}
> >  
> >  	return comm->reg_base + reg_offset + reg;
> >  }
> 
> The code looks sane to me, although I can't verify its correctness
> without a datasheet.

Datasheet is public.

Intel® Atom™ Processor Z3600 and Z3700 Series Datasheet (Volume 2 of 2)
Number: 329518-002

> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks!

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
