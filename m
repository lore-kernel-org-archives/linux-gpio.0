From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 031/182] gpio: lpc32xx: use gpiochip data pointer
Date: Sat, 12 Dec 2015 22:47:31 +0200
Message-ID: <566C87E3.8030602@mleia.com>
References: <1449667026-31219-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:41432 "EHLO mail.mleia.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752105AbbLLUre (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 12 Dec 2015 15:47:34 -0500
In-Reply-To: <1449667026-31219-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Roland Stigge <stigge@antcom.de>

Hi Linus,

On 09.12.2015 15:17, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Roland Stigge <stigge@antcom.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

> ---
> Roland: this looks like a driver that should move to drivers/pinctrl
> since it is obviously controlling a lot of pins. Can you confirm?

The platform to which this driver belongs is unmaintained (and broken)
for more than one year.

If you remember I've recently sent a complete replacement of this
driver, but not this legacy driver nor mine new one control pin
functions, there should be another pinctrl driver.

--
With best wishes,
Vladimir
