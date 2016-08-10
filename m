From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: include/linux/io-mapping.h:130:39: error: implicit declaration of
 function 'ioremap_wc'
Date: Wed, 10 Aug 2016 15:37:10 +0200
Message-ID: <CACRpkdbq7S4AKC13dwc87Vg7ys=Qzc3HvQa90=w-QyXcED118A@mail.gmail.com>
References: <201608071408.Vl9JXt1A%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:35071 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965165AbcHJS5J (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Aug 2016 14:57:09 -0400
Received: by mail-oi0-f52.google.com with SMTP id 4so71928329oih.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Aug 2016 11:57:09 -0700 (PDT)
In-Reply-To: <201608071408.Vl9JXt1A%fengguang.wu@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: kbuild test robot <fengguang.wu@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Aug 7, 2016 at 8:51 AM, kbuild test robot
<fengguang.wu@intel.com> wrote:

> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0cbbc422d56668528f6efd1234fe908010284082
> commit: 7d4defe21c682c934a19fce1ba8b54b7bde61b08 gpio: include <linux/io-mapping.h> in gpiolib-of
> date:   9 weeks ago
> config: um-allyesconfig (attached as .config)
> compiler: gcc-6 (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         git checkout 7d4defe21c682c934a19fce1ba8b54b7bde61b08
>         # save the attached .config to linux build tree
>         make ARCH=um
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/gpio/gpiolib-of.c:19:0:
>    include/linux/io-mapping.h: In function 'io_mapping_create_wc':
>>> include/linux/io-mapping.h:130:39: error: implicit declaration of function 'ioremap_wc' [-Werror=implicit-function-declaration]
>      return (struct io_mapping __force *) ioremap_wc(base, size);
>                                           ^~~~~~~~~~
>    include/linux/io-mapping.h:130:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>      return (struct io_mapping __force *) ioremap_wc(base, size);
>             ^
>    include/linux/io-mapping.h: In function 'io_mapping_free':
>>> include/linux/io-mapping.h:136:2: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]
>      iounmap((void __force __iomem *) mapping);
>      ^~~~~~~
>    cc1: some warnings being treated as errors
>
> vim +/ioremap_wc +130 include/linux/io-mapping.h

I have tried to fix this but don't know what the problem really is,
as all archs seem to work fine except UM. I need help with this :/

Involving the linux-gpio list...

Yours,
Linus Walleij
