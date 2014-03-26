From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH] gpio-sch: set output level after configuration of
 direction
Date: Wed, 26 Mar 2014 20:05:43 +0100
Message-ID: <20140326190543.GN3998@book.gsilab.sittig.org>
References: <1395740006-8554-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:41575 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755218AbaCZTFq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Mar 2014 15:05:46 -0400
Content-Disposition: inline
In-Reply-To: <1395740006-8554-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Daniel Krueger <daniel.krueger@systec-electronic.com>

On Tue, 2014-03-25 at 10:33 +0100, Alexander Stein wrote:
> 
> According to the datasheet, writing to the level register has no effect
> when GPIO is programmed as input. Hence we set the level after configuring
> the GPIO as output. But we cannot prevent a short low pulse if direction is
> set to high and an external pull-up is connected.

Does "will have no effect" actually translate into "should not be
done" or even "must not be done"?  Doesn't sound like it.

I understood that setting the data register for input pins does
nothing in that very moment, yet when switching to output the
value immediately gets used.  So this is the most appropriate
thing to do.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
