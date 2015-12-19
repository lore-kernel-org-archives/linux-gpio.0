From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: pinctrl-adi2: Use a signed return type for adi_gpio_irq_startup()
Date: Sat, 19 Dec 2015 23:45:01 +0300
Message-ID: <20151219204501.GV5284@mwanda>
References: <56758D34.2070806@users.sourceforge.net>
 <20151219201213.GP5284@mwanda>
 <5675C0BB.9020204@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:40361 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753489AbbLSUpU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Dec 2015 15:45:20 -0500
Content-Disposition: inline
In-Reply-To: <5675C0BB.9020204@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sat, Dec 19, 2015 at 09:40:27PM +0100, SF Markus Elfring wrote:
> > This introduces a compile warning.
> 
> How do you think about to show the exact message you get?
> 

I can't actually compile it myself.

> 
> > These functions are supposed to return 1 if there is an IRQ pending.
> > Change the -EINVAL to 0.
> 
> Is there any more source code clean-up needed around the comment "FIXME"
> in the affected function?

Delete the FIXME comment.

regards,
dan carpenter

