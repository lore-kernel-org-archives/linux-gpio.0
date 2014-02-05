From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpiolib: consumer.h: Move forward declarations outside #ifdef
Date: Wed, 5 Feb 2014 10:24:32 +0900
Message-ID: <CAAVeFuJ-Gmq0cz2yz77y4h8EEZvJvBxpR+a44yUbQAuw-HuPYQ@mail.gmail.com>
References: <1391517730-13627-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f173.google.com ([209.85.128.173]:46133 "EHLO
	mail-ve0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752638AbaBEBYx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2014 20:24:53 -0500
Received: by mail-ve0-f173.google.com with SMTP id oz11so6555131veb.4
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2014 17:24:52 -0800 (PST)
In-Reply-To: <1391517730-13627-1-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Feb 4, 2014 at 9:42 PM, Lars-Peter Clausen <lars@metafoo.de> wrote:
> Make sure that the forward declared structs in gpio/consumer.h are also visible
> on the else branch of the CONFIG_GPIOLIB #ifdef.
>
> Fixes the following warnings and their associated errors when CONFIG_GPIOLIB is
> not selected:
>         include/linux/gpio/consumer.h:67:14: warning: 'struct device' declared inside parameter list
>         include/linux/gpio/consumer.h:67:14: warning: its scope is only this definition or declaration, which is probably not what you want
>         [...]
>
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
