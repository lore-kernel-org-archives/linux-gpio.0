From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH v2] gpio: winbond: add driver
Date: Sat, 30 Dec 2017 22:02:58 +0100
Message-ID: <1d1dc7f9-eb61-9067-1de3-ceecb76b6e46@maciej.szmigiero.name>
References: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
 <1514473954.7000.418.camel@linux.intel.com>
 <786affb2-68e9-1c5d-6a73-98f3ea09f7b1@maciej.szmigiero.name>
 <1514543232.7000.507.camel@linux.intel.com> <20171229160918.GA8195@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171229160918.GA8195@sophia>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 29.12.2017 17:09, William Breathitt Gray wrote:
> On Fri, Dec 29, 2017 at 12:27:12PM +0200, Andy Shevchenko wrote:
>> On Fri, 2017-12-29 at 00:44 +0100, Maciej S. Szmigiero wrote:
>>> On 28.12.2017 16:12, Andy Shevchenko wrote:
>>>> On Fri, 2017-12-22 at 19:58 +0100, Maciej S. Szmigiero wrote:
>>>>>
>>
>>>>> +	  You will need to provide a module parameter "gpios", or
>>>>> a
>>>>> +	  boot-time parameter "gpio_winbond.gpios" with a bitmask
>>>>> of
>>>>> GPIO
>>>>> +	  ports to enable (bit 0 is GPIO1, bit 1 is GPIO2, etc.).
>>>>
>>>> 1. Why it's required?
>>>
>>> It is required bacause "[o]ne should be careful which ports one
>>> tinkers
>>> with since some might be managed by the firmware (for functions like
>>> powering on and off, sleeping, BIOS recovery, etc.) and some of GPIO
>>> port
>>> pins are physically shared with other devices included in the Super
>>> I/O
>>> chip".
>>
>> I would like to be clear, I was asking about module parameters. Nowadays
>> we won't have new parameters to the kernel.
>>
>> Is there any strong argument to do it so? Is it one above? Can we detect
>> as much as possible run time?
> 
> The Low Pin Count (LPC) bus is a modern computer bus which to software
> resembles the legacy ISA bus of the 1980s. Unfortunately, this means
> port addresses for devices are assumed based on convention and manual
> configuration rather than hardware detection -- as such, there is a
> danger of clobbering another device's address space since addressing
> must be resolved manually.

Yes, although according to the datasheet this particular device only
supports two hardcoded I/O bases (and is soldered on a motherboard) so
a random conflict is unlikely.

> 
> Maciej, although the base address for the Winbond Super I/O chip cannot
> be probed, does the chip itself offer configuration information for how
> many GPIO are available -- or instead is the total number of GPIO
> supported by firmware always the same and it is left up to the user to
> make sure they do not clobber other devices' address spaces during use?

As I wrote in my previous message to Andy unfortunately we don't really
have a general ability to detect which GPIO device(s) should be configured
and how since it is very likely that these particular devices and their
pins that aren't used internally by the firmware aren't even configured
correctly.
And we can't simply enable all since these would possibly reconfigure
these that really should be managed by the firmware or that share pins
with other devices like UARTs.

> My suspicion is the latter, but I figure I may as well ask.
> 
> If so, I suggest simply allowing access to all supported GPIO to the
> user. My reasoning is this: the user is the one loading the module
> parameter, so they should already know which GPIO they intend to use --
> as such, if they wouldn't have requested it in your "gpios" module
> parameter, they won't use it when the gpiochip is registered. Thus, the
> "gpios" module parameter can be removed and ngpios simply set to the
> total number of supported GPIO.

As I wrote above, we can't blindly enable all GPIO ports.

> For example, the 104-IDIO-16 GPIO driver supports 32 GPIO lines because
> 104-IDIO-16 devices have 32 available GPIO lines. However, this same
> driver may be use for 104-IDIO-8 devices which are firmware compatible
> with 104-IDIO-16 devices. In this case, despite 104-IDIO-8 devices only
> having 16 GPIO lines, ngpios is still set to 32 because the user already
> knows that the upper 16 GPIO lines are not available for their device,
> despite the driver permitting access to them.
> 
> One problem I do see is how to handle your "ppgpios" and "odgpios"
> module parameters, which allow the configuration of push-pull mode and
> open drain mode respectfully. I would like to see these module
> parameters go aways as well and leave it up for the user to configure at
> runtime. Linus, does the GPIO subsystem have a method of dynamically
> setting these kind of pin configurations?

The problem here is that this device doesn't support per-pin output
driver configuration, only per-GPIO device (8 pins) configuration.

The GPIO subsystem exports an independent configuration for each pin,
so implementing a GPIO output driver configuration method this way
would be advertising a capability that the device doesn't really have.

> William Breathitt Gray

Maciej Szmigiero
