From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFD] gpiolib: gpiochip is always dangling after remove
Date: Tue, 8 Mar 2016 15:53:23 +0700
Message-ID: <CACRpkdZtVref_ATxY1-ktGmS=ZUAyMxSfrED8sVjRd6KQCRbnQ@mail.gmail.com>
References: <1456491974-26997-1-git-send-email-bamv2005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:36626 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932256AbcCHIxY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 03:53:24 -0500
Received: by mail-ob0-f171.google.com with SMTP id m7so7830113obh.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 00:53:24 -0800 (PST)
In-Reply-To: <1456491974-26997-1-git-send-email-bamv2005@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamv2005@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

On Fri, Feb 26, 2016 at 8:06 PM, Bamvor Jian Zhang <bamv2005@gmail.com> wrote:

> From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
>
> In my gpiochip mockup driver, after call gpiochip_remove, the
> gpipchip is not actually removed even if there is no clients in
> userspace. It could be removed if remove the corresonding reference
> count in this patch.
>
> But such gpiochip will be removed even if user space open the
> corresponding chardev. I am not sure If I do not right thing.
> Please correct me if I am wrong.
>
> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

I think you're onto the right thing, thank you for looking into this.

My idea was that the gdev->dev and gdev->cdev should stay around
until the last userspace user is gone, even if the gpiochip_remove()
was called.

Maybe I just got the refcounts wrong :(

It'd be great if you can come up with a patch that has the following
properties:

gpiochip_add_data(), no userspace users, gpiochip_remove()
-> refcount goes to zero and gpiodevice_release() gets called

gpiochip_add_data(), add some userspace users, gpiochip_remove()
-> refcount does not go to zero and gpiodevice_release() is not called
Then remove the userspace users:
-> refcount goes to zero and gpiodevice_release() gets called

It might be that using device_add(), device_del() directly like I'm
doing cannot really solve this :( then we need to rethink the mechanism
in terms of device_register()/device_unregister(), but I couldn't
get that to work with the way chardevs are added.

Yours,
Linus Walleij
