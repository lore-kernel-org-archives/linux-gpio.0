From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/2] gpio: add API to be strict about GPIO IRQ usage
Date: Fri, 11 Oct 2013 09:57:07 -0700
Message-ID: <CAAVeFuLqWTciAkEq+D_8c3e3_UH91djQPVO9CnEMwWogkgxEwA@mail.gmail.com>
References: <1381483935-12165-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:37285 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752163Ab3JKQ52 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 12:57:28 -0400
Received: by mail-ie0-f180.google.com with SMTP id e14so3825332iej.39
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 09:57:27 -0700 (PDT)
In-Reply-To: <1381483935-12165-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Stephen Warren <swarren@wwwdotorg.org>

On Fri, Oct 11, 2013 at 2:32 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> It is currently often possible in many GPIO drivers to request
> a GPIO line to be used as IRQ after calling gpio_to_irq() and,
> as the gpiolib is not aware of this, set the same line to
> output and start driving it, with undesired side effects.
>
> As it is a bogus usage scenario to request a line flagged as
> output to used as IRQ, we introduce APIs to let gpiolib track
> the use of a line as IRQ, and also set this flag from the
> userspace ABI.
>
> The API is symmetric so that lines can also be flagged from
> .irq_enable() and unflagged from IRQ by .irq_disable().
> The debugfs file is altered so that we see if a line is
> reserved for IRQ.

A much-welcome safety measure.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
