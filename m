From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: of: add missing of_node_put() in of_gpiochip_scan_gpios()
Date: Mon, 31 Oct 2016 09:23:33 +0100
Message-ID: <CACRpkdYZF=hZmOZ_2=za6j__GAKNNyya8K7WYc47nrv8_T72oA@mail.gmail.com>
References: <1477757632-26746-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:35681 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762176AbcJaIXe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2016 04:23:34 -0400
Received: by mail-qk0-f176.google.com with SMTP id z190so153063798qkc.2
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2016 01:23:33 -0700 (PDT)
In-Reply-To: <1477757632-26746-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Oct 29, 2016 at 6:13 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> When terminating for_each_available_child_of_node() iteration
> with break or return, of_node_put() should be used to prevent
> stale device node references from being left behind.
>
> This is detected by Coccinelle semantic patch.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied with Vladimir's review tag.

Yours,
Linus Walleij
