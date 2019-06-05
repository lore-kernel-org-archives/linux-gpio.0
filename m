From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v2 2/3] gpio: davinci: Add new compatible for K3 AM654
 SoCs
Date: Wed, 5 Jun 2019 20:43:26 +0530
Message-ID: <96dbfd50-2a45-e3dc-3928-47fbc52f9269@ti.com>
References: <20190605080259.2462-1-j-keerthy@ti.com>
 <20190605080259.2462-3-j-keerthy@ti.com>
 <CAMpxmJXjMX20TAEsfEa7pqZx5-aW_rMKwS+6g9NTvRNEfuAyeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMpxmJXjMX20TAEsfEa7pqZx5-aW_rMKwS+6g9NTvRNEfuAyeA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, lokeshvutla@ti.com, linux-gpio <linux-gpio@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org



On 05/06/19 7:56 PM, Bartosz Golaszewski wrote:
> śr., 5 cze 2019 o 10:02 Keerthy <j-keerthy@ti.com> napisał(a):
>>
>> Add new compatible for K3 AM654 SoCs.
>>
>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>> ---
>>   drivers/gpio/gpio-davinci.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
>> index 0977590eb996..fc494a84a29d 100644
>> --- a/drivers/gpio/gpio-davinci.c
>> +++ b/drivers/gpio/gpio-davinci.c
>> @@ -632,6 +632,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>>
>>   static const struct of_device_id davinci_gpio_ids[] = {
>>          { .compatible = "ti,keystone-gpio", keystone_gpio_get_irq_chip},
>> +       { .compatible = "ti,am654-gpio", keystone_gpio_get_irq_chip},
> 
> Please add a patch adding this compatible to the binding document as well.

https://patchwork.kernel.org/patch/10976445/

Posted but did not add you in Cc. Sorry about that.

- Keerthy
> 
> Bart
> 
>>          { .compatible = "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
>>          { /* sentinel */ },
>>   };
>> --
>> 2.17.1
>>
