From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: Propagate errors from chip->get()
Date: Wed, 2 Sep 2015 21:37:00 +0900
Message-ID: <CAAVeFu+27Fe7LrHx-oX2mVX89h=cLfBH=kf82=QPP5EokDWC+Q@mail.gmail.com>
References: <1440780258-23652-1-git-send-email-bjorn.andersson@sonymobile.com> <20150901051613.GE13472@usrtlx11787.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150901051613.GE13472@usrtlx11787.corpusers.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 1, 2015 at 2:16 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> On Fri 28 Aug 09:44 PDT 2015, Bjorn Andersson wrote:
>
>> It's possible to have gpio chips hanging off unreliable remote buses
>> where the get() operation will fail to acquire a readout of the current
>> gpio state. Propagate these errors to the consumer so that they can
>> act on, retry or ignore these failing reads, instead of treating them as
>> the line being held high.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
>> ---
>>  drivers/gpio/gpiolib.c | 21 ++++++++++++++-------
>>  1 file changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index 3b5e516298e0..dc17dbf8c234 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -1173,15 +1173,16 @@ EXPORT_SYMBOL_GPL(gpiod_is_active_low);
>>   * that the GPIO was actually requested.
>>   */
>>
>> -static bool _gpiod_get_raw_value(const struct gpio_desc *desc)
>> +static int _gpiod_get_raw_value(const struct gpio_desc *desc)
>>  {
>>       struct gpio_chip        *chip;
>> -     bool value;
>>       int offset;
>> +     int value;
>>
>>       chip = desc->chip;
>>       offset = gpio_chip_hwgpio(desc);
>> -     value = chip->get ? chip->get(chip, offset) : false;
>> +     value = chip->get ? chip->get(chip, offset) : -EIO;
>
> Linus, Alexandre, please feel free to apply this with -ENOTSUPP in
> accordance to Alexandre's comment in [1], if you prefer that. I picked
> -EIO as that's what's used in most other places when the get() op is
> missing.
>
> Maybe we should follow up with separate patch to make that consistent?

I will let Linus decide which value is the more appropriate, the patch
looks solid to me!

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks!
