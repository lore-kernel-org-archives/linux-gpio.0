From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/7] gpiolib: support monitoring mockup devices
Date: Tue, 31 Jan 2017 14:23:01 +0100
Message-ID: <CACRpkdZv19E49n1m0Kt9-ZpQBmjc7v0BY+VbJWr7PnoXG9QsTA@mail.gmail.com>
References: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com> <1485358461-24070-3-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f176.google.com ([74.125.82.176]:33417 "EHLO
        mail-ot0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751964AbdAaNa6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2017 08:30:58 -0500
Received: by mail-ot0-f176.google.com with SMTP id 73so265680410otj.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2017 05:29:32 -0800 (PST)
In-Reply-To: <1485358461-24070-3-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jan 25, 2017 at 4:34 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> Add a new flag to struct gpio_chip indicating that the chip doesn't
> model a real device. When setting up the line event queue, check if
> a device is a mockup chip and don't actually request the interrupt.
>
> This way we can monitor mockup GPIOs.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hm. I'm not so happy about adding code that gets compiled into every
system on the planet but is only used for testing with the mockup driver.

Atleast it should be #ifdef:ed (one of the few cases when we should
do that).

But I would prefer if there was some more elegant way. Like getting
a mockup irqchip! But I don't know how hard that is indeed.

Yours,
Linus Walleij
