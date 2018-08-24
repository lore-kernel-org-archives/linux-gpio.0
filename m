From: =?UTF-8?Q?Piotr_Kr=c3=b3l?= <piotr.krol@3mdeb.com>
Subject: Re: [PATCH] gpio: Add driver for PC Engines APU2/APU3 GPIOs
Date: Fri, 24 Aug 2018 12:56:32 +0200
Message-ID: <dc367319-8877-83cf-42e0-e3f7e8e14a7a@3mdeb.com>
References: <20180801111243.2848-1-fe@dev.tdt.de>
 <CAHp75VdNf8BCYEq348CQe2OUUOLdYehsr5TmBDQXXEAm59+kDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdNf8BCYEq348CQe2OUUOLdYehsr5TmBDQXXEAm59+kDg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Florian Eckert <fe@dev.tdt.de>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 08/03/2018 09:08 PM, Andy Shevchenko wrote:

Hi Andy,

(...)

>> +#define APU_FCH_ACPI_MMIO_BASE 0xFED80000
>> +#define APU_FCH_GPIO_BASE      (APU_FCH_ACPI_MMIO_BASE + 0x1500)
> 
> Wow! Can we see ACPI tables for these boards? Care to share (via some
> file share service) output of `acpidump -o tables.dat` ?

Please find acpidump [1]. FYI I'm PC Engines firmware maintainer
(firmware is coreboot based), so I can fix required things. I'm pretty
sure that ACPI tables are not in best shape.

[1] https://pastebin.com/2neC1Sri

Best Regards,
--
Piotr Król
Embedded Systems Consultant
https://3mdeb.com | @3mdeb_com
