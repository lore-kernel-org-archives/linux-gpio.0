From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 052/182] gpio: pxa: use gpiochip data pointer
Date: Sun, 13 Dec 2015 21:19:49 +0100
Message-ID: <CACRpkdbdAb4DRWnp_PkxuQpDxaf6O4tY8OMxHd1iWyC-z8J8hg@mail.gmail.com>
References: <1449667312-32244-1-git-send-email-linus.walleij@linaro.org>
	<87poyfjnim.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:36799 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752334AbbLMUTu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2015 15:19:50 -0500
Received: by oian133 with SMTP id n133so4215658oia.3
        for <linux-gpio@vger.kernel.org>; Sun, 13 Dec 2015 12:19:50 -0800 (PST)
In-Reply-To: <87poyfjnim.fsf@belgarion.home>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Daniel Mack <zonque@gmail.com>

On Wed, Dec 9, 2015 at 10:54 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
>
>> This makes the driver use the data pointer added to the gpio_chip
>> to store a pointer to the state container instead of relying on
>> container_of().
>>
>> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
>> Cc: Daniel Mack <zonque@gmail.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> This conflicts with the earlier serie in https://lkml.org/lkml/2015/11/28/136
> which revamps the gpio_chip_base() anyway.

I have already fixed that, I think.

> The patch is perfectly fine, and yet it's the opportunity to ask a review of the
> other serie before other patches make me respin the serie, isn't it ?

I merged it and rebased my patch.

Yours,
Linus Walleij
