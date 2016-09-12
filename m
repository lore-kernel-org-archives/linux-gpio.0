From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: lockdep: incorrect deadlock warning with two GPIO expanders
Date: Mon, 12 Sep 2016 17:16:14 +0200
Message-ID: <CAMpxmJW5WNF2zE+fjmpDxubAYA_A67iQhNGTvSAL-MD-6dFTCw@mail.gmail.com>
References: <CAMpxmJUuj5VrzEu4YZUVxr-ZqFU4VGJpjyHimMJug23EC7j=sQ@mail.gmail.com>
 <20160912120938.GR10153@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:36141 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932172AbcILPQQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 11:16:16 -0400
Received: by mail-oi0-f41.google.com with SMTP id q188so202951649oia.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2016 08:16:15 -0700 (PDT)
In-Reply-To: <20160912120938.GR10153@twins.programming.kicks-ass.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>

  + Linus, Alexandre, linux-gpio

2016-09-12 14:09 GMT+02:00 Peter Zijlstra <peterz@infradead.org>:
>2016-09-12 13:51 GMT+02:00 Bartosz Golaszewski <bgolaszewski@baylibre.com>:
>> I'm trying to figure out a way of getting rid of an incorrect lockdep
>> deadlock warning, but the issue is not trivial.
>>
>> In our hardware an I2C multiplexer is controlled by a GPIO provided by
>> an expander. There's a second expander using the same device driver
>> (pca953x) on one of the I2C bus segments. The diagram below presents
>> the setup:
>>
>>                                                - - - - -
>>  -------             ---------  Bus segment 1 |         |
>> |       |           |         |---------------  Devices
>> |       | SCL/SDA   |         |               |         |
>> | Linux |-----------| I2C MUX |                - - - - -
>> |       |    |      |         | Bus segment 2
>> |       |    |      |         |-------------------
>>  -------     |       ---------                    |
>>              |           |                    - - - - -
>>         ------------     | MUX GPIO          |         |
>>        |            |    |                     Devices
>>        |    GPIO    |    |                   |         |
>>        | Expander 1 |----                     - - - - -
>>        |            |                             |
>>         ------------                              | SCL/SDA
>>                                                   |
>>                                              ------------
>>                                             |            |
>>                                             |    GPIO    |
>>                                             | Expander 2 |
>>                                             |            |
>>                                              ------------
>>
>> Lockdep prints a deadlock message when trying to set the direction or
>> get/set the value of any GPIO provided by the second expander.
>>
>> The reason for the warning is that we take the chip->i2c_lock in
>> pca953x_gpio_set/get_value() or pca953x_gpio_direction_input/output()
>> and then come right back to pca953x_gpio_set_value() when the GPIO mux
>> kicks in. The call path is as follows (starting from a fixed regulator
>> controlled by a GPIO provided by the second expander):
>>
>>   regulator_register()
>>   |_ _regulator_do_enable()
>>      |_ pca953x_gpio_set_value() <- mutex_lock
>>         |_ pca953x_write_single()
>>            |_ i2c_smbus_write_byte_data()
>>               |_ i2c_smbus_xfer()
>>                  |_ i2c_transfer()
>>                     |_ __i2c_transfer()
>>                        |_ i2c_mux_master_xfer()
>>                           |_ i2c_mux_gpio_select()
>>                              |_ i2c_mux_gpio_set()
>>                                 |_ pca953x_gpio_set_value() <- 2nd mutex_lock
>>
>> The locks actually protect different expanders, but lockdep doesn't
>> see this and says:
>>
>>   Possible unsafe locking scenario:
>>
>>         CPU0
>>         ----
>>    lock(&chip->i2c_lock);
>>    lock(&chip->i2c_lock);
>>
>>   *** DEADLOCK ***
>>
>>   May be due to missing lock nesting notation
>>
>> Using mutex_lock_nested(&chip->i2c_lock, SINGLE_DEPTH_NESTING) in
>> pca953x_gpio_get_value() and pca953x_gpio_direction_input/output()
>> helps for reading the values or setting the direction, but doesn't do
>> anything if used in pca953x_gpio_set_value() since we still end up
>> taking the lock of the same subclass again.
>>
>> It would require some nasty hacks to figure out that a GPIO is being
>> used by an I2C mux if we wanted to explicitly provide a different
>> sublass in this case, but that would not fix the culprit, since the
>> same problem would occur in other gpio drivers under similar
>> circumstances.
>>
>> It seems the problem is with the way lockdep works, but I lack the
>> knowledge to propose any solution.
>>
>> Any help & ideas are appreciated.
>
> So I'm entirely clueless on how the device model works let alone i2c
> and/or gpio. So I'm going to need some help as well. What's an SCL/SDA
> for instance?
>

SCL/SDA stands for I2C clock and data lines. It's not important for
the problem, I just used it to mark the physical layer between the SoC
and I2C multiplexer.

> So the 'problem' is that pca953x_probe()'s mutex_init() will collapse
> all mutexes it initializes into a single class. It assumes that the
> locking rules for all instances will be the same.
>
> This happens to not be true in this case.
>

Correct.

> The tricky part, and here I have absolutely no clue what so ever, is
> being able to tell at pca953x_probe() time that this is so.
>

AFAIK there is no clean way to tell that a GPIO is used by an I2C
multiplexer at probe time. Linus, Alexandre could you confirm?

> Once we can tell, at probe time, there are two different annotations we
> could use, depending on need.
>

My current workaround is the following patch:

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 5e3be32..40b96bf 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -739,6 +739,7 @@ static const struct of_device_id pca953x_dt_ids[];
 static int pca953x_probe(struct i2c_client *client,
    const struct i2c_device_id *id)
 {
+ struct lock_class_key *lock_key = (struct lock_class_key *)id;
  struct pca953x_platform_data *pdata;
  struct pca953x_chip *chip;
  int irq_base = 0;
@@ -783,7 +784,7 @@ static int pca953x_probe(struct i2c_client *client,

  chip->chip_type = PCA_CHIP_TYPE(chip->driver_data);

- mutex_init(&chip->i2c_lock);
+ __mutex_init(&chip->i2c_lock, "chip->i2c_lock", lock_key);

  /* initialize cached registers from their original values.
  * we can't share this chip with another i2c master.

It uses the fact that the two expanders we have are of different type
(pca9534 and pca9535). The id pointer points to per-chip device info
residing in .data which makes it suitable for mutex key.

I don't think such hack is suitable for mainline though.

> I suppose that theoretically you can keep nesting like that ad
> infinitum, but I also expect that its uncommon enough, and maybe not
> practical, to really nest like this -- seeing this is the first instance
> of such issues.
>
> In any case, can you tell at probe time? And how deep a nesting should
> we worry about?
>

In this case we would only need two classes - one for 'regular' GPIOs
and another for the GPIOs used to control an I2C multiplexer.

> Seeing how this lock is specific to the driver, and there is no generic
> infrastructure, I don't see how we could solve it other than on a
> per-driver basis.

I'm planning to convert this driver to using regmap and I'm afraid
we'll run into similar issue (given that regmap doesn't nest the
default mutex nor uses different classes).

Best regards,
Bartosz Golaszewski
