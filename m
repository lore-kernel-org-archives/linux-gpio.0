From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: RFC: Bug in error handling in gpiolib.c
Date: Thu, 29 Aug 2013 19:45:29 +0200
Message-ID: <CACRpkday6zMGSKvc4HTVKP3oezTdR5x_MHaK8nvDHWwu260B=A@mail.gmail.com>
References: <521CFB38.8080705@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:39401 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754525Ab3H2Rp3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2013 13:45:29 -0400
Received: by mail-ob0-f175.google.com with SMTP id xn12so824849obc.6
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2013 10:45:29 -0700 (PDT)
In-Reply-To: <521CFB38.8080705@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tim Bird <tbird20d@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Bird, Tim" <tim.bird@sonymobile.com>

On Tue, Aug 27, 2013 at 9:17 PM, Tim Bird <tbird20d@gmail.com> wrote:

> Hi all,
>
> There appears to be a bug in the error handling in
> drivers/gpi/gpiolib.c  In certain error cases
> desc_to_gpio() is called to get the gpio number
> for an error message, but this may happen on code
> paths where desc->chip is NULL.  This causes a panic
> on my system in gpiod_request(), as follows:
(...)
> Here's my patch:
> Subject: [PATCH] gpio: avoid panic on NULL desc->chip in gpiod_request

Patch applied. Unless we come up with something better,
there is some parallel discussion on how to handle NULL
descriptors.

Alexandre: OK to apply this?

Yours,
Linus Walleij
