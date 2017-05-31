From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 6/7] gpio: mockup: improve the error message
Date: Wed, 31 May 2017 12:54:22 +0200
Message-ID: <CAMRc=MfDL_4ExbzAYkus3M7=Cwoee6kV=XXX5kVbvU6j2c7XXA@mail.gmail.com>
References: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
 <1496134720-5363-7-git-send-email-brgl@bgdev.pl> <CAHp75VdiCsE2nHXHjvYfeG43oVCF0i8x8-hk=uTTLBOdH91U6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdiCsE2nHXHjvYfeG43oVCF0i8x8-hk=uTTLBOdH91U6Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2017-05-30 20:59 GMT+02:00 Andy Shevchenko <andy.shevchenko@gmail.com>:
> On Tue, May 30, 2017 at 11:58 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> Indicate the error number and make the message a bit more elaborate.
>
>> +                       dev_err(dev,
>> +                               "adding gpiochip failed: %d (base: %d, ngpio: %d)\n",
>> +                               ret, base, base < 0 ? ngpio : base + ngpio);
>
> You may consider to use
> 'gpio_mockup_add' instead of 'adding gpiochip'. The latter points the
> reader first to gpiochip_add family of functions while you run a
> wrapper on top of it.
>

But this message can also be emitted if the module params are invalid,
in which case we don't even enter gpio_mockup_add().

Thanks,
Bartosz
