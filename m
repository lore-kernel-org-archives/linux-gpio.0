From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [pinctrl:devel 63/65] drivers/pinctrl/freescale/pinctrl-imx6ul.c:343:33:
 warning: passing argument 2 of 'imx_pinctrl_probe' discards 'const' qualifier
 from pointer target type
Date: Thu, 11 Jan 2018 10:32:22 +0100
Message-ID: <CACRpkdbtkzLWccs_D=xTh=0LTt9xs=hGUERLafrrhcEHK3H88Q@mail.gmail.com>
References: <201801100031.ehyAIs9l%fengguang.wu@intel.com> <59dc10a601670bf18fbcd4d39d685c81@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:46919 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754762AbeAKJcY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jan 2018 04:32:24 -0500
Received: by mail-qt0-f194.google.com with SMTP id r39so1017556qtr.13
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2018 01:32:23 -0800 (PST)
In-Reply-To: <59dc10a601670bf18fbcd4d39d685c81@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Bai Ping <ping.bai@nxp.com>, kbuild-all@01.org, linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>, kbuild test robot <fengguang.wu@intel.com>

On Wed, Jan 10, 2018 at 7:11 PM, Stefan Agner <stefan@agner.ch> wrote:
> Hi Linus,
>
> On 2018-01-09 17:40, kbuild test robot wrote:
>> tree:
>> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
>> devel
>> head:   a3a093ae02e2ae81499ad9e78516dccd72906c25
>> commit: ba33f4f42e968854d8367fc4e55b07f835c55832 [63/65] pinctrl:
>> imx6ul: add IOMUXC SNVS pinctrl driver for i.MX 6ULL
>> config: arm-multi_v7_defconfig (attached as .config)
>> compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
>> reproduce:
>>         wget
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
>> -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout ba33f4f42e968854d8367fc4e55b07f835c55832
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=arm
>>
>> All warnings (new ones prefixed by >>):
>>
>>    drivers/pinctrl/freescale/pinctrl-imx6ul.c: In function
>> 'imx6ul_pinctrl_probe':
>>>> drivers/pinctrl/freescale/pinctrl-imx6ul.c:343:33: warning: passing argument 2 of 'imx_pinctrl_probe' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>>      return imx_pinctrl_probe(pdev, pinctrl_info);
>>                                     ^~~~~~~~~~~~
>
>
> I think this happened because you only applied patch 5 of the imx
> constify patchset, is that correct?

I have applied patches 1-4 now... patch 5 I can't even find in
my inbox :(

So I guess not.

Can you have a look at my devel branch and send or resend a
patch if something is still wrong?
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Yours,
Linus Walleij
