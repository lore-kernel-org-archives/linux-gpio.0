From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH] gpio-sch: set output level after configuration of
 direction
Date: Thu, 27 Mar 2014 20:05:07 +0100
Message-ID: <20140327190507.GX3998@book.gsilab.sittig.org>
References: <1395740006-8554-1-git-send-email-alexander.stein@systec-electronic.com>
 <20140326190543.GN3998@book.gsilab.sittig.org>
 <8978154.5j6gWjKto1@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:35336 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756825AbaC0TFK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Mar 2014 15:05:10 -0400
Content-Disposition: inline
In-Reply-To: <8978154.5j6gWjKto1@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Daniel Krueger <daniel.krueger@systec-electronic.com>

On Thu, 2014-03-27 at 14:10 +0100, Alexander Stein wrote:
> 
> On Wednesday 26 March 2014 20:05:43, Gerhard Sittig wrote:
> > On Tue, 2014-03-25 at 10:33 +0100, Alexander Stein wrote:
> > > 
> > > According to the datasheet, writing to the level register has no effect
> > > when GPIO is programmed as input. Hence we set the level after configuring
> > > the GPIO as output. But we cannot prevent a short low pulse if direction is
> > > set to high and an external pull-up is connected.
> > 
> > Does "will have no effect" actually translate into "should not be
> > done" or even "must not be done"?  Doesn't sound like it.
> 
> I would translate that into 'won't do anything', it's read-only, thus the written value is lost. It just reflects the current signal when configured as input.

This is new information (both the "read-only" thing and "data
will be lost").  I'd suggest to update the commit message then.

BTW does reflecting input data and accepting output data (which
may or may not apply at the moment since it's only used in output
mode) not necessarily conflict.  Hardware may have two separate
registers (one for read, one for write) at the same address.
GPIO data registers often are implemented that way.  Which is why
you usually can "queue" the output value and then switch
directions.  And in the output case it's valid as well that input
sensed at the wire and output data dictated by the CPU might
differ (think open drain or bus keeper).

> > I understood that setting the data register for input pins does
> > nothing in that very moment, yet when switching to output the
> > value immediately gets used.  So this is the most appropriate
> > thing to do.
> 
> That would be the correct way, if hardware can be programmed that way. But if the data register is set when GPIO is confgured as input the data is lost. So when switching to output it does _NOT_ have the previously set value.
> That's why the direction is set first and data afterwards. Awkward, but yet the only way to set an "initial" output value

This information should end up in the source comment, I guess, in
this very strength.  It's an unusual limitation in a block that
implements a commodity feature.  The previous "soft" form made me
ask those questions, as will the next person to look ask again.

You keep referring to the documentation, did you check that the
hardware behaves the way you interpret the document?  Just to
make sure ...  This question might be avoided by saying "the
datasheet states and observation of hardware acknowledges ...".
It's not unusual that documentation and implementation differ. :)


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
