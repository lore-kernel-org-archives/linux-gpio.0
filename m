From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] gpio: sysfs: avoid using kstrtol() in 'value'
 attribute write
Date: Wed, 20 Dec 2017 10:35:36 +0100
Message-ID: <CACRpkdbNzzuGQZmW5s8=6u0w49n1ZESb+sEayCXVSCs=nH6nnA@mail.gmail.com>
References: <84f3fa77ff5a0b7ac73709de8bdcd93a2cf95271.1513591276.git.christophe.leroy@c-s.fr>
 <d674a102bb9afb07298070f1efd730a94e0fa3bc.1513591276.git.christophe.leroy@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36704 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754510AbdLTJfh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Dec 2017 04:35:37 -0500
Received: by mail-it0-f67.google.com with SMTP id d16so6130951itj.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2017 01:35:37 -0800 (PST)
In-Reply-To: <d674a102bb9afb07298070f1efd730a94e0fa3bc.1513591276.git.christophe.leroy@c-s.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Mon, Dec 18, 2017 at 11:08 AM, Christophe Leroy
<christophe.leroy@c-s.fr> wrote:

> A 'perf record' on an app continuously writing in the 'value'
> attribute show that most of the time is spent in kstrtol()
>
> --17.99%--value_store
>           |
>           |--10.17%--kstrtoint
>           |          |
>           |          |--8.82%--kstrtoll
>           |
>           |--2.50%--gpiod_set_value_cansleep
>           |
>           |--1.82%--u16_gpio_set
>           |
>           |--1.46%--value_store
>
> The normal case is to write 0 or 1 in the attribute, therefore
> this patch avoids the call to kstrtol() in the most common cases
>
> Then 'perf record' shows
>
> --7.21%--value_store
>           |
>           |--2.69%--u16_gpio_set
>           |
>           |--1.47%--value_store
>           |
>           |--1.08%--gpiod_set_value_cansleep
>           |
>           |--0.60%--mutex_lock
>           |
>            --0.58%--mutex_unlock
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Patch applied.

Yours,
Linus Walleij
