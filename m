From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH] gpio: make GPIO_OMAP bool instead of tristate
Date: Wed, 7 Oct 2015 12:57:43 +0530
Message-ID: <20151007072743.GB21158@sudip-pc>
References: <1444132871-25798-1-git-send-email-sudipm.mukherjee@gmail.com>
 <561432D3.20709@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:34130 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751001AbbJGH1v (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2015 03:27:51 -0400
Content-Disposition: inline
In-Reply-To: <561432D3.20709@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Austin Schuh <austin@peloton-tech.com>, Santosh Shilimkar <ssantosh@kernel.org>

On Tue, Oct 06, 2015 at 03:45:07PM -0500, Grygorii Strashko wrote:
> On 10/06/2015 07:01 AM, Sudip Mukherjee wrote:
> > While building arm allmodconfig the build fails with the error:
> > ERROR: "handle_bad_irq" [drivers/gpio/gpio-omap.ko] undefined!
> > 
> > The build breaks as handle_bad_irq is not exported for module use.
> 
> Not sure if this is right thing to do. We really want it to be a module if needed.
> 
> The handle_bad_irq() was used in this driver to catch the case when Omap
> GPIO IRQ is enabled before calling .irq_set_type()   
> 
> I think there are few option:
> - export handle_bad_irq()
> - pass NULL in gpiochip_irqchip_add() instead of handle_bad_irq()
> - use handle_simple_irq()
> - revert this change
> 
> Thought second one should work. 

I think that should be ok. If you want me to test the patch in my setup
to verify that it fixes the build failure please let me know.

But going through the old thread it looked like plan was on to
export handle_bad_irq() atleast thats what looks like from Linus's
(Linus Walleij) reply in https://lkml.org/lkml/2014/2/25/119

regards
sudip
