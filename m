From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: ti-iodelay: Fix return value check in ti_iodelay_probe()
Date: Thu, 19 Jan 2017 00:29:25 +0100
Message-ID: <CACRpkdYZ0g5ZA-exhAOLRmbq2LQ52OY9=tcW=L2p0ZNpHQWfug@mail.gmail.com>
References: <20170117144147.18540-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:35236 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751276AbdARXaE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2017 18:30:04 -0500
Received: by mail-qt0-f181.google.com with SMTP id x49so37515794qtc.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2017 15:29:26 -0800 (PST)
In-Reply-To: <20170117144147.18540-1-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Tony Lindgren <tony@atomide.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 17, 2017 at 3:41 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> In case of error, the function pinctrl_register() returns
> NULL not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.
>
> Fixes: 003910ebc83b ("pinctrl: Introduce TI IOdelay configuration driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

This does not apply on the devel branch of the pin control
tree. Please rebase it and resend. Include Tony's ACK.

Yours,
Linus Walleij
