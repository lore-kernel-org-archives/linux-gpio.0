From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: dwapb: enable for ARC
Date: Wed, 15 Apr 2015 10:13:34 +0200
Message-ID: <CACRpkdZYZBAMW3UXcYtH3HKZbjhBLJQE15tLDFF47re+CuQi8w@mail.gmail.com>
References: <1427790607-24842-1-git-send-email-abrodkin@synopsys.com>
	<1428565685.2536.4.camel@synopsys.com>
	<CACRpkdZCb+5AP7n8LuG2p6XMd9ctKVH8nRu8gavBV4EA5LcqBQ@mail.gmail.com>
	<8837317.PEV34r0lLR@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:33636 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751200AbbDOINf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2015 04:13:35 -0400
Received: by oblw8 with SMTP id w8so12422796obl.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2015 01:13:34 -0700 (PDT)
In-Reply-To: <8837317.PEV34r0lLR@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Steven Miao <realmz6@gmail.com>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Apr 9, 2015 at 12:31 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday 09 April 2015 10:29:59 Linus Walleij wrote:

>> I will make a patch removing the dependencies and see what happens.
>
> Yes, makes sense. I think we don't need anything other than
>
>         depends on OF_GPIO || X86_INTEL_QUARK

I didn't even keep that. Just available for everyone and its dog,
this hardware is so clearly generic.

I also rearranged the Kconfig menus in GPIO so users are not
confused (hopefully) as much by strange GPIO stuff anymore.

Yours,
Linus Walleij
