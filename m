From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH 005/182] gpio: 104-idi-48: use gpiochip data pointer
Date: Wed, 9 Dec 2015 13:26:39 -0500
Message-ID: <5668725F.20607@gmail.com>
References: <1449666795-29971-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f41.google.com ([209.85.213.41]:34412 "EHLO
	mail-vk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752919AbbLIS0m (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 13:26:42 -0500
Received: by vkbs1 with SMTP id s1so60491378vkb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 10:26:41 -0800 (PST)
In-Reply-To: <1449666795-29971-1-git-send-email-linus.walleij@linaro.org>
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
