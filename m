From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH 006/182] gpio: 104-idio-16: use gpiochip data pointer
Date: Wed, 9 Dec 2015 13:27:10 -0500
Message-ID: <5668727E.4080104@gmail.com>
References: <1449666804-30018-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f43.google.com ([209.85.213.43]:32854 "EHLO
	mail-vk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752919AbbLIS1M (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 13:27:12 -0500
Received: by vkca188 with SMTP id a188so60890545vkc.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 10:27:12 -0800 (PST)
In-Reply-To: <1449666804-30018-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

On 12/09/2015 08:13 AM, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
