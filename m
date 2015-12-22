From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 022/182] gpio: davinci: use gpiochip data pointer
Date: Tue, 22 Dec 2015 18:09:44 +0200
Message-ID: <567975C8.4000300@ti.com>
References: <1449666942-30784-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:53846 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753966AbbLVQKD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 22 Dec 2015 11:10:03 -0500
In-Reply-To: <1449666942-30784-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Sekhar Nori <nsekhar@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>

On 12/09/2015 03:15 PM, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/gpio/gpio-davinci.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
>

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>


-- 
regards,
-grygorii
