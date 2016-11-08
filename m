From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 1/1] gpio: pca953x: Fix corruption of other gpios in
 set_multiple.
Date: Tue, 8 Nov 2016 16:53:43 +0800
Message-ID: <b094c8cf-07ed-ff12-0f1f-22a95f7f0a57@electromag.com.au>
References: <1478584845-75666-1-git-send-email-preid@electromag.com.au>
 <CACRpkdb=wWnH2z0pSHRY2JKArKKk1-7jgGorVbDnvt3cT+acYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy2.45ru.net.au ([203.30.46.146]:48504 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932443AbcKHJAb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 04:00:31 -0500
In-Reply-To: <CACRpkdb=wWnH2z0pSHRY2JKArKKk1-7jgGorVbDnvt3cT+acYQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Yong Li <yong.b.li@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 8/11/2016 16:30, Linus Walleij wrote:
> On Tue, Nov 8, 2016 at 7:00 AM, Phil Reid <preid@electromag.com.au> wrote:
>
>> gpiod_set_array_value_complex does not clear the bits field.
>> Therefore when the drivers set_multiple funciton is called bits outside
>> the mask are undefined and can be either set or not. So bank_val needs
>> to be masked with bank_mask before or with the reg_val cache.
>>
>> Signed-off-by: Phil Reid <preid@electromag.com.au>
>
> Patch applied for fixes. Should it also be tagged for stable?
> Is there a commit this fixes that we can set as Fixes:?
>
It looks like it was broken in my original implementation of the set_multiple call.
fixes commit: b4818afeacbd81821f89a89951471cffcb6a65e0

I guess it should probably go into stable.

-- 
Regards
Phil Reid

