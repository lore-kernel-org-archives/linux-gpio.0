From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH v5] gpio: winbond: add driver
Date: Tue, 9 Jan 2018 14:57:46 +0100
Message-ID: <4fe716b3-8ab0-c75f-297c-5c8e22d782f1@maciej.szmigiero.name>
References: <ce716371-cc0a-6983-69c5-1a1203a48bc8@maciej.szmigiero.name>
 <CACRpkdb-mvduoo_Ah0ou6mCjuB+LWZQSrwiOWAY=FbP8Z1_vdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb-mvduoo_Ah0ou6mCjuB+LWZQSrwiOWAY=FbP8Z1_vdw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Jonathan Cameron <jic23@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 09.01.2018 14:53, Linus Walleij wrote:
> On Sat, Jan 6, 2018 at 12:46 AM, Maciej S. Szmigiero
> <mail@maciej.szmigiero.name> wrote:
> 
>> This commit adds GPIO driver for Winbond Super I/Os.
>>
>> Currently, only W83627UHG model (also known as Nuvoton NCT6627UD) is
>> supported but in the future a support for other Winbond models, too, can
>> be added to the driver.
>>
>> A module parameter "gpios" sets a bitmask of GPIO ports to enable (bit 0 is
>> GPIO1, bit 1 is GPIO2, etc.).
>> One should be careful which ports one tinkers with since some might be
>> managed by the firmware (for functions like powering on and off, sleeping,
>> BIOS recovery, etc.) and some of GPIO port pins are physically shared with
>> other devices included in the Super I/O chip.
>>
>> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> 
>> Changes from v4:
> 
> This v5 version applied, I also added Andy's review tag.
> 
> Good work!

Thanks!

> Yours,
> Linus Walleij

Best regards,
Maciej Szmigiero
