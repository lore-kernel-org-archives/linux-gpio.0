From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] gpio: userspace ABI for reading/writing GPIO lines
Date: Mon, 4 Jul 2016 11:55:42 +0200
Message-ID: <CACRpkdboXqc9TixgnMPNG4gg5_Wz3opxHvrTmzKeE+5L5U83TA@mail.gmail.com>
References: <1464868289-1766-1-git-send-email-linus.walleij@linaro.org>
 <2026706.RhdqQzbNxG@ws-stein> <CACRpkdbRG3w+=GvnJUN9b+Nbej7gfDR5duTwjmdxTLc-p03O7w@mail.gmail.com>
 <31233738.EiQ4DLngM8@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:36707 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932842AbcGDJzo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2016 05:55:44 -0400
Received: by mail-oi0-f49.google.com with SMTP id f189so188522372oig.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jul 2016 02:55:43 -0700 (PDT)
In-Reply-To: <31233738.EiQ4DLngM8@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>

On Wed, Jun 29, 2016 at 11:43 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> There is no valid .fd if copy_to_user() fails and immediately returning
> -EFAULT. Thus the previously kzalloc'ed lh (well anything linehandle_release
> frees) is unaccessible. Userspace has no .fd for neither any ioctl nor for
> calling close(). This allocated memory will remain unavailable until the
> process exits. I think something like this should be added:
>
>> @@ -486,8 +486,10 @@ static int linehandle_create(struct gpio_device *gdev,
>> void __user *ip)>
>>       }
>>
>>       handlereq.fd = fd;
>>
>> -     if (copy_to_user(ip, &handlereq, sizeof(handlereq)))
>> -             return -EFAULT;
>> +     if (copy_to_user(ip, &handlereq, sizeof(handlereq))) {
>> +             ret = -EFAULT;
>> +             goto out_free_descs;
>> +     }

I see. I'm fixing a patch, also checking if I have that bug in more
places.

Yours,
Linus Walleij
