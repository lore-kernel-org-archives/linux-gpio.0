From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] pin control bulk changes for v4.16
Date: Fri, 2 Feb 2018 14:56:51 -0800
Message-ID: <CA+55aFzMBptQt-QHMR0MM9MA3=1rxcf8ca5qHxrf4Mm0ZobE_A@mail.gmail.com>
References: <CACRpkdaTv4NBrRXeJE6dVi4W88+LZdsTCSzTHi0vdcKMW3Qfmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34797 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751468AbeBBW4x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Feb 2018 17:56:53 -0500
In-Reply-To: <CACRpkdaTv4NBrRXeJE6dVi4W88+LZdsTCSzTHi0vdcKMW3Qfmw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Fri, Feb 2, 2018 at 5:28 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> here is the big slew of changes in pin control for the v4.16 cycle.

So I pulled this, and then was surprised by how *everything* got
rebuilt even though it only touched pinctl files.

The reason for that seems to be that the pinctl pull got me this:

   include/linux/pinctrl/devinfo.h                    |    2 +

and in include/linux/device.h we have

  #include <linux/pinctrl/devinfo.h>

so pretty much *every* driver ends up depending on that silly two-line change.

I *think* that the only reason that happens is because of this:

  #ifdef CONFIG_PINCTRL
          struct dev_pin_info     *pins;
  #endif

and honestly, that could be trivially done by just having a forward
declaration, replacing the pinctrl/devinfo.h header include entirely.

Ironically, that two-line change to pinctrl/devinfo.h was a forward
declaration in the exact reverse direction:

    +struct device;
    +

so I would really prefer to speed up recompiles and just generally try
to avoid horrible header file inclusion by doing the same thing in
<linux/device.h>, adding just that

    struct dev_pin_info;

declaration, and removing the <linux/pinctrl/devinfo.h> include.

Hmm?

I also wonder if there are any automated tools that try to find these
kinds of crazy things. I suspect a lot of our build times is the poor
compiler just reading and parsing header files over and over again,
and a lot of them are probably not needed.

A year ago, Ingo did patches limit some of the header file issues for
the core headers (<linux/sched.h> in particular). Maybe he had
tooling? Ingo?

                  Linus
