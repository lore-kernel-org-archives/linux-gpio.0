From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: Allow configuration of pins from gpiolib
 based drivers
Date: Fri, 20 Jan 2017 09:48:13 +0100
Message-ID: <CACRpkdZaU_0R-giZnskPM=5XxKks9JbRH-cvLRSr55KBucUs-g@mail.gmail.com>
References: <20170119094820.83595-1-mika.westerberg@linux.intel.com>
 <20170119094820.83595-3-mika.westerberg@linux.intel.com> <1484827882.2133.229.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:34466 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751419AbdATItk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2017 03:49:40 -0500
Received: by mail-io0-f169.google.com with SMTP id l66so57887395ioi.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2017 00:48:14 -0800 (PST)
In-Reply-To: <1484827882.2133.229.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 19, 2017 at 1:11 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, 2017-01-19 at 12:48 +0300, Mika Westerberg wrote:
>> When a GPIO driver is backed by a pinctrl driver the GPIO driver
>> sometimes needs to call the pinctrl driver to configure certain
>> things,
>> like whether the pin is used as input or output. In addition to this
>> there are other configurations applicable to GPIOs such as setting
>> debounce time of the GPIO.
>>
>> To support this we introduce a new function pinctrl_gpio_set_config()
>> that can be used by gpiolib based driver to pass configuration
>> requests
>> to the backing pinctrl driver.
>
>
>> +     mutex_lock(&pctldev->mutex);
>> +     pin = gpio_to_pin(range, gpio);
>> +     ret = pinconf_set_config(pctldev, pin, configs,
>> ARRAY_SIZE(configs));
>> +     mutex_unlock(&pctldev->mutex);
>
> Does gpio_to_pin() require to be under lock?

All other callers do that because:

commit 9b77ace409e1419c331209c4c8eb2c8bc990e9fd
Author: Axel Lin <axel.lin@ingics.com>
Date:   Mon Aug 19 10:07:46 2013 +0800

    pinctrl: core: Add proper mutex lock in pinctrl_request_gpio

    This one is missed in commit 42fed7ba "pinctrl: move subsystem mutex to
    pinctrl_dev struct".

    I think this fixes the race between pin_free() and pin_request() calls.
    It protects accessing the members of pctldev->desc.
    (e.g. update desc->mux_usecount, desc->gpio_owner, desc->mux_owner, etc)
    Current code grabs pctldev->mutex before calling pinmux_free_gpio(),
    but did not grab the mutex while calling pinmux_request_gpio().

    Signed-off-by: Axel Lin <axel.lin@ingics.com>
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
