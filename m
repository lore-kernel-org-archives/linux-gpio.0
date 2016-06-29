From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] gpio: userspace ABI for reading/writing GPIO lines
Date: Wed, 29 Jun 2016 11:05:49 +0200
Message-ID: <CACRpkdbRG3w+=GvnJUN9b+Nbej7gfDR5duTwjmdxTLc-p03O7w@mail.gmail.com>
References: <1464868289-1766-1-git-send-email-linus.walleij@linaro.org> <2026706.RhdqQzbNxG@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:35671 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751334AbcF2JFv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2016 05:05:51 -0400
Received: by mail-ob0-f181.google.com with SMTP id o10so3914075obp.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2016 02:05:50 -0700 (PDT)
In-Reply-To: <2026706.RhdqQzbNxG@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>

On Wed, Jun 29, 2016 at 10:53 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:
> On Thursday 02 June 2016 13:51:26, Linus Walleij wrote:

>> +     fd = anon_inode_getfd("gpio-linehandle",
>> +                           &linehandle_fileops,
>> +                           lh,
>> +                           O_RDONLY | O_CLOEXEC);
>
> When will linehandle_release actually be called? When we explicitely call
> close(req.fd) or when application exits and all FDs will be closed anyway?

As far as I understand: both.

And I don't think anything else makes sense? If an application is terminated,
the operating environment will close all open file handles as far as I know,
at least that is how I always thought it works.

But hey, it's userspace so what do I know...

Anyways if it doesn't work like so, there are a bunch of subsystems in
the kernel using it so they would all have severe problems.

>> +     if (fd < 0) {
>> +             ret = fd;
>> +             goto out_free_descs;
>> +     }
>> +
>> +     handlereq.fd = fd;
>> +     if (copy_to_user(ip, &handlereq, sizeof(handlereq)))
>> +             return -EFAULT;
>
> If I'm right above doesn't that then leak lh until application eventually
> exits? Userspace won't receive the newly created fd. The same would apply to
> patch 3/4.

I don't understand....

The userspace application reads the .fd fields of the handle request after
issuing the ioctl() and it then contains the new file handle.

Yours,
Linus Walleij
