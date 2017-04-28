From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re:
Date: Fri, 28 Apr 2017 10:43:19 +0200
Message-ID: <CACRpkda0PDE1b0nud9OLmLX1VWJtEtXfe2s6ryze5_BawFUHaQ@mail.gmail.com>
References: <1493367610-7330-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:35090 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S939655AbdD1InV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Apr 2017 04:43:21 -0400
Received: by mail-it0-f54.google.com with SMTP id 70so31495947ita.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Apr 2017 01:43:21 -0700 (PDT)
In-Reply-To: <1493367610-7330-1-git-send-email-agust@denx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Apr 28, 2017 at 10:20 AM, Anatolij Gustschin <agust@denx.de> wrote:

> Subject: [PATCH v3] gpiolib: Add stubs for gpiod lookup table interface
>
> Add stubs for gpiod_add_lookup_table() and gpiod_remove_lookup_table()
> for the !GPIOLIB case to prevent build errors. Also add prototypes.
>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> ---
> Changes in v3:
>  - add stubs for !GPIOLIB case. Drop prototypes, these are
>    already in gpio/machine.h

Yeah...

> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h

So why should the stubs be in <linux/gpio/consumer.h>
and not in <linux/gpio/machine.h>?

Yours,
Linus Walleij
