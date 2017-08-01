From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFT PATCH v2] gpiolib: allow gpio irqchip to map irqs dynamically
Date: Tue, 1 Aug 2017 11:53:42 +0200
Message-ID: <CAMRc=MdgOmVfQ9-qTQ2XOkj90GojBVco_qpQ3Ryms7F4YBLvdA@mail.gmail.com>
References: <20170721164900.7070-1-grygorii.strashko@ti.com> <CACRpkdbFVV669PxGDXO9Xzf-jj0sEKyQTvhdLMA_of16wBp7PQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbFVV669PxGDXO9Xzf-jj0sEKyQTvhdLMA_of16wBp7PQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

2017-08-01 9:52 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
>
> Applied this rather than v1.
>
> But maybe we should get rid of ->irq_base from gpio-mockup.c
> and delete it, as the base is irqchip-internal.
>
> Bartosz what do you say? Do we need this in the mockup?
>
> Yours,
> Linus Walleij

Hi Linus,

a while ago I submitted a series[1] adding a simple framework for
simulating interrupts with the intention of removing most of the
irq_work code from gpio-mockup and iio-dummy-evgen. The third patch in
that series[2] does that for the mockup driver. I'll send a v2 shortly
and I hope to get it merged for v4.14.

Best regards,
Bartosz Golaszewski

[1] https://lkml.org/lkml/2017/7/19/698
[2] https://lkml.org/lkml/2017/7/19/696
