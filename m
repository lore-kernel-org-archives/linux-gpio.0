From: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Subject: Re: [RFD] does abi of sysfs of gpio change?
Date: Fri, 26 Feb 2016 15:14:06 +0800
Message-ID: <CAFy1USQWO+CP4m2HYOpYBX1QCWAdTAYPNVRy9LSYtWcnn6b0yw@mail.gmail.com>
References: <CAFy1UST8fzsM6tq4_yAZ1XbPyaMg4a0kBm5-_8r0E8NpgwGYag@mail.gmail.com>
	<CACRpkdYeDBkpfQrQDiLV_NLGaHYPzfO6DrBJLAp__sQHQGcFBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:32793 "EHLO
	mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185AbcBZHOH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2016 02:14:07 -0500
Received: by mail-io0-f181.google.com with SMTP id z135so114616828iof.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 23:14:07 -0800 (PST)
In-Reply-To: <CACRpkdYeDBkpfQrQDiLV_NLGaHYPzfO6DrBJLAp__sQHQGcFBw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Markus Pargmann <mpa@pengutronix.de>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Alexandre Courbot <acourbot@nvidia.com>

Hi, Linus

On 25 February 2016 at 23:12, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Feb 24, 2016 at 3:35 PM, Bamvor Zhang Jian
> <bamvor.zhangjian@linaro.org> wrote:
>
>> I am working on writing a gpio mockup driver(for test the gpio framework).
>> I found that in the lastest for-next branch of linux-gpio, the path of gpiochip
>> in device directory is changed from
>> `/sys/devices/platform/gpio-mockup/gpio/gpiochip*`
>> to
>> `/sys/devices/platform/gpio-mockup/gpiochip*/gpio`.
> (...)
>> IIUC, this change may break the script which depend on it.
>> Is it intended to do it?
>
> No, I screwed up :(
>
>> From be7699ddea0fd0e2b0712cc8f50318595cad553c Mon Sep 17 00:00:00 2001
>> From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
>> Date: Wed, 24 Feb 2016 22:17:19 +0800
>> Subject: [PATCH] fix abi changes of sysfs
>
> It was impossible to extract this patch because of some
> HTML formatting, but I rewrote the patch, adding some extra
> comments and commit message, and applied. Check the result
> in my devel branch.
I test this patch in your devel branch. It works for me.
And I found that I could not boot qemu-system-aarch64 on your
devel branch. It works if I rebase those(105) patches to 4.5-rc4.
It is ok before 4.5 either.
Maybe there is some bug for support qemu in 4.5-rc1. But It is
not relative the patches of gpio in devel branch.
>
> I also have a bad conscience for not looking at you patches,
> I've been swamped, sorry :(
Glad to know I could help. I find other issue when I try to test
my gpio mockup driver base on the latest code.
I will start a new thread to discuss it.

Regards

Bamvor
>
> Yours,
> Linus Walleij
