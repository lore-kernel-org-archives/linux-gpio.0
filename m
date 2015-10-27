From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: generic: Revert to old error handling in bgpio_map
Date: Tue, 27 Oct 2015 11:28:07 +0100
Message-ID: <CACRpkdY_G21Kh3bQDQ=Zz3PxgQnGSiKyow133dQzJWTq2LcJNw@mail.gmail.com>
References: <1445411520-7175-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:34641 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752322AbbJ0K2I convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2015 06:28:08 -0400
Received: by oies66 with SMTP id s66so116858672oie.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2015 03:28:07 -0700 (PDT)
In-Reply-To: <1445411520-7175-1-git-send-email-linux@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>

On Wed, Oct 21, 2015 at 9:12 AM, Guenter Roeck <linux@roeck-us.net> wro=
te:

> Returning an error instead of NULL in bgpio_map if
> platform_get_resource_byname does not find a resource was introduced =
with
> commit cf3f2a2c8bae ("gpio: generic: improve error handling in bgpio_=
map").
> This results in several qemu runtime failures with default and non-de=
fault
> configurations, if attempts are made to boot from mmcblk0. Examples f=
or
> failures with multi_v7_defconfig are
>
> Machine: vexpress-a9    dtb: vexpress-v2p-ca9
> Machine: vexpress-a15   dtb: vexpress-v2p-ca15-tc1
>
> Crash:
>
> VFS: Cannot open root device "mmcblk0" or unknown-block(0,0): error -=
6
> Please append a correct "root=3D" boot option; here are the available=
 partitions:
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-b=
lock(0,0)
>
> Looking into the code, always returning an error if bgpio_map fails
> does not appear to make much sense, since the code in bgpio_setup_io
> specifically supports some of the resources to be NULL.
>
> Fixes: cf3f2a2c8bae ("gpio: generic: improve error handling in bgpio_=
map")
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Patch/revert applied. Thanks for digging in and fixing this G=C3=BCnthe=
r!

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
