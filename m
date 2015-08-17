From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio:Fix build warning about void to integer cast in the
 function mmio_74xx_gpio_probe
Date: Mon, 17 Aug 2015 12:42:49 +0900
Message-ID: <CAAVeFuLK-+u0awxjZ18+HCcZtuH+8U-_xaXn6Ec22UsqP=TUXg@mail.gmail.com>
References: <1436042072-7496-1-git-send-email-xerofoify@gmail.com>
 <CACRpkdbj61+XoTCambLEGG=PNdkunvqnmRpV1VKi5pX1ouPzGw@mail.gmail.com> <55CCD7CA.7040803@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33532 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751650AbbHQDnJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Aug 2015 23:43:09 -0400
In-Reply-To: <55CCD7CA.7040803@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: nick <xerofoify@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Aug 14, 2015 at 2:45 AM, nick <xerofoify@gmail.com> wrote:
>
>
> On 2015-07-16 08:00 AM, Linus Walleij wrote:
>> On Sat, Jul 4, 2015 at 10:34 PM, Nicholas Krause <xerofoify@gmail.com> wrote:
>>
>>> This fixes the build warning , warning: cast from pointer to integer
>>> of different size when building this file on a x86 allmodconfig
>>> configuration. In order for me to fix this build warning I changed
>>> the cast in the function mmio_74xx_gpio_probe from casting the
>>> variable data of the stucture pointer of_id to uintptr_t rather
>>> then unsigned when assigning to the variable flag of the structure
>>> pointer priv of the structure type mmio_74xx_gpio_priv.
>>>
>>>
>>> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
>>
>> Patch applied with some tweaks to the long subject line.
>>
>> Yours,
>> Linus Walleij
>>
>
> Linus,
> After searching through your git tree for gpio subsystem I haven't found this patch merged
> yet. Is there any reason for that or should I just resend.

I can see this patch in both Linus' for-next branch
(git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
for-next), and linux-next. Always check linux-next first.
