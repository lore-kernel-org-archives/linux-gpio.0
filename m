From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v1] gpio: keystone: add dsp gpio controller driver
Date: Mon, 11 Aug 2014 19:06:54 +0300
Message-ID: <53E8EA1E.8080804@ti.com>
References: <1405507426-18992-1-git-send-email-grygorii.strashko@ti.com> <CACRpkdYY_a_9G-VLBbv2a22Cg4j0t3Wv4W1h0n6-ccCXgVJXsA@mail.gmail.com> <1406128780.455243415@f419.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:33342 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753914AbaHKPW1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 11 Aug 2014 11:22:27 -0400
In-Reply-To: <1406128780.455243415@f419.i.mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Muralidharan Karicheri <m-karicheri2@ti.com>

Hi Alexander, Linus,

On 07/23/2014 06:19 PM, Alexander Shiyan wrote:
> Wed, 23 Jul 2014 17:10:26 +0200 =D0=BE=D1=82 Linus Walleij <linus.wal=
leij@linaro.org>:
>> On Wed, Jul 16, 2014 at 12:43 PM, Grygorii Strashko
>> <grygorii.strashko@ti.com> wrote:
>>
>>> From: Murali Karicheri <m-karicheri2@ti.com>
>>>
>>> On Keystone SOCs, ARM host can send interrupts to DSP cores using t=
he
>>> DSP GPIO controller IP. Each DSP GPIO controller provides 28 IRQ si=
gnals for
>>> each DSP core. This is one of the component used by the IPC mechani=
sm used
>>> on Keystone SOCs.
>>>
>>> Keystone 2 DSP GPIO controller has specific features:
>>> - each GPIO can be configured only as output pin;
>>> - setting GPIO value to 1 causes IRQ generation on target DSP core;
>>> - reading pin value returns 0 - if IRQ was handled or 1 - IRQ is st=
ill
>>>    pending.
>>>
>>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ...
>> And if you proceed with this, please integrate it with
>> drivers/gpio/gpio-syscon.c, I don't need more special
>> syscons GPIO handlers.

Thanks for your comments.

I'm going to update it for using "gpio-syscon".
But "gpio-syscon" driver itself will need to be modified to support our
device specific callbacks:
- gpiochip.set(): it should set bit 0 to 1 always to physically apply G=
PIO values
- gpiochip.direction_output(): it should do nothing in our case, just r=
eturn 0

So, I'll extend struct syscon_gpio_data to support custom implementatio=
n of
set/direction_output callbacks. Will it be ok for you?

Best regards,
- grygorii
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
