From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/2] gpio: intel-mid: Remove potentially harmful code
Date: Fri, 8 Jul 2016 11:20:40 +0300
Message-ID: <20160708082040.GW23527@lahna.fi.intel.com>
References: <1467798613-70389-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467798613-70389-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: stable-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>, stable@vger.kernel.org, #@black.fi.intel.com, v3.13+@black.fi.intel.com
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 06, 2016 at 12:50:12PM +0300, Andy Shevchenko wrote:
> The commit d56d6b3d7d69 ("gpio: langwell: add Intel Merrifield support")
> doesn't look at all as a proper support for Intel Merrifield and I dare to say
> that it distorts the behaviour of the hardware.
> 
> The register map is different on Intel Merrifield, i.e. only 6 out of 8
> register have the same purpose but none of them has same location in the
> address space. The current case potentially harmful to existing hardware since
> it's poking registers on wrong offsets and may set some pin to be GPIO output
> when connected hardware doesn't expect such.
> 
> Besides the above GPIO and pinctrl on Intel Merrifield have been located in
> different IP blocks. The functionality has been extended as well, i.e. added
> support of level interrupts, special registers for wake capable sources and
> thus, in my opinion, requires a completele separate driver.
> 
> If someone wondering the existing gpio-intel-mid.c would be converted to actual
> pinctrl (which by the fact it is now), though I wouldn't be a volunteer to do
> that.
> 
> Fixes: d56d6b3d7d69 ("gpio: langwell: add Intel Merrifield support")
> Cc: stable@vger.kernel.org # v3.13+
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

If it is truely poking wrong registers, this is certainly right thing to
do.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

I take it we are getting a driver which is using the correct registers
soon ;-)
