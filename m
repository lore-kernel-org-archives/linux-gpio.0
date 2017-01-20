From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 3/3] pinctrl / gpio: Introduce .set_config() callback for
 GPIO chips
Date: Fri, 20 Jan 2017 10:24:08 +0100
Message-ID: <d4624a94-7a09-e28a-30bb-5d0e367722c0@baylibre.com>
References: <20170119094820.83595-1-mika.westerberg@linux.intel.com>
 <20170119094820.83595-4-mika.westerberg@linux.intel.com>
 <CACRpkdbsOvJkpNtjvCXRNWV6dA6onzomn-E+9n=xJabmcRGbEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbsOvJkpNtjvCXRNWV6dA6onzomn-E+9n=xJabmcRGbEQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 01/20/2017 10:13 AM, Linus Walleij wrote:
> On Thu, Jan 19, 2017 at 10:48 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
>> Currently we already have two pin configuration related callbacks
>> available for GPIO chips .set_single_ended() and .set_debounce(). In
>> future we expect to have even more, which does not scale well if we need
>> to add yet another callback to the GPIO chip structure for each possible
>> configuration parameter.
>>
>> Better solution is to reuse what we already have available in the
>> generic pinconf.
>>
>> To support this, we introduce a new .set_config() callback for GPIO
>> chips. The callback takes a single packed pin configuration value as
>> parameter. This can then be extended easily beyond what is currently
>> supported by just adding new types to the generic pinconf enum.
>>
>> We then convert the existing drivers over .set_config() and finally
>> remove the .set_single_ended() and .set_debounce() callbacks.
>>
>> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Yes!!! This is exactly how this should be done.
> 
> Can't wait to apply the final version of this.
> 
>> +static int gpio_set_drive_mode(struct gpio_chip *gc, unsigned offset,
>> +                              enum pin_config_param mode)
>> +{
>> +       unsigned long config = { PIN_CONF_PACKED(mode, 0) };
>> +
>> +       return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
>> +}
> 
> I would name it gpio_set_drive_single_ended() as the open source/open
> drain is all we support here.
> 
>>         if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
>>                 /* First see if we can enable open drain in hardware */
>> -               if (gc->set_single_ended) {
>> -                       ret = gc->set_single_ended(gc, gpio_chip_hwgpio(desc),
>> -                                                  LINE_MODE_OPEN_DRAIN);
>> -                       if (!ret)
>> -                               goto set_output_value;
>> -               }
>> +               ret = gpio_set_drive_mode(gc, gpio_chip_hwgpio(desc),
>> +                                         PIN_CONFIG_DRIVE_OPEN_DRAIN);
>> +               if (!ret)
>> +                       goto set_output_value;
> 
> Aha I see, so if we fail to set single ended we get to the next step.
> Nice.
> 
>>                 /* Emulate open drain by not actively driving the line high */
>>                 if (val)
>>                         return gpiod_direction_input(desc);
>>         }
> 
> (...)
> 
>> -               if (gc->set_single_ended) {
>> -                       ret = gc->set_single_ended(gc, gpio_chip_hwgpio(desc),
>> -                                                  LINE_MODE_OPEN_SOURCE);
>> -                       if (!ret)
>> -                               goto set_output_value;
>> -               }
>> +               ret = gpio_set_drive_mode(gc, gpio_chip_hwgpio(desc),
>> +                                         PIN_CONFIG_DRIVE_OPEN_SOURCE);
>>                 /* Emulate open source by not actively driving the line low */
>>                 if (!val)
>>                         return gpiod_direction_input(desc);
> 
> But here the handling seems to be wrong? You still need
> the if (!ret) goto set_output_value?
> 
>>         } else {
>> -               /* Make sure to disable open drain/source hardware, if any */
>> -               if (gc->set_single_ended)
>> -                       gc->set_single_ended(gc,
>> -                                            gpio_chip_hwgpio(desc),
>> -                                            LINE_MODE_PUSH_PULL);
>> +               gpio_set_drive_mode(gc, gpio_chip_hwgpio(desc),
>> +                                   PIN_CONFIG_DRIVE_PUSH_PULL);
> 
> Nice.
> 
>> -static int sx150x_gpio_set_single_ended(struct gpio_chip *chip,
>> -                                       unsigned int offset,
>> -                                       enum single_ended_mode mode)
>> +static int sx150x_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
>> +                                 unsigned long config)
>>  {
>> -       struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
>> -       int ret;
>> -
>> -       switch (mode) {
>> -       case LINE_MODE_PUSH_PULL:
>> -               if (pctl->data->model != SX150X_789 ||
>> -                   sx150x_pin_is_oscio(pctl, offset))
>> -                       return 0;
>> -
>> -               ret = regmap_write_bits(pctl->regmap,
>> -                                       pctl->data->pri.x789.reg_drain,
>> -                                       BIT(offset), 0);
>> -               break;
>> -
>> -       case LINE_MODE_OPEN_DRAIN:
>> -               if (pctl->data->model != SX150X_789 ||
>> -                   sx150x_pin_is_oscio(pctl, offset))
>> -                       return -ENOTSUPP;
>> -
>> -               ret = regmap_write_bits(pctl->regmap,
>> -                                       pctl->data->pri.x789.reg_drain,
>> -                                       BIT(offset), BIT(offset));
>> -               break;
>> -       default:
>> -               ret = -ENOTSUPP;
>> -               break;
>> -       }
>> -
>> -       return ret;
>> +       return pinctrl_gpio_set_config(chip->base + offset, config);
>>  }
> 
> This is the beauty of it all..

It would be even cooler it this becomes a generic helper !

> 
>> @@ -811,16 +782,26 @@ static int sx150x_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>>                         break;
>>
>>                 case PIN_CONFIG_DRIVE_OPEN_DRAIN:
>> -                       ret = sx150x_gpio_set_single_ended(&pctl->gpio,
>> -                                               pin, LINE_MODE_OPEN_DRAIN);
>> +                       if (pctl->data->model != SX150X_789 ||
>> +                           sx150x_pin_is_oscio(pctl, pin))
>> +                               return -ENOTSUPP;
>> +
>> +                       ret = regmap_write_bits(pctl->regmap,
>> +                                               pctl->data->pri.x789.reg_drain,
>> +                                               BIT(pin), BIT(pin));
>>                         if (ret < 0)
>>                                 return ret;
>>
>>                         break;
>>
>>                 case PIN_CONFIG_DRIVE_PUSH_PULL:
>> -                       ret = sx150x_gpio_set_single_ended(&pctl->gpio,
>> -                                               pin, LINE_MODE_PUSH_PULL);
>> +                       if (pctl->data->model != SX150X_789 ||
>> +                           sx150x_pin_is_oscio(pctl, pin))
>> +                               return 0;
>> +
>> +                       ret = regmap_write_bits(pctl->regmap,
>> +                                               pctl->data->pri.x789.reg_drain,
>> +                                               BIT(pin), 0);
>>                         if (ret < 0)
>>                                 return ret;
>>
>> @@ -1178,7 +1159,7 @@ static int sx150x_probe(struct i2c_client *client,
>>         pctl->gpio.direction_output = sx150x_gpio_direction_output;
>>         pctl->gpio.get = sx150x_gpio_get;
>>         pctl->gpio.set = sx150x_gpio_set;
>> -       pctl->gpio.set_single_ended = sx150x_gpio_set_single_ended;
>> +       pctl->gpio.set_config = sx150x_gpio_set_config;
> 
> Would be nice if some SX150x person could look at this but it seems just
> right to me.

Seems good, please CC us in v2 so we can add a Tested-by.

Thanks,
Neil

> 
>> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
>> index c2748accea71..2939c1d84add 100644
>> --- a/include/linux/gpio/driver.h
>> +++ b/include/linux/gpio/driver.h
>> @@ -8,6 +8,7 @@
>>  #include <linux/irqdomain.h>
>>  #include <linux/lockdep.h>
>>  #include <linux/pinctrl/pinctrl.h>
>> +#include <linux/pinctrl/pinconf-generic.h>
> 
> Yups there is lands...
> 
> Thanks, I'm impressed.
> 
> Hope I'll be able to apply v2.
> 
> Yours,
> Linus Walleij
> 
