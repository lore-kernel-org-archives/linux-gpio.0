From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [pinctrl:devel 43/47] drivers/pinctrl/samsung/pinctrl-s3c64xx.c:283:9:
 error: 'struct samsung_pinctrl_drv_data' has no member named 'virt_base'; did
 you mean 'pin_base'?
Date: Tue, 8 Nov 2016 14:17:40 +0100
Message-ID: <CACRpkdZ=Uc5Ugw8=VM823tPKzsA=UghQc75pkd1pcWp4QAbJ5A@mail.gmail.com>
References: <201611082051.Q5bbuSGG%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f173.google.com ([209.85.216.173]:35927 "EHLO
        mail-qt0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750809AbcKHNRl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 08:17:41 -0500
Received: by mail-qt0-f173.google.com with SMTP id w33so106627102qtc.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2016 05:17:41 -0800 (PST)
In-Reply-To: <201611082051.Q5bbuSGG%fengguang.wu@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>

On Tue, Nov 8, 2016 at 1:58 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> head:   05e51a4da2af5f68c911adcb888f103460a2e5b3
> commit: e40fde2c098df8bbaf82b5b80b43aa49eb2cb9af [43/47] pinctrl: samsung: Add the support the multiple IORESOURCE_MEM for one pin-bank
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout e40fde2c098df8bbaf82b5b80b43aa49eb2cb9af
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm
>
> All error/warnings (new ones prefixed by >>):
>
>    drivers/pinctrl/samsung/pinctrl-s3c64xx.c: In function 's3c64xx_irq_set_function':
>>> drivers/pinctrl/samsung/pinctrl-s3c64xx.c:283:9: error: 'struct samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean 'pin_base'?
>      reg = d->virt_base + bank->pctl_offset;
>             ^~

This patch does not compile. I took out both patches from my tree as they
are causing build regressions.

Please develop against the latest release candidate or the "devel" branch
in the pin control tree.

Please also split the patches better as Krzysztof requested.

Yours,
Linus Walleij
