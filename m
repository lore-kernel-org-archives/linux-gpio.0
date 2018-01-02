From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 06/27] gpio: replace devm_ioremap_nocache with devm_ioremap
Date: Tue, 2 Jan 2018 09:41:54 +0100
Message-ID: <CACRpkdZ-wGU55htBcS9mdZmZBO9sDw6aciu+A3O44WqXf3UtHA@mail.gmail.com>
References: <1514026690-32863-1-git-send-email-xieyisheng1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:43062 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752116AbeABIlz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 03:41:55 -0500
Received: by mail-io0-f193.google.com with SMTP id w188so3837099iod.10
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 00:41:55 -0800 (PST)
In-Reply-To: <1514026690-32863-1-git-send-email-xieyisheng1@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yisheng Xie <xieyisheng1@huawei.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, ysxie@foxmail.com, linux-gpio@vger.kernel.org

On Sat, Dec 23, 2017 at 11:58 AM, Yisheng Xie <xieyisheng1@huawei.com> wrote:

> Default ioremap is ioremap_nocache, so devm_ioremap has the same
> function with devm_ioremap_nocache, which can just be killed to
> save the size of devres.o
>
> This patch is to use use devm_ioremap instead of devm_ioremap_nocache,
> which should not have any function change but prepare for killing
> devm_ioremap_nocache.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Yisheng Xie <xieyisheng1@huawei.com>

Patch applied.

Yours,
Linus Walleij
