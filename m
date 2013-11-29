From: Bruno Randolf <br1@einfach.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Fri, 29 Nov 2013 17:21:32 +0000
Message-ID: <5298CD1C.9010704@einfach.org>
References: <1385597895-26418-1-git-send-email-br1@einfach.org> <CACRpkdaXO+tYRq=uyQiAopRDPwKv1_F4yZwCWr4-JL1xnio4Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from postler.einfach.org ([91.250.116.113]:58115 "EHLO
	postler.einfach.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755820Ab3K2RVn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 12:21:43 -0500
In-Reply-To: <CACRpkdaXO+tYRq=uyQiAopRDPwKv1_F4yZwCWr4-JL1xnio4Wg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>
Cc: Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hello Linus!

Thank you for your review. I will try to address your concerns, as my
time and knowledge permits ;)

On 11/29/2013 02:40 PM, Linus Walleij wrote:
>> +       depends on X86
> 
> Really? What stops me from soldering this onto one of my ARM or
> MIPS boards?

I suppose nothing, but I don't know. Will remove it.

> ISA-style probing, yeah I had to accept this last time ...
> So no discovery on this system, no ACPI?

The system has ACPI, but GPIOs were not working... I don't know enough
about ACPI, but if someone tells me what to look for I can try to debug it.

>> +/* internal variables */
>> +static struct platform_device *sch311x_gpio_pdev;
>> +static struct platform_device *i2c_gpio_pdev;
>> +
>> +static struct {
>> +       unsigned short runtime_reg;     /* Runtime Register base address */
>> +       spinlock_t lock;                /* lock for io operations */
>> +} sch311x_gpio_data;
> 
> This is a singleton. What happens the day someone mounts two
> of these chips on a board?

Right, this part comes from the watchdog driver for the same chip
(watchdog/sch311x_wdt.c), so I thought I can do the same. That's not a
good excuse, I know...

> Please devm_kzalloc() a state container
> instead, look in other GPIO drivers for examples of this.

Do you have a good example?

>> +static inline void sch311x_sio_enter(int sio_config_port)
>> +{
>> +       outb(0x55, sio_config_port);
>> +}
> 
> 0x55?
> 
>> +static inline void sch311x_sio_exit(int sio_config_port)
>> +{
>> +       outb(0xaa, sio_config_port);
>> +}
> 
> 0xaa?

> Please #define thise magic values.

Again, comes from watchdog/sch311x_wdt.c... will #define.

>> +static int sch311x_gpio_get(struct gpio_chip *chip, unsigned offset)
>> +{
>> +       unsigned char data = inb(sch311x_gpio_data.runtime_reg + GP1);
>> +       return ((data >> offset) & 1);
> 
> Use this:
> 
> #include <linux/bitops.h>
> 
> return !!(data & BIT(offset));

Ah, thanks!!!

>> +#if 0
>> +       /* configure as "push/pull": output voltage is 3.3V */
>> +       outb(SCH311X_GPIO_CONF_OUT, sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[offset]);
> 
> No #if 0 code! Delete this.

OK, sorry.

>> +#else
>> +       /* configure as "open drain": output voltage is 5V on an unconnected PIN */
>> +       outb(SCH311X_GPIO_CONF_OUT | SCH311X_GPIO_CONF_OPEN_DRAIN,
>> +            sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[offset]);
> 
> So if you really only support push/pull, open drain and maybe even
> open source, then it's OK to use the GPIO subsystem. If you start
> doing more things, this becomes a matter of pin control.

It can just be configured as just push/pull or open drain. Is there any
way this can be configured within the GPIO subsystem?

> At the very least I want the driver split up in two files: one that
> adds the GPIO driver for an arbitrary number of pins, and one
> that adds this boards' configuration. You can put the latter in
> drivers/platform/x86 or wherever, just not in drivers/gpio.

OK, that makes sense.

bruno

