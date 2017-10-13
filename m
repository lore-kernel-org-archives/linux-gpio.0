From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v2 5/5] gpio: Add driver for Maxim MAX3191x industrial
 serializer
Date: Fri, 13 Oct 2017 15:12:41 -0700
Message-ID: <86333441-4c2b-3e3d-853f-eddadf446956@caviumnetworks.com>
References: <cover.1507797496.git.lukas@wunner.de>
 <165c5061f7f309ecb7f1a3d32c8f7df5026f4a47.1507797496.git.lukas@wunner.de>
 <20171013111124.GA12351@wunner.de>
 <797c3efc-c466-1371-bb3e-176915f81895@caviumnetworks.com>
 <20171013212907.GA25710@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-cys01nam02on0048.outbound.protection.outlook.com ([104.47.37.48]:37872
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752460AbdJMWMt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Oct 2017 18:12:49 -0400
In-Reply-To: <20171013212907.GA25710@wunner.de>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Phil Reid <preid@electromag.com.au>, David Daney <david.daney@cavium.com>, Iban Rodriguez <irodriguez@cemitec.com>, Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org

On 10/13/2017 02:29 PM, Lukas Wunner wrote:
> On Fri, Oct 13, 2017 at 09:53:06AM -0700, David Daney wrote:
>> On 10/13/2017 04:11 AM, Lukas Wunner wrote:
>>> The drivers
>>>
>>>         gpio-104-dio-48e.c, gpio-74x164.c, gpio-gpio-mm.c,
>>>         gpio-pca953x.c, gpio-thunderx.c, gpio-ws16c48.c,
>>>         gpio-xilinx.c
>>>
>>> currently use an inefficient algorithm for their ->set_multiple
>>> callback:  They iterate over every chip (or bank or gpio pin),
>>> check if any bits are set in the mask for this particular chip,
>>> and if so, update the affected GPIOs.  If the mask is sparsely
>>> populated, you'll waste CPU time checking chips even though
>>> they're not affected by the operation at all.
>>>
>>> Iterating over the chips is backwards, it is more efficient to
>>> iterate over the bits set in the mask, identify the corresponding
>>> chip and update its affected GPIOs.  The gpio-max3191x.c driver
>>> I posted yesterday contains an example for such an algorithm and
>>> you may want to improve your ->set_mutiple implementation accordingly:
>>
>> Do you have any profiling results that demonstrate significant system-wide
>> performance improvements by making such a change?
> 
> Sorry, no.
> 
> 
>> For the gpio-thunderx.c driver, the words in the bits/mask exactly match the
>> banks, so the number of iterations doesn't change with the approach you
>> suggest.
> 
> No, I was specifically referring to a sparsely populated mask above.
> Let's say the mask consists of several 64-bit words and only the last
> word has set bits.  With the existing algorithm you have as many
> iterations as you have banks:
> 
> 	for (bank = 0; bank <= chip->ngpio / 64; bank++) {
> 		set_bits = bits[bank] & mask[bank];
> 		clear_bits = ~bits[bank] & mask[bank];
> 		writeq(set_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_SET);
> 		writeq(clear_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_CLR);
> 	}
> 
> Whereas with the algorithm I'm proposing you only have a single iteration:
> 
> 	int bit = 0;
> 	while ((bit = find_next_bit(mask, chip->ngpio, bit)) != chip->ngpio) {
> 		unsigned int bank = bit / 64;
> 		set_bits = bits[bank] & mask[bank];
> 		clear_bits = ~bits[bank] & mask[bank];
> 		writeq(set_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_SET);
> 		writeq(clear_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_CLR);
> 		bit = (bank + 1) * 64; /* continue search from next bank */
> 	}
> 
> find_next_bit() uses the clz instruction on ARM, similar instructions
> exist on most arches, so the search is very fast.
> 

There are a maximum of two banks.

For some thunderx SoCs there is only a single bank, so my code has 
exactly one iteration.  For the SoCs with two banks, my code has exactly 
two iterations.  There are no function calls in the loop.

Your suggested code does a function call to the find_next_bit() function 
for each iteration.  I assert that your method will be slower.

Unless you can show an instruction trace where your code results in 
fewer instructions being executed, I would NAK the patch.

I can't believe I have spent so much time on this issue, for which no 
matter what you do, will not impact system performance in any measurable 
way.


David.




