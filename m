From: Fabio Estevam <fabio.estevam@freescale.com>
Subject: Re: mxs gpios as wakeup interrupts and irq_set_wake() hook
Date: Thu, 21 Nov 2013 14:35:23 -0200
Message-ID: <528E364B.2070309@freescale.com>
References: <528DDE30.4090509@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]:58086 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750827Ab3KUQg2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 21 Nov 2013 11:36:28 -0500
In-Reply-To: <528DDE30.4090509@digi.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hector Palacios <hector.palacios@digi.com>, linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, festevam@gmail.com, zonque@gmail.com, "shawn.guo@linaro.org" <shawn.guo@linaro.org>

Hi Hector,

On 11/21/2013 08:19 AM, Hector Palacios wrote:
> Hello,
>
> I was trying to have GPIOs be able to wake up my ARM i.MX28 system from
> suspend but noticed that the existing hook irq_set_wake() in the driver
>
>      ct->chip.irq_set_wake = mxs_gpio_set_wake_irq;
>
> was never called when I enabled a gpio as wakeup via the sysfs:
>
>      echo enabled > /sys/class/gpio/gpio107/device/power/wakeup

Does the existing code work if you pass 'gpio-key,wakeup' in the .dts file?

Regards,

Fabio Estevam

