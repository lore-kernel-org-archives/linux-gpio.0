From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] lmp92001: mfd: gpio: Add support LMP92001
Date: Tue, 12 Sep 2017 11:11:06 +0200
Message-ID: <CACRpkdaVxdSh69k-eDXx7ABxrVEuGpDpT4abFxhVMHN-c4ohuA@mail.gmail.com>
References: <20170830182100.9311-1-s.abhisit@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170830182100.9311-1-s.abhisit@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abhisit Sangjan <s.abhisit@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, jacopo <jacopo@jmondi.org>, Lars-Peter Clausen <lars@metafoo.de>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 30, 2017 at 8:21 PM,  <s.abhisit@gmail.com> wrote:

> From: Abhisit Sangjan <s.abhisit@gmail.com>
>
> TI LMP92001 Analog System Monitor and Controller
>
> 8-bit GPIOs.
> 12 DACs with 12-bit resolution.
>
> The GPIOs and DACs are shared port function with Cy function pin to
> take control the pin suddenly from external hardware.
> DAC's referance voltage selectable for Internal/External.
>
> 16 + 1 ADCs with 12-bit resolution.
>
> Built-in internal Temperature Sensor on channel 17.
> Window Comparator Function is supported on channel 1-3 and 9-11 for
> monitoring with interrupt signal (pending to implement for interrupt).
> ADC's referance voltage selectable for Internal/External.
>
> Signed-off-by: Abhisit Sangjan <s.abhisit@gmail.com>

Maybe you can trim the commit message to only be about
GPIO on this patch, since it is only about GPIO?

> +config GPIO_LMP92001
> +       tristate "LMP92001 GPIOs"
> +       depends on MFD_LMP92001

select GPIOLIB

> +static int __init lmp92001_gpio_init(void)
> +{
> +       return platform_driver_register(&lmp92001_gpio_driver);
> +}
> +subsys_initcall(lmp92001_gpio_init);
> +
> +static void __exit lmp92001_gpio_exit(void)
> +{
> +       platform_driver_unregister(&lmp92001_gpio_driver);
> +}
> +module_exit(lmp92001_gpio_exit);

Is this necessary? Can't you just have module_platform_driver() and be
done with it?

Yours,
Linus Walleij
