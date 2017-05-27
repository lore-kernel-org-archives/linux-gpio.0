From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 01/10] gpio: mockup: fix direction values
Date: Sat, 27 May 2017 19:43:44 +0300
Message-ID: <CAHp75Ven54kF8dfq-efQg5ANkaeaQa0o=K+K8rHmO_U48jqn-Q@mail.gmail.com>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl> <1495701227-28809-2-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495701227-28809-2-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, May 25, 2017 at 11:33 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> The comment in linux/gpio/driver.h says:
>
>  @get_direction: returns direction for signal "offset", 0=out, 1=in
>
> We got those switched at some point. Fix the values.

Shouldn't it have a Fixes tag?


>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  drivers/gpio/gpio-mockup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index c6dadac..c18d011 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -29,8 +29,8 @@
>  #define        GPIO_MOCKUP_MAX_GC      10
>
>  enum {
> -       DIR_IN = 0,
> -       DIR_OUT,
> +       DIR_OUT = 0,
> +       DIR_IN = 1,
>  };
>
>  /*
> --
> 2.9.3
>



-- 
With Best Regards,
Andy Shevchenko
