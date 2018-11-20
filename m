From: "J, KEERTHY" <j-keerthy@ti.com>
Subject: Re: [PATCH 1/3] ARM: davinci: define gpio interrupts as separate
 resources
Date: Tue, 20 Nov 2018 12:08:41 +0530
Message-ID: <63ac671f-b202-2533-3878-af16149fbdbb@ti.com>
References: <20181113135051.15308-1-brgl@bgdev.pl>
 <20181113135051.15308-2-brgl@bgdev.pl>
 <c092b014-d5cf-f1ad-de91-6696b05cdf17@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <c092b014-d5cf-f1ad-de91-6696b05cdf17@ti.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, stable@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>
List-Id: linux-gpio@vger.kernel.org



On 11/20/2018 2:22 AM, Sekhar Nori wrote:
> On 13/11/18 7:20 PM, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> Since commit eb3744a2dd01 ("gpio: davinci: Do not assume continuous
>> IRQ numbering") the davinci GPIO driver fails to probe if we boot
>> in legacy mode from any of the board files. Since the driver now
>> expects every interrupt to be defined as a separate resource, split
>> the definition in devices-da8xx.c instead of having a single continuous
>> interrupt range.
>>
>> Fixes: eb3744a2dd01 ("gpio: davinci: Do not assume continuous IRQ numbering")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> There are a number of other boards that need such fixing too. And the
> commit in question does not do a good job of explaining why it was
> needed in the first place. The description  just repeats what can be
> inferred by reading the patch.

Cc Lokesh

Sekhar,

DT explicitly mentions every IRQ number. The patch in discussion
explicitly calls platform_get_irq for all the interrupts which to me is 
the right thing to do as: platform_get_irq--> 
of_irq_get-->irq_create_of_mapping--> sequence is to be done for every IRQ.

k3-am654 definitely will need explicit calls to platform_get_irq as it 
will be involving interrupt router and interrupt numbers need not be 
continuous.

So i do not think reverting the patch is the right idea.

Regards,
Keerthy

> 
> 
>      gpio: davinci: Do not assume continuous IRQ numbering
> 
>      Currently the driver assumes that the interrupts are continuous
>      and does platform_get_irq only once and assumes the rest are continuous,
>      instead call platform_get_irq for all the interrupts and store them
>      in an array for later use.
> 
>      Signed-off-by: Keerthy <j-keerthy@ti.com>
>      Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
>      Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> 
> Can we revert the offending commit instead?
> 
> Thanks,
> Sekhar
> 
