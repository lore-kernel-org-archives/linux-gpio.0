From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 052/182] gpio: pxa: use gpiochip data pointer
Date: Wed, 09 Dec 2015 22:54:57 +0100
Message-ID: <87poyfjnim.fsf@belgarion.home>
References: <1449667312-32244-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:29755 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902AbbLIVzA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 16:55:00 -0500
In-Reply-To: <1449667312-32244-1-git-send-email-linus.walleij@linaro.org>
	(Linus Walleij's message of "Wed, 9 Dec 2015 14:21:52 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Daniel Mack <zonque@gmail.com>

Linus Walleij <linus.walleij@linaro.org> writes:

> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Daniel Mack <zonque@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

This conflicts with the earlier serie in https://lkml.org/lkml/2015/11/28/136
which revamps the gpio_chip_base() anyway.

The patch is perfectly fine, and yet it's the opportunity to ask a review of the
other serie before other patches make me respin the serie, isn't it ?

Oh, and :
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
