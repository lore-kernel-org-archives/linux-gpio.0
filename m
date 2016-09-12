From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Mon, 12 Sep 2016 16:11:11 +0300
Message-ID: <20160912131111.GG1811@lahna.fi.intel.com>
References: <20160908101303.GA22716@ktx>
 <20160908102402.GC15313@lahna.fi.intel.com>
 <20160908162843.GB22716@ktx>
 <20160909061834.GG15313@lahna.fi.intel.com>
 <20160909082358.GA23895@ktx>
 <20160909085832.GK15313@lahna.fi.intel.com>
 <20160911080506.GO15313@lahna.fi.intel.com>
 <20160912065656.GA2411@ktx>
 <20160912090401.GB1811@lahna.fi.intel.com>
 <20160912130444.GB2411@ktx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:11858 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757742AbcILNUW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Sep 2016 09:20:22 -0400
Content-Disposition: inline
In-Reply-To: <20160912130444.GB2411@ktx>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phidias Chiang <phidias.chiang@canonical.com>
Cc: Anisse Astier <anisse@astier.eu>, Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Sep 12, 2016 at 09:04:44PM +0800, Phidias Chiang wrote:
> On Mon, Sep 12, 2016 at 12:04:01PM +0300, Mika Westerberg wrote:
> > 
> > OK, I see what is going on now. When I changed handle_simple_irq to
> > handle_bad_irq, the IRQ core in __irq_do_set_handler() thinks the
> > handler is uninstalled and masks the line.
> > 
> > If you change handle_bad_irq to handle_simple_irq, in call to
> > gpiochip_irqchip_add(), does it work then?
> 
> Yes it does :), thank you for the support!

Thanks for testing.

So we need to use handle_simple_irq here instead.

Linus, do you see any problems with that?
