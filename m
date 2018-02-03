From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] pin control bulk changes for v4.16
Date: Fri, 2 Feb 2018 16:51:05 -0800
Message-ID: <CA+55aFzhp2QW9JeMwV6=W4skf0CW6E+Zg4K90n3Bo+yZmz485Q@mail.gmail.com>
References: <CACRpkdaTv4NBrRXeJE6dVi4W88+LZdsTCSzTHi0vdcKMW3Qfmw@mail.gmail.com>
 <CA+55aFzMBptQt-QHMR0MM9MA3=1rxcf8ca5qHxrf4Mm0ZobE_A@mail.gmail.com> <CA+55aFztiKehjo7OQQFboAEfe_BrxJQG_5wxak2a_GdNBEFiMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34207 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752097AbeBCAvG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Feb 2018 19:51:06 -0500
In-Reply-To: <CA+55aFztiKehjo7OQQFboAEfe_BrxJQG_5wxak2a_GdNBEFiMw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Fri, Feb 2, 2018 at 4:44 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Stupid patch attached. I don't know how much this helps the insane
> dependency hell for <linux/pinctrl/devinfo.h>, but it's bound to help
> _some_.

Testing it, that patch definitely cuts down on recompiles after

     touch include/linux/pinctrl/devinfo.h

a lot.

It still ends up rebuilding a fair amount of odd drivers, but now the
files it rebuilds at least make _some_ sense.

It used to really rebuild just about everything (because pretty much
everything includes <linux/device.h>). Now it rebuilds various snd/soc
files,gpio stuff and mmc/mfc stuff.

I'm sure it could be improved upon still, but I think this is already
a fairly noticeable improvement.

One odd header include down. Ten million to go.

             Linus
