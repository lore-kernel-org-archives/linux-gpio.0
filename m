From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] gpio / ACPI: ignore GpioInt() GPIOs when requesting GPIO_OUT_*
Date: Thu, 24 Mar 2016 10:41:16 -0700
Message-ID: <CAKdAkRQxh=mG7eMxCCWHRE09brpDY5MYdqsCeOT3TOmw3woS2A@mail.gmail.com>
References: <20160323225831.GA28309@dtor-ws>
	<20160324140133.GT2099@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f52.google.com ([209.85.213.52]:33561 "EHLO
	mail-vk0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbcCXRlS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Mar 2016 13:41:18 -0400
In-Reply-To: <20160324140133.GT2099@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Thu, Mar 24, 2016 at 7:01 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Wed, Mar 23, 2016 at 03:58:31PM -0700, Dmitry Torokhov wrote:
>> From: Dmitry Torokhov <dtor@chromium.org>
>>
>> When firmware does not use _DSD properties that allow properly name GPIO
>> resources, the kernel falls back on parsing _CRS resources, and will
>> return entries described as GpioInt() as general purpose GPIOs even
>> though they are meant to be used simply as interrupt sources for the
>> device:
>>
>> Device (ETSA)
>> {
>>       Name (_HID, "ELAN0001")
>>       ...
>>
>>       Method(_CRS, 0x0, NotSerialized)
>>       {
>>               Name(BUF0,ResourceTemplate ()
>>               {
>>                       I2CSerialBus(
>>                               0x10,                     /* SlaveAddress */
>>                               ControllerInitiated,      /* SlaveMode */
>>                               400000,                   /* ConnectionSpeed */
>>                               AddressingMode7Bit,       /* AddressingMode */
>>                               "\\_SB.I2C1",             /* ResourceSource */
>>                       )
>>                       GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullNone,,
>>                                "\\_SB.GPSW") { BOARD_TOUCH_GPIO_INDEX }
>>               } )
>>               Return (BUF0)
>>       }
>> ...
>> }
>>
>> This gives troubles with drivers such as Elan Touchscreen driver
>> (elants_i2c) that uses devm_gpio_get to look up "reset" GPIO line and
>> decide whether the driver is responsible for powering up and resetting
>> the device or firmware is. In the above case the lookup succeeds, we map
>> GPIO as output and later fail to request client->irq interrupt that is
>> mapped to the same GPIO.
>>
>> Let's ignore resources described as GpioInt() when requesting output
>> GPIO (but allow them when requesting GPIOD_ASIS or GPIOD_IN as some
>> drivers - i2c-hid - do request GPIO as input and then map it to
>> interrupt with gpiod_to_irq).
>
> You could mention here that we only ignore GpioInt() resources in
> fallback case.

I thought I did that (in the first paragraph). Let me try to reword
better and resend.

>
>> BUG=chrome-os-partner:51154
>> TEST=Boot Cyan, verify touchscreen work
>>
>> Change-Id: Id20c730b937dce8a4135d2b64c8d798372d20e82
>
> This is not needed for mainline patches :)

Ugh, sorry, I forgot to cut this stuff out...

>
>> Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thanks.

-- 
Dmitry
