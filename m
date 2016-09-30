From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: omap2: fix missing include
Date: Fri, 30 Sep 2016 09:06:00 -0700
Message-ID: <CACRpkdZ9QEGyejLhUO6+4u7YFN+w4DggxtONSa84T9QLkLb6WA@mail.gmail.com>
References: <1474634412-7050-1-git-send-email-linus.walleij@linaro.org>
 <20160923141313.y7xp2yyv74nk2v3a@atomide.com> <20160923191556.GN8825@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:32935 "EHLO
        mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933562AbcI3QGB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Sep 2016 12:06:01 -0400
Received: by mail-oi0-f44.google.com with SMTP id r126so135333267oib.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Sep 2016 09:06:01 -0700 (PDT)
In-Reply-To: <20160923191556.GN8825@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Tony Lindgren <tony@atomide.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Fri, Sep 23, 2016 at 12:15 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

>> Sorry the removal got postponed from v4.8 to v4.9. Note that
>> it will produce a trivial merge conflict.
>
> Ah, that explains it.  Linus, I'd come across this a few months ago, and
> sent Tony a different fix for it:
>
> https://patchwork.kernel.org/patch/9238801/

Oh I see.

The only reason I patched it was because the build robots were
complaining, the problem will go away in the merge window one
way or another, sorry about all fuzz. Maybe I shouldn't be overly
eager to please the build robots. :/

Yours,
Linus Walleij
