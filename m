From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: berlin: guard sub-directory with
 CONFIG_PINCTRL_BERLIN
Date: Sat, 28 Nov 2015 12:22:21 +0100
Message-ID: <56598E6D.7000207@gmail.com>
References: <1448365524-12605-1-git-send-email-yamada.masahiro@socionext.com>
 <1448365524-12605-2-git-send-email-yamada.masahiro@socionext.com>
 <20151124200259.6c002d1f@xhacker>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:33356 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751274AbbK1LWZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Nov 2015 06:22:25 -0500
In-Reply-To: <20151124200259.6c002d1f@xhacker>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Antoine Tenart <antoine.tenart@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

On 24.11.2015 13:02, Jisheng Zhang wrote:
> On Tue, 24 Nov 2015 20:45:22 +0900
> Masahiro Yamada wrote:
> 
>> CONFIG_PINCTRL_BERLIN is more suitable than CONFIG_ARCH_BERLIN
>> to guard the drivers/pinctrl/berlin/ directory.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> 
> I'm not maintainers, but this patch looks good to me. So if you need, 
> 
> Acked-by: Jisheng Zhang <jszhang@marvell.com>

And here comes the maintainer's

Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Thanks!

>> ---
>>
>>  drivers/pinctrl/Makefile        | 2 +-
>>  drivers/pinctrl/berlin/Makefile | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
>> index 738cb49..17c0206 100644
>> --- a/drivers/pinctrl/Makefile
>> +++ b/drivers/pinctrl/Makefile
>> @@ -41,7 +41,7 @@ obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
>>  obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
>>  
>>  obj-$(CONFIG_ARCH_BCM)		+= bcm/
>> -obj-$(CONFIG_ARCH_BERLIN)	+= berlin/
>> +obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
>>  obj-y				+= freescale/
>>  obj-$(CONFIG_X86)		+= intel/
>>  obj-$(CONFIG_PLAT_ORION)        += mvebu/
>> diff --git a/drivers/pinctrl/berlin/Makefile b/drivers/pinctrl/berlin/Makefile
>> index 06f9402..6f641ce 100644
>> --- a/drivers/pinctrl/berlin/Makefile
>> +++ b/drivers/pinctrl/berlin/Makefile
>> @@ -1,4 +1,4 @@
>> -obj-$(CONFIG_PINCTRL_BERLIN)		+= berlin.o
>> +obj-y					+= berlin.o
>>  obj-$(CONFIG_PINCTRL_BERLIN_BG2)	+= berlin-bg2.o
>>  obj-$(CONFIG_PINCTRL_BERLIN_BG2CD)	+= berlin-bg2cd.o
>>  obj-$(CONFIG_PINCTRL_BERLIN_BG2Q)	+= berlin-bg2q.o
> 

