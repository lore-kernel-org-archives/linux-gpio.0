From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 4/7] gpio: mockup: improve readability
Date: Wed, 31 May 2017 12:53:06 +0200
Message-ID: <CAMRc=MfdX+XMuUfpW33Qc7Xi4kKkJfCQLp0TaShijQbOUC4+vA@mail.gmail.com>
References: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
 <1496134720-5363-5-git-send-email-brgl@bgdev.pl> <CAHp75VfKEUeNEf1xJ_9+wi0UREznfUxs6Pu1EZWbmuoB15bZ9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfKEUeNEf1xJ_9+wi0UREznfUxs6Pu1EZWbmuoB15bZ9Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2017-05-30 20:55 GMT+02:00 Andy Shevchenko <andy.shevchenko@gmail.com>:
> On Tue, May 30, 2017 at 11:58 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> We currently shift bits here and there without actually explaining
>> what we're doing. Add some helper variables with names indicating
>> their purpose to improve the code readability.
>
>> +       /* Each chip is described by two values. */
>> +       num_chips = gpio_mockup_params_nr / 2;
>> +
>> +       chips = devm_kzalloc(dev, sizeof(*chips) * num_chips, GFP_KERNEL);
>
> It's effectively
> devm_kcalloc()
> or
> devm_kmalloc_array()
> depending on the requirement of zeroing a memory chunks.
>

Is there any advantage to using one of these here?

Thanks,
Bartosz
