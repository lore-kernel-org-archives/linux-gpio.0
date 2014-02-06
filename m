From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: consumer.h: Move forward declarations outside #ifdef
Date: Thu, 6 Feb 2014 10:23:54 +0100
Message-ID: <CACRpkdY6K+agMKx43sad4BzUOG0uprdgZHOOP=Ss+sfOsqk+Vg@mail.gmail.com>
References: <1391517730-13627-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:41101 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754961AbaBFJXz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Feb 2014 04:23:55 -0500
Received: by mail-ob0-f177.google.com with SMTP id wp18so1865900obc.8
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2014 01:23:54 -0800 (PST)
In-Reply-To: <1391517730-13627-1-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Feb 4, 2014 at 1:42 PM, Lars-Peter Clausen <lars@metafoo.de> wrote:

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

Applied for fixes with Alexandre's ACK, thanks!

Yours,
Linus Walleij
