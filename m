From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] gpio: pca953x: Add DT binding for reset gpio
Date: Fri, 8 Aug 2014 15:14:44 +0200
Message-ID: <CACRpkdY0TqVH1tJR1H89S5hvdJUboQdVtNvZnL3NeWit4f+amw@mail.gmail.com>
References: <1406618686-22385-1-git-send-email-mpa@pengutronix.de>
	<1406618686-22385-5-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:59183 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752763AbaHHNOp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Aug 2014 09:14:45 -0400
Received: by mail-ob0-f173.google.com with SMTP id vb8so3990170obc.4
        for <linux-gpio@vger.kernel.org>; Fri, 08 Aug 2014 06:14:44 -0700 (PDT)
In-Reply-To: <1406618686-22385-5-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>, Houcheng Lin <houcheng@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Toby Smith <toby@tismith.id.au>, Aaron Sierra <asierra@xes-inc.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Jul 29, 2014 at 9:24 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> The pca953x has a negated reset input. This patch adds a DT binding for
> the reset gpio and resets the chip when it is probed. This will reset
> the device and leave the gpio in the correct state so reset is not
> triggered.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

Why on earth should this be in the GPIO driver?

The driver should be in drivers/reset/reset-gpio.c and you
should provide a separate driver for it.

As it happens, Houcheng Lin has already proposed such a
driver:
http://marc.info/?l=linux-kernel&m=140309916607115&w=2

Please coordinate with Houcheng and use his driver for what
you want to achieve.

Yours,
Linus Walleij
