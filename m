From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/9] gpiolib: Add GPIO name support
Date: Fri, 31 Jul 2015 11:49:28 +0200
Message-ID: <20150731094928.GQ28535@localhost>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <CACRpkdY=SLGyrcvWT355b3Z+pBwb9gPzVcieD8mOn=zdyJ1mFw@mail.gmail.com>
 <CAAVeFuL5F=Y2boCWp_TZEAN-kdT-Ob9r-h1-eNVDjBHftFYkeg@mail.gmail.com>
 <20150721095457.GA9981@pengutronix.de>
 <20150721101037.GB20023@pengutronix.de>
 <CAGmoSHt0Kg-cxe3U6uV40=ttmFbDruRcJZNxtmSZ=gmZQN5fTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:34710 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752408AbbGaJta (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jul 2015 05:49:30 -0400
Received: by lbqc9 with SMTP id c9so17680634lbq.1
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2015 02:49:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAGmoSHt0Kg-cxe3U6uV40=ttmFbDruRcJZNxtmSZ=gmZQN5fTw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arun Bharadwaj <arun@gumstix.com>
Cc: Markus Pargmann <mpa@pengutronix.de>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Jul 30, 2015 at 05:13:37PM -0700, Arun Bharadwaj wrote:

> 2) Some times I get a kernel dump when I try to unexport the gpio or even
> when I try to read the "name" file. This is not very repeatable and seems
> to happen at random. I haven't had the time to look into this in more
> detail yet, but here's the dump FWIW: http://pastebin.com/xq9cpCQE

This is probably because of patch 8/9 erroneously taking the sysfs_lock
in gpio_name_show.

Johan
