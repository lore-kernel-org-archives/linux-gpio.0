From: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH] pinctrl:intel: Retain HOSTSW_OWN for requested gpio pin
Date: Mon, 8 Apr 2019 13:09:47 +0300
Message-ID: <20190408100947.GI9224@smile.fi.intel.com>
References: <20190408042103.3804-1-chiu@endlessm.com>
 <20190408074106.GC3622@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190408074106.GC3622@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Chris Chiu <chiu@endlessm.com>, heikki.krogerus@linux.intel.com, drake@endlessm.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 08, 2019 at 10:41:06AM +0300, Mika Westerberg wrote:
> On Mon, Apr 08, 2019 at 12:21:03PM +0800, Chris Chiu wrote:
> > +static void

static u32

(see below why)

> > +intel_gpio_update_pad_mode(void __iomem *hostown, u32 mask, u32 value)
> > +{
> > +	u32 curr = readl(hostown);
> > +	u32 updated = (curr & ~mask) | (value & mask);
> 
> I think here we should first complain if the expected ownership is not
> correct. Warning or info level probably enough.

It is easy to achieve, something like

if ((value ^ saved) & requeted)
	dev_warn(...);

See also below.

(I had mentioned this earlier)

> > +	return writel(updated, hostown);

writel() is a void function, this is wrong. We need to return curr instead to
make above working to issue a warning message.

> Also if the pin is not requested and not changed we should not touch the
> register.

I don't think it brings any value here, if mask is 0 we will write back the
same value we read.

> Otherwise this looks good to me.

-- 
With Best Regards,
Andy Shevchenko
