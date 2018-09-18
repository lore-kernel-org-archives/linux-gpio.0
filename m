From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: pinctrl-icelake: driver writes to wrong offsets?
Date: Tue, 18 Sep 2018 18:31:23 +0300
Message-ID: <20180918153123.GK14465@lahna.fi.intel.com>
References: <CACK8Z6ECjwWqDnaXKrmEbEXzmiX41Sbzys=FSCqMwh8eYLPH9A@mail.gmail.com>
 <20180917081249.GM14465@lahna.fi.intel.com>
 <CACK8Z6EpPCCGWRZX_FEewyoySLjBUUKDPzKZof4LvvKatU_NLg@mail.gmail.com>
 <20180918083157.GC14465@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180918083157.GC14465@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajat Jain <rajatja@google.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, casey.g.bowman@intel.com, "Atwood, Matthew S" <matthew.s.atwood@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 18, 2018 at 11:31:57AM +0300, Mika Westerberg wrote:
> > As you can see in the above example, when I export the pins and change
> > the directions from "in" to "out" PADCFG get updated correctly for pin
> > 18, but when writing the value, it is the PADCFG for pin 42 that gets
> > updated which is incorrect.
> 
> It looks like we are missing translation (call intel_gpio_to_pin()) in
> intel_gpio_set(), intel_gpio_get() and intel_gpio_get_direction(). IIRC
> gpiolib handles the translation but here it seems not. Strange.
> 
> > So this looks like a driver issue to me. Please let me know if I need
> > to file a bug on bugzilla for this.
> 
> I agree, definitely driver issue. Please file bugzilla about this (add
> me and Andy there as well) and we'll investigate.

If you have not yet filed bugzilla about this then I don't think there
is need anymore as I think I have a fix already. It turns out with the
custom GPIO base (Ice Lake, Cannon Lake) the translation is missing
completely in ->get(), ->set() and ->get_direction() operations.

I'll send a proper patch shortly.
