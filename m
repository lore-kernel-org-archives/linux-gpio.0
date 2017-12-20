From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: sysfs: don't use sprintf() for 'value' attribute
Date: Wed, 20 Dec 2017 10:34:29 +0100
Message-ID: <CACRpkdZ1mVVzf9wyGx3_oZm=3mqk4ynBg1RidFcV5NBXuK1iAg@mail.gmail.com>
References: <84f3fa77ff5a0b7ac73709de8bdcd93a2cf95271.1513591276.git.christophe.leroy@c-s.fr>
 <1fbada4f02475f69abbccd105c92dc3512dd6ab0.1513591276.git.christophe.leroy@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34903 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754104AbdLTJea (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Dec 2017 04:34:30 -0500
Received: by mail-io0-f193.google.com with SMTP id 14so10174104iou.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2017 01:34:30 -0800 (PST)
In-Reply-To: <1fbada4f02475f69abbccd105c92dc3512dd6ab0.1513591276.git.christophe.leroy@c-s.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Mon, Dec 18, 2017 at 11:08 AM, Christophe Leroy
<christophe.leroy@c-s.fr> wrote:

> A bench with 'perf record' shows that most of time spent in value_show()
> is spent in sprintf()
>
> --42.41%--sysfs_kf_read
>           |
>           |--39.73%--dev_attr_show
>           |          |
>           |          |--38.23%--value_show
>           |          |          |
>           |          |          |--29.22%--sprintf
>           |          |          |
>           |          |          |--2.94%--gpiod_get_value_cansleep
>           |          |          |
>
> value_show() only returns "0\n" or "1\n", therefore the use of
> sprintf() can be avoided
>
> With this patch we get the following result with 'perf record'
>
> --13.89%--sysfs_kf_read
>           |
>           |--10.72%--dev_attr_show
>           |          |
>           |          |--9.44%--value_show
>           |          |          |
>           |          |          |--4.61%--gpiod_get_value_cansleep
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Patch applied.

Yours,
Linus Walleij
