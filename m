From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [pinctrl:devel 43/47]
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c:283:9: error: 'struct
 samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean
 'pin_base'?
Date: Wed, 09 Nov 2016 09:47:31 +0900
Message-ID: <58227223.3040707@samsung.com>
References: <201611082051.Q5bbuSGG%fengguang.wu@intel.com>
 <CGME20161108131744epcas2p49fac2234e36b89f8a7104a6d8f591dc9@epcas2p4.samsung.com>
 <CACRpkdZ=Uc5Ugw8=VM823tPKzsA=UghQc75pkd1pcWp4QAbJ5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48118 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753891AbcKIArd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 19:47:33 -0500
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGC029WUNJ469B0@mailout1.samsung.com> for
 linux-gpio@vger.kernel.org; Wed, 09 Nov 2016 09:47:31 +0900 (KST)
In-reply-to: <CACRpkdZ=Uc5Ugw8=VM823tPKzsA=UghQc75pkd1pcWp4QAbJ5A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>

Hi Linus,

On 2016년 11월 08일 22:17, Linus Walleij wrote:
> On Tue, Nov 8, 2016 at 1:58 PM, kbuild test robot
> <fengguang.wu@intel.com> wrote:
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
>> head:   05e51a4da2af5f68c911adcb888f103460a2e5b3
>> commit: e40fde2c098df8bbaf82b5b80b43aa49eb2cb9af [43/47] pinctrl: samsung: Add the support the multiple IORESOURCE_MEM for one pin-bank
>> config: arm-allmodconfig (attached as .config)
>> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
>> reproduce:
>>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout e40fde2c098df8bbaf82b5b80b43aa49eb2cb9af
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=arm
>>
>> All error/warnings (new ones prefixed by >>):
>>
>>    drivers/pinctrl/samsung/pinctrl-s3c64xx.c: In function 's3c64xx_irq_set_function':
>>>> drivers/pinctrl/samsung/pinctrl-s3c64xx.c:283:9: error: 'struct samsung_pinctrl_drv_data' has no member named 'virt_base'; did you mean 'pin_base'?
>>      reg = d->virt_base + bank->pctl_offset;
>>             ^~
> 
> This patch does not compile. I took out both patches from my tree as they
> are causing build regressions.
> 
> Please develop against the latest release candidate or the "devel" branch
> in the pin control tree.
> 
> Please also split the patches better as Krzysztof requested.

I'm sorry for my mistake. I'll resend the patch after fixing it.

Best Regards,
Chanwoo Choi
