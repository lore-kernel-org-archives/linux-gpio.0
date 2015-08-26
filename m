From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpiolib: Add GPIO initialization
Date: Wed, 26 Aug 2015 14:08:31 +0200
Message-ID: <CACRpkdZV0_QgT9eAPC7cQ4JFYb5npNobn40M13mhYruU0O0vdw@mail.gmail.com>
References: <1439979512-3894-1-git-send-email-mpa@pengutronix.de>
	<1439979512-3894-4-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36145 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752748AbbHZMIb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 08:08:31 -0400
Received: by oiev193 with SMTP id v193so119890339oie.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2015 05:08:31 -0700 (PDT)
In-Reply-To: <1439979512-3894-4-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Markus Pargmann <mpa@devmp.org>

On Wed, Aug 19, 2015 at 12:18 PM, Markus Pargmann <mpa@pengutronix.de> wrote:

> From: Markus Pargmann <mpa@devmp.org>
>
> This functions adds a way to initialize a GPIO without hogging it.
>
> Signed-off-by: Markus Pargmann <mpa@devmp.org>
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt | 29 +++++++------

This needs to go to devicetree@vger.kernel.org for review.

Yours,
Linus Walleij
