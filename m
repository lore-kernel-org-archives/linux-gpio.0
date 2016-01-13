From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: mm-lantiq: Do not use gpiochip_get_data() in ltq_mm_save_regs()
Date: Wed, 13 Jan 2016 10:21:54 +0100
Message-ID: <CACRpkdYtcbpoW7ouO748szDKzZHtFaJ8A3=AKdDH8XenAS5jvA@mail.gmail.com>
References: <1452183898-19343-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35967 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932571AbcAMJVz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jan 2016 04:21:55 -0500
Received: by mail-ob0-f176.google.com with SMTP id ba1so459821290obb.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jan 2016 01:21:54 -0800 (PST)
In-Reply-To: <1452183898-19343-1-git-send-email-linux@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, John Crispin <blogic@openwrt.org>

On Thu, Jan 7, 2016 at 5:24 PM, Guenter Roeck <linux@roeck-us.net> wrote:

> Commit 6aa7dbfa2877 ("gpio: mm-lantiq: use gpiochip data pointer") replaces
> the use of container_of() with gpiochip_get_data(). However, the data
> pointer is not yet set by the time the save_regs function is called.
>
> Fixes: 6aa7dbfa2877 ("gpio: mm-lantiq: use gpiochip data pointer")
> Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Cc: John Crispin <blogic@openwrt.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Patch applied.

> It might make sense to merge this patch into the patch causing the problem.

Nah, don't wanna rebase. Plus people should see all mistakes I make...

Yours,
Linus Walleij
