From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 5/5] gpio: pca953x: coding style fixes
Date: Wed, 7 Sep 2016 17:19:41 +0200
Message-ID: <CAMpxmJWdNozn0NV-_VPtxxF=msN1WfOQNF5fZMj13E5QEJvijA@mail.gmail.com>
References: <1473259770-26224-1-git-send-email-bgolaszewski@baylibre.com>
 <1473259770-26224-6-git-send-email-bgolaszewski@baylibre.com> <1473261457.11323.88.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:36649 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752727AbcIGPTn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 11:19:43 -0400
Received: by mail-it0-f54.google.com with SMTP id i184so203719721itf.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 08:19:42 -0700 (PDT)
In-Reply-To: <1473261457.11323.88.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2016-09-07 17:17 GMT+02:00 Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> On Wed, 2016-09-07 at 16:49 +0200, Bartosz Golaszewski wrote:
>> pca953x_gpio_set_multiple() has some coding style issues that make it
>> harder to read. Tweak the code a bit.
>>
>
> Usually give one day for reviewers to have a chance to follow your
> changes.
>

Sure, I re-posted immediately because the changes were minor.

Thanks,
Bartosz

> And one comment below.
>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>  drivers/gpio/gpio-pca953x.c | 22 ++++++++++++----------
>>  1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
>> index b08ed52..079c311 100644
>> --- a/drivers/gpio/gpio-pca953x.c
>> +++ b/drivers/gpio/gpio-pca953x.c
>> @@ -360,25 +360,27 @@ exit:
>>  }
>>
>>  static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
>> -             unsigned long *mask, unsigned long *bits)
>> +                                   unsigned long *mask, unsigned
>> long *bits)
>>  {
>>       struct pca953x_chip *chip = gpiochip_get_data(gc);
>> +     unsigned int bankmask, bankval;
>> +     int bank_shift, bank, ret;
>>       u8 reg_val[MAX_BANK];
>> -     int ret;
>> -     int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
>> -     int bank;
>
> I meant to keep int ret apart.
>
> struct pca953x_chip *chip = gpiochip_get_data(gc);
> unsigned int bank_mask, bank_val, bank_shift, bank;
> u8 reg_val[MAX_BANK];
> int ret;
>
> And perhaps _ in the names of bank* to be consistent.
>
>
> --
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Intel Finland Oy
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
