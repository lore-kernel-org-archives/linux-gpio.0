From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 00/63] Allow compile testing of most gpio drivers
Date: Fri, 8 Apr 2016 14:24:55 +0200
Message-ID: <CACRpkdZAfa34PSKniVhRbJFYCy=+1M6QSaucVFWHDzZw4DFFLg@mail.gmail.com>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36178 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753118AbcDHMY4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Apr 2016 08:24:56 -0400
Received: by mail-oi0-f54.google.com with SMTP id y204so134240882oie.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 Apr 2016 05:24:56 -0700 (PDT)
In-Reply-To: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexanders83@web.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Apr 5, 2016 at 7:35 PM, Alexander Stein <alexanders83@web.de> wrote:

> Now all changes are restricted to GPIO subsystem are available on
> https://github.com/AlexanderStein/linux/tree/gpio-compile-test

Please do not base branches on my for-next branch, instead
use my "devel" branch for stuff like this.

However I successfully pulled it in and rebase it, removing
the offending commits, so I'm pushing this to the build
servers for a massive test!

Let's see what happens.

Yours,
Linus Walleij
