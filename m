From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/7] gpio: mockup: extensions for testing purposes
Date: Tue, 31 Jan 2017 14:28:44 +0100
Message-ID: <CACRpkdZfnJABCOOsDYap=3OLdLHTMFZdg5EV5g3fMNt+erL3zQ@mail.gmail.com>
References: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:36167 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752156AbdAaNib (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2017 08:38:31 -0500
Received: by mail-it0-f50.google.com with SMTP id c7so215917195itd.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2017 05:36:52 -0800 (PST)
In-Reply-To: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jan 25, 2017 at 4:34 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> This series proposes to extend the gpio framework by allowing to
> inject line events from the kernel code and by providing a debugfs
> interface for that to the gpio-mockup driver. We also allow the
> user to request that the mockup driver name the lines.

I sympathize fully with the goal and intentions of the series, I
agree: this is awesome to have for testing and validation of
GPIO.

I'm reluctant about the changes to gpiolib and want to make that
code as optional as possible, definately #ifdef if nothing else
works. Otherwise the memory footprint people will get me for this,
haha. ;)

The absolutely best would be if the driver could inject "real"
irqs and also exercise the gpiolib irqchip helpers. I have been
vaguely thinking that sofware interrupts should be able to do this
but I'm not very versed in that kind of stuff.

The changes to gpio-mockup.c are entirely uncontroversial, it
is for testing so I'm willing to accept almost anything if it looks
maintainable and helps in testing.

Yours,
Linus Walleij
