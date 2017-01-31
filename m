From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 0/7] gpio: mockup: extensions for testing purposes
Date: Tue, 31 Jan 2017 15:21:55 +0100
Message-ID: <CAMpxmJVMOsaZ0eVoAEdqGiQAXzBp0wWqrVKpcXknKWADEB+t=w@mail.gmail.com>
References: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
 <CACRpkdZfnJABCOOsDYap=3OLdLHTMFZdg5EV5g3fMNt+erL3zQ@mail.gmail.com>
 <CAMpxmJU4GJ43fSU1SPFgN6e5pNw3zr4CQmmB_kq81ZtUHS-MYQ@mail.gmail.com> <4e742219-1e4c-aab8-a528-0e387a0a3c39@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:35119 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752250AbdAaOWB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2017 09:22:01 -0500
Received: by mail-io0-f172.google.com with SMTP id j18so132215668ioe.2
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2017 06:21:56 -0800 (PST)
In-Reply-To: <4e742219-1e4c-aab8-a528-0e387a0a3c39@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2017-01-31 15:11 GMT+01:00 Lars-Peter Clausen <lars@metafoo.de>:
> On 01/31/2017 03:05 PM, Bartosz Golaszewski wrote:
>> 2017-01-31 14:28 GMT+01:00 Linus Walleij <linus.walleij@linaro.org>:
>>> On Wed, Jan 25, 2017 at 4:34 PM, Bartosz Golaszewski
>>> <bgolaszewski@baylibre.com> wrote:
>>>
>>>> This series proposes to extend the gpio framework by allowing to
>>>> inject line events from the kernel code and by providing a debugfs
>>>> interface for that to the gpio-mockup driver. We also allow the
>>>> user to request that the mockup driver name the lines.
>>>
>>> I sympathize fully with the goal and intentions of the series, I
>>> agree: this is awesome to have for testing and validation of
>>> GPIO.
>>>
>>> I'm reluctant about the changes to gpiolib and want to make that
>>> code as optional as possible, definately #ifdef if nothing else
>>> works. Otherwise the memory footprint people will get me for this,
>>> haha. ;)
>>>
>>> The absolutely best would be if the driver could inject "real"
>>> irqs and also exercise the gpiolib irqchip helpers. I have been
>>> vaguely thinking that sofware interrupts should be able to do this
>>> but I'm not very versed in that kind of stuff.
>>>
>>
>> This was my initial idea, but I thought it's not very likely that
>> Thomas Gleixner would allow me to allocate a new software interrupt
>> just for the sake of testing gpiolib. Also: the handling of softirqs
>> seems to be a bit different than regular IRQs, but I'm too not an
>> expert.
>
> FWIW, we also need this in IIO. We currently inject our software IRQs for
> testing using irq_work and handle_simple_irq()[1]. This has the advantage
> that it goes the normal route through the IRQ subsystem and is even running
> in IRQ context rather than application context (which is what happens if you
> emulate the IRQ directly from the sysfs/debugfs callbacks).
>
> - Lars
>
> [1] http://lxr.free-electrons.com/source/drivers/iio/dummy/iio_dummy_evgen.c#L84

Nice! I didn't know about that. I think this is what we need in gpiolib.

Thanks,
Bartosz
