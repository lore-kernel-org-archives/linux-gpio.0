From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Subject: Re: [PATCH 071/182] gpio: ts5500: use gpiochip data pointer
Date: Wed, 09 Dec 2015 16:45:21 -0500
Message-ID: <874mfrjnym.fsf@ketchup.mtl.sfl>
References: <1449667606-738-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([208.88.110.44]:59806 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750980AbbLIVp3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 16:45:29 -0500
In-Reply-To: <1449667606-738-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

Linus Walleij <linus.walleij@linaro.org> writes:

> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Thanks,
-v
