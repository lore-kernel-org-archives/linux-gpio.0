From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: dwapb: re-enable GPIO_DWAPB for arm64
Date: Mon, 9 Mar 2015 11:55:13 +0100
Message-ID: <CACRpkdZa-WyOJM7KDW-R5yq8sFfiTEkA=-qkFkFn0T2-95_ZMA@mail.gmail.com>
References: <1425281034-3324-1-git-send-email-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:44599 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751300AbbCIKzO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 06:55:14 -0400
Received: by obcuy5 with SMTP id uy5so25450544obc.11
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2015 03:55:13 -0700 (PDT)
In-Reply-To: <1425281034-3324-1-git-send-email-wangkefeng.wang@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Mar 2, 2015 at 8:23 AM, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:

> Hisilicon arm64 soc uses designWare gpio, re-enable it after
> commit 1972c97db5b(gpio: dwapb: fix compile errors).
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Patch applied. I cannot see patch 1/2 I guess it's not affecting
my subsystem.

Yours,
Linus Walleij
