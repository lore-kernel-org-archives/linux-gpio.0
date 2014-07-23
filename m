From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] gpio: move gpio_ensure_requested() into legacy C file
Date: Wed, 23 Jul 2014 17:48:11 +0200
Message-ID: <CACRpkdaHRRwUR7RBWengsQu7vuZu4e3APMpX=Z=aUJ9LsBncew@mail.gmail.com>
References: <1406013463-19218-1-git-send-email-acourbot@nvidia.com>
	<1406013463-19218-6-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:38800 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757616AbaGWPsM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Jul 2014 11:48:12 -0400
Received: by mail-oi0-f48.google.com with SMTP id h136so1000515oig.21
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2014 08:48:11 -0700 (PDT)
In-Reply-To: <1406013463-19218-6-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Jul 22, 2014 at 9:17 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> gpio_ensure_requested() only makes sense when using the integer-based
> GPIO API, so make sure it is called from there instead of the gpiod
> API which we know cannot be called with a non-requested GPIO anyway.
>
> The uses of gpio_ensure_requested() in the gpiod API were kind of
> out-of-place anyway, so putting them in gpio-legacy.c helps clearing the
> code.
>
> Actually, considering the time this ensure_requested mechanism has been
> around, maybe we should just turn this patch into "remove
> gpio_ensure_requested()" if we know for sure that no user depend on it
> anymore?
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Make a separate patch on top to delete this thing since there
are ZERO in-kernel users. The only place it's used in a comment
in arch/arm/mach-ep93xx/vision_ep9307.c ....

Yours,
Linus Walleij
