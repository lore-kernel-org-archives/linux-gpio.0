From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Add missing of_node_put
Date: Wed, 29 Jun 2016 10:08:39 +0200
Message-ID: <CACRpkdbOBG8g0ifrzF0_Ub2iDS9JpVH_qtEcN+-83dkk4Hz7pQ@mail.gmail.com>
References: <20160624130630.GA11858@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:34219 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752553AbcF2IIk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2016 04:08:40 -0400
Received: by mail-ob0-f180.google.com with SMTP id ru5so15081710obc.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2016 01:08:40 -0700 (PDT)
In-Reply-To: <20160624130630.GA11858@amitoj-Inspiron-3542>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Cc: Barry Song <baohua@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On Fri, Jun 24, 2016 at 3:06 PM, Amitoj Kaur Chawla
<amitoj1606@gmail.com> wrote:

> of_find_node_by_name does an of_node_get on its return value,
> so an of_node_put is needed on this value before the corresponding
> variable goes out of scope.
>
> The Coccinelle semantic patch used to make this change is as follows:
> @@
> struct device_node *n;
> struct device_node *n1;
> statement S;
> identifier f;
> expression E;
> constant C;
> @@
>
> n = of_find_node_by_name(...)
> ...
> if (!n) S
> ... when != of_node_put(n)
>     when != n1 = f(n,...)
>     when != E = n
>     when any
>     when strict
> (
> + of_node_put(n);
>   return -C;
> |
>   of_node_put(n);
> |
>   n1 = f(n,...)
> |
>   E = n
> |
>   return ...;
> )
>
> Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>

Patch applied.

Yours,
Linus Walleij
