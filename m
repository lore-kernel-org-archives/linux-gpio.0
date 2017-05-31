From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 4/7] gpio: mockup: improve readability
Date: Wed, 31 May 2017 17:57:03 +0300
Message-ID: <CAHp75VemkM4wMR8NcHoWTFvL9heUvpwb37Uqf5FC-R2URppELQ@mail.gmail.com>
References: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
 <1496134720-5363-5-git-send-email-brgl@bgdev.pl> <CAHp75VfKEUeNEf1xJ_9+wi0UREznfUxs6Pu1EZWbmuoB15bZ9Q@mail.gmail.com>
 <CAMRc=MfdX+XMuUfpW33Qc7Xi4kKkJfCQLp0TaShijQbOUC4+vA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:34419 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751053AbdEaO5F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2017 10:57:05 -0400
In-Reply-To: <CAMRc=MfdX+XMuUfpW33Qc7Xi4kKkJfCQLp0TaShijQbOUC4+vA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, May 31, 2017 at 1:53 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 2017-05-30 20:55 GMT+02:00 Andy Shevchenko <andy.shevchenko@gmail.com>:
>> On Tue, May 30, 2017 at 11:58 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>> We currently shift bits here and there without actually explaining
>>> what we're doing. Add some helper variables with names indicating
>>> their purpose to improve the code readability.
>>
>>> +       /* Each chip is described by two values. */
>>> +       num_chips = gpio_mockup_params_nr / 2;
>>> +
>>> +       chips = devm_kzalloc(dev, sizeof(*chips) * num_chips, GFP_KERNEL);
>>
>> It's effectively
>> devm_kcalloc()
>> or
>> devm_kmalloc_array()
>> depending on the requirement of zeroing a memory chunks.

> Is there any advantage to using one of these here?

Yes, though subtle one in this case. The caller will not care about
(possible) overflow in multiplication.
Other (micro)optimizations might be in place in the future as well,
but I dunno about this.

I would suggest to change.

P.S. And of course if you don't need zeroed area it would be (slight?)
performance impact I suppose.

-- 
With Best Regards,
Andy Shevchenko
