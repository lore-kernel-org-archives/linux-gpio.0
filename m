From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple GPIO outputs
Date: Wed, 30 Jul 2014 13:04:35 +0200
Message-ID: <1930172.kW3NAyPiCa@pcimr>
References: <25983307.ZjJOfz2Kpg@pcimr> <5291550.Rzt9KR357U@pcimr> <20140730104130.GO17528@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:58782 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752452AbaG3LEs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jul 2014 07:04:48 -0400
In-Reply-To: <20140730104130.GO17528@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Gerhard Sittig <gsi@denx.de>, Wolfram Sang <wsa@the-dreams.de>

On Wednesday 30 July 2014 11:41:30 Mark Brown wrote:
> On Wed, Jul 30, 2014 at 11:12:30AM +0200, Rojhalat Ibrahim wrote:
> 
> Please fix your mailer to word wrap within paragraphs.
> 
> > I could not find any other in-kernel driver that might benefit from the new feature, either.
> 
> > So I guess you are right: There are no users for this.
> 
> The usual users for this are devices like LCD panels or other parallel
> buses.

Can you point me to any in-kernel driver that uses GPIOs to drive an LCD panel
or a parallel bus?


