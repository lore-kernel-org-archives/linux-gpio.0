From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: make inclusion of <linux/of_platform.h> unconditional
Date: Thu, 10 Dec 2015 19:30:30 +0100
Message-ID: <CACRpkdbu9ccfiSZFqpYBveh0ShND5fA1zTCzxURcJLeTnu2JQw@mail.gmail.com>
References: <1449655574-6550-1-git-send-email-linus.walleij@linaro.org>
	<56680830.8010607@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33214 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751229AbbLJSaa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 13:30:30 -0500
Received: by oixx65 with SMTP id x65so51305544oix.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 10:30:30 -0800 (PST)
In-Reply-To: <56680830.8010607@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Wed, Dec 9, 2015 at 11:53 AM, Ben Dooks <ben.dooks@codethink.co.uk> =
wrote:
> On 09/12/15 10:06, Linus Walleij wrote:
>> After adding the DT matching in
>> commit 6f29c9afbe636fc0e35c82a11eaf45c3b85eb07a
>> "gpio: pca935x: fix of-only probed devices"
>> compilation fails like this:
>>
>> CC [M]  drivers/gpio/gpio-pca953x.o
>> gpio-pca953x.c: In function =E2=80=98pca953x_probe=E2=80=99:
>> gpio-pca953x.c:693:11: error: implicit declaration of
>> function =E2=80=98of_match_device=E2=80=99 [-Werror=3Dimplicit-funct=
ion-declaration]
>> match =3D of_match_device(pca953x_dt_ids, &client->dev);
>
> Thanks, given the driver makes no other attempt to remove OF
> lists if there is no OF present then this may as well be
> unconditionally included.

Hm it seems to fail compilation on a few defconfigs still...
Need to think about adding deps or reintroducing these ifdefs.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
