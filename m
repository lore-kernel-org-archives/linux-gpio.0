From: Scott Branden <scott.branden@broadcom.com>
Subject: Re: [PATCH 3/3] pinctrl: bcm: clean up modular vs. non-modular
 distinctions
Date: Mon, 29 May 2017 09:35:27 -0700
Message-ID: <4eb8be51-8cf9-31b9-c6e6-52fdb9cd202d@broadcom.com>
References: <20170522205648.23545-1-paul.gortmaker@windriver.com>
 <20170522205648.23545-4-paul.gortmaker@windriver.com>
 <CACRpkdbQTDkqy+ChBq=pg1BnHH5ARL0+J-zL_gipEEotujOxbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:37080 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750880AbdE2Qfd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 12:35:33 -0400
Received: by mail-wm0-f52.google.com with SMTP id d127so66075073wmf.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 09:35:32 -0700 (PDT)
In-Reply-To: <CACRpkdbQTDkqy+ChBq=pg1BnHH5ARL0+J-zL_gipEEotujOxbA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, Sherman Yin <syin@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>

Hi Linus,


On 17-05-29 01:31 AM, Linus Walleij wrote:
> On Mon, May 22, 2017 at 10:56 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>
>> Fixups here tend to be more of a conglomerate of some of the other
>> repeated/systematic ones we've seen in the earlier pinctrl cleanups.
>>
>> We remove module.h from code that isn't doing anything modular at
>> all;  if they have __init sections, then replace it with init.h
>>
>> One driver has a .remove that would be dispatched on module_exit,
>> and as that code is essentially orphaned, so we remove it.  In case
>> anyone was previously doing the (pointless) unbind to get to that
>> function, we disable unbind for this one driver as well.
>>
>> A couple bool drivers (hence non-modular) are converted over to
>> to builtin_platform_driver().
>>
>> Since module_platform_driver() uses the same init level priority as
>> builtin_platform_driver() the init ordering remains unchanged with
>> this commit.
>>
>> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>>
>> We also delete the MODULE_LICENSE tag etc. since all that information
>> was (or is now) contained at the top of the file in the comments.
>>
>> Cc: Eric Anholt <eric@anholt.net>
>> Cc: Florian Fainelli <f.fainelli@gmail.com>
>> Cc: Jon Mason <jonmason@broadcom.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Ray Jui <rjui@broadcom.com>
>> Cc: Scott Branden <sbranden@broadcom.com>
>> Cc: Stefan Wahren <stefan.wahren@i2se.com>
>> Cc: Sherman Yin <syin@broadcom.com>
>> Cc: bcm-kernel-feedback-list@broadcom.com
>> Cc: linux-gpio@vger.kernel.org
>> Cc: linux-rpi-kernel@lists.infradead.org
>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Patch applied with Stefan Wahren's Tested-by tag.
>
> I can't take header standardization into account, header files are not
> ABI, further see
> Documentation/process/stable-api-nonsense.rst
It is a simple ask to place the new information in a new comment after 
the legal header.

An aim at consistency helps reduce confusion (internal and external)
of what license header template to apply to files.  Modifying these 
headers and placing
information in the middle of them does not help in this effort.

> Yours,
> Linus Walleij
Regards,
Scott
