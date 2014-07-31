From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Thu, 31 Jul 2014 09:12:35 +0200
Message-ID: <20140731071235.GH3407@book.gsilab.sittig.org>
References: <25983307.ZjJOfz2Kpg@pcimr>
 <3862339.n8jYhAjBf6@pcimr>
 <CACRpkdY0Dm9RFx61KR2CZ4YGfr8cZRg2rtq_jWpmkqoHZSUB=Q@mail.gmail.com>
 <5291550.Rzt9KR357U@pcimr>
 <CAAVeFuJmHkXOa6d8ZN8LBVK=mM_HA_U0QQ0kqbkcaq11ELCrFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:46507 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752748AbaGaHMk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Jul 2014 03:12:40 -0400
Content-Disposition: inline
In-Reply-To: <CAAVeFuJmHkXOa6d8ZN8LBVK=mM_HA_U0QQ0kqbkcaq11ELCrFQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Rojhalat Ibrahim <imr@rtschenk.de>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@the-dreams.de>

On Thu, 2014-07-31 at 11:35 +0900, Alexandre Courbot wrote:
> 
> I'd be surprised if at least *one* such driver was not in mainline
> though. Had a quick look but could not find anything that would be an
> obvious candidate to use these new functions.

What about drivers/mtd/nand/gpio.c, the GPIO bitbanged NAND
controller driver?  Most of the latch, control, and data lines
groups are set at the same time.  It should be a perfect example.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
