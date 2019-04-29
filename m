From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Clear interrupt status in unmask callback
Date: Mon, 29 Apr 2019 16:13:43 +0300
Message-ID: <20190429131343.GC9224@smile.fi.intel.com>
References: <20190422044539.16085-1-kai.heng.feng@canonical.com>
 <20190426214758.GC9224@smile.fi.intel.com>
 <6BCF9C55-E365-4638-8030-99EBA348F8D4@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6BCF9C55-E365-4638-8030-99EBA348F8D4@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: mika.westerberg@linux.intel.com, linus.walleij@linaro.org, hotwater438@tutanota.com, hdegoede@redhat.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 29, 2019 at 05:16:16PM +0800, Kai-Heng Feng wrote:
> at 05:47, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Apr 22, 2019 at 12:45:39PM +0800, Kai-Heng Feng wrote:
> > > Commit a939bb57cd47 ("pinctrl: intel: implement gpio_irq_enable") was
> > > added because clearing interrupt status bit is required to avoid
> > > unexpected behavior.
> > > 
> > > Turns out the unmask callback also needs the fix, which can solve weird
> > > IRQ triggering issues on I2C touchpad ELAN1200.

> > Is it possible scenario when IRQ enable is called, but not masking
> > callbacks?
> > For _AEI or GPE?
> 
> I am unfamiliar with both of them, what are the callbacks to be used for
> _AEI and GPE case?
> Seems like both gpiolib and irqchip call irq_unmask() when irq_enable() is
> absent.

Yes, that's correct, thank you for double checking.

 * @irq_enable:         enable the interrupt (defaults to chip->unmask if NULL)


Wait for v2 with mentioned earlier changes and gathered tags.

-- 
With Best Regards,
Andy Shevchenko
