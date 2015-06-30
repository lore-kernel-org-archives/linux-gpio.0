From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: assign chip owner to dev->driver->owner if
 not set
Date: Tue, 30 Jun 2015 22:41:21 +0900
Message-ID: <CAAVeFuLpBjnA0uq6vjpawWpzEG76sDe7pCgS6nG6CwGaar-JKA@mail.gmail.com>
References: <1435253451-19817-1-git-send-email-grygorii.strashko@ti.com> <1435253451-19817-2-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:33985 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752858AbbF3Nll (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2015 09:41:41 -0400
In-Reply-To: <1435253451-19817-2-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>

On Fri, Jun 26, 2015 at 2:30 AM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> Assign GPIO chip owner field to chip->dev->driver->owner if it was not
> configured by GPIO driver.

Sounds good, setting this field manually seems to make less and less
sense anyway as most drivers follow the device model.

>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
> Hi,
>
>  There is also one positive additional side effect:
>  lines like below can be removed from a lot of GPIO
>  drivers
>         rdc321x_gpio_dev->chip.owner = THIS_MODULE;

A good idea for a follow-up patch! ;)

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
