From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [RFC fixes 0/2] FIX: Renesas RZ series pinctrl driver
Date: Mon, 30 Jan 2017 16:47:36 +0100
Message-ID: <a8578e24-e142-aad6-a170-d682ee3b24d2@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485535628-17097-1-git-send-email-jacopo+renesas@jmondi.org>
 <SG2PR06MB1165AE0403810D368E508C5F8A760@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165AE0403810D368E508C5F8A760@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "wsa@the-dreams.de" <wsa@the-dreams.de>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Chris,
    thanks for testing the series

On 27/01/2017 22:09, Chris Brandt wrote:
> Hi Jacopo,
>
> On Friday, January 27, 2017, Jacopo Mondi wrote:
>> Hello,
>>    sorry if I'm sending 2 patches on top of an RFC series with comments
>> still pending, but these patches enabled me to properly test pin
>> configuration sequence in order to access the internal EEPROM through
>> RIIC2 interface on pins 1_4 and 1_5.
>>
>> The outcome is a bugfix to RZ/A1 pincontroller driver which [2/2] applies
>> on.
>>
>> When sending v2 of the whole series I'll probably squash these, but if
>> someone is testing the RFC series I wanted to make sure he does not waste
>> his time with a broken driver.
>>
>> Thanks
>>    j
>>
>> Jacopo Mondi (2):
>>   arm: dts: genmai: Configure RIIC2 pins
>>   pinctrl: rz-pfc: Fix RZ/A1 pin function configuration
>>
>>  arch/arm/boot/dts/r7s72100-genmai.dts |  8 ++++-  drivers/pinctrl/rz-
>> pfc/pinctrl-rza1.c | 55 +++++++++++++++++++++++------------
>>  2 files changed, 43 insertions(+), 20 deletions(-)
>
>
> Preliminary testing shows that I2C pin muxing works. Nice job!
>
> Testing:
> - RZ/A1H RSK board
> - u-boot modified to make sure pins are put back to GPIO-IN
> - RIIC ch3 is connected to a I2C port expander that has 3 LEDs attached
> - using a heartbeat kernel thread that blinks the LEDs
>
> Of course, more testing is needed to make sure there is no "smoke and mirrors"
> going on like there was with the MSTP clock driver ;)
>
>
> Note that the I2C pin need to be configured at "bi-directional" but there is
> no way to specify that from DT, so that has to be added as a parameter.

That's something I would like to discuss quite soon.
One general thing I would like is having the so-called "additional 
parameters" part of the SoC driver module, as my gut feeling is that 
different PFC hw requires different configuration options.

In example, the RZ/A1 SoC requires the input/output direction of the pin 
to be specified even when the alternate function is supposed to drive it 
(in order to enable/disable input buffer). The same applies to 
bi-directional port control as you pointed out in your example 
(bi-directional enables input buffer, but that's a consequence of how hw 
works there).

I'm almost sure the same won't be required by all existing and 
forth-coming Renesas SoCs with a pin-based PFC hardware, but maybe other 
parameters I cannot think of right now will have to be specified instead.

If we want to keep the configuration flags SoC-specific, the most easy 
way to pass them down from core module to SoC module would be 
compressing the alternate function number and other configurations in a 
single u32.

In that case the dts will look like:

renesasa,rz-pins = <BANK PORT (ALTERNATE_FUNC_# | IO_MODE | DIRECTION)>;

We could even add a parameter to separate ALTERNATE_FUNCTION from the 
additional configurations, but I don't see any advantage in doing this 
at the moment.

Can people with a broader knowledge of Renesas' SoC series ack/nack my 
assumptions here?

Thanks
    j
