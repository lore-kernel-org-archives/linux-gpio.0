From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl:intel: Retain HOSTSW_OWN for requested gpio pin
Date: Mon, 8 Apr 2019 10:41:06 +0300
Message-ID: <20190408074106.GC3622@lahna.fi.intel.com>
References: <20190408042103.3804-1-chiu@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190408042103.3804-1-chiu@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: andriy.shevchenko@intel.com, heikki.krogerus@linux.intel.com, drake@endlessm.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 08, 2019 at 12:21:03PM +0800, Chris Chiu wrote:
> +static void
> +intel_gpio_update_pad_mode(void __iomem *hostown, u32 mask, u32 value)
> +{
> +	u32 curr = readl(hostown);
> +	u32 updated = (curr & ~mask) | (value & mask);

I think here we should first complain if the expected ownership is not
correct. Warning or info level probably enough.

> +
> +	return writel(updated, hostown);

Also if the pin is not requested and not changed we should not touch the
register.

Otherwise this looks good to me.
