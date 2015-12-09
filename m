From: Philipp Zabel <philipp.zabel@gmail.com>
Subject: Re: [PATCH 163/182] mfd: htc-egpio: use gpiochip data pointer
Date: Wed, 9 Dec 2015 19:21:04 +0100
Message-ID: <CA+gwMce3XF347TGJgZDo1oKJtqe4xx39azmd9UJeZvmAPyfPZA@mail.gmail.com>
References: <1449668857-6260-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:34958 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753100AbbLISVF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 13:21:05 -0500
Received: by qgec40 with SMTP id c40so92183919qge.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 10:21:05 -0800 (PST)
In-Reply-To: <1449668857-6260-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Jones <lee.jones@linaro.org>

On Wed, Dec 9, 2015 at 2:47 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Philipp Zabel <philipp.zabel@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee please ACK this so I can take it through the GPIO tree.
> Philipp: should this driver move to drivers/gpio? Looks like
> so to me.

Yes, please.

Acked-by: Philipp Zabel <philipp.zabel@gmail.com>
for this and for the move.

regards
Philipp
