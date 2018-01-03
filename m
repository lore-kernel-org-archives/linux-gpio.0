From: Yisheng Xie <xieyisheng1@huawei.com>
Subject: Re: [PATCH v3 06/27] gpio: replace devm_ioremap_nocache with
 devm_ioremap
Date: Wed, 3 Jan 2018 14:05:14 +0800
Message-ID: <ca2bf6e4-096a-92f7-923d-3e5f72167fa1@huawei.com>
References: <1514026690-32863-1-git-send-email-xieyisheng1@huawei.com>
 <CACRpkdZ-wGU55htBcS9mdZmZBO9sDw6aciu+A3O44WqXf3UtHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga07-in.huawei.com ([45.249.212.35]:41535 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751140AbeACGFV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Jan 2018 01:05:21 -0500
In-Reply-To: <CACRpkdZ-wGU55htBcS9mdZmZBO9sDw6aciu+A3O44WqXf3UtHA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, ysxie@foxmail.com, linux-gpio@vger.kernel.org



On 2018/1/2 16:41, Linus Walleij wrote:
> On Sat, Dec 23, 2017 at 11:58 AM, Yisheng Xie <xieyisheng1@huawei.com> wrote:
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

Well, I list the ARCHs related to the change file, do not include cris,ia64,mn10300
and openrisc, which ioremap is not the same as ioremap_nocache, as discussed in cover
letter. So please let me know if I need update the comment.

 change_file								ARCH
 drivers/gpio/gpio-ath79.c     | 3 +--					mips
 drivers/gpio/gpio-em.c        | 6 ++----				arm
 drivers/gpio/gpio-htc-egpio.c | 4 ++--					arm
 drivers/gpio/gpio-xgene.c     | 3 +--					arm64

Thanks
Yisheng
> 
> Patch applied.
> 
> Yours,
> Linus Walleij
> 
> 

