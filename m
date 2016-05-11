From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] gpio: zevio: make it explicitly non-modular
Date: Wed, 11 May 2016 13:50:27 +0200
Message-ID: <CACRpkdaDK2vZ7V4zW_yM8KMiKPTmpvQHzpYvm3_iDx3F5BG5vQ@mail.gmail.com>
References: <1462838398-10725-1-git-send-email-paul.gortmaker@windriver.com>
	<1462838398-10725-5-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:35404 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751386AbcEKLu1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2016 07:50:27 -0400
Received: by mail-oi0-f49.google.com with SMTP id x19so62827907oix.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2016 04:50:27 -0700 (PDT)
In-Reply-To: <1462838398-10725-5-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Fabian Vogt <fabian@ritter-vogt.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 10, 2016 at 1:59 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/gpio/Kconfig:config GPIO_ZEVIO
> drivers/gpio/Kconfig:   bool "LSI ZEVIO SoC memory mapped GPIOs"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
>
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Fabian Vogt <fabian@ritter-vogt.de>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
