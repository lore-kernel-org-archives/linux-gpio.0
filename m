From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] pin control bulk changes for the v4.11 kernel cycle
Date: Tue, 21 Feb 2017 11:31:47 +0100
Message-ID: <CACRpkdZu_G3Te4uOuWjtMpejVdig=1vJNJU2-EfHQVgZ+_uq-g@mail.gmail.com>
References: <CACRpkda+U66SuTHoDncA=1RH_KnBB5hKNLPEx0Ec2NbtsDskhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:34947 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751352AbdBUKbt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Feb 2017 05:31:49 -0500
Received: by mail-it0-f43.google.com with SMTP id 203so102176811ith.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Feb 2017 02:31:48 -0800 (PST)
In-Reply-To: <CACRpkda+U66SuTHoDncA=1RH_KnBB5hKNLPEx0Ec2NbtsDskhw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Feb 21, 2017 at 10:05 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:

Damned I missed this too:

> - We merge an immutable branch from the GPIO tree that hits a whole slew
>   of sites in drivers/gpio, and obviously these changes will also be visible
>   in the GPIO pull request.

- The above leads to a conflict with the staging tree greybus GPIO
  driver in drivers/staging/greybus/gpio.c where a checkpatch fix was
  clashing with the changes.
  Stephen has a resolution in the next tree.

This is more of a minor, ordinary merge conflict (than the other crap in the
GPIO tree I try to solve right now) so should be OK for you to handle
I hope.

Yours,
Linus Walleij
