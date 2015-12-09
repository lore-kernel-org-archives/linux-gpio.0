From: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>
Subject: Re: [PATCH 131/182] avr32: gpio: use gpiochip data pointer
Date: Wed, 9 Dec 2015 15:01:20 +0100
Message-ID: <20151209140120.GA3015@samfundet.no>
References: <1449668213-4111-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:41926 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753218AbbLIOB1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 09:01:27 -0500
Content-Disposition: inline
In-Reply-To: <1449668213-4111-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Haavard Skinnemoen <hskinnemoen@gmail.com>

Around Wed 09 Dec 2015 14:36:53 +0100 or thereabout, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
> Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>

> ---
> AVR32 folks: please ACK this patch so I can take it through the
> GPIO tree.

Thanks for fixing.

> BTW: consider tidying up and moving this driver to drivers/pinctrl
> and implement the right pin control interfaces for AVR32 ...
> thanks.

I note the heads up, added to my backlog.

> ---
>  arch/avr32/mach-at32ap/pio.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

<snipp diff>

-- 
mvh
Hans-Christian Egtvedt
