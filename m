From: Yisheng Xie <xieyisheng1@huawei.com>
Subject: Re: [PATCH v3 18/27] pinctrl: replace devm_ioremap_nocache with
 devm_ioremap
Date: Wed, 3 Jan 2018 14:15:36 +0800
Message-ID: <644fa45e-d06c-458b-464f-bd5312cc33b0@huawei.com>
References: <1514026853-33422-1-git-send-email-xieyisheng1@huawei.com>
 <CACRpkdaZ5HRC-Mhc=apRSXwizf_8b8ioLfg_=VN5b-eGYJGADQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga06-in.huawei.com ([45.249.212.32]:33723 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750907AbeACGPz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Jan 2018 01:15:55 -0500
In-Reply-To: <CACRpkdaZ5HRC-Mhc=apRSXwizf_8b8ioLfg_=VN5b-eGYJGADQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, ysxie@foxmail.com, linux-gpio@vger.kernel.org



On 2018/1/2 16:43, Linus Walleij wrote:
> On Sat, Dec 23, 2017 at 12:00 PM, Yisheng Xie <xieyisheng1@huawei.com> wrote:
> 
>> Default ioremap is ioremap_nocache, so devm_ioremap has the same
>> function with devm_ioremap_nocache, which can just be killed to
>> save the size of devres.o
>>
>> This patch is to use use devm_ioremap instead of devm_ioremap_nocache,
>> which should not have any function change but prepare for killing
>> devm_ioremap_nocache.
>>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: linux-gpio@vger.kernel.org
>> Signed-off-by: Yisheng Xie <xieyisheng1@huawei.com>
> 
> Patch applied.

Well, I list the ARCHs related to the change file, do not include cris,ia64,mn10300
and openrisc, which ioremap is not the same as ioremap_nocache, as discussed in cover
letter. So please let me know if I need update the comment.

 change file							ARCH
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c         | 2 +-		arm/arm64
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c         | 4 ++--		arm
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 2 +-		arm
 drivers/pinctrl/pinctrl-amd.c                 | 4 ++--		x86/arm

Thanks
Yisheng
> 
> Yours,
> Linus Walleij
> 
> 

