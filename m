From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v9] gpio: Add GPIO support for the ACCES 104-IDIO-16
Date: Fri, 16 Oct 2015 17:03:00 +0200
Message-ID: <CACRpkdYPBrgeqHL-dAMupGscht2US2WAAO7jojoTfSiXP8hDEA@mail.gmail.com>
References: <20151009225504.GA3050@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151009225504.GA3050@sophia>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Oct 10, 2015 at 12:55 AM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES 104-IDIO-16 family of PC/104 utility boards feature 16
> optically isolated inputs and 16 optically isolated FET solid state
> outputs. This driver provides GPIO support for these 32 channels of
> digital I/O. Change-of-State detection interrupts are not supported.
>
> GPIO 0-15 correspond to digital outputs 0-15, while GPIO 16-31
> correspond to digital inputs 0-15. The base port address for the device
> may be set via the a_104_idio_16_base module parameter.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
> Changes in v9:
>   - Initialize GPIO device private data structure to 0 to prevent
>     garbage data pollution

Getting there...

> +static unsigned a_104_idio_16_base;
> +module_param(a_104_idio_16_base, uint, 0);
> +MODULE_PARM_DESC(a_104_idio_16_base, "ACCES 104-IDIO-16 base address");

This is nice!

> +static int __init a_104_idio_16_probe(struct platform_device *pdev)
> +{
> +       struct a_104_idio_16_gpio *const a104idio16gp = pdev->dev.platform_data;

No.

Why not just allocate zeroed it here in probe() like this:

struct a_104_idio_16_gpio *gp;

gp = devm_kzalloc(&pdev->dev, sizeof(*gp), GFP_KERNEL);
if (!gp)
   return -ENOMEM;

You may want to rename "a_104_idio_16_gpio" to something more everyday.
This is hard to type.

> +static int __init a_104_idio_16_init(void)
> +{
> +       int err;
> +       const struct a_104_idio_16_gpio GP = { 0 };

This just works by chance. The keyword you're looking for is not "const"
but "static" if you want this to stay around. But do it as described above
instead.

> +       a_104_idio_16_device = platform_device_register_data(NULL,
> +               a_104_idio_16_driver.driver.name, -1, &GP, sizeof(GP));
> +       if (IS_ERR(a_104_idio_16_device)) {
> +               err = PTR_ERR(a_104_idio_16_device);
> +               goto out_platform_device;
> +       }

Skip all this. Use devm_kzalloc() in probe as described.

> +
> +       dev_info(&a_104_idio_16_device->dev, "Initializing module\n");
> +
> +       err = platform_driver_probe(&a_104_idio_16_driver, a_104_idio_16_probe);
> +       if (err)
> +               goto out_platform_driver;
> +
> +       return 0;
> +
> +out_platform_driver:
> +       platform_device_unregister(a_104_idio_16_device);
> +out_platform_device:
> +       return err;
> +}

Then this can be just return platform_driver_probe(...);

Yours,
Linus Walleij
