From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio:Fix error handling in the function max732x_irq_bus_sync_unlock
Date: Tue, 18 Aug 2015 16:37:45 +0900
Message-ID: <CAAVeFuLutUgFfTZYRce3GKofnvw94mzvaZSER9WmorNRXuzW-Q@mail.gmail.com>
References: <1439836657-8684-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:35360 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751079AbbHRHiG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2015 03:38:06 -0400
In-Reply-To: <1439836657-8684-1-git-send-email-xerofoify@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Aug 18, 2015 at 3:37 AM, Nicholas Krause <xerofoify@gmail.com> wrote:
> This fixes error handling in the function max732x_irq_bus_sync_unlock
> by checking if the internal call in this function's while loop to the
> function max732x_gpio_direction_input failed by returning a error code
> and if so break out of this while immediately as we cannot continue
> after a failed call to this function before finally unlocking the
> locked mutex and returning to the caller of the function,
> max732x_irq_bus_sync_unlock.

Again a overlenghty one-line commit message.

The intent is also debattable. max732x_irq_bus_sync_unlock() returns
void, so we have to way to inform the caller that some failure
happened. In that case, isn't it better to keep doing the job as much
as we can? max732x_gpio_direction_input() already signals errors, so
all that we can do here is done already.
