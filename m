From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: change member .dev to .parent
Date: Thu, 5 Nov 2015 11:01:49 +0100
Message-ID: <CACRpkdZ-7mMm+kzKntYWH-6dtOKrFjULux32UL6vxoaAnqrtYg@mail.gmail.com>
References: <1446629475-31754-1-git-send-email-linus.walleij@linaro.org>
	<20151104171300.GJ3503@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34372 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030867AbbKEKBu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2015 05:01:50 -0500
Received: by oies6 with SMTP id s6so1793079oie.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2015 02:01:49 -0800 (PST)
In-Reply-To: <20151104171300.GJ3503@x1>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Alek Du <alek.du@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>

On Wed, Nov 4, 2015 at 6:13 PM, Lee Jones <lee.jones@linaro.org> wrote:
> On Wed, 04 Nov 2015, Linus Walleij wrote:

>> -             chip->dev             = &pdev->dev;
>> +             chip->parent             = &pdev->dev;
>
> Are you buggering up my tabbing, or is this a Gitisum?

It's coccinelle doing this ... anyway I'll go in and check manually
that it looks OK in the end result.

>   Acked-by: Lee Jones <lee.jones@linaro.org>

Thanks!
Linus Walleij
