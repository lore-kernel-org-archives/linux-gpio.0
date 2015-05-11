From: Jonas Jensen <jonas.jensen@gmail.com>
Subject: Re: [PATCH 3/4] gpio: moxart: get value of output gpio from generic driver
Date: Mon, 11 May 2015 14:17:30 +0200
Message-ID: <CACmBeS0n4EcNpKfVZM4AypjJVqXeq+5jNqx2chyp5yPX6cBY0Q@mail.gmail.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
	<1430321701-13758-4-git-send-email-vladimir_zapolskiy@mentor.com>
	<CACRpkdaQc4Udg6mbzF23sapnPDRvRhLX_=4hjvtJpbmXO4_g-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yh0-f50.google.com ([209.85.213.50]:33922 "EHLO
	mail-yh0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750919AbbEKMRb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2015 08:17:31 -0400
Received: by yhw29 with SMTP id 29so35603179yhw.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2015 05:17:30 -0700 (PDT)
In-Reply-To: <CACRpkdaQc4Udg6mbzF23sapnPDRvRhLX_=4hjvtJpbmXO4_g-A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 11 May 2015 at 11:52, Linus Walleij <linus.walleij@linaro.org> wrote:
> Patch applied, unless Jonas has a problem with it.
> Always CC: Jonas Jensen whenever patching Moxart stuff pls.

Thanks!

I just figured out I never completed my linux-gpio subscription though
I would have found this eventually.

Unfortunately my tree is not rebased since 3.17 so merged manually and
tested (verified OK on UC-7112-LX):

https://bitbucket.org/Kasreyn/linux-next/commits/5da653347ed802f5cdfd785d1dbaab2aa7432c1d


   Jonas
