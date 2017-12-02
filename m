From: arvindY <arvind.yadav.cs@gmail.com>
Subject: Re: [PATCH] gpio: ftgpio010: Fix platform_get_irq's error checking
Date: Sat, 2 Dec 2017 22:19:25 +0530
Message-ID: <5A22D995.9010802@gmail.com>
References: <c6bf37f60d82aa3d425f66f08e10fedc51202b6f.1512051063.git.arvind.yadav.cs@gmail.com>
 <CACRpkdZCh-YrsEM+f2XbpYtPuTN_DtEFUFUb-DJjZ-0=EQ5FMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:43142 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751783AbdLBQt3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Dec 2017 11:49:29 -0500
In-Reply-To: <CACRpkdZCh-YrsEM+f2XbpYtPuTN_DtEFUFUb-DJjZ-0=EQ5FMA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

Hi Linus,

On Saturday 02 December 2017 09:00 PM, Linus Walleij wrote:
> Hi Arvind,
>
> thanks for the patch!
>
> On Thu, Nov 30, 2017 at 3:12 PM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:
>
>> The platform_get_irq() function returns negative if an error occurs.
>> zero or positive number on success. platform_get_irq() error checking
>> for zero is not correct.
>>
>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> (...)
>>          irq = platform_get_irq(pdev, 0);
>> -       if (!irq)
>> -               return -EINVAL;
>> +       if (irq < 0)
>> +               return irq;
> This is wrong.
> For an in-depth explanation why irq 0 in not valid, see:
> https://lwn.net/Articles/470820/
Thank you for sharing this Articles. It's really helpful.
>
> It should be:
>
> if (irq <= 0)
>    return irq ? irq : -EINVAL;
>
> Please update and resubmit. If you have more patches like this,
> correct them too.
I will resubmit patch.
> Yours,
> Linus Walleij
Thanks,
arvind
