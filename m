From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: core: Do not call get_direction in atomic context
 for sleeping gpio
Date: Mon, 30 May 2016 17:15:58 +0200
Message-ID: <CACRpkdZjW9KxkDFx3YatYyCzSd3+Vtw6V+Tzp=9H4S2fMAmQJA@mail.gmail.com>
References: <1464095903-29145-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34258 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933483AbcE3PP7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 May 2016 11:15:59 -0400
Received: by mail-oi0-f51.google.com with SMTP id b65so272901079oia.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 May 2016 08:15:59 -0700 (PDT)
In-Reply-To: <1464095903-29145-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 24, 2016 at 3:18 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> When adding the gpiochip, the GPIO HW drivers' callback get_direction()
> get called in atomic context. Some of the GPIO HW drivers can sleep when
> accessing the register and hence it can create the sleeping call in
> atomic context.
>
> Call get_direction() in non-atomic context from gpiochip_add() if GPIO
> HW driver is having sleepable callback i.e. chip->can_sleep = 1.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>
> ---
> This is found when implementing the get_direction() of max77620 on 20160520
> linux-next.

I chose to send a new patch just moving the lock release before the
direction check. I just sent it with you as Reported-by.

Yours,
Linus Walleij
