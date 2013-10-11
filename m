From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Bug report - gpio: improve error path in gpiolib
Date: Fri, 11 Oct 2013 16:29:41 +0200
Message-ID: <CACRpkdYpy71MX+m2fb2MTgQgA2PUxZe4RNLfnpOMa+i0ZE_BCQ@mail.gmail.com>
References: <F7C544E1-F25D-4E83-9896-A761ADBEBA93@goldelico.com>
	<524E199C.8030108@nvidia.com>
	<DD75C018-FCE8-42D1-8836-01990062B1D5@goldelico.com>
	<CAAVeFuKYechF5UPVqau6nRpVDnT5fYDGmypN2pLJaz6wiritfQ@mail.gmail.com>
	<51948145-0CAD-48E7-B3E2-BDE52BEE2CA4@goldelico.com>
	<CAAVeFuLgMNAA3x0woJ4UFV9a6wkzM5vYBSKGyuRts_5ykWNTPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:42854 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752047Ab3JKO3l (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 10:29:41 -0400
Received: by mail-ie0-f182.google.com with SMTP id as1so6450458iec.41
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 07:29:41 -0700 (PDT)
In-Reply-To: <CAAVeFuLgMNAA3x0woJ4UFV9a6wkzM5vYBSKGyuRts_5ykWNTPQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, Alex Courbot <acourbot@nvidia.com>, Frank Rowand <frank.rowand@sonymobile.com>, NeilBrown Brown <neilb@suse.de>, Belisko Marek <marek.belisko@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Oct 6, 2013 at 8:55 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Sat, Oct 5, 2013 at 1:50 PM, Dr. H. Nikolaus Schaller
> <hns@goldelico.com> wrote:
>>> I have just sent 2 patches that should fix this issue.
>>
>> Great.
>>
>>> Could you test
>>> them and give your Tested-by after confirming they work?
>>
>> Yes, these patches work for us as well and have the intended
>> effect (like my quick hack).
>>
>> Tested-by: Dr. H. Nikolaus Schaller <hns@goldelico.com>
>
> Great! Linus, are you ok to take these into your tree? They should
> probably go into 3.12 as the patch that causes the difference in
> behavior is already merged.

OK saw this now, move these two for fixes.

Yours,
Linus Walleij
