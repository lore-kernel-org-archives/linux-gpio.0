From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 4/7] gpio: mockup: improve readability
Date: Tue, 30 May 2017 21:55:13 +0300
Message-ID: <CAHp75VfKEUeNEf1xJ_9+wi0UREznfUxs6Pu1EZWbmuoB15bZ9Q@mail.gmail.com>
References: <1496134720-5363-1-git-send-email-brgl@bgdev.pl> <1496134720-5363-5-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496134720-5363-5-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 30, 2017 at 11:58 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> We currently shift bits here and there without actually explaining
> what we're doing. Add some helper variables with names indicating
> their purpose to improve the code readability.

> +       /* Each chip is described by two values. */
> +       num_chips = gpio_mockup_params_nr / 2;
> +
> +       chips = devm_kzalloc(dev, sizeof(*chips) * num_chips, GFP_KERNEL);

It's effectively
devm_kcalloc()
or
devm_kmalloc_array()
depending on the requirement of zeroing a memory chunks.

-- 
With Best Regards,
Andy Shevchenko
