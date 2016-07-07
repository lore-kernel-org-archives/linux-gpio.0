From: Bin Gao <bin.gao@linux.intel.com>
Subject: Re: [PATCH v4] gpio: add Intel WhiskeyCove GPIO driver
Date: Wed, 6 Jul 2016 22:30:35 -0700
Message-ID: <20160707053035.GB115716@worksta>
References: <20160627235616.GA9303@worksta>
 <CACRpkdZJ0AUWmxLApzryCZbQcQmwWO1A-NLMP46WsLkJBZgprQ@mail.gmail.com>
 <20160706100715.GA23527@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:12668 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932740AbcGGF0e (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 7 Jul 2016 01:26:34 -0400
Content-Disposition: inline
In-Reply-To: <20160706100715.GA23527@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>

On Wed, Jul 06, 2016 at 01:07:15PM +0300, Mika Westerberg wrote:
> On Wed, Jul 06, 2016 at 10:57:19AM +0200, Linus Walleij wrote:
> > On Tue, Jun 28, 2016 at 1:56 AM, Bin Gao <bin.gao@linux.intel.com> wrote:
> > 
> > > This patch introduces a separate GPIO driver for Intel WhiskeyCove PMIC.
> > > This driver is based on gpio-crystalcove.c.
> > >
> > > Signed-off-by: Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>
> > > Signed-off-by: Bin Gao <bin.gao@intel.com>
> > > ---
> > > Changes in v4:
> > >  - Converted CTLI_INTCNT_XX macros to less verbose ones INT_DETECT_XX.
> > >  - Add comments about why there is no .pm for the driver.
> > >  - Header files re-ordered.
> > >  - Various coding style change to address Andy's comments.
> > 
> > Mika can I have your ACK/review tag on this driver so I can merge it?
> > I prefer to have all Intel stuff bearing your seal of approval.
> 
> Thanks for your trust :)
> 
> I don't have much comments in addition to what you already pointed out.
> I'll just wait for the next revision and give my ack then.
> 
> > > +static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
> > > +{
> > > +       int pending;
> > > +       unsigned int p0, p1, virq, gpio;
> > > +       struct wcove_gpio *wg = data;
> 
> Bin,
> 
> Since you are going to make another iteration, please arrange the
> declarations like:
> 
> 	unsigned int p0, p1, virq, gpio;
> 	struct wcove_gpio *wg = data;
> 	int pending;

Yes, will do. Thanks.

-Bin
