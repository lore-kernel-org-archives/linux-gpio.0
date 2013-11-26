From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] gpio: pl061: print resource_size_t as %pa
Date: Tue, 26 Nov 2013 11:17:38 -0800
Message-ID: <CAOesGMgSnW9e4M63RVWyAtqTbhj4_+Kmw_Rm71aCUUhiav25Vw@mail.gmail.com>
References: <1385492161-27624-1-git-send-email-olof@lixom.net>
	<1385493242.20100.71.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qe0-f49.google.com ([209.85.128.49]:61840 "EHLO
	mail-qe0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752654Ab3KZTRj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 14:17:39 -0500
Received: by mail-qe0-f49.google.com with SMTP id w7so6121535qeb.22
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 11:17:38 -0800 (PST)
In-Reply-To: <1385493242.20100.71.camel@joe-AO722>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: LinusW <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Nov 26, 2013 at 11:14 AM, Joe Perches <joe@perches.com> wrote:
> On Tue, 2013-11-26 at 10:56 -0800, Olof Johansson wrote:
>> commit 73675c8aa07 ('gpio: pl061: proper error messages') added a printout
>> of a resource_size_t using %x, which produces an error for builds with
>> 64-bit resources:
>
> What tree is this?

linux-next

>> drivers/gpio/gpio-pl061.c:345:3: warning: format '%x' expects argument of
>>     type 'unsigned int', but argument 3 has type 'resource_size_t'
>>
>> Switch to %pa (and pass in a pointer to the resource instead).
>>
>> Fixes: 73675c8aa07 ('gpio: pl061: proper error messages')
> []
>> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> []
>> @@ -341,8 +341,8 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
>>       }
>>
>>       amba_set_drvdata(adev, chip);
>> -     dev_err(&adev->dev, "PL061 GPIO chip @%08x registered\n",
>> -             adev->res.start);
>> +     dev_err(&adev->dev, "PL061 GPIO chip @%pa registered\n",
>> +             &adev->res.start);
>
> This looks as if this should not use dev_err, but maybe dev_info
> and maybe it should use %pR, &adev->res

Yep, I have as a somewhat long-standing todo to scrub for needlessly
elevated printk levels (err and warn) on various drivers during boot,
thanks for shortcutting that. :)

I'll let Linus decide on pR vs pa.

-Olof
