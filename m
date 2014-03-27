From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] gpio-sch: set output level after configuration of direction
Date: Thu, 27 Mar 2014 14:10:15 +0100
Message-ID: <8978154.5j6gWjKto1@ws-stein>
References: <1395740006-8554-1-git-send-email-alexander.stein@systec-electronic.com> <20140326190543.GN3998@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:32860 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754914AbaC0NLR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 27 Mar 2014 09:11:17 -0400
In-Reply-To: <20140326190543.GN3998@book.gsilab.sittig.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Daniel Krueger <daniel.krueger@systec-electronic.com>

On Wednesday 26 March 2014 20:05:43, Gerhard Sittig wrote:
> On Tue, 2014-03-25 at 10:33 +0100, Alexander Stein wrote:
> > 
> > According to the datasheet, writing to the level register has no effect
> > when GPIO is programmed as input. Hence we set the level after configuring
> > the GPIO as output. But we cannot prevent a short low pulse if direction is
> > set to high and an external pull-up is connected.
> 
> Does "will have no effect" actually translate into "should not be
> done" or even "must not be done"?  Doesn't sound like it.

I would translate that into 'won't do anything', it's read-only, thus the written value is lost. It just reflects the current signal when configured as input.

> I understood that setting the data register for input pins does
> nothing in that very moment, yet when switching to output the
> value immediately gets used.  So this is the most appropriate
> thing to do.

That would be the correct way, if hardware can be programmed that way. But if the data register is set when GPIO is confgured as input the data is lost. So when switching to output it does _NOT_ have the previously set value.
That's why the direction is set first and data afterwards. Awkward, but yet the only way to set an "initial" output value

Regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein

SYS TEC electronic GmbH
Am Windrad 2
08468 Heinsdorfergrund
Tel.: 03765 38600-1156
Fax: 03765 38600-4100
Email: alexander.stein@systec-electronic.com
Website: www.systec-electronic.com
 
Managing Director: Dipl.-Phys. Siegmar Schmidt
Commercial registry: Amtsgericht Chemnitz, HRB 28082

