From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH v3] gpio: winbond: add driver
Date: Thu, 4 Jan 2018 21:18:28 +0100
Message-ID: <c5048e9a-7f22-dd7e-89ff-6d58aa4813ca@maciej.szmigiero.name>
References: <834ef274-35fc-0384-fb0f-df36effacf7c@maciej.szmigiero.name>
 <1515006309.7000.635.camel@linux.intel.com>
 <d118e4ed-3faf-ebfc-1ad3-ba3d2c1178eb@maciej.szmigiero.name>
 <1515087346.7000.696.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps-vb.mhejs.net ([37.28.154.113]:54896 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751829AbeADUSd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Jan 2018 15:18:33 -0500
In-Reply-To: <1515087346.7000.696.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, Jonathan Cameron <jic23@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On 04.01.2018 18:35, Andy Shevchenko wrote:
> On Thu, 2018-01-04 at 00:41 +0100, Maciej S. Szmigiero wrote:
>> On 03.01.2018 20:05, Andy Shevchenko wrote:
>>> On Sat, 2017-12-30 at 22:02 +0100, Maciej S. Szmigiero wrote:
>>>> This commit adds GPIO driver for Winbond Super I/Os.
> 
>>> First of all, looking more at this driver, why don't we create a
>>> gpiochip per real "port" during actual configuration?
>>
>> Hmm.. there is only a one 'chip' here, so why would the driver want to
>> register multiple ones?
>>
>> That would also create at least one additional point of failure if
>> one or more such gpiochip(s) register but one fails to do so.
>>
>>> And I still have filing that this one suitable for MFD.
>>
>> As I wrote previously, that would necessitate rewriting also w83627ehf
>> hwmon and w83627hf_wdt drivers, and would make the driver stand out
>> against other, similar Super I/O drivers.
>>
>>> Anyone, does it make sense?
> 
> OK, at least I shared my point.
> 
>>>> +/* returns whether changing a pin is allowed */
>>>> +static bool winbond_gpio_get_info(unsigned int *gpio_num,
>>>> +				  const struct winbond_gpio_info
>>>> **info)
>>>> +{
>>>> +	bool allow_changing = true;
>>>> +	unsigned long i;
>>>> +
> 
>>>> +	for_each_set_bit(i, &gpios, sizeof(gpios)) {
> 
> sizeof(gpios) will produce wrong number for you. It's rather
> BITS_PER_LONG here. Right?

Yes, you are right.

BTW: It happened to work fine when tested on x86-64 since the first
8 bits of "gpios" cover all the existing GPIO ports.

>>>> +		if (*gpio_num < 8)
>>>> +			break;
>>>> +
>>>> +		*gpio_num -= 8;
>>>> +	}
>>>
>>> Why not hweight() here?
>>>
>>> unsigned int shift = hweight_long(gpios) * 8;
>>> unsigned int index = fls_long(gpios); // AFAIU
>>>
>>> *offset -= *offset >= shift ? shift : shift - 8;
>>> *info = &winbond_gpio_infos[index];
>>>
>>> ...
>>
>> Unfortunately, this code doesn't produce the same results as the code
>> above.
>>
>> First, in this code "index" does not depend on "gpio_num" (or
>> "offset")
>> passed to winbond_gpio_get_info() function, so gpio 0 (on the first
>> GPIO
>> device or port) will access the same winbond_gpio_infos entry as gpio
>> 18
>> (which is located on the third GPIO port).
> 
> Actually, it does depend on gpio_num (it's your point to break the
> loop).

I meant that in your code "index" does not depend on "gpio_num" (also
known as "offset").

> So, fls(*offset) then (I renamed gpio_num to offset in my example).

"index = fls(*offset)" isn't correct either, since with "offset" == 10
(0b1010) and "gpios" == 0b1101 we want "index" pointing at the second
enabled GPIO port, that is, the third port (so index should equal 2),
but with the same "offset" and "gpios" == 0b1111 we want "index" to
equal 1.

That is, "index" should depend both on "gpios" and "offset", since when
counting gpio numbers in "offset" we skip disabled GPIO ports (that is,
these that have their bits in "gpios" unset), but they are counted in
"index" because this variable points at static array of hardware GPIO
ports descriptions, which always contains all ports (enabled or not).

>> In fact, the calculated "index" would always point to the last enabled
>> GPIO port (since that is the meaning of "gpios" MSB, assuming this
>> user-provided parameter was properly verified or sanitized).
> 
> Yes, I missed that.
> 
>> Second, the calculated "offset" would end negative for anything but
>> the
>> very last GPIO port (ok, not really negative since it is an unsigned
>> type,
>> but still not correct either).
> 
> So, sounds like hweight_int(*offset) then. No?

(Guess you meant hweight_long() above since I wasn't able to find
hweight_int() in the tree).

"*offset = hweight_long(*offset)" isn't correct since it doesn't
produce the same results as "*offset %= 8" and that is what we need to
calculate.
"index = hweight_long(*offset)" isn't correct since "offset" isn't a
bitmask, it is a number, and "index" (for the reasons described in the
previous comment) should also depend on "gpios" value.

>> And that even not taking into account the special case of GPIO6 port
>> that has only 5 gpios.
> 
> This doesn't matter because of check in ternary operator.
> 
>> What we want in this code is for "i" (or "index") to contain the GPIO
>> port number for the passed "gpio_num" (or "offset") and that this
>> last variable ends reduced modulo 8 from its original value.
> 
> Yep.
> 
>>>> +	if (gpios & ~GENMASK(ARRAY_SIZE(winbond_gpio_infos) - 1,
>>>> 0))
>>>> {
>>>> +		wb_sio_err("unknown ports enabled in GPIO ports
>>>> bitmask\n");
>>>> +		return 0;
>>>> +	}
>>>
>>> Do we care? Perhaps just enforce mask based on the size and leave
>>> garbage out.
>>
>> Can be done either way, but I think notifying user that he or she has
>> provided an incorrect parameter value is a good thing - we can use a
>> accept-but-warn style.
> 
> I would prefer latter (accept-but-warn).
> 

Will do.

Maciej
