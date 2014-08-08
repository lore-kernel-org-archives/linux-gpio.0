From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 4/4] gpio: pca953x: Add DT binding for reset gpio
Date: Fri, 08 Aug 2014 16:11:34 +0200
Message-ID: <1407507094.3354.11.camel@paszta.hi.pengutronix.de>
References: <1406618686-22385-1-git-send-email-mpa@pengutronix.de>
	 <1406618686-22385-5-git-send-email-mpa@pengutronix.de>
	 <CACRpkdY0TqVH1tJR1H89S5hvdJUboQdVtNvZnL3NeWit4f+amw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:53283 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756662AbaHHOLv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Aug 2014 10:11:51 -0400
In-Reply-To: <CACRpkdY0TqVH1tJR1H89S5hvdJUboQdVtNvZnL3NeWit4f+amw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, Houcheng Lin <houcheng@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Toby Smith <toby@tismith.id.au>, Aaron Sierra <asierra@xes-inc.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

Am Freitag, den 08.08.2014, 15:14 +0200 schrieb Linus Walleij:
> On Tue, Jul 29, 2014 at 9:24 AM, Markus Pargmann <mpa@pengutronix.de> wrote:
> 
> > The pca953x has a negated reset input. This patch adds a DT binding for
> > the reset gpio and resets the chip when it is probed. This will reset
> > the device and leave the gpio in the correct state so reset is not
> > triggered.
> >
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> 
> Why on earth should this be in the GPIO driver?
>
> The driver should be in drivers/reset/reset-gpio.c and you
> should provide a separate driver for it.

I still think we should keep using the reset-gpios binding for simple
cases like this; I see no reason to add a separate device to the device
tree for a single GPIO.

> As it happens, Houcheng Lin has already proposed such a
> driver:
> http://marc.info/?l=linux-kernel&m=140309916607115&w=2

That is a different issue, as there the device does not appear on the
bus until the reset is released.

Here the I2C device will be probed from the device tree, so the reset
can be released or triggered from the probe function.

regards
Philipp

