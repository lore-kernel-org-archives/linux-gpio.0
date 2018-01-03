From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 06/27] gpio: replace devm_ioremap_nocache with devm_ioremap
Date: Wed, 3 Jan 2018 08:48:52 +0100
Message-ID: <CACRpkdayoOOswWyi_1iBD4zpo99YZh_mPF_dYCvZbfSyv9hi5A@mail.gmail.com>
References: <1514026690-32863-1-git-send-email-xieyisheng1@huawei.com>
 <CACRpkdZ-wGU55htBcS9mdZmZBO9sDw6aciu+A3O44WqXf3UtHA@mail.gmail.com> <ca2bf6e4-096a-92f7-923d-3e5f72167fa1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36212 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751154AbeACHsx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jan 2018 02:48:53 -0500
Received: by mail-io0-f194.google.com with SMTP id i143so1265784ioa.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 23:48:53 -0800 (PST)
In-Reply-To: <ca2bf6e4-096a-92f7-923d-3e5f72167fa1@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yisheng Xie <xieyisheng1@huawei.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, ysxie@foxmail.com, linux-gpio@vger.kernel.org

On Wed, Jan 3, 2018 at 7:05 AM, Yisheng Xie <xieyisheng1@huawei.com> wrote:
> On 2018/1/2 16:41, Linus Walleij wrote:
>> On Sat, Dec 23, 2017 at 11:58 AM, Yisheng Xie <xieyisheng1@huawei.com> wrote:
>>
>>> Default ioremap is ioremap_nocache, so devm_ioremap has the same
>>> function with devm_ioremap_nocache, which can just be killed to
>>> save the size of devres.o
>>>
>>> This patch is to use use devm_ioremap instead of devm_ioremap_nocache,
>>> which should not have any function change but prepare for killing
>>> devm_ioremap_nocache.
>>>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>> Cc: linux-gpio@vger.kernel.org
>>> Signed-off-by: Yisheng Xie <xieyisheng1@huawei.com>
>
> Well, I list the ARCHs related to the change file, do not include cris,ia64,mn10300
> and openrisc, which ioremap is not the same as ioremap_nocache, as discussed in cover
> letter. So please let me know if I need update the comment.

I dropped the patch until it's figured out that none of these arches
are affected
by the change.

Please resend with a comment explaining why the change is harmless on the
architectures these drivers are for.

Yours,
Linus Walleij
