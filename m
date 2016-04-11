From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 00/63] Allow compile testing of most gpio drivers
Date: Mon, 11 Apr 2016 09:01:45 +0200
Message-ID: <CACRpkdbA1vShcBkbi0ap=8V3i0RV91tMKppOPd4sLNLtqLU9QQ@mail.gmail.com>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
	<CACRpkdZAfa34PSKniVhRbJFYCy=+1M6QSaucVFWHDzZw4DFFLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36352 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752561AbcDKHBq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Apr 2016 03:01:46 -0400
Received: by mail-ob0-f180.google.com with SMTP id j9so104803313obd.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Apr 2016 00:01:46 -0700 (PDT)
In-Reply-To: <CACRpkdZAfa34PSKniVhRbJFYCy=+1M6QSaucVFWHDzZw4DFFLg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexanders83@web.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Apr 8, 2016 at 2:24 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Apr 5, 2016 at 7:35 PM, Alexander Stein <alexanders83@web.de> wrote:
>
>> Now all changes are restricted to GPIO subsystem are available on
>> https://github.com/AlexanderStein/linux/tree/gpio-compile-test
>
> Please do not base branches on my for-next branch, instead
> use my "devel" branch for stuff like this.
>
> However I successfully pulled it in and rebase it, removing
> the offending commits, so I'm pushing this to the build
> servers for a massive test!
>
> Let's see what happens.

As it turns out, it makes things explode to the left and right on
the build servers.

I guess we need to trickle in a few patches at a time, while
fixing the compile errors they raise.

Unfortunately the build servers have this tendency to shoot
the messenger, but on the other hand, if we churn through them,
drivers get fixed. Mostly Kconfig stuff it seems?

Yours,
Linus Walleij
