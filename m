From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 118/182] pinctrl: mediatek: use gpiochip data pointer
Date: Sat, 12 Dec 2015 00:33:12 +0100
Message-ID: <566B5D38.2090503@gmail.com>
References: <1449668036-3391-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:35707 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753088AbbLKXdQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 18:33:16 -0500
Received: by mail-wm0-f50.google.com with SMTP id l68so35049297wml.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2015 15:33:15 -0800 (PST)
In-Reply-To: <1449668036-3391-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>



On 09/12/15 14:33, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
