From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: dwapb: use dwapb_read instead of readl_relaxed
Date: Mon, 24 Apr 2017 15:09:34 +0200
Message-ID: <CACRpkdbZ5JuQLFGmejnruzyGR-6h27Cwa0EObL=V6EO=V9nRqw@mail.gmail.com>
References: <20170413094639.484-1-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:34608 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1170593AbdDXNJg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2017 09:09:36 -0400
Received: by mail-io0-f175.google.com with SMTP id a103so191018407ioj.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2017 06:09:36 -0700 (PDT)
In-Reply-To: <20170413094639.484-1-jszhang@marvell.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Apr 13, 2017 at 11:46 AM, Jisheng Zhang <jszhang@marvell.com> wrote:

> Commit 67809b974a07 ("GPIO: gpio-dwapb: Change readl&writel to
> dwapb_read&dwapb_write") missed this readl_relaxed() usage, I'm not
> sure the reason, maybe for performance reason? But if we do care
> the performance, we could use the relaxed io in dwapb_read and
> dwapb_write.
>
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>

Patch applied.

Yours,
Linus Walleij
