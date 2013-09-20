From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH] gpio: pca953x: Don't flip bits on PCA957x GPIO expanders
 when probing them.
Date: Fri, 20 Sep 2013 22:37:47 +0200
Message-ID: <523CB21B.207@free-electrons.com>
References: <1379108508-19933-1-git-send-email-gsmecher@threespeedlogic.com> <CACRpkdbwo5J9tx4KcPf5sVngCyqEkauqn0GFzJ844GuuixBFsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:49214 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752055Ab3ITUh5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2013 16:37:57 -0400
In-Reply-To: <CACRpkdbwo5J9tx4KcPf5sVngCyqEkauqn0GFzJ844GuuixBFsQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

On 20/09/2013 22:24, Linus Walleij wrote:
> On Fri, Sep 13, 2013 at 11:41 PM, Graeme Smecher
> <gsmecher@threespeedlogic.com> wrote:
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
>> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
>> Acked-by: Haojian Zhuang <haojian.zhuang@gmail.com>
> 
> Looks like you're deleting code from Gregory CLEMENT,
> Gregory what do you say about this?

Thanks to point me this patch, I didn't have noticed it.
The code being removed is mine because I change it to take care of the
multiple bankd. I didn't change the functionality. The original code
was from Haojian Zhuang so as he gave his acked-by it should be fine.

However could you wait for until the end of this week end, to let me test
it on a real hardware?

Thanks,

Gregory

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
