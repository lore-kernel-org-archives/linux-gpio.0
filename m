From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add COMPILE_TEST to several drivers
Date: Thu, 6 Jul 2017 23:52:51 +0200
Message-ID: <CACRpkdaits4bo4NhdG1Crh2Ds-7q=_WotZeYF6dWMSzFpf-zjQ@mail.gmail.com>
References: <1499140313-31592-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:38725 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752717AbdGFVwx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jul 2017 17:52:53 -0400
Received: by mail-it0-f52.google.com with SMTP id k192so17766324ith.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jul 2017 14:52:53 -0700 (PDT)
In-Reply-To: <1499140313-31592-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 4, 2017 at 5:51 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> These drivers are actually platform-agnostic.  Add COMPILE_TEST for
> the compilation test coverage.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I had such patches in the past.

It breaks everything to the left and right.

What I need is someone who turns this on PER DRIVER (in their tree)
fixes all the fallout (I don't know how, maybe using 0day builds?), then
sends a patch fixing the fallout and as the last patch turns on
COMPILE_TEST when it doesn't break anything.

And we want to use it for new drivers, ideally.

The arch that always breaks everything us UM Linux.

Yours,
Linus Walleij
