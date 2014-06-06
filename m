From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 0/4] <mach/gpio.h> purge
Date: Fri, 6 Jun 2014 14:10:43 +0900
Message-ID: <CAAVeFuKJE1pCtogU3BrkQHSTQyKOvo_u06Mmdioqu1_+9Nq2nA@mail.gmail.com>
References: <1401888838-3126-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f170.google.com ([209.85.128.170]:58978 "EHLO
	mail-ve0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbaFFFLE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Jun 2014 01:11:04 -0400
Received: by mail-ve0-f170.google.com with SMTP id db11so2450734veb.15
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2014 22:11:03 -0700 (PDT)
In-Reply-To: <1401888838-3126-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alexandre Courbot <acourbot@nvidia.com>

On Wed, Jun 4, 2014 at 10:33 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> After deleting <mach/gpio.h> from the AT91 only S5P remains.
> This patch set fixes up S5P and then removes NEED_MACH_GPIO_H
> permanently removing any references to <mach/gpio.h> from the
> ARM kernel. Do a small cleanout of a dangling reference to
> ARM_GPIOLIB_COMPLEX at the same time.

Good riddance indeed!

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
