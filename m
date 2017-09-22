From: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH] gpio: syscon: do not use raw "set" callback in
 syscon_gpio_dir_out
Date: Fri, 22 Sep 2017 11:23:05 +0100
Message-ID: <7e4a2e92-1186-4bad-986e-e3cb39b9c36c@arm.com>
References: <1504104641-8369-1-git-send-email-vladimir.murzin@arm.com>
 <CACRpkdayo0Upfx21q7FJbVRRiqWTuHGfF=vYUpZHd+17TDUQbQ@mail.gmail.com>
 <1505994978.366886647@f249.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:55950 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751903AbdIVKXI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Sep 2017 06:23:08 -0400
In-Reply-To: <1505994978.366886647@f249.i.mail.ru>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>

On 21/09/17 12:56, Alexander Shiyan wrote:
>> Четверг, 21 сентября 2017, 14:23 +03:00 от Linus Walleij <linus.walleij@linaro.org>:
>>
>> I really need Alexander Shiyan to look at this patch.
>>
>> The way i percieve it, .set is NULL if the chip does not
>> support output.
>>
>> We should print the right error messages and bail out
>> if the user is anyway trying to set a line like that.
> 
> Hello.
> 
> Using "chip->set", instead of "priv->data->set", is more proper way on my opinion.
> However, if the driver is not configured for output, the any errors should not occur in any case.

So what is conclusion on this? I agree that there is nothing broken atm, but I faced
the issues when I tried to use gpio-syscon to fit into my case which is very
similar to those pseudo-GPIOs in drivers/mfd/vexpress-sysreg.c

Thanks
Vladimir

> 
>> On Wed, Aug 30, 2017 at 4:50 PM, Vladimir Murzin
>> < vladimir.murzin@arm.com > wrote:
>>
>>> "set" callback is optional and can be NULL, instead use chip->set
>>> which always points at proper callback function.
>>>
>>> Fixes 2c341d62eb4b ("gpio: syscon: add soc specific callback to assign output value")
>>>
>>> Signed-off-by: Vladimir Murzin < vladimir.murzin@arm.com >
>>> ---
>>>  drivers/gpio/gpio-syscon.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
>>> index 537cec7..cf88a0b 100644
>>> --- a/drivers/gpio/gpio-syscon.c
>>> +++ b/drivers/gpio/gpio-syscon.c
>>> @@ -122,7 +122,7 @@ static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
>>>                                    BIT(offs % SYSCON_REG_BITS));
>>>         }
>>>
>>> -       priv->data->set(chip, offset, val);
>>> +       chip->set(chip, offset, val);
>>>
>>>         return 0;
>>>  }
> 
> ---
> 

