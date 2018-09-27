From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: fix debugfs entry for mcp23s18
 device
Date: Thu, 27 Sep 2018 09:45:29 +0800
Message-ID: <252ce4f2-ccd2-2983-0a28-103801eeb21c@electromag.com.au>
References: <20180925145616.12610-1-m.felsch@pengutronix.de>
 <20180925145616.12610-2-m.felsch@pengutronix.de>
 <02d7e7b6-6dd4-1f3d-eeaa-07e38b427428@electromag.com.au>
 <20180926094225.xpm4mkxlmkjg2d5x@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180926094225.xpm4mkxlmkjg2d5x@pengutronix.de>
Content-Language: en-AU
Sender: stable-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de, stable@vger.kernel.org, =?UTF-8?Q?Jan_Kundr=c3=a1t?= <jan.kundrat@cesnet.cz>
List-Id: linux-gpio@vger.kernel.org

On 26/09/2018 5:42 PM, Marco Felsch wrote:
> On 18-09-26 07:55, Phil Reid wrote:
>> G'day Marco,
>>
>> On 25/09/2018 10:56 PM, Marco Felsch wrote:
>>> This patch fixes 'commit 9b3e4207661e ("pinctrl: mcp23s08: spi: Fix regmap
>>> debugfs entries")'. For sure the MCP23S18 device has only 1 address pin
>>> but this will get decoded into three internally ([1], section 1.4).
>>>
>>> [1]http://ww1.microchip.com/downloads/en/DeviceDoc/22103a.pdf
>> The MCP23018 (i2c) has an address pin that's decoded to 8 addresses.
>> The spi MCP23s18 does not from what I can see.
>>
>> reference:
>> TABLE 1-2: SPI PINOUT DESCRIPTION (MCP23S18)
>>
>> and
>>
>>> 1.4 Multi-bit Address Decoder
>>> The ADDR pin is used to set the slave address of the
>>> MCP23018 (I2C only) to allow up to eight devices on
>>> the bus using only a
>> So I think the original code is correct.
> Sorry, mixed up different RM and the commit message isn't correct too,
> shame on me.
> 
> The patch should be smaller and should not do more than one at the same
> time: fixing and uniform the code. Sorry for that.
> 
> Without the patch this would ever be true, since one_regmap_config is
> initialised to NULL gets only modified in case of S08/S17.
> 
> ...
> 
> case MCP_TYPE_S18:
> 	if (!one_regmap_config)
> 		return -ENOMEM;
> 
> ...
> 
> This was the fixing part. The other one is to uniform the handling and
> the debugfs entries.
G'day Marco,

Sorry I still don't follow.
I've got a mcp23s18 in one of my systems and debugfs seems to work fine.

one_regmap_config is only used for the S08/S17 to fiddle with the name / label



-- 
Regards
Phil Reid

ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au

3 The Avenue, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100
Email: preid@electromag.com.au
