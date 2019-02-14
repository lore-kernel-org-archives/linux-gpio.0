From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] gpio: AMD G-Series PCH gpio driver
Date: Thu, 14 Feb 2019 04:08:44 +0200
Message-ID: <CAHp75VeUEtRnRyJfpRC9Pdjy4ji=EMk=QQJ8gk7RpX6SsLg9Qg@mail.gmail.com>
References: <1550091448-28578-1-git-send-email-info@metux.net> <1550091448-28578-2-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550091448-28578-2-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 13, 2019 at 10:57 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

Thanks for this version, my comments below.

>
> GPIO platform driver for the AMD G-series PCH (eg. on GX-412TC)
>
> This driver doesn't registers itself automatically, as it needs to
> be provided with platform specific configuration, provided by some
> board driver setup code.
>
> Didn't implement oftree probing yet, as it's rarely found on x86.

Since I don't see neither changelog nor version of the series, it's
hard to say what had been changed and addressed.

> +static void *amd_fch_gpio_addr(struct amd_fch_gpio_priv *priv,
> +                              unsigned int gpio)
> +{

> +       if (unlikely(gpio > priv->pdata->gpio_num)) {
> +               dev_err(&priv->pdev->dev,
> +                       "gpio number %d out of range\n", gpio);
> +               return NULL;
> +       }

I'm pretty sure this wouldn't be the case.

> +
> +       return priv->base + priv->pdata->gpio_reg[gpio]*sizeof(u32);
> +}

> +       if (unlikely(!ptr))
> +               return -EINVAL;

Neither those ones.

> +       spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
> +
> +       if (value)
> +               writel_relaxed(readl_relaxed(ptr) | AMD_FCH_GPIO_FLAG_WRITE,
> +                              ptr);
> +       else
> +               writel_relaxed(readl_relaxed(ptr) & ~AMD_FCH_GPIO_FLAG_WRITE,
> +                              ptr);

This will look better in usual pattern, i.e.

u32 value;

...
value = readl...
if (...)
 ...
else
 ...
writel...

> +static int amd_fch_gpio_request(struct gpio_chip *chip,
> +                               unsigned int gpio_pin)
> +{
> +       if (likely(gpio_pin < chip->ngpio))
> +               return 0;
> +
> +       return -EINVAL;
> +}

Can't be generic request routine used?

> +
> +static int amd_fch_gpio_probe(struct platform_device *pdev)
> +{
> +       struct amd_fch_gpio_priv *priv;
> +       struct amd_fch_gpio_pdata *pdata;

> +       struct resource res = DEFINE_RES_MEM_NAMED(
> +                               AMD_FCH_MMIO_BASE + AMD_FCH_GPIO_BANK0_BASE,
> +                               AMD_FCH_GPIO_SIZE,
> +                               "amd-fch-gpio-iomem");

Define this outside the function as static variable.

> +
> +       pdata = dev_get_platdata(&pdev->dev);

> +

Redundant blank line.

> +       if (unlikely(pdata == NULL)) {

Simple if (!pdata)

> +               dev_err(&pdev->dev, "no platform_data\n");
> +               return -ENOENT;
> +       }
> +
> +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);

> +

Redundant blank line.

> +       if (unlikely(priv == NULL))

This check is simple

if (!priv)

> +               return -ENOMEM;
> +

> +       spin_lock_init(&priv->gc.bgpio_lock);
> +
> +       priv->base = devm_ioremap_resource(&pdev->dev, &res);
> +       if (IS_ERR(priv->base))

> +               return -ENXIO;

Do not shadow error code.

> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       return devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
> +}



-- 
With Best Regards,
Andy Shevchenko
