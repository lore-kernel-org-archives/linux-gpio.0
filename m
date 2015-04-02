From: Alexander Stein <alexanders83@web.de>
Subject: Re: Re: [PATCH 2/2] pinctrl: at91: Add missing include
Date: Thu, 02 Apr 2015 11:39:48 +0200
Message-ID: <12638259.j5S92pLO40@kongar>
References: <1426878721-2618-1-git-send-email-alexanders83@web.de> <1426878721-2618-2-git-send-email-alexanders83@web.de> <20150402081941.GB26864@ns203013.ovh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:64504 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751262AbbDBJk0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 2 Apr 2015 05:40:26 -0400
In-Reply-To: <20150402081941.GB26864@ns203013.ovh.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

On Thursday 02 April 2015, 10:19:41 wrote Jean-Christophe PLAGNIOL-VILLARD:
> On 20:12 Fri 20 Mar     , Alexander Stein wrote:
> > This fixes the sparse warning:
> > drivers/pinctrl/pinctrl-at91.c:1556:6: warning: symbol
> >  'at91_pinctrl_gpio_suspend' was not declared. Should it be static?
> > drivers/pinctrl/pinctrl-at91.c:1580:6: warning: symbol
> >  'at91_pinctrl_gpio_resume' was not declared. Should it be static?
> > 
> > Signed-off-by: Alexander Stein <alexanders83@web.de>
> > ---
> >  drivers/pinctrl/pinctrl-at91.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> > index a882523..02f6477 100644
> > --- a/drivers/pinctrl/pinctrl-at91.c
> > +++ b/drivers/pinctrl/pinctrl-at91.c
> > @@ -25,6 +25,8 @@
> >  /* Since we request GPIOs from ourself */
> >  #include <linux/pinctrl/consumer.h>
> >  
> > +#include <mach/hardware.h>
> NACK this will break multi arch support

Mh, i see. So I guess this sparse warning will stay there then.

Best regards,
Alexander

