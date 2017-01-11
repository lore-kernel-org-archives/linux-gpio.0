From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 0/3] Renesas RZ PFC and GPIO driver
Date: Wed, 11 Jan 2017 16:15:30 +0100
Message-ID: <10eda4a0-55de-4716-b92f-17dcf599af34@jmondi.org>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
 <2671694.94z5NEauGX@avalon> <06e9c953-df81-08f1-a817-730301778e06@jmondi.org>
 <7332833.bE664ByKOm@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:53713 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753301AbdAKPPf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 10:15:35 -0500
In-Reply-To: <7332833.bE664ByKOm@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Laurent,

On 11/01/2017 12:22, Laurent Pinchart wrote:
> Hi Jacopo,
>

[snip]

>>>>
>>>> Here is my general question: Which of these 2 approaches are better?
>>>>
>>>> A) In the DT, the user ask "enable Ethernet please" and magic happens in
>>>>    the pfc driver.
>>>>
>>>> B) In the DT, the user looks up the correct pin/function assignments in
>>>>    the SoC Hardware Manual and manually spells out what they need.
>>>>
>>>> R-Car looks more like A. I've been using a driver that looks more like B.
>>>>
>>>> For most drivers (USB, MMC, SDHI, etc..,), I'm happy when 'magic happens'
>>>> and I don't really have to open a HW manual at all.
>>>> But, for something like setting up the PFC when someone gets a shiny new
>>>> board, making people actually open a HW manual seems acceptable to me.
>>>
>>> From a user point of view, option A looks better to me. However, it has
>>> two drawbacks:
>>>
>>> - Through deciding what pin groups we make available we create a DT ABI
>>> that will make it difficult to fix mistakes in case the groups are not
>>> fine-grained enough.
>>>
>>> - The data tables in C code are large, and we end up compiling many of
>>> them in multi-platform kernel, significantly increasing the kernel size.
>>>
>>> I would thus favour option B.
>>
>> That would be saner, I agree.
>>
>> And a much saner way of doing this would be, in my understanding, not
>> using the group-based sh-pfc drivers used for R-Car and back it up with
>> a pin-based equivalent, where to hook drivers for each specific hardware.
>
> We can't really do that for the existing SoCs as the concept of groups is
> present in the hardware. Not only do we need to select per-pin functions, but
> there are also register bits that perform pin muxing for whole groups. If this
> changes in future generations of the SoCs we then could do away with the data
> tables, but for now we're stuck with them.
>

Well, for the RZ/A platform "groups" are really pins themselves for what 
I see in dts and pinctrl driver.

-------------------------------------------------------------------
Eg. SCIF2

From: arch/arm/boot/dts/r7s72100-genmai.dts
	scif2_pins: serial2 {
		renesas,groups = "scif2_txd_p3_0", "scif2_rxd_p3_2";
		renesas,function = "scif2";
	};

From: drivers/pinctrl/sh-pfc/pfc-r7s72100.c
#define SCIF2(fn)			\
	fn(scif2, clk, 3, 0, 4)		\
	fn(scif2, txd, 3, 1, 4)		\
	*fn(scif2, rxd, 3, 2, 4)	\*
	*fn(scif2, txd, 3, 0, 6)	\*
	fn(scif2, clk, 4, 1, 5)		\
	fn(scif2, txd, 4, 2, 5)		\
	fn(scif2, rxd, 4, 3, 5)		\
	fn(scif2, txd, 4, 14, 7)	\
	fn(scif2, rxd, 4, 15, 7)	\
	fn(scif2, txd, 6, 2, 7)		\
	fn(scif2, rxd, 6, 3, 7)		\
	fn(scif2, clk, 8, 3, 7)		\
	fn(scif2, rxd, 8, 4, 7)		\
	fn(scif2, txd, 8, 6, 7)
-------------------------------------------------------------------

It seems to me that "renesas,function" is used to identify all "groups" 
(aka pins here) that can be made to work in SCIF2 mode (the 14 pins 
above) and "renesas,groups" identifies which pins to configure for the 
desired function (the alternate function number is the last entry of the 
"fn(function, name, bank,  pin, function)" macro).

Long story short: this ends up writing a bunch of registers for each 
single "group" (pin)

-------------------------------------------------------------------
Eg.

scif2_rxd_p3_2 configuration as function #4 writes registers

PMC3[2] = 1, PFC3[2] = 1, PFCE3[2] = 1, PFCAE3[2] = 0

scif2_txd_p3_0 configuration as function #6 writes registers

PMC3[2] = 1, PFC3[2] = 1, PFCE3[2] = 0, PFCAE3[2] = 1

And no global group configuration register has to be set, as it happens 
instead for R-Car series.
-------------------------------------------------------------------

As shown in the RFC series "pinctrl: sh-pfc: r7s72100: Add IO mode 
selection" I sent out along with this one, this model is not flexible 
enough, and the attempt I proposed to extend it to support additional 
pin configuration options ends up multiplying the already gigantic macro 
tables.

I was wondering if that should not be be turned into something more 
similar to the pinctrl-single defined ABI. In that case it would look 
like this (please excuse the pseduo-dts syntax here)

  	scif2_pins: serial2 {
		renesas,pin = <3, 2, MUX_MODE4, PIN_CONFIG_OPTIONS,
			       3, 0, MUX_MODE6, PIN_CONFIG_OPTIONS>
	};

I'm under the impression that pinctrl-single would almost do, if not for 
the write function bit, that for OMAP platform results in a write to a 
single register, while (for RZ/A at least) we have to spread it on a 
bunch of different registers.

Also, Chris has some examples of this in his BSPs iirc, so I guess there 
is code for the RZ series out there already implementing this per-pin ABI...

Sorry for the long email, hope it did not frustrate anyone.
    j


>> Looks like pinmux-single, yes, but that driver bets on the ability to
>> set pin functions and configurations with a write to a single register
>> while, at least for RZ/A, the same is scattered among several registers
>> (I may be wrong on the single register requirement for pinctrl-single
>> though)
>>
>> So, I guess what direction to take depends on whether or not we're going
>> to see more hardware with a per-pin configuration that would benefit
>> from this new rz-pfc driver (it seems so) and if this justify splitting
>> sh-pfc in two, a group-based one for R-Car devices (and all devices
>> there already) and a new pin-based one.
>>
>> Or maybe we can tie pin-based configuration in sh-pfc and it's me not
>> seeing how to do that.
>

