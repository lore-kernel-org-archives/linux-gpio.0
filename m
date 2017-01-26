From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
Subject: Re: Suspicious debounce handling code in pintctrl-baytrail
Date: Thu, 26 Jan 2017 16:50:36 +0200
Message-ID: <20170126145036.GK17297@lahna.fi.intel.com>
References: <20170126142020.7bfd1229@endymion>
 <20170126134341.GI17297@lahna.fi.intel.com>
 <20170126150046.2ca78ed6@endymion>
 <1485439990.2133.343.camel@intel.com>
 <1485440121.2133.344.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:19323 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752030AbdAZOzS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 09:55:18 -0500
Content-Disposition: inline
In-Reply-To: <1485440121.2133.344.camel@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Cc: "jdelvare@suse.de" <jdelvare@suse.de>, "Ciocan, Cristina" <cristina.ciocan@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>

On Thu, Jan 26, 2017 at 02:15:21PM +0000, Shevchenko, Andriy wrote:
> On Thu, 2017-01-26 at 16:13 +0200, Andy Shevchenko wrote:
> > On Thu, 2017-01-26 at 15:00 +0100, Jean Delvare wrote:
> > > Hi Mika, hello Andy,
> > > 
> 
> > > Additionally, I suspect that in the "get" path, the following is
> > > > wrong:
> > > > 
> > > > 	case PIN_CONFIG_INPUT_DEBOUNCE:
> > > > 		if (!(conf & BYT_DEBOUNCE_EN))
> > > > 			return -EINVAL;
> > > > 
> > > > I'm not familiar with the pinctrl interface but my understanding
> > > > of
> > > > the PIN_CONFIG_INPUT_DEBOUNCE documentation is that the driver
> > > > must
> > > > return 0 if debouncing is disabled.
> > > 
> > > ?
> 
> No, this is correct.
> "...if it is available but disabled it should return -EINVAL"

OK, thanks Andy for checking it up.
