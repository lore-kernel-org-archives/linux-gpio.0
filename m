From: santosh shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH 2/2] gpio: davinci: use irq_data_get_chip_type
Date: Wed, 27 Jan 2016 11:03:44 -0800
Message-ID: <56A91490.6060300@oracle.com>
References: <4cc3a3a7a74c7a1894892a85aa7eabbd1534fe96.1451484758.git.geliangtang@163.com>
 <ca4c79f0383786097cf59da27432eb619325002b.1451484758.git.geliangtang@163.com>
 <CACRpkda+WB_5yCScjeO2Q9aN2i3CTLRir-jKXk6uaxqMHhNWyg@mail.gmail.com>
 <56A8F1B6.20401@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56A8F1B6.20401@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Geliang Tang <geliangtang@163.com>, Santosh Shilimkar <ssantosh@kernel.org>, Sekhar Nori <nsekhar@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 1/27/2016 8:35 AM, Grygorii Strashko wrote:
> On 01/27/2016 03:56 PM, Linus Walleij wrote:
>> On Wed, Dec 30, 2015 at 3:16 PM, Geliang Tang <geliangtang@163.com>
>> wrote:
>>
>>> Use irq_data_get_chip_type() instead of container_of().
>>>
>>> Signed-off-by: Geliang Tang <geliangtang@163.com>
>>> ---
>>>   drivers/gpio/gpio-davinci.c | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
>>> index 65ebaef..aaa1a249 100644
>>> --- a/drivers/gpio/gpio-davinci.c
>>> +++ b/drivers/gpio/gpio-davinci.c
>>> @@ -435,8 +435,7 @@ static struct irq_chip
>>> *davinci_gpio_get_irq_chip(unsigned int irq)
>>>   {
>>>          static struct irq_chip_type gpio_unbanked;
>>>
>>> -       gpio_unbanked = *container_of(irq_get_chip(irq),
>>> -                                     struct irq_chip_type, chip);
>>> +       gpio_unbanked = *irq_data_get_chip_type(irq_get_irq_data(irq));
>>>
>>>          return &gpio_unbanked.chip;
>>>   };
>>
>> Grygorii/Santosh, can you ACK/comment on this patch?
>>
>
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
>
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
