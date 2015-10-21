From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH -next] gpio: generic: Revert to old error handling in bgpio_map
Date: Wed, 21 Oct 2015 11:13:33 +0200
Message-ID: <CAFSsGVuCZwk4PY9SCR_f=LiG920ZD3Hk-hxVNc9vHXMACtG7sA@mail.gmail.com>
References: <1445411520-7175-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:36740 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895AbbJUJNf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Oct 2015 05:13:35 -0400
In-Reply-To: <1445411520-7175-1-git-send-email-linux@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 21, 2015 at 9:12 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> Returning an error instead of NULL in bgpio_map if
> platform_get_resource_byname does not find a resource was introduced with
> commit cf3f2a2c8bae ("gpio: generic: improve error handling in bgpio_map").
> This results in several qemu runtime failures with default and non-default
> configurations, if attempts are made to boot from mmcblk0. Examples for
> failures with multi_v7_defconfig are
>
> Machine: vexpress-a9    dtb: vexpress-v2p-ca9
> Machine: vexpress-a15   dtb: vexpress-v2p-ca15-tc1
>
> Crash:
>
> VFS: Cannot open root device "mmcblk0" or unknown-block(0,0): error -6
> Please append a correct "root=" boot option; here are the available partitions:
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
>
> Looking into the code, always returning an error if bgpio_map fails
> does not appear to make much sense, since the code in bgpio_setup_io
> specifically supports some of the resources to be NULL.
>
Indeed. Seems like "dat" is the only mandatory resource.
Previously there was a double check that "dat" is set:
in bgpio_dev_probe and in bgpio_setup_io

With your proposed patch the check in bgpio_dev_probe is removed.
Due to the (previously redundant) check in bgpio_setup_io it's ok however.

One could only discuss whether "dat" should be checked as early as possible
(in bgpio_dev_probe instead of bgpio_setup_io).
But that's something I'd consider to be more or less cosmetic.

> Fixes: cf3f2a2c8bae ("gpio: generic: improve error handling in bgpio_map")
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/gpio/gpio-generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
> index d8b1700b9519..bd5193c67a9c 100644
> --- a/drivers/gpio/gpio-generic.c
> +++ b/drivers/gpio/gpio-generic.c
> @@ -586,7 +586,7 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
>
>         r = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
>         if (!r)
> -               return IOMEM_ERR_PTR(-EINVAL);
> +               return NULL;
>
>         sz = resource_size(r);
>         if (sz != sane_sz)
> --
> 2.1.4
>
