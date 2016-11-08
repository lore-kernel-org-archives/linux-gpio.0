From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 1/1] gpio: pca953x: Move memcpy into mutex lock for set
 multiple function.
Date: Tue, 8 Nov 2016 17:03:37 +0800
Message-ID: <3e07dfe0-6ff1-9eb6-0693-7195b657712c@electromag.com.au>
References: <1478582291-57976-1-git-send-email-preid@electromag.com.au>
 <CACRpkdYTYrMGjqvbJZhsWfpNWW5e82+FhZnseKLfQSM20ZT7Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy2.45ru.net.au ([203.30.46.146]:51258 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753160AbcKHJDn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 04:03:43 -0500
In-Reply-To: <CACRpkdYTYrMGjqvbJZhsWfpNWW5e82+FhZnseKLfQSM20ZT7Nw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Yong Li <yong.b.li@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 8/11/2016 16:32, Linus Walleij wrote:
> On Tue, Nov 8, 2016 at 6:18 AM, Phil Reid <preid@electromag.com.au> wrote:
>
>> Need to ensure that reg_output is not updated while setting multiple
>> bits. This makes the mutex locking behaviour for the set_multiple call
>> consistent with that of the set_value call.
>>
>> Signed-off-by: Phil Reid <preid@electromag.com.au>
>
> Patch applied for fixes.
>
> Stable? Fixes:?
>
> Yours,
> Linus Walleij
>
>
It looks like it was broken in my original implementation of the set_multiple call.
fixes commit: b4818afeacbd81821f89a89951471cffcb6a65e0

This one is pretty nasty, it should go into stable.


-- 
Regards
Phil Reid
