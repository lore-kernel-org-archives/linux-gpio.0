From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: GPIO Char device and tools/gpio/gpio-utils.c
Date: Mon, 31 Jul 2017 14:56:18 +0200
Message-ID: <CAMRc=MdsQh6GumOZdoo_i6E=d2qAEHYkTDArVDGrMSYCxyX3nA@mail.gmail.com>
References: <aa21e9a8-345d-b9db-e39c-e62d910794cc@cipherdyne.com>
 <546696b7-4be8-ef79-6436-d9eb0a41db52@cipherdyne.com> <CACRpkdYKd1gyJNxyFY3GS4MZVJqPenoqzCKSBmWvvKbq4iszuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:35549 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751239AbdGaM4T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 08:56:19 -0400
Received: by mail-qk0-f179.google.com with SMTP id d145so140910088qkc.2
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 05:56:19 -0700 (PDT)
In-Reply-To: <CACRpkdYKd1gyJNxyFY3GS4MZVJqPenoqzCKSBmWvvKbq4iszuA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Bennett <jbennett@cipherdyne.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

2017-07-31 14:22 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> On Fri, Jul 21, 2017 at 7:26 PM, Jonathan Bennett
> <jbennett@cipherdyne.com> wrote:
>
>> So to use GPIO pins through the chardev interface, one has to hold on to the file
>> descriptor to keep the pins from reverting to their initial state.  Is this a bug, or
>> intended behavior?
>
> I do not remember putting any code in that would explicitly return the
> GPIO line to
> the inital state.
>
> That said it makes some weird sense as people might be probing around with
> the tools and then it would be good behaviour to leave things in the room like
> they were arranged when you entered, don't you think?
>
> I'd like to hear Bartosz take on this though, he is more versed with userspace
> GPIO than me these days, and talk directly to users of this feature.
>
> Yours,
> Linus Walleij

Currently if a pin is driven low or high by HW design, it will return
to the default state after releasing the file descriptor. Floating
pins stay the way they were set even after closing the fd. While to me
this behavior looks correct, we could potentially add a new flag to
the request structure e.g. GPIO_REQUEST_RESTORE_STATE that would make
gpiolib explicitly restore the previous state even for floating pins
after close().

Best regards,
Bartosz Golaszewski
