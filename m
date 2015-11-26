From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: Re: [PATCH RFD 1/3] gpio/mockup: add virtual gpio device
Date: Thu, 26 Nov 2015 22:54:35 +0800
Message-ID: <56571D2B.8020103@linaro.org>
References: <1447491097-14799-1-git-send-email-bamvor.zhangjian@linaro.org>
 <1447491097-14799-2-git-send-email-bamvor.zhangjian@linaro.org>
 <CACRpkdag_xkSp6uTsoK9tso5mkrGotOeMMjECvecP4ti+5-q_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:36193 "EHLO
	mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751165AbbKZOyk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Nov 2015 09:54:40 -0500
Received: by iofh3 with SMTP id h3so90995795iof.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2015 06:54:39 -0800 (PST)
In-Reply-To: <CACRpkdag_xkSp6uTsoK9tso5mkrGotOeMMjECvecP4ti+5-q_A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Kamlakant Patel <kamlakant.patel@broadcom.com>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>

Hi, Linus

On 11/26/2015 05:34 PM, Linus Walleij wrote:
> On Sat, Nov 14, 2015 at 9:51 AM, Bamvor Jian Zhang
> <bamvor.zhangjian@linaro.org> wrote:
> 
>> This patch add basic structure of a virtual gpio device(gpio-mockup)
>> for testing gpio subsystem. The tester could manipulate such device
>> through sysfs and check the result from debugfs.
>>
>> Currently, it support one or more gpiochip(determined by module
>> parameters with base,ngpio pair). One could test the overlap of
>> different gpiochip and test the direction and/or output values of
>> these chips.
>>
>> Signed-off-by: Kamlakant Patel <kamlakant.patel@linaro.org>
>> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
> 
> This is looking quite nice. Just minor nitpicks:
Thanks.
> 
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define GPIO_NAME      "gpio-mockup"
>> +#define        MAX_GC          5
>> +
>> +enum direction {
>> +       IN,
>> +       OUT
>> +};
>> +
>> +/*
>> + * struct gpio_pin_status - structure describing a GPIO status
>> + * @dir:       Configures direction of gpio as "in" or "out", 0=in, 1=out
>> + * @value:     Configures status of the gpio as 0(low) or 1(high)
>> + */
>> +struct gpio_pin_status {
>> +       enum direction  dir;
>> +       int             value;
> 
> bool value
> 
> Since it is only 0/1.
Ok, I will change it in next version.
> 
>> +struct mockup_gpio_controller {
>> +       struct gpio_chip        gc;
>> +       struct gpio_pin_status  *stats;
>> +};
>> +
>> +int conf[MAX_GC << 1];
>> +int params_nr;
>> +module_param_array(conf, int, &params_nr, 0400);
> 
> I don't really understand why we need these.
> 
> "params_nr" is a way too generic name, plus such module parameters
> should be documented in Documentation/kernel-parameters.txt
> gpio_test_chips = n is better, but I don't really see why we need to
> specify this at all, can't we just decide how many we need? Why
> do we need more than one?
Firstly, one or more gpiochip(s) exist in real driver. And I found the
number of gpiochip may be the corner case. Just like the fix in 
Commit 5433aed ("gpiolib: improve overlap check of range of gpio").
Left this parameter to userspace make the test script easier to
different corner case.
In fact, one or two or more gpiochip is different cases in
gpiochip_add_to_list().
> 
>> +const char *pins_name[MAX_GC] = {"A", "B", "C", "D", "E"};
> 
> So this has 5 pins. Any special reason why?
There is no special reason. Like I said above, I found that there 
are the corner cases when I insert different number of gpiochip. And I
do not want to fix to 3 gpiochips.
And it is not the name of each pin. It is the name of each gpiochip
(cntr->gc.label = name).
> I think 32 is more typical, but there may be a point in having some
> odd number.
Do you mean the gc->names? I do not support it at this time. It seems
that the code of handling gc->names(aka gpiochip_set_desc_names) is
not important. How about do it later?
> 
>> +
>> +static int
>> +mockup_gpio_get(struct gpio_chip *gc, unsigned offset)
>> +{
>> +       struct mockup_gpio_controller *cntr = container_of(gc,
>> +                       struct mockup_gpio_controller, gc);
>> +
>> +       return cntr->stats[offset].value;
> 
> This should still work with a bool there I think.
Ok. 
> 
>> +static void
>> +mockup_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
>> +{
>> +       struct mockup_gpio_controller *cntr = container_of(gc,
>> +                       struct mockup_gpio_controller, gc);
>> +
>> +       if (value)
>> +               cntr->stats[offset].value = 1;
>> +       else
>> +               cntr->stats[offset].value = 0;
> 
> Assign like this to do boolean clamping:
> 
> cntr->stats[offset].value = !!value;
Got you.
> 
> 
>> +int mockup_gpio_add(struct device *dev, struct mockup_gpio_controller *cntr,
>> +               const char *name, int base, int ngpio)
>> +{
>> +       int ret;
>> +
>> +       cntr->gc.base = base;
> 
> I don't think base should be specified for the test chip.
> We should set this to -1 and get a dynamic base, whatever
> it is. 
Fix base to -1 means we could only test the path of code in dynamic
gpio base allocation. I had look at the drivers in drivers/gpio,
it seems that the dynamic allocation is not usual. So, I feel test
with the base gave by user(dt, acpi or something else) is useful.
> Then the test scripts should deal with that.

> 
> Doing this also makes the conf array go away.
> 
>> +static int
>> +mockup_gpio_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct mockup_gpio_controller *cntr;
>> +       int ret;
>> +       int i, j;
>> +       int base;
>> +       int ngpio;
>> +
>> +       if (params_nr == 0) {
>> +               params_nr = 2;
>> +               conf[0] = 0;
>> +               conf[1] = 32;
>> +       }
> 
> This needs explaining. Why do we want 2 test gpio chips by default?
> Why not just one?
Oh, it is too tricky. The default 2 parameter means one gpiochip(one
base and one ngpio). It is indeed just one gpiochip by default.
When I add the module parameter, I was thinking I should pass the
parameter in one array(base1, ngpio1, base2, ngpio2 ...) or two arrays
((base1, base2, ...), (ngpio1, ngpio2, ...). Having two arrays is more
clear but hard to read in test script.
> 
> Why is the base of the second one 32 and not 5 since there is 5 pins
> on each chip?
The '5' is the series of name of each gpio label.
> 
> I would think adding just one chip or two with very varying characteristics
> is the way to go.
Like I mentioned above, one, two or more is different cases.
> Like one 32 line chip and one 5 line chip or
> something.
Yes, it is what I am doing in the script. I will insert one, two or
more gpiochip with different number of lines each.
> 
>> +
>> +       cntr = devm_kzalloc(dev, sizeof(*cntr) * params_nr, GFP_KERNEL);
>> +       if (!cntr)
>> +               return -ENOMEM;
>> +
>> +       platform_set_drvdata(pdev, cntr);
>> +
>> +       for (i = 0; i < params_nr >> 1; i++) {
>> +               base = conf[i << 1];
>> +               ngpio = conf[(i << 1) + 1];
> 
> These should go away I think.
> 
> The rest looks good.
Thanks

Bamvor
> 
> Yours,
> Linus Walleij
> 
