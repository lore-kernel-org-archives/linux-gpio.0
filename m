From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH v2 3/3] gpiolib: Convert fwnode_get_named_gpiod() to configure GPIO
Date: Thu, 12 Jan 2017 13:51:49 +0100
Message-ID: <1830263.uPIogjsk2v@ws-stein>
References: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com> <1633853.HOlbG3UopE@ws-stein> <1484223312.2133.78.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:55568 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750879AbdALMv4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Jan 2017 07:51:56 -0500
In-Reply-To: <1484223312.2133.78.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Thursday 12 January 2017 14:15:12, Andy Shevchenko wrote:
> On Thu, 2017-01-12 at 08:27 +0100, Alexander Stein wrote:
> > On Wednesday 11 January 2017 16:14:57, Andy Shevchenko wrote:
> > > On Wed, 2017-01-11 at 15:35 +0200, Andy Shevchenko wrote:
> > > > On Wed, 2017-01-11 at 13:21 +0100, Linus Walleij wrote:
> > > > > On Mon, Jan 9, 2017 at 3:02 PM, Andy Shevchenko
> > > 
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > Alas, it doesn't apply clearly. gpio_keys_polled.c has been changed
> > > a
> > > lot from that time. So, would you like to fix it yourself?
> > > 
> > > Since mine is applied clearly I may do other way around, rebase and
> > > fix
> > > that patch on top of mine.
> > > How does it sound?
> > 
> > Yeah, I noticed that gpio_keys_polled.c has changed meanwhile, so my
> > patch has 
> > to be modifed anyway. If your patch is applied somewhere I can rebase
> > my 
> > change on that and resubmit.
> 
> First of all, how do you feel if Linus applies my change first?

I don't mind. Just go ahead and point me somewhere I can base on.

> Please, keep me in Cc list for new version if you are going to re-
> base/re-send.

Will do.

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein@systec-electronic.com

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-0
Fax:    +49 (0) 3765 38600-4100
 
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010

