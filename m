From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 4/9] gpio: Add 'name' to the gpio descriptor struct
Date: Tue, 28 Jul 2015 11:24:12 +0200
Message-ID: <20150728092412.GK28535@localhost>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-5-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:34461 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755036AbbG1JYN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2015 05:24:13 -0400
Received: by lbbzr7 with SMTP id zr7so70516676lbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2015 02:24:11 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1437125570-28623-5-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de

On Fri, Jul 17, 2015 at 11:32:45AM +0200, Markus Pargmann wrote:
> The latest gpio hogging mechanism assigns each gpio a 'line-name' in the
> devicetree. The 'name' field is different from the 'label' field.
> 'label' is only used for requested GPIOs to describe its current use by
> driver or userspace.
> 
> The 'name' field describes the GPIO itself, not the use. This is most
> likely identical to the label in the schematic on the GPIO line and
> should help to find this particular GPIO.

You merge this one with whatever patch starts using the name field.

Johan
