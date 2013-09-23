From: Graeme Smecher <gsmecher@threespeedlogic.com>
Subject: Re: [PATCH] gpio: pca953x: Don't flip bits on PCA957x GPIO expanders
 when probing them.
Date: Mon, 23 Sep 2013 09:36:39 -0400
Message-ID: <524043E7.2050803@threespeedlogic.com>
References: <1379108508-19933-1-git-send-email-gsmecher@threespeedlogic.com> <CACRpkdYWCFCtmF2_ORA5RRJudeNm9u+6ngMfcW8xrc+K2-Y3TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from threespeedlogic.com ([75.98.167.93]:59517 "EHLO
	threespeedlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753603Ab3IWNji (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2013 09:39:38 -0400
In-Reply-To: <CACRpkdYWCFCtmF2_ORA5RRJudeNm9u+6ngMfcW8xrc+K2-Y3TQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, gregory.clement@free-electrons.com

Hi,

On 23/09/13 06:57 AM, Linus Walleij wrote:
> On Fri, Sep 13, 2013 at 11:41 PM, Graeme Smecher
> <gsmecher@threespeedlogic.com>  wrote:
>
>> The pca957x driver supports a handful of I2C GPIO expanders from NXP, Maxim,
>> and TI. For the PCA9574 and PCA9575 devices only, the driver resets the GPIO
>> level and direction in the pca957x_probe function. This seems like the wrong
>> thing to do, since it can cause hardware bit twiddles during warm reboots when
>> the chip state and reset values don't match.
>>
>> This kind of initialization is best left upstream (in a bootloader) or
>> downstream (in userspace). It's also an inconsistency across devices supported
>> by this driver.
>>
>> This patch is NOT boot-tested: the SoC I'm  using is stuck on 2.6.37, and the
>> patch doesn't apply trivially.
>>
>> Signed-off-by: Graeme Smecher<gsmecher@threespeedlogic.com>
>> Acked-by: Haojian Zhuang<haojian.zhuang@gmail.com>
> Patch applied with Gregory's Tested-by tag!

Thanks all!

cheers,
Graeme
