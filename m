From: Hector Palacios <hector.palacios@digi.com>
Subject: Re: mxs gpios as wakeup interrupts and irq_set_wake() hook
Date: Thu, 21 Nov 2013 18:32:04 +0100
Message-ID: <528E4394.9050807@digi.com>
References: <528DDE30.4090509@digi.com> <528E364B.2070309@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.bemta12.messagelabs.com ([216.82.251.17]:28005 "EHLO
	mail1.bemta12.messagelabs.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755140Ab3KURi3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 21 Nov 2013 12:38:29 -0500
In-Reply-To: <528E364B.2070309@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <fabio.estevam@freescale.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "zonque@gmail.com" <zonque@gmail.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>

Hi Fabio,

On 11/21/2013 05:35 PM, Fabio Estevam wrote:
> Hi Hector,
>
> On 11/21/2013 08:19 AM, Hector Palacios wrote:
>> Hello,
>>
>> I was trying to have GPIOs be able to wake up my ARM i.MX28 system from
>> suspend but noticed that the existing hook irq_set_wake() in the driver
>>
>>       ct->chip.irq_set_wake = mxs_gpio_set_wake_irq;
>>
>> was never called when I enabled a gpio as wakeup via the sysfs:
>>
>>       echo enabled > /sys/class/gpio/gpio107/device/power/wakeup
>
> Does the existing code work if you pass 'gpio-key,wakeup' in the .dts file?

Do you mean to have an entry like this?

         gpio_keys {
		compatible = "gpio-keys";
		#address-cells = <1>;
		#size-cells = <0>;
		autorepeat;
		gpio-key,wakeup;
		button@21 {
			label = "GPIO Key UP";
			linux,code = <103>;
			gpios = <&gpio3 11 1>;	/* gpio107 */
		};
         };

No it doesn't.

In any case what I wanted (maybe it's not standard) was to be able to export a GPIO, 
configure it as interrupt, and enable it as wakeup, entirely from sysfs, without 
needing to use a driver or defining an entry for a specific GPIO in the DT.
I achieved it with the code I sent but I guess the framework was not devised to use 
gpios that way.

Have you tested if that irq_set_wake hook in the gpio-mxs.c driver is ever called?

Best regards,
--
Hector Palacios
