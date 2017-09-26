From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/8] extcon: gpio: Localize platform data
Date: Tue, 26 Sep 2017 11:04:02 +0900
Message-ID: <59C9B592.5030209@samsung.com>
References: <20170924145622.4031-1-linus.walleij@linaro.org>
        <CGME20170924145853epcas4p38c33944036eb5a07285eae475fb204a6@epcas4p3.samsung.com>
        <20170924145622.4031-3-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170924145622.4031-3-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On 2017년 09월 24일 23:56, Linus Walleij wrote:
> Nothing in the entire kernel #includes <linux/extcon/extcon-gpio.h>
> so move the platform data declaration inside of the driver.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/extcon/extcon-gpio.c       | 22 +++++++++++++++++-
>  include/linux/extcon/extcon-gpio.h | 47 --------------------------------------
>  2 files changed, 21 insertions(+), 48 deletions(-)
>  delete mode 100644 include/linux/extcon/extcon-gpio.h
> 
> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
> index ebed22f22d75..6abf5f70fdbf 100644
> --- a/drivers/extcon/extcon-gpio.c
> +++ b/drivers/extcon/extcon-gpio.c
> @@ -18,7 +18,6 @@

Actually, extcon-gpio.h defines the 'struct gpio_extcon_pdata'
in order to get the gpio and interrupt data from platform_data
before device-tree binding method. But, as you mentioned,
it is not used on kernel with platform_data method.

Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

[snip]

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
