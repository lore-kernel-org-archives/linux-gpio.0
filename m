From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: BGPIOF_READ_OUTPUT_REG_SET problem
Date: Wed, 16 Dec 2015 20:58:37 +0200
Message-ID: <5671B45D.1030407@mentor.com>
References: <20151216140456.GA20121@panicking> <56717A1F.7020105@mentor.com>
 <20151216152511.GB20121@panicking>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:42379 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754936AbbLPTAC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2015 14:00:02 -0500
In-Reply-To: <20151216152511.GB20121@panicking>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Trimarchi <michael@amarulasolutions.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>

Hi Michael,

On 16.12.2015 17:25, Michael Trimarchi wrote:
> Hi
> 
> On Wed, Dec 16, 2015 at 04:50:07PM +0200, Vladimir Zapolskiy wrote:
>> Hi Michael,
>>
>> On 16.12.2015 16:05, Michael Trimarchi wrote:
>>> Hi
>>>
>>> I have get a problem using gpio and imx6q freescale architecture. 
>>
>> what is the problem you experience? What is the version of the kernel
>> (commit hash id) you run?
>>
> 
> I don't want the mask back when I read the gpio. I want to know if it's
> 1 or 0

I hope I figured out what is your problem.

At the time when I submitted b19e7f51a5 (dated Apr 29, 2015) return type of
_gpiod_get_raw_value() was bool, so it did not matter if you return mask or
0/1 value.

Later on Bjorn's commit e20538b82 ("gpio: Propagate errors from
chip->get()") (dated Aug 28, 2015) changed the return type from bool to int,
so you get the error now.

I would like to mention some points.

a) the Bjorn's commit brings the same problem to more GPIO drivers, this is
a short and not totally verified list (only function names):

* da9055_gpio_get()
* davinci_gpio_get()
* em_gio_get()
* intel_gpio_get()
* ttl_get_value()
* max732x_gpio_get_value()
* ioh_gpio_get()
* mpc8572_gpio_get()
* mpc8xxx_gpio_get()
* msic_gpio_get()
* pcf857x_get()
* pch_gpio_get()
* sa1100_gpio_get()
* gsta_gpio_get()
* tc3589x_gpio_get()
* tz1090_gpio_get()
* tz1090_pdc_gpio_get()

The list of gc.get() functions which may return a negative value today is
much shorter, so counting gpiochip drivers commit e20538b82 brings more bugs
than fixes.

I believe the right decision will be to fix all currently broken gpiochip
.get() functions, most probably returning a negative error was done on
purpose, Linus, please confirm.

b) from Bjorn's commit:

-static bool _gpiod_get_raw_value(const struct gpio_desc *desc)
+static int _gpiod_get_raw_value(const struct gpio_desc *desc)
 {
 	struct gpio_chip	*chip;
-	bool value;
 	int offset;
+	int value;

 	chip = desc->chip;
 	offset = gpio_chip_hwgpio(desc);
-	value = chip->get ? chip->get(chip, offset) : false;
+	value = chip->get ? chip->get(chip, offset) : -EIO;
+	value = value < 0 ? value : !!value;

^^^ this !! is a naive attempt to imitate backward compatible behaviour,
however it is broken, because if some !0 value is returned, then it might
happen that (value < 0) branch is selected.

Michael, is it your case? Do you receive an error, when reading a
GPIO[x*32+31] line status?

 	trace_gpio_value(desc_to_gpio(desc), 1, value);
	return value;
 }

c) here are the results of my testing on iMX6 SabreSD (edb42dc7bc0 on
Torvald's branch with a slightly modified DTS):

  output (red LED D3):

  % echo 2 > /sys/class/gpio/export
  % echo out > /sys/class/gpio/gpio2/direction
  % echo 1 > /sys/class/gpio/gpio2/value
  % cat /sys/class/gpio/gpio2/value
  1

  input (vol dn button)
  % echo 5 > /sys/class/gpio/export
  % echo in > /sys/class/gpio/gpio5/direction
  % cat /sys/class/gpio/gpio5/value
  1

Everything seems to be ok with gpios other than 31 + x*32, but the problem
of course exists.

Michael, try to revert e20538b82 and retest on your end, I would appreciate
to know the results.

Linus, I missed any relative discussion on the mailing list, what is the
final decision, can _gpiod_get_raw_value() return errors or not? In other
words which one of two gpiochip classes is broken, the one which returns
errors as negative values in .get() or the one which returns masks? I
believe it should be easier to fix the second one, even if it is larger
though :)

With best wishes,
Vladimir

>>> I don't really understand how should work your change and I have done a quick
>>> fix for me. Can you explain what was the idea?
>>
>> I believe here you are talking about changes b19e7f51a5 and
>> 442b2494b17d1 , please explain the problem.
>>
>> With best wishes,
>> Vladimir
>>
>>> Michael
>>>
>>> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
>>> index a3f0753..f9c6ff7 100644
>>> --- a/drivers/gpio/gpio-generic.c
>>> +++ b/drivers/gpio/gpio-generic.c
>>> @@ -139,11 +139,14 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
>>>  {
>>>  	struct bgpio_chip *bgc = to_bgpio_chip(gc);
>>>  	unsigned long pinmask = bgc->pin2mask(bgc, gpio);
>>> +	unsigned long reg;
>>>  
>>>  	if (bgc->dir & pinmask)
>>> -		return bgc->read_reg(bgc->reg_set) & pinmask;
>>> +		reg = bgc->read_reg(bgc->reg_set) & pinmask;
>>>  	else
>>> -		return bgc->read_reg(bgc->reg_dat) & pinmask;
>>> +		reg = bgc->read_reg(bgc->reg_dat) & pinmask;
>>> +
>>> +	return !!(reg &  bgc->pin2mask(bgc, gpio));
>>>  }
>>>  
>>>  static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
>>>
> 

