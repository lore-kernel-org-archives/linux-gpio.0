From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Implements gpio free function
Date: Fri, 22 Mar 2019 21:06:10 +0200
Message-ID: <20190322190610.GB9224@smile.fi.intel.com>
References: <1553135724-38331-1-git-send-email-zhuchangchun@cvte.com>
 <20190321084420.GG3622@lahna.fi.intel.com>
 <20190321092330.GK9224@smile.fi.intel.com>
 <140c6ec0-7c11-6aa9-8434-f14d77be9a8c@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <140c6ec0-7c11-6aa9-8434-f14d77be9a8c@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, zhuchangchun <zhuchangchun@cvte.com>, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, hendychu@aliyun.com
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 22, 2019 at 07:32:28PM +0100, Enrico Weigelt, metux IT consult wrote:
> On 21.03.19 10:23, Andy Shevchenko wrote:
> 
> > ...and on top of that GPIO sysfs interface is deprecated.
> 
> I don't like the idea of deprecating this. It might not be enough for
> all usecases, but for a lot of usecases, it's a very easy and simple
> interfaces.

So, you probably late for more than year. Linus W. and others discussed that
a lot and the points of the choice are listed in documentation IIRC.


-- 
With Best Regards,
Andy Shevchenko
