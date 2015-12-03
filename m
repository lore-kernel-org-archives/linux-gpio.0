From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/2] pinctrl: single: Use a separate lockdep class
Date: Thu, 3 Dec 2015 13:46:46 -0800
Message-ID: <20151203214646.GD23396@atomide.com>
References: <1448644860-29323-1-git-send-email-sudeep.holla@arm.com>
 <CACRpkda3g7FXV4vLtj0LnV5H3vhumDrngHeJ6F7yc8y1k_dABg@mail.gmail.com>
 <565DAA09.3030201@arm.com>
 <20151203180721.GU23396@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:50651 "EHLO muru.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750736AbbLCVqv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 3 Dec 2015 16:46:51 -0500
Content-Disposition: inline
In-Reply-To: <20151203180721.GU23396@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

* Tony Lindgren <tony@atomide.com> [151203 10:07]:
> * Sudeep Holla <sudeep.holla@arm.com> [151201 06:10]:
> > 
> > 
> > On 01/12/15 14:06, Linus Walleij wrote:
> > >On Fri, Nov 27, 2015 at 6:20 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > >
> > >>The single pinmux controller can be cascaded to the other interrupt
> > >>controllers. Hence when propagating wake-up settings to its parent
> > >>interrupt controller, there's possiblity of detecting possible recursive
> > >>locking and getting lockdep warning.
> > >>
> > >>This patch avoids this false positive by using a separate lockdep class
> > >>for this single pinctrl interrupts.
> > >>
> > >>Cc: Linus Walleij <linus.walleij@linaro.org>
> > >>Cc: linux-gpio@vger.kernel.org
> > >>Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> > >>Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > >
> > >I need Tony's ACK on this patch before applying.
> > >
> > >Is it a regression that needs to go into fixes?
> > >
> > 
> > Not really, only needed by PATCH 2/2 to avoid recursive locking.
> 
> No problem with this patch, so:
> 
> Acked-by: Tony Lindgren <tony@atomide.com>

Actually this needs to be merged together with 1/2 once the pending
issues are fixed as this will add a lockdep warning with 1/2.

So for now:

Un-Acked-by: Tony Lindgren <tony@atomide.com>
