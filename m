From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 6/7] gpio: mockup: improve the error message
Date: Wed, 31 May 2017 17:26:25 +0200
Message-ID: <CAMRc=MfgowT2sEaEkx6rObfMEEfN-_0srvb61GxT=BUqxY7-4w@mail.gmail.com>
References: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
 <1496134720-5363-7-git-send-email-brgl@bgdev.pl> <CAHp75VdiCsE2nHXHjvYfeG43oVCF0i8x8-hk=uTTLBOdH91U6Q@mail.gmail.com>
 <CAMRc=MfDL_4ExbzAYkus3M7=Cwoee6kV=XXX5kVbvU6j2c7XXA@mail.gmail.com> <CAHp75Ve8gs-VcRRU=qioErxVurP+TYejV9=PV_eZc__=2q7YLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:33554 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751000AbdEaP00 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2017 11:26:26 -0400
Received: by mail-oi0-f48.google.com with SMTP id w10so19769412oif.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2017 08:26:26 -0700 (PDT)
In-Reply-To: <CAHp75Ve8gs-VcRRU=qioErxVurP+TYejV9=PV_eZc__=2q7YLQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2017-05-31 17:00 GMT+02:00 Andy Shevchenko <andy.shevchenko@gmail.com>:
> On Wed, May 31, 2017 at 1:54 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> 2017-05-30 20:59 GMT+02:00 Andy Shevchenko <andy.shevchenko@gmail.com>:
>>> On Tue, May 30, 2017 at 11:58 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>> Indicate the error number and make the message a bit more elaborate.
>>>
>>>> +                       dev_err(dev,
>>>> +                               "adding gpiochip failed: %d (base: %d, ngpio: %d)\n",
>>>> +                               ret, base, base < 0 ? ngpio : base + ngpio);
>>>
>>> You may consider to use
>>> 'gpio_mockup_add' instead of 'adding gpiochip'. The latter points the
>>> reader first to gpiochip_add family of functions while you run a
>>> wrapper on top of it.
>>>
>>
>> But this message can also be emitted if the module params are invalid,
>> in which case we don't even enter gpio_mockup_add().
>
> ...which unveils bad phrasing in the message. In that case "adding
> gpiochip" is also misleading.
>

Not really. You can pass an invalid value later in the list which will
only become apparent when it's reached. In that case previous
gpiochips will be added correctly but probe will fail with -EINVAL
after reaching the bad one in which case the message is right. I hope
I'm being clear.

Thanks,
Bartosz
