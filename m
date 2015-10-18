From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] pinctrl: mvebu: armada-38x: add suspend/resume support
Date: Sun, 18 Oct 2015 16:01:23 +0200
Message-ID: <20151018160123.6694b4be@free-electrons.com>
References: <1445117328-31678-1-git-send-email-mw@semihalf.com>
	<20151017222927.GR32532@n2100.arm.linux.org.uk>
	<CAPv3WKed+Q3K0ky9b9AAYSymB-tE0O=57UdrgM+7Cx-X9PeVcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:58303 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751900AbbJROB1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Oct 2015 10:01:27 -0400
In-Reply-To: <CAPv3WKed+Q3K0ky9b9AAYSymB-tE0O=57UdrgM+7Cx-X9PeVcA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marcin Wojtas <mw@semihalf.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, nadavh@marvell.com, linux-gpio@vger.kernel.org, Lior Amsalem <alior@marvell.com>, Gregory =?UTF-8?B?Q2zDqW1lbnQ=?= <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Hello Marcin,

On Sun, 18 Oct 2015 10:43:42 +0200, Marcin Wojtas wrote:

> Thanks for pointing this. I based on pinctrl-armada-xp.c (it needs a
> fix then, too) and it worked. I must have missed, because I got proper
> registers' number and values in suspend/resume routines. As
> pinctrl-armada-xp.c needs also a small fix and in order not to
> duplicate code, how about a following solution:
> - *mpp_saved_regs and *mpp_base become members of struct mvebu_pinctrl_soc_info

I don't like this. The mvebu_pinctrl_soc_info structure is meant to be
a read-only structure that only describes static information giving
SoC-specific details for pin-muxing. The idea is that in the event
where you had multiple pinctrl in the same system, you would still have
only one instance of mvebu_pinctrl_soc_info.

So, I'd prefer if mpp_saved_regs and mpp_base became members of a new
structure, that gets allocated at ->probe() time, on a per-instance
basis.

> - common mvebu_pinctrl_suspend/resume functions in pinctrl-mvebu.c
> (now there will be two users AXP and A38X)

Not sure how to handle that if the per-instance structure is defined on
a per-SoC basis, but I'm interested in seeing proposals.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
