From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 18/27] pinctrl: replace devm_ioremap_nocache with devm_ioremap
Date: Wed, 3 Jan 2018 08:49:36 +0100
Message-ID: <CACRpkdZTvQt3i4HbT=DrzAU83v22L3fk4dUB2HZOTbF56o03KQ@mail.gmail.com>
References: <1514026853-33422-1-git-send-email-xieyisheng1@huawei.com>
 <CACRpkdaZ5HRC-Mhc=apRSXwizf_8b8ioLfg_=VN5b-eGYJGADQ@mail.gmail.com> <644fa45e-d06c-458b-464f-bd5312cc33b0@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33613 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751219AbeACHth (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jan 2018 02:49:37 -0500
Received: by mail-io0-f194.google.com with SMTP id t63so1273739iod.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 23:49:36 -0800 (PST)
In-Reply-To: <644fa45e-d06c-458b-464f-bd5312cc33b0@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yisheng Xie <xieyisheng1@huawei.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, ysxie@foxmail.com, linux-gpio@vger.kernel.org

On Wed, Jan 3, 2018 at 7:15 AM, Yisheng Xie <xieyisheng1@huawei.com> wrote:
> On 2018/1/2 16:43, Linus Walleij wrote:
>> On Sat, Dec 23, 2017 at 12:00 PM, Yisheng Xie <xieyisheng1@huawei.com> wrote:
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
>>
>> Patch applied.
>
> Well, I list the ARCHs related to the change file, do not include cris,ia64,mn10300
> and openrisc, which ioremap is not the same as ioremap_nocache, as discussed in cover
> letter. So please let me know if I need update the comment.

Yeah, same comment as the GPIO patch.

Yours,
Linus Walleij
