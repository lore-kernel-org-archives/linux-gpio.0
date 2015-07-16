From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio:Fix build warning about void to integer cast in the
 function mmio_74xx_gpio_probe
Date: Thu, 16 Jul 2015 22:31:21 +0900
Message-ID: <CAAVeFuJRQVHNw8ZNb2+MqYJQ=Pr=GGS888sYNzssG8wRah7q+g@mail.gmail.com>
References: <1436042072-7496-1-git-send-email-xerofoify@gmail.com>
 <CACRpkdbj61+XoTCambLEGG=PNdkunvqnmRpV1VKi5pX1ouPzGw@mail.gmail.com> <55A79EFD.3050100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:33349 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751677AbbGPNbk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 09:31:40 -0400
In-Reply-To: <55A79EFD.3050100@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: nick <xerofoify@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jul 16, 2015 at 9:09 PM, nick <xerofoify@gmail.com> wrote:
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
> Sorry about that I kinda suck at commit messages if you would like to some me the edit
> so I can get better at it, that would be helpful.

As explained in Documentation/SubmittingPatches: (probably a good idea
to re-read that document)

"For these reasons, the "summary" must be no more than 70-75
characters, and it must describe both what the patch changes, as well
as why the patch might be necessary.  It is challenging to be both
succinct and descriptive, but that is what a well-written summary
should do."

Your patch subject line should not be longer than 70-75 characters. If
you need to be more extensive, do so in the first paragraph of your
commit log.
