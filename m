From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 3/5] gpio: pca953x: refactor pca953x_read_regs()
Date: Wed, 7 Sep 2016 16:51:08 +0200
Message-ID: <CAMpxmJU-q4TEVYiUZTj3gp__tFXY_tzEQ017vmn0HhP0Yu0Eqg@mail.gmail.com>
References: <1473255472-16090-1-git-send-email-bgolaszewski@baylibre.com>
 <1473255472-16090-4-git-send-email-bgolaszewski@baylibre.com> <1473256591.11323.71.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473256591.11323.71.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2016-09-07 15:56 GMT+02:00 Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> On Wed, 2016-09-07 at 15:37 +0200, Bartosz Golaszewski wrote:
>> Avoid the unnecessary if-else in pca953x_read_regs() by spltting the
>> routine into smaller, specialized functions and calling the right one
>> via a function pointer held in struct pca953x.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>  drivers/gpio/gpio-pca953x.c | 56 +++++++++++++++++++++++++++++++-----
>> ---------
>>  1 file changed, 39 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
>> index b3020ee..018bd18 100644
>> --- a/drivers/gpio/gpio-pca953x.c
>> +++ b/drivers/gpio/gpio-pca953x.c
>> @@ -135,6 +135,7 @@ struct pca953x_chip {
>>       const struct pca953x_offset *offset;
>>
>>       int (*write_regs)(struct pca953x_chip *, int, u8 *);
>> +     int (*read_regs)(struct pca953x_chip *, int, u8 *);
>>  };
>>
>>  static int pca953x_read_single(struct pca953x_chip *chip, int reg,
>> u32 *val,
>> @@ -220,24 +221,41 @@ static int pca953x_write_regs(struct
>> pca953x_chip *chip, int reg, u8 *val)
>>       return 0;
>>  }
>>
>> -static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8
>> *val)
>> +static int pca953x_read_regs_8(struct pca953x_chip *chip, int reg, u8
>> *val)
>>  {
>>       int ret;
>>
>> -     if (chip->gpio_chip.ngpio <= 8) {
>> -             ret = i2c_smbus_read_byte_data(chip->client, reg);
>> -             *val = ret;
>> -     } else if (chip->gpio_chip.ngpio >= 24) {
>> -             int bank_shift = fls((chip->gpio_chip.ngpio - 1) /
>> BANK_SZ);
>> +     ret = i2c_smbus_read_byte_data(chip->client, reg);
>> +     *val = ret;
>
> It's probably of out scope of this series, but looks like
>
> if (ret < 0)
>  return ret;
>
> *val = ret;
> return 0 (?);
>

I'll look into it.

Thanks,
Bartosz
