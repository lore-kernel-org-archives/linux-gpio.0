From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Implement intel_gpio_get_direction
 callback
Date: Tue, 6 Mar 2018 20:06:13 +0200
Message-ID: <20180306180613.GA22205@lahna.fi.intel.com>
References: <20180306134213.16898-1-javier@emutex.com>
 <3585081b-70af-5c31-08c0-84e96b6055bc@emutex.com>
 <1520348165.10722.438.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520348165.10722.438.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Javier Arteaga <javier@emutex.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 06, 2018 at 04:56:05PM +0200, Andy Shevchenko wrote:
> On Tue, 2018-03-06 at 14:31 +0000, Javier Arteaga wrote:
> > (Fix Andy's Cc: - apologies)
> > 
> > On 06/03/2018 13:42, Javier Arteaga wrote:
> > > Allows querying GPIO direction from the pad config register.
> > > If the pad is not in GPIO mode, return an error.
> > > 
> > > Signed-off-by: Javier Arteaga <javier@emutex.com>
> > > ---
> > > This is needed by the drivers for the UP Squared board, an APL-based
> > > platform. (For now, these drivers are out-of-tree.)
> > > 
> > > An earlier version of this patch was reviewed some time ago by Andy
> > > Shevchenko outside of the mailing lists:
> > > <https://github.com/emutex/ubilinux-kernel/commit/708a776f2ffd1b1c>
> > > 
> 
> Yes, this one look good!
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
