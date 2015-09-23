From: Dirk Behme <dirk.behme@gmail.com>
Subject: Re: [PATCH] gpiolib: don't compare an unsigned for >= 0
Date: Wed, 23 Sep 2015 11:41:37 +0200
Message-ID: <560273D1.4040307@gmail.com>
References: <1439913752-26634-1-git-send-email-dirk.behme@gmail.com>
 <55E29114.4050008@gmail.com>
 <CAAVeFu+2sjZDAeHHy=RZgbW4L_+S9+6fypMoNNkMD-g=wutyRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:34290 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752774AbbIWJlk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2015 05:41:40 -0400
Received: by wicfx3 with SMTP id fx3so229557496wic.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2015 02:41:39 -0700 (PDT)
In-Reply-To: <CAAVeFu+2sjZDAeHHy=RZgbW4L_+S9+6fypMoNNkMD-g=wutyRg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 31.08.2015 06:44, Alexandre Courbot wrote:
> On Sun, Aug 30, 2015 at 2:13 PM, Dirk Behme <dirk.behme@gmail.com> wrote:
>> On 18.08.2015 18:02, Dirk Behme wrote:
>>>
>>> The parameter offset is an unsigned, so it makes no sense to compare
>>> it for >= 0. Fix the compiler warning regarding this by removing this
>>> comparison.
>>>
>>> As the macro GPIO_OFFSET_VALID is only used at this single place, simplify
>>> the code by dropping the macro completely and dropping the invert, too.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
>>> ---
>>>    drivers/gpio/gpiolib.c | 4 +---
>>>    1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>>> index bf4bd1d..9841b05 100644
>>> --- a/drivers/gpio/gpiolib.c
>>> +++ b/drivers/gpio/gpiolib.c
>>> @@ -47,8 +47,6 @@
>>>     */
>>>    DEFINE_SPINLOCK(gpio_lock);
>>>
>>> -#define GPIO_OFFSET_VALID(chip, offset) (offset >= 0 && offset <
>>> chip->ngpio)
>>> -
>>>    static DEFINE_MUTEX(gpio_lookup_lock);
>>>    static LIST_HEAD(gpio_lookup_list);
>>>    LIST_HEAD(gpio_chips);
>>> @@ -914,7 +912,7 @@ const char *gpiochip_is_requested(struct gpio_chip
>>> *chip, unsigned offset)
>>>    {
>>>          struct gpio_desc *desc;
>>>
>>> -       if (!GPIO_OFFSET_VALID(chip, offset))
>>> +       if (offset >= chip->ngpio)
>>>                  return NULL;
>>>
>>>          desc = &chip->desc[offset];
>>
>>
>>
>> What do you think about this? Could this be applied?
>
> Looks good to me.
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>


Ping, could this be applied, then?

Best regards

Dirk

