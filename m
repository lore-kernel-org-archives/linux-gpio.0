From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Re: [PATCH V2] gpio: mmp: add GPIO driver for Marvell MMP series
Date: Wed, 18 Mar 2015 09:42:28 +0100
Message-ID: <CACRpkdaP5gZW84WNxKvPPehx7DzW+heGy8SgG_=f4x3RSs6jNw@mail.gmail.com>
References: <1425607483-8614-1-git-send-email-chao.xie@marvell.com>
	<CACRpkdaLGotNhCdgz6fZ8ksmVPudn8PFUaL2WcTBgey1U=32CA@mail.gmail.com>
	<60d165d9.180bc.14c2b49a313.Coremail.xiechao_mail@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:34519 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755053AbbCRIma (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Mar 2015 04:42:30 -0400
Received: by lbbsy1 with SMTP id sy1so24491782lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2015 01:42:28 -0700 (PDT)
In-Reply-To: <60d165d9.180bc.14c2b49a313.Coremail.xiechao_mail@163.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chao Xie <xiechao_mail@163.com>
Cc: Chao Xie <chao.xie@marvell.com>, Rob Herring <robh@kernel.org>, Andrew Ruder <andy@aeruder.net>, Eric Miao <eric.y.miao@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@gmail.com>

On Wed, Mar 18, 2015 at 6:09 AM, Chao Xie <xiechao_mail@163.com> wrote:
> At 2015-03-17 18:25:24, "Linus Walleij" <linus.walleij@linaro.org> wrote:

>>So this driver duplicates drivers/gpio/gpio-pxa.c in some sense but
>>is nicer and cleaner and thus an incentive for me to merge it.
>>At the same time I don't want two drivers for essentially the same
>>hardware and in that way I would prefer to clean up the PXA driver.
>>
>>But I don't know how close the PXA and MMP drivers really are.
>>
>>Will it also cover MMP2 that is currently using by the PXA driver?
>>
>>Is it really complicated to migrate gpio-pxa to GPIOLIB_IRQCHIP?
>>
>>I guess you should also delete the compatible string and
>>compatibility code in drivers/gpio/gpio-pxa.c (as a separate patch
>>in this series) and merge this along with some defconfig
>>changes that activates this by default for the MMP machines?
>
>
> I will ask Haojian to comment at it when send out V3 patch.
> pxa and mmp are two different series.
> First pxa is Intel's product, and after Intel sell its xscale to
> marvell, the SOC series become mmp. The SOC design has
> many differences.

OK I knew there was some story like this ... and before Intel
the chipset now known as PXA was StrongARM-related and was
a Digital product right?

> now mmp gpio has some registers kept in order to use the
> old pxa driver, but silicon designer warned us that it is better
> to use the new register interfaces.
>
> The major differences are:
> For all the edge detecting setting/clearing, level setting/clearing,
> direction setting/clearing, mmp has
> separated registers

So the new IP is obviously derived from the old PXA IP and
should preferably use the same driver, just with some tweaks.
It would be better if the PXA driver was evolved to cover the new
registers for the MMP.

Well I guess if *all* registers start to be at a different offset (etc)
then there is no point in having the same driver. But that seems
not to be the case.

Run-time adaptable drivers that cover a wide range of hardware
is very nice for me as a maintainer, mostly because I don't
need to fix the same bug in a myriad of places.

Yours,
Linus Walleij
