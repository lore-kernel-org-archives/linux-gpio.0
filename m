From: Helmut Grohne <h.grohne@intenta.de>
Subject: Re: [PATCH v2] gpio: zynq: initialize clock even without CONFIG_PM
Date: Fri, 3 Jun 2016 15:01:13 +0200
Message-ID: <20160603130113.GA28017@laureti-dev>
References: <20160603121526.GA23642@laureti-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.intenta.de ([194.31.246.158]:55392 "EHLO mail.intenta.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752277AbcFCNBX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 3 Jun 2016 09:01:23 -0400
Content-Disposition: inline
In-Reply-To: <20160603121526.GA23642@laureti-dev>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>, Helmut Buchsbaum <helmut.buchsbaum@gmail.com>

On Fri, Jun 03, 2016 at 02:15:32PM +0200, Helmut Grohne wrote:
> Please note that this rebased patch is only compile tested, because some
> required drivers broke with 4.7-rc1. If you are reluctant to apply the
> patch under this condition, I can report back after fixing drivers.
> Posting the updated patch anyway in case the other Helmut wants to test
> it.

Excuse the quick followup. I gave up fixing the driver before the
weekend but then it turned out to be much easier than expected.

I now tested the patch with 4.7-rc1 (plus some out of tree drivers) on
our board both with CONFIG_PM=y and CONFIG_PM=n and confirm that it
works as expected. With CONFIG_PM=n and plain 4.7-rc1, the gpio
controller doesn't work at all.

Helmut
