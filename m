From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/3] gpio: max77620: Implement gpio_get_direction callback
Date: Tue, 31 May 2016 11:23:06 +0530
Message-ID: <574D26C2.1090502@nvidia.com>
References: <1464095626-28424-1-git-send-email-ldewangan@nvidia.com>	<1464095626-28424-2-git-send-email-ldewangan@nvidia.com> <CACRpkdbM=Ew6sPzGYFSst8p8AtaLAeDTxOaXUMBS8Qj2=HcuRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9685 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751288AbcEaGFe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 02:05:34 -0400
In-Reply-To: <CACRpkdbM=Ew6sPzGYFSst8p8AtaLAeDTxOaXUMBS8Qj2=HcuRA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


On Monday 30 May 2016 08:33 PM, Linus Walleij wrote:
> On Tue, May 24, 2016 at 3:13 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> Implement gpio_get_direction() callback for MAX77620 GPIO.
>> This is useful for debugfs and the userspace ABI.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>>   #include <linux/gpio/driver.h>
>> +#include <linux/gpio.h>
> No. This is a sign that something is wrong, no driver should include
> this unless it is using GPIOs as a resource itself.
This is just to use the flag GPIOF_*

As you said below, we can use the 0 and 1, there is no need to include 
header.
Will post the v2 patch for this.


>> +       return (val & MAX77620_CNFG_GPIO_DIR_MASK) ?
>> +               GPIOF_DIR_IN : GPIOF_DIR_OUT;
> Just return 0 or 1. The driver-internal API isn't smarter than that.
>



Thanks,
Laxman
