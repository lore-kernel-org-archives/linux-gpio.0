From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [pinctrl:devel 152/153] drivers/gpio/gpiolib.c:1943:19: warning:
 'struct lock_dep_class' declared inside parameter list
Date: Wed, 8 Nov 2017 16:04:05 +0100
Message-ID: <CAMuHMdVVTuCem3-P70ZvNBGw7g-_2Q+h2Ed_76cJEpfWrYnkQg@mail.gmail.com>
References: <201711082209.w9VtmkEu%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:48323 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751705AbdKHPEG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Nov 2017 10:04:06 -0500
Received: by mail-qt0-f193.google.com with SMTP id f8so3664258qta.5
        for <linux-gpio@vger.kernel.org>; Wed, 08 Nov 2017 07:04:06 -0800 (PST)
In-Reply-To: <201711082209.w9VtmkEu%fengguang.wu@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Thierry Reding <treding@nvidia.com>, "kbuild-all@01.org" <kbuild-all@01.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Wed, Nov 8, 2017 at 3:38 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> head:   bfcadc85ef134881fce5f8635648e36de1ab4c9d
> commit: 959bc7b22bd25a3a907fbb9b26a1d0cbdf98ef40 [152/153] gpio: Automatically add lockdep keys
> config: m68k-m5475evb_defconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 4.9.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 959bc7b22bd25a3a907fbb9b26a1d0cbdf98ef40
>         # save the attached .config to linux build tree
>         make.cross ARCH=m68k
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/gpio/gpiolib.c:1943:19: warning: 'struct lock_dep_class' declared inside parameter list
>                struct lock_dep_class *lock_key)
>                       ^

s/lock_dep_class/lock_class_key/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
