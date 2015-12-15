From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH 035/182] gpio: mb86s7x: use gpiochip data pointer
Date: Tue, 15 Dec 2015 16:59:44 +0530
Message-ID: <CAJe_ZhfoWu2_QKpc1jYJfD5NzR+W3MaJQWF616Df3SUtB1Ca3w@mail.gmail.com>
References: <1449667058-31408-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f53.google.com ([209.85.213.53]:36690 "EHLO
	mail-vk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964929AbbLOL3p (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2015 06:29:45 -0500
Received: by mail-vk0-f53.google.com with SMTP id y187so3275279vka.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2015 03:29:45 -0800 (PST)
In-Reply-To: <1449667058-31408-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

On 9 December 2015 at 18:47, Linus Walleij <linus.walleij@linaro.org> wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Jassi Brar <jaswinder.singh@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-By: Jassi Brar <jaswinder.singh@linaro.org>

Thanks.
