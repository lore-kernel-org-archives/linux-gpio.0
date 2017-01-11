From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 0/3] Renesas RZ PFC and GPIO driver
Date: Wed, 11 Jan 2017 18:51:35 +0100
Message-ID: <3347aca7-5984-44dc-6b23-9eb1fa4712f5@jmondi.org>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
 <7332833.bE664ByKOm@avalon> <10eda4a0-55de-4716-b92f-17dcf599af34@jmondi.org>
 <1928005.z8ulDpGmNF@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1928005.z8ulDpGmNF@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Laurent,

On 11/01/2017 17:31, Laurent Pinchart wrote:
> Hi Jacopo,

[snip]

>>
>> I was wondering if that should not be be turned into something more
>> similar to the pinctrl-single defined ABI. In that case it would look
>> like this (please excuse the pseduo-dts syntax here)
>>
>>   	scif2_pins: serial2 {
>> 		renesas,pin = <3, 2, MUX_MODE4, PIN_CONFIG_OPTIONS,
>> 			       3, 0, MUX_MODE6, PIN_CONFIG_OPTIONS>
>
> This should just be "pin", not "renesas,pin".
>
>> 	};
>
> Yes, I believe that should be done, especially given that the datasheet for
> the SoC is public. For other SoCs the current PFC driver model exposes the
> information needed to configure pin muxing even if you can't access the
> datasheet, which is an option that I'd hate losing.
>

Just to point out that this proposed change won't affect the existing 
R-Car devices, but would apply to RZ/A-like devices currently not 
supported and which may appear in future (and according to Chris, to 
some old SH ones which no one wants to touch ;P )

I'm thinking about something like

drivers/pinctrl/sh-pfc/ (which would be better re-named as rcar-pfc)
drivers/pinctrl/rz-pfc/

But that's a big change that may upset some people here :)

>> I'm under the impression that pinctrl-single would almost do, if not for
>> the write function bit, that for OMAP platform results in a write to a
>> single register, while (for RZ/A at least) we have to spread it on a
>> bunch of different registers.
>
> That's correct, but a pinctrl-single-like driver could be implemented
> relatively easily without all the data tables. We might still need some data
> if we want to validate DT entries though, for instance to store the valid pin
> config and/or options for each pin.
>

A big difference from what pinctrl-single does and what the table-based 
approach does is that it creates groups, pins and functions at run-time, 
parsing the dts...
There's indeed quite some code there for doing this, but it does not 
perform any validation of what the dts describes.
Maybe we can skip all that part (parsing and run-time generation of 
groups, pins and function) using tables, and adopt a pin-oriented ABI 
that would allow us to specify in the dts the function and the per-pin 
configuration that would look more natural for this kind of devices.

As a final note: maybe we need to decide what to do with this series, 
people is spending time reviewing it, and I've just sent v2 out. If we 
want to go in a different direction, we should stop here :)

Thanks
    j
