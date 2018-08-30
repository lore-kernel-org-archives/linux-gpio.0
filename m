From: Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH] gpio: Add driver for PC Engines APU2/APU3 GPIOs
Date: Thu, 30 Aug 2018 07:54:31 +0200
Message-ID: <105943b718ecffbd17a34082130e0f31@dev.tdt.de>
References: <20180801111243.2848-1-fe@dev.tdt.de>
 <CAHp75VdNf8BCYEq348CQe2OUUOLdYehsr5TmBDQXXEAm59+kDg@mail.gmail.com>
 <dc367319-8877-83cf-42e0-e3f7e8e14a7a@3mdeb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dc367319-8877-83cf-42e0-e3f7e8e14a7a@3mdeb.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 2018-08-24 12:56, Piotr Król wrote:
> On 08/03/2018 09:08 PM, Andy Shevchenko wrote:
> 
> Hi Andy,
> 
> (...)
> 
>>> +#define APU_FCH_ACPI_MMIO_BASE 0xFED80000
>>> +#define APU_FCH_GPIO_BASE      (APU_FCH_ACPI_MMIO_BASE + 0x1500)
>> 
>> Wow! Can we see ACPI tables for these boards? Care to share (via some
>> file share service) output of `acpidump -o tables.dat` ?
> 
> Please find acpidump [1]. FYI I'm PC Engines firmware maintainer
> (firmware is coreboot based), so I can fix required things. I'm pretty
> sure that ACPI tables are not in best shape.
> 

Thanks for the dump,

By the way I have seen that the driver
https://github.com/torvalds/linux/blob/master/drivers/gpio/gpio-amdpt.c
is using the acpi to get the mmio address. I think this is the way to go
to get the acpi mmio address in the gpio-apu driver as well.

What is the right "acpi_device_id" for the APU3?
https://github.com/torvalds/linux/blob/master/drivers/gpio/gpio-amdpt.c#L146
