From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: Bug report - gpio: improve error path in gpiolib
Date: Sun, 6 Oct 2013 11:55:33 -0700
Message-ID: <CAAVeFuLgMNAA3x0woJ4UFV9a6wkzM5vYBSKGyuRts_5ykWNTPQ@mail.gmail.com>
References: <F7C544E1-F25D-4E83-9896-A761ADBEBA93@goldelico.com>
 <524E199C.8030108@nvidia.com> <DD75C018-FCE8-42D1-8836-01990062B1D5@goldelico.com>
 <CAAVeFuKYechF5UPVqau6nRpVDnT5fYDGmypN2pLJaz6wiritfQ@mail.gmail.com> <51948145-0CAD-48E7-B3E2-BDE52BEE2CA4@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:44986 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754104Ab3JFSzy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2013 14:55:54 -0400
Received: by mail-ie0-f169.google.com with SMTP id tp5so13778314ieb.14
        for <linux-gpio@vger.kernel.org>; Sun, 06 Oct 2013 11:55:53 -0700 (PDT)
In-Reply-To: <51948145-0CAD-48E7-B3E2-BDE52BEE2CA4@goldelico.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Alex Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Frank Rowand <frank.rowand@sonymobile.com>, NeilBrown Brown <neilb@suse.de>, Belisko Marek <marek.belisko@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Oct 5, 2013 at 1:50 PM, Dr. H. Nikolaus Schaller
<hns@goldelico.com> wrote:
>> I have just sent 2 patches that should fix this issue.
>
> Great.
>
>> Could you test
>> them and give your Tested-by after confirming they work?
>
> Yes, these patches work for us as well and have the intended
> effect (like my quick hack).
>
> Tested-by: Dr. H. Nikolaus Schaller <hns@goldelico.com>

Great! Linus, are you ok to take these into your tree? They should
probably go into 3.12 as the patch that causes the difference in
behavior is already merged.

Thanks,
Alex.
