From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/2] x86: pcengines apuv2 gpio/leds/keys platform driver
Date: Thu, 14 Feb 2019 04:13:54 +0200
Message-ID: <CAHp75Vex6dhhaUFA+5SaC45HCNVpx3gzRYJ8CQA7kz+K_NQ-cg@mail.gmail.com>
References: <1550091448-28578-1-git-send-email-info@metux.net> <1550091448-28578-3-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550091448-28578-3-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 13, 2019 at 10:57 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Driver for PCengines APUv2 board's front LEDs and Button,
> which are attached to AMD PCH GPIOs. Due to lack of dedicated
> ACPI entry, detecting the board via DMI.

> +#include <linux/init.h>

> +#include <linux/module.h>

One of them is not needed.

> +static struct platform_device * __init apu_create_pdev(
> +       const char* name,
> +       const void *pdata,
> +       size_t sz)
> +{
> +       struct platform_device *pdev;
> +

> +       pdev = platform_device_register_resndata(
> +               NULL,                   /* parent */
> +               name,                   /* name */
> +               PLATFORM_DEVID_NONE,    /* id */
> +               NULL,                   /* res */
> +               0,                      /* res_num */
> +               pdata,                  /* platform_data */
> +               sz);

No need to comment the obvious.

> +
> +       if (IS_ERR(pdev))

> +               pr_err(KBUILD_MODNAME ": failed registering %s: %ld\n", name, PTR_ERR(pdev));

Better to set pr_fmt() macro at the top of source.

> +
> +       return pdev;
> +}
> +
> +static int __init apu_board_init(void)
> +{
> +       int rc;
> +       const struct dmi_system_id *id;
> +
> +       id = dmi_first_match(apu_gpio_dmi_table);

> +

Redundant blank line.

> +       if (!id) {
> +               pr_err(KBUILD_MODNAME ": failed to detect apu board via dmi\n");

pr_fmt()

> +               return -ENODEV;
> +       }

> +       pr_info(KBUILD_MODNAME ": initialized: gpio, leds, keys\n");

Noise.

> +       return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko
