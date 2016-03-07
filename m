From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] tools: gpio: add kernel headers in CFLAGS
Date: Mon, 7 Mar 2016 12:01:01 +0700
Message-ID: <CACRpkdYvGYbzENVSfJO-tW8qGs=RzpFCA9BROtU+_92-jjeeTw@mail.gmail.com>
References: <1456495590-7610-1-git-send-email-bamv2005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:36778 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127AbcCGFBD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2016 00:01:03 -0500
Received: by mail-ob0-f178.google.com with SMTP id rt7so95775775obb.3
        for <linux-gpio@vger.kernel.org>; Sun, 06 Mar 2016 21:01:02 -0800 (PST)
In-Reply-To: <1456495590-7610-1-git-send-email-bamv2005@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamv2005@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

On Fri, Feb 26, 2016 at 9:06 PM, Bamvor Jian Zhang <bamv2005@gmail.com> wrote:

> From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
>
> Gpio tools require linux/gpio.h which may be only exist in kernel
> source code in a cross compile environment.
>
> Add such header to CFLAGS to avoid compiling failure.
>
> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

I already got a patch like this and NACKed it: the procedure to compile
userspace tools is:

make -C ${LINUX_TREE} headers_install ARCH=<arch> INSTALL_HDR_PATH=<bar>
cd tools/gpio
make CFLAGS="${CFLAGS} -I<bar>"

So you push the new locations of your fresh kernel headers to the front of the
include path. But make headers_install is mandatory before trying to compile
userspace, as uapi may differ between architectures.

Yours,
Linus Walleij
