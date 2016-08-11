From: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: mmio: add brcm,bcm6345 support
Date: Thu, 11 Aug 2016 15:48:14 +0200
Message-ID: <a876b24d-f83d-5cbe-8933-9eb838b22818@gmail.com>
References: <1470225957-5692-2-git-send-email-noltari@gmail.com>
 <CACRpkdYTriHeSQz0St6kVDEtMcbMDK+LUr=n9TYzGQ6RnSaG6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34918 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751148AbcHKNsZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Aug 2016 09:48:25 -0400
In-Reply-To: <CACRpkdYTriHeSQz0St6kVDEtMcbMDK+LUr=n9TYzGQ6RnSaG6w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Christian Lamparter <chunkeey@googlemail.com>

Hi Linus,

First of all sorry about not explaining things correctly.

El 11/08/2016 a las 13:50, Linus Walleij escribió:
> On Wed, Aug 3, 2016 at 2:05 PM, Álvaro Fernández Rojas
> <noltari@gmail.com> wrote:
> 
>> From: Christian Lamparter <chunkeey@googlemail.com>
>>
>> This patch adds support for the GPIO found in Broadcom's bcm63xx-gpio
>> chips.
>> This GPIO controller is used in the following Broadcom SoCs: BCM6338, BCM6345.
>> It can be used in newer SoCs, without the capability of pin multiplexing.
>>
>> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>> ---
>>  v2: fix build
> 
> Aha now I understand why the binding looks like it does.
> 
> Sorry for being too stupid to understand it was using the
> generic GPIO MMIO bindings :(
> 
> I see that it is tempting to use MMIO for this. But surely,
> with all the registers you left out, this controller can do a bunch of
> other stuff with the registers you're not using right now.
Not really, there aren't any other GPIO registers for these two (old) SoCs.
However, newer SoCs have pinmux and several other registers,
thus the warning about not using them for newer SoCs.

> 
> I think the right solution is to use GPIO_GENERIC but create
> a unque GPIO driver for this hardware. It's just not that simple,
> if you look at the register map, can this hardware also do open
> drain? Interrupts? Biasing? etc. Then it needs its own driver,
> it can use the generic GPIO library but still needs its own driver.
Please, have a look at:
https://gitlab.labs.nic.cz/turris/openwrt/blob/8bfda76892a39c033b5abf2c17035a444fffad08/target/linux/brcm63xx-2.6/files/include/asm-mips/mach-bcm963xx/6345_map_part.h#L141
https://gitlab.labs.nic.cz/turris/openwrt/blob/8bfda76892a39c033b5abf2c17035a444fffad08/target/linux/brcm63xx-2.6/files/include/asm-mips/mach-bcm963xx/6338_map_part.h#L202
As you can see these two SoCs are pretty simple and only direction and data can be configured.
As an example, BCM6348 does have pin multiplexing (GPIOMode) and needs a more complex gpio/pinctrl driver:
https://gitlab.labs.nic.cz/turris/openwrt/blob/8bfda76892a39c033b5abf2c17035a444fffad08/target/linux/brcm63xx-2.6/files/include/asm-mips/mach-bcm963xx/6348_map_part.h#L255

> 
> Yours,
> Linus Walleij
> 

Regards,
Álvaro.
