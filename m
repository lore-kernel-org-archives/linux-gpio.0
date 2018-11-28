From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 0/2] Add device driver for APU2/APU3 GPIOs
Date: Wed, 28 Nov 2018 14:07:25 +0200
Message-ID: <CAHp75VfFYJQzTv_oe8RKPo03-FLYHy6BkrKaG23svAKtC+jVBg@mail.gmail.com>
References: <20181127132508.5501-1-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127132508.5501-1-fe@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Eckert.Florian@googlemail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 27, 2018 at 3:25 PM Florian Eckert <fe@dev.tdt.de> wrote:

> Changes v5:
> gpio-apu.c
> - Remove GPIO_GENERIC select from Kconfig
> - Make gpio_chip real member of apu_gpio_pdata
> - Use BIT macro for get_data and get_dir functions
> - Pass platform data to devm_gpiochip_add_data to get data
>   per-instance state container
> - Remove DEVNAME define
> - Remove platfrom_device member from apu_gpio_pdata this
> - Clean up init function
> - Remove MODULE_ALIAS
>
> Until now it was not possible to get more information to detect the
> MMIO_BASE address from the ACPI subsystem.

I'm sorry if I already asked, please, remind me where dump of ACPI
tables can be found?
Also would be nice to have the output of `lspci -nk -vv -xxx` on such platform.

-- 
With Best Regards,
Andy Shevchenko
