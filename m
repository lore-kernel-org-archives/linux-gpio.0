From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Add a quirk to make Acer Chromebook
 keyboard work again
Date: Thu, 6 Apr 2017 12:59:48 +0300
Message-ID: <20170406095948.GT2957@lahna.fi.intel.com>
References: <20170329095932.73368-1-mika.westerberg@linux.intel.com>
 <CACRpkdYm_wzJWskrkStgjXPM=F93S3K3HO-c5Tt=qSVJOxkGAw@mail.gmail.com>
 <da0935b8-245a-6920-4749-ade6eb278dba@arm.com>
 <20170330090047.GX2957@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:59032 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933117AbdDFKCF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 Apr 2017 06:02:05 -0400
Content-Disposition: inline
In-Reply-To: <20170330090047.GX2957@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Adam S Levy <theadamlevy@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 30, 2017 at 12:00:47PM +0300, Mika Westerberg wrote:
> > > Isn't the right solution to translate this back to the offset from the "Linux
> > > IRQ" and use that offset? This quirk seems pretty violent.
> > 
> > I'm not sure I understand the quirk here, but my personal approach would
> > be to provide an inverse mapping oldIRQ->hwirq, and use the usual
> > irqdomain lookup to get back to the real thing.
> 
> OK, thanks for tip. Let me try both approaches and see which one works
> better :)

I've now looked at the issue again and I'm actually not sure if we can
use either of the proposals here :/

Essentially all the Linux IRQ<->hwirq mappings are created when the
gpiochip is initialized in gpiochip_irqchip_add(). Because of that, I
don't see how we can change those afterwards when the i8042 keyboard
driver asks for IRQ 182. Maybe I'm missing something obvious but to me
the only way to go forward is to do what this patch does and add all the
GPIOs to the irqdomain (if we don't want to add a custom IRQ domain for
cherryview).
