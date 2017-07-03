From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: Getting gpios from user space based on gpio-line-names
Date: Mon, 3 Jul 2017 15:06:06 +0200
Message-ID: <CAMRc=MdPNMQu27RWGW6D+um4yD+BBnut3Bfy0hC0CUprm99q=Q@mail.gmail.com>
References: <6fc9ba3b-982c-d17d-3d5f-16b486f3ca5a@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:36202 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753978AbdGCNGH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2017 09:06:07 -0400
Received: by mail-qt0-f176.google.com with SMTP id i2so142602174qta.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jul 2017 06:06:07 -0700 (PDT)
In-Reply-To: <6fc9ba3b-982c-d17d-3d5f-16b486f3ca5a@monstr.eu>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: monstr@monstr.eu
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

2017-07-03 15:01 GMT+02:00 Michal Simek <monstr@monstr.eu>:
> Hi,
>
> I am trying to find some docs about how to ask for gpio line
> based on gpio-line-names in DT. I see line names available via debugfs
> which is not suitable for production.
> And also I didn't find a way how to ask for gpio Linux number from user
> space to start to work with them.
> This is for gpio mraa integration which depends on Linux gpio line numbers.
>
> Thanks,
> Michal
>
> --
> Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel - Xilinx Microblaze
> Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
> U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs
>
>

Hi Michal,

you can try libgpiod[1] and specifically the gpiofind tool included in
the repository. Buildroot has this package should you need to build a
rootfs for some specific target.

Best regards,
Bartosz Golaszewski

[1] https://github.com/brgl/libgpiod
