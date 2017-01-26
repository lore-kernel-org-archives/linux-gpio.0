From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Suspicious debounce handling code in pintctrl-baytrail
Date: Thu, 26 Jan 2017 16:08:11 +0200
Message-ID: <20170126140811.GJ17297@lahna.fi.intel.com>
References: <20170126142020.7bfd1229@endymion>
 <20170126134341.GI17297@lahna.fi.intel.com>
 <20170126150046.2ca78ed6@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:59487 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751733AbdAZOK0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 09:10:26 -0500
Content-Disposition: inline
In-Reply-To: <20170126150046.2ca78ed6@endymion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Cristina Ciocan <cristina.ciocan@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>

On Thu, Jan 26, 2017 at 03:00:46PM +0100, Jean Delvare wrote:
> Hi Mika, hello Andy,
> 
> On Thu, 26 Jan 2017 15:43:41 +0200, Mika Westerberg wrote:
> > On Thu, Jan 26, 2017 at 02:20:20PM +0100, Jean Delvare wrote:
> > > Hi Cristina,
> > > 
> > > In this commit:
> > > 
> > > commit 658b476c742fe379e7020309fd590a27b457a4c1
> > > Date:   Fri Apr 1 14:00:07 2016 +0300
> > > 
> > >     pinctrl: baytrail: Add debounce configuration
> > > 
> > > you added support for getting and setting debounce configuration for
> > > the Baytrail pins. Now gcc complains about the following:
> > > 
> > >   CC [M]  drivers/pinctrl/intel/pinctrl-baytrail.o
> > > drivers/pinctrl/intel/pinctrl-baytrail.c: In function ‘byt_pin_config_set’:
> > > drivers/pinctrl/intel/pinctrl-baytrail.c:1181:17: warning: variable ‘debounce’ set but not used [-Wunused-but-set-variable]
> > >   u32 conf, val, debounce;
> > >                  ^
> > > 
> > > I looked at the code, and it indeed looks wrong. You are reading the
> > > BYT_DEBOUNCE_REG register, clearing the debounce time bits from it, and
> > > then writing the debounce time bits to the *BYT_CONF0_REG* register.
> > > This is certainly corrupting the chip configuration, as the
> > > configuration register bits 2-0 have a completely different meaning
> > > (mux configuration.)
> > 
> > Yes, you are right.
> > 
> > This is fixed by following commit from Andy:
> > 
> > https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-pinctrl.git/commit/?h=fixes&id=04ff5a095d662e0879f0eb04b9247e092210aeff
> 
> Thanks for the pointer, I wasn't aware of that patch. Looks overall
> good, but:
> 
> +			case 0:
> +				conf &= BYT_DEBOUNCE_EN;
> +				break;
> 
> looks suspicious to me. I think ~BYT_DEBOUNCE_EN was intended?

Good catch! Yes, definitely it should be ~BYT_DEBOUNCE_EN.

> Furthermore I would expect conf |= BYT_DEBOUNCE_EN in the other cases,
> otherwise disabling debounce once will prevent you from enabling it
> forever.
> 
> Also Andy's patch doesn't seem to address my second point:
> 
> > Additionally, I suspect that in the "get" path, the following is wrong:
> > 
> > 	case PIN_CONFIG_INPUT_DEBOUNCE:
> > 		if (!(conf & BYT_DEBOUNCE_EN))
> > 			return -EINVAL;
> > 
> > I'm not familiar with the pinctrl interface but my understanding of
> > the PIN_CONFIG_INPUT_DEBOUNCE documentation is that the driver must
> > return 0 if debouncing is disabled.

Indeed, I also agree it should return 0 here.

We will fix this, thanks!
