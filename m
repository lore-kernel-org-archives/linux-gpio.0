From: "andriy.shevchenko" <andriy.shevchenko@linux.intel.com>
Subject: Re: Re: [PATCH] pinctrl: intel: Implements gpio free function
Date: Sat, 23 Mar 2019 18:48:10 +0200
Message-ID: <20190323164810.GE9224@smile.fi.intel.com>
References: <20190321084420.GG3622@lahna.fi.intel.com>
 <2019032119195575582546@cvte.com>
 <20190321120324.GI3622@lahna.fi.intel.com>
 <2019032120213955866649@cvte.com>
 <20190321123637.GJ3622@lahna.fi.intel.com>
 <2019032121342663125658@cvte.com>
 <20190321135642.GK3622@lahna.fi.intel.com>
 <2019032211131426883268@cvte.com>
 <20190322104242.GV3622@lahna.fi.intel.com>
 <2019032314505202825175@cvte.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2019032314505202825175@cvte.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "zhuchangchun@cvte.com" <zhuchangchun@cvte.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linus.walleij" <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, hendychu <hendychu@aliyun.com>
List-Id: linux-gpio@vger.kernel.org

On Sat, Mar 23, 2019 at 02:51:52PM +0800, zhuchangchun@cvte.com wrote:
> On Fri, Mar 22, 2019 at 11:14:14AM +0800, zhuchangchun@cvte.com wrote:

> >    From above,you can kown when you export a GPIO ,it will do request,
> >
> >    and there will set TX and RX register at the time same time.
> >
> >    when you try to set direction in and set value, TX register value can
> >    roll back
> >
> >    the value,but RX register was not set, so who will set RX value back??
>  
> I think you are looking at some older code. There is now function
> __intel_gpio_set_direction() that is supposed to set both buffers
> depending on the direction. It was introduced with commit 17fab473693e
> ("pinctrl: intel: Set pin direction properly").
> 
> 
> --> Yes ,I see the latest master branch, the __intel_gpio_set_direction will
> set RX and TX, but I still think we need to implement free function,cause
> it will help many other engineers,especailly for some manufactories use some
> module,and this modules embeded its own driver but not can be modified,
> if they want use the gpio control the module, they may meet the same problem.

What problem?
Is it reproducible on latest vanilla kernel?

-- 
With Best Regards,
Andy Shevchenko
