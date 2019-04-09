From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: pinctrl-intel: move gpio suspend/resume to
 noirq phase
Date: Tue, 9 Apr 2019 18:28:46 +0300
Message-ID: <20190409152846.GT9224@smile.fi.intel.com>
References: <1554720566-29103-1-git-send-email-binbin.wu@intel.com>
 <20190408124348.GQ9224@smile.fi.intel.com>
 <20190408125126.GR3622@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190408125126.GR3622@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Binbin Wu <binbin.wu@intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 08, 2019 at 03:51:26PM +0300, Mika Westerberg wrote:
> On Mon, Apr 08, 2019 at 03:43:48PM +0300, Andy Shevchenko wrote:
> > On Mon, Apr 08, 2019 at 06:49:26PM +0800, Binbin Wu wrote:
> > > In current driver, SET_LATE_SYSTEM_SLEEP_PM_OPS is used to install the
> > > callbacks for suspend/resume.
> > > GPIO pin may be used as the interrupt pin by some device. However, using
> > > SET_LATE_SYSTEM_SLEEP_PM_OPS() to install the callbacks, the resume
> > > callback is called after resume_device_irqs(). Unintended interrupts may
> > > arrive due to resuming device irqs first, but the GPIO controller is not
> > > properly restored.
> > > 
> > > Normally, for a SMP system, there are multiple cores, so even when there are
> > > unintended interrupts, BSP gets the chance to init the gpio chip soon.
> > 
> > gpio -> GPIO.
> > (If Mika is okay with patch content, I may fix this when applying)
> 
> Yup, this looks good to me.
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko
