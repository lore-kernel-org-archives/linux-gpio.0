From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] gpio: Fix kernel stack leak to userspace
Date: Mon, 22 Jan 2018 14:48:53 +0100
Message-ID: <CAK8P3a3ejTV5onHJFZEy-4S4AZXVMp6tirAami_bETvoMtWvuQ@mail.gmail.com>
References: <20180122122146.25689-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:33847 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751070AbeAVNsy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jan 2018 08:48:54 -0500
In-Reply-To: <20180122122146.25689-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, "# 3.4.x" <stable@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>

On Mon, Jan 22, 2018 at 1:21 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> The GPIO event descriptor was leaking kernel stack to
> userspace because we don't zero the variable before
> use. Ooops. Fix this.
>
> Cc: stable@vger.kernel.org
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
