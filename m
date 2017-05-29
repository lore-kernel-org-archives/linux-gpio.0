From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: ingenic: add CONFIG_OF dependency
Date: Mon, 29 May 2017 18:45:32 +0200
Message-ID: <CACRpkdZn4j6CAwa=ymzGtxkKh3g35ffqvKEDxs5AEDf6pYtdJQ@mail.gmail.com>
References: <20170529125802.163127-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:34973 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750951AbdE2Qpd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 12:45:33 -0400
Received: by mail-it0-f44.google.com with SMTP id c15so29419750ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 09:45:33 -0700 (PDT)
In-Reply-To: <20170529125802.163127-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Cercueil <paul@crapouillou.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 29, 2017 at 2:57 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The driver cannot access the of_node field when CONFIG_OF is disabled:
>
> drivers/gpio/gpio-ingenic.c: In function 'ingenic_gpio_probe':
> drivers/gpio/gpio-ingenic.c:324:10: error: 'struct gpio_chip' has no member named 'of_node'
>
> Fixes: b0653ce39a0d ("gpio: Add gpio-ingenic driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I already sent a combined patch fixing these two deps earlier today,
good that we are several at it :)

Yours,
Linus Walleij
