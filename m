From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH] gpio: Add driver for TI TPIC2810
Date: Wed, 30 Dec 2015 11:45:04 -0600
Message-ID: <56841820.3040807@ti.com>
References: <1450210252-12121-1-git-send-email-afd@ti.com>
 <CACRpkdak90H+eZXH=9tZYzQ5DCZsYRXqF7i+tdAqQ8_Y0fcjug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:47464 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752046AbbL3RpG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Dec 2015 12:45:06 -0500
In-Reply-To: <CACRpkdak90H+eZXH=9tZYzQ5DCZsYRXqF7i+tdAqQ8_Y0fcjug@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 12/23/2015 05:29 PM, Linus Walleij wrote:
> On Tue, Dec 15, 2015 at 9:10 PM, Andrew F. Davis <afd@ti.com> wrote:
>
>> Add driver for TI TPIC2810 8-Bit LED Driver with I2C Interface.
>>
>> The TPIC2810 has 8 open-drain outputs that can but used to drive
>> LEDs and other low-side switched resistive loads.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>
> This patch will have to be rebased to apply and compile after the release
> of kernel v4.5-rc1, as we have too much lined up right now, I see no
> big problems
> with it but here are some more minor comments.
>

Works for me.

>   +static inline struct tpic2810 *to_tpic2810(struct gpio_chip *chip)
>> +{
>> +       return container_of(chip, struct tpic2810, chip);
>> +}
>
> We are getting rid of this design pattern, check the gpiochip_get_data()
> function that will be introduced in v4.5-rc1 and patches I merge to all
> other drivers.
>

ACK

>> +static const struct i2c_device_id tpic2810_id_table[] = {
>> +       { "tpic2810", },
>> +       { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, tpic2810_id_table);
>> +
>> +static struct i2c_driver tpic2810_driver = {
>> +       .driver = {
>> +               .name = "tpic2810",
>> +       },
>> +       .probe = tpic2810_probe,
>> +       .remove = tpic2810_remove,
>> +       .id_table = tpic2810_id_table,
>> +};
>> +module_i2c_driver(tpic2810_driver);
>
> No device tree probing? Which platform uses this?
> I was expecting an .of_match_table()  in .driver.
>

As far as I know .of_match_table and MODULE_ALIAS for
DT have no real effect on I2C devices as they match
on "anything,i2c_name". And only throw an I2C
MODALIAS to userspace for loading. So we can use
this device in a DTS without any driver modifications.

At least it worked like this on my test platform
(am57xx-evm).

I think it might be best to keep drivers DT agnostic
when possible, in case DT is superseded by something,
so we don't end up with mountains of dead code.

Thanks,
Andrew

> Yours,
> Linus Walleij
>
