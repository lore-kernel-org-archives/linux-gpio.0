From: He YunLei <heyunlei@huawei.com>
Subject: Re: [PATCH] gpio: pl061: hook request if gpio-ranges avaiable
Date: Tue, 2 Dec 2014 09:39:52 +0800
Message-ID: <547D1868.3020201@huawei.com>
References: <1416552238-9908-1-git-send-email-heyunlei@huawei.com> <CACRpkdZNYMX0qK4desZGY-tDp=VzBamzoU11d8Kf4U+bKbunYQ@mail.gmail.com> <CAD6h2NQUoRTtwDxjyryzua9N3oK6vB+iF1MtX6w_2F99x2BjKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:10381 "EHLO
	szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932280AbaLBBkG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Dec 2014 20:40:06 -0500
In-Reply-To: <CAD6h2NQUoRTtwDxjyryzua9N3oK6vB+iF1MtX6w_2F99x2BjKg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wangbintian <bintian.wang@huawei.com>, peifeiyue@huawei.com, Xinwei Kong <kong.kongxinwei@hisilicon.com>

On 2014/11/29 1:00, Haojian Zhuang wrote:
> On 28 November 2014 at 20:26, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Fri, Nov 21, 2014 at 7:43 AM, Yunlei He <heyunlei@huawei.com> wrote:
>>
>>> Gpio-ranges property is useful to represent which GPIOs correspond
>>> to which pins on which pin controllers. But there may be some gpios
>>> without pinctrl operation. So check whether gpio-ranges property
>>> exists in device node first.
>>>
>>> Signed-off-by: Yunlei He <heyunlei@huawei.com>
>>> Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
>>> Signed-off-by: Haojian Zhuang <haojian.zhuang@linaro.org>
>>
>> (...)
>>
>>>   Documentation/devicetree/bindings/gpio/pl061-gpio.txt | 2 +-
>>>   drivers/gpio/gpio-pl061.c                             | 7 +++++--
>>>   2 files changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.txt b/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
>>> index a2c416b..577bcf7 100644
>>> --- a/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
>>> +++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
>>> @@ -7,4 +7,4 @@ Required properties:
>>>     - bit 0 specifies polarity (0 for normal, 1 for inverted)
>>>   - gpio-controller : Marks the device node as a GPIO controller.
>>>   - interrupts : Interrupt mapping for GPIO IRQ.
>>> -
>>> +- gpio-ranges : Interaction with the PINCTRL subsystem
>>
>> This can be a separate patch. Please send it as such.
>>
>>> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
>>> index 84b49cf..01875d1 100644
>>> --- a/drivers/gpio/gpio-pl061.c
>>> +++ b/drivers/gpio/gpio-pl061.c
>>> @@ -24,6 +24,7 @@
>>>   #include <linux/slab.h>
>>>   #include <linux/pinctrl/consumer.h>
>>>   #include <linux/pm.h>
>>> +#include <linux/of_address.h>
>>
>> What you're checking for is not an address. This would be just
>> #include <linux/of.h>
>>
>>>          spin_lock_init(&chip->lock);
>>> +       if (of_get_property(dev->of_node, "gpio-ranges", NULL)) {
>>> +               chip->gc.request = pl061_gpio_request;
>>> +               chip->gc.free = pl061_gpio_free;
>>> +       }
>>>
>>> -       chip->gc.request = pl061_gpio_request;
>>> -       chip->gc.free = pl061_gpio_free;
>>
>> NAK.
>>
>> No this does not work. GPIO ranges doe not *have* to come from
>> the device tree, it is more common that a GPIO driver adds it by
>> way of gpiochip_add_pin_range().
>>
>> Haojian has already solved this problem in the pinctrl core.
>> Inspect commit 51e13c2475913d45a3ec546dee647538a9341d6a
>> "pinctrl: check pinctrl ready for gpio range"
>>
>> The call(s) to pinctrl_request_gpio() from
>> pl061_gpio_request() should already return silently with 0
>> AFAICT, Haojian do you agree?
>>
>
> It's a bit different.
>
> The commit 51e13c2475 is used to fix this scenario. There're 8 gpio
>   pins in GPIO CHIP #19. There're pin muxing on gpio152 -
>   gpio155. And there're _no_ pin muxing on gpio156 - gpio159. When
> user tries to request gpio159, he'll meet failure since the pinctrl device
> can't cover gpio159. But the pinctrl device is already register for
> gpio152. In order to distinguish whether the pinctrl device registered,
> I added pinctrl_ready_for_gpio_range(gpio).
>
> In another scenario, there's no back-end pinctrl device for GPIO
> CHIP #0. So pinctrl_request_gpio() always returns EPROBE_DEFER.
> The commit 51e13c2475 can't cover this.
>
> I suggest to write code in below.
>
> -static void pl061_gpio_free(struct gpio_chip *chip, unsigned offset)
> +static void pl061_gpio_free(struct gpio_chip *gc, unsigned offset)
>   {
> -       int gpio = chip->base + offset;
> +       struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
> +       int gpio = gc->base + offset;
>
> -       pinctrl_free_gpio(gpio);
> +       if (chip->uses_pinctrl)
> +               pinctrl_free_gpio(gpio);
>   }
>
>   static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
> @@ -264,6 +270,9 @@ static int pl061_probe(struct amba_device *adev,
> const struct amba_id *id)
>
>          spin_lock_init(&chip->lock);
>
> +       /* Hook the request()/free() for pinctrl operation */
> +       if (of_property_read_bool(dev->of_node, "gpio-ranges"))
> +               chip->uses_pinctrl = true;
>
> Maybe it's more clear.
>
> Best Regards
> Haojian
>
> .
>
Ok, thanks for reviews above. The modification in this path is really obscure. I will update this path
according to the comments and send a new version use the code suggested by Haojian.

Best Regards
Yunlei



