From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 7/9] gpiolib-sysfs: Add gpio name parsing for sysfs export
Date: Fri, 31 Jul 2015 10:44:56 +0200
Message-ID: <20150731084456.GN28535@localhost>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-8-git-send-email-mpa@pengutronix.de>
 <20150728095004.GM28535@localhost>
 <20150729065736.GE30895@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:35400 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753465AbbGaIo6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jul 2015 04:44:58 -0400
Received: by lblf12 with SMTP id f12so42230826lbl.2
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2015 01:44:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150729065736.GE30895@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de

On Wed, Jul 29, 2015 at 08:57:36AM +0200, Markus Pargmann wrote:
> On Tue, Jul 28, 2015 at 11:50:04AM +0200, Johan Hovold wrote:
> > On Fri, Jul 17, 2015 at 11:32:48AM +0200, Markus Pargmann wrote:

> > > +		char *gpio_name = kstrdup(buf, GFP_KERNEL);
> > 
> > Must check for allocation failures, but why use kstrdup at all?
> 
> Yes have to check that.
> strim() may modify the buf variable which is constant.
>
> > > +
> > > +		desc = gpio_name_to_desc(strim(gpio_name));

Ah, I missed that strim.

Johan
