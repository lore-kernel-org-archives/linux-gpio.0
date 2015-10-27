From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH v10] gpio: Add GPIO support for the ACCES 104-IDIO-16
Date: Tue, 27 Oct 2015 08:37:37 -0400
Message-ID: <562F7011.9040309@gmail.com>
References: <20151019165914.GA22867@sophia>
 <CACRpkdbQyed0S0Y6MSt35LuOekFprvbPMDpsGku-cBXBt=9j0Q@mail.gmail.com>
 <20151027111303.GD4665@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f173.google.com ([209.85.160.173]:33321 "EHLO
	mail-yk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932363AbbJ0Mhj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2015 08:37:39 -0400
In-Reply-To: <20151027111303.GD4665@kw.sim.vm.gnt>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Andreas Bofjall <andreas@gazonk.org>, =?UTF-8?Q?Diego_Elio_Petten=c3=b2?= <flameeyes@flameeyes.eu>, Mika Westerberg <mika.westerberg@linux.intel.com>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Bruno Randolf <br1@einfach.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 10/27/2015 07:13 AM, Simon Guinot wrote:
> On Tue, Oct 27, 2015 at 11:06:58AM +0100, Linus Walleij wrote:
>> On Mon, Oct 19, 2015 at 6:59 PM, William Breathitt Gray
>> <vilhelm.gray@gmail.com> wrote:
>>
>>> The ACCES 104-IDIO-16 family of PC/104 utility boards feature 16
>>> optically isolated inputs and 16 optically isolated FET solid state
>>> outputs. This driver provides GPIO support for these 32 channels of
>>> digital I/O. Change-of-State detection interrupts are not supported.
>>>
>>> GPIO 0-15 correspond to digital outputs 0-15, while GPIO 16-31
>>> correspond to digital inputs 0-15. The base port address for the device
>>> may be set via the idio_16_base module parameter.
>>>
>>> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
>>> ---
>>> Changes in v10:
>>>   - Rename symbols to be more concise
>>>   - Allocate GPIO device private data structure in probe function
>>
>> Yes, exactly like this. :)
>>
>> Patcha applied for kernel v4.4.
>>
>>> +menu "ISA GPIO drivers"
>>> +
>>> +config GPIO_104_IDIO_16
>>> +       tristate "ACCES 104-IDIO-16 GPIO support"
>>> +       depends on X86
>>> +       help
>>> +         Enables GPIO support for the ACCES 104-IDIO-16 family.
>>> +
>>> +endmenu
>>
>> I have five other drivers using port-based I/O:
>>
>> gpio-f7188x.c
>> gpio-it87.c
>> gpio-sch.c
>> gpio-sch311x.c
>> gpio-ts5500.c
>>
>> Do you think it makes sense to move all of these in under
>> the "ISA GPIO drivers" menu as well? I guess they all require
>> ISA after all.
>>
>> (Added their maintainers to the To: line so I can get some input
>> on this.)
> 
> Hi Linus,
> 
> The Super-I/Os are connected to a LPC bridge. And since LPC is much like
> ISA for software, then I guess it makes sense to move the drivers
> gpio-f7188x and gpio-it87 under a "ISA GPIO drivers" menu.
> 
> Simon
> 

Part of my purpose in suggesting the "ISA GPIO drivers" menu is my
intention to submit a couple more PC/104 drivers for merging into the Linux
baseline. Perhaps it may make sense to create subdirectories within the
"ISA GPIO Driver" to further organize drivers between "Super-I/O,"
"PC/104," and other ISA-based buses.

- William Breathitt Gray
