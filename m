From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2 0/3] tools/gpio: switch to tools buildsystem
Date: Sun, 19 Jun 2016 22:07:11 +0900
Message-ID: <CAAVeFu+81cpK9-kAZhfyhhZc1AkegxaeCQ7omxDoRctSyboyFg@mail.gmail.com>
References: <1466263488-94457-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36684 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750720AbcFSNHb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Jun 2016 09:07:31 -0400
Received: by mail-io0-f193.google.com with SMTP id s63so14305442ioi.3
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jun 2016 06:07:31 -0700 (PDT)
In-Reply-To: <1466263488-94457-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Sun, Jun 19, 2016 at 12:24 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Current environment is not allowed to easily build the tools.
> Move to tools buildsystem to allow user build gpio tools using only existing
> kernel sources. Besides that support O=/path/to/build/dir option.

Very good idea. I just have a few issues with the current patchset:

1) I think patch 1 and 2 should be merged, otherwise we would have one
commit where the GPIO tools are not available anymore
2) When trying to cross-compile the tools, I am hitting the following error:

  arm-linux-gnueabihf-gcc -Wp,-MD,./.lsgpio.o.d,-MT,lsgpio.o -O2 -Wall
-g -D_GNU_SOURCE -Iinclude -D"BUILD_STR(s)=#s"   -c -o lsgpio.o
lsgpio.c
  arm-linux-gnueabihf-gcc -Wp,-MD,./.gpio-utils.o.d,-MT,gpio-utils.o
-O2 -Wall -g -D_GNU_SOURCE -Iinclude -D"BUILD_STR(s)=#s"   -c -o
gpio-utils.o gpio-utils.c
   ld -r -o lsgpio-in.o  lsgpio.o gpio-utils.o
lsgpio.o: error adding symbols: File in wrong format

Looks like the host linker is invoked instead of the target one.
