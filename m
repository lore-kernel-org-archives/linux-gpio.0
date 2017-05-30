From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: remove unused variable
Date: Wed, 31 May 2017 01:57:15 +0200
Message-ID: <CACRpkdb_mjHGoUa859-Voaog8YzJmuVbekoMqmZznHx-aBMxBg@mail.gmail.com>
References: <20170530092128.1180841-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:33973 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbdE3X5R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 19:57:17 -0400
Received: by mail-io0-f171.google.com with SMTP id k91so2676400ioi.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2017 16:57:17 -0700 (PDT)
In-Reply-To: <20170530092128.1180841-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 30, 2017 at 11:21 AM, Arnd Bergmann <arnd@arndb.de> wrote:

> This was left behind by a cleanup patch:
>
> drivers/gpio/gpiolib.c: In function 'gpiochip_irqchip_init_valid_mask':
> drivers/gpio/gpiolib.c:1474:6: error: unused variable 'i' [-Werror=unused-variable]
>
> Fixes: 923a654c186c ("gpiolib: Re-use bitmap_fill() instead of open coded loop")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
