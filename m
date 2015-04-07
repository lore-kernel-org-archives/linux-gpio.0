From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] MIPS: Cleanup Loongson-2F's gpio driver
Date: Tue, 7 Apr 2015 11:11:29 +0200
Message-ID: <CACRpkdbzbivfr3t1dWSiRaB+9nuTxWqUR-fUy2Pt2PDndo41PA@mail.gmail.com>
References: <1427337288-8411-1-git-send-email-chenhc@lemote.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:37400 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752719AbbDGJLa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 05:11:30 -0400
Received: by igblo3 with SMTP id lo3so6257643igb.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 02:11:29 -0700 (PDT)
In-Reply-To: <1427337288-8411-1-git-send-email-chenhc@lemote.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Huacai Chen <chenhc@lemote.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>

On Thu, Mar 26, 2015 at 3:34 AM, Huacai Chen <chenhc@lemote.com> wrote:

> This cleanup is prepare to move the driver to drivers/gpio. Custom
> definitions of gpio_get_value()/gpio_set_value() are dropped.
>
> Acked-by: Ralf Baechle <ralf@linux-mips.org>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Patch applied to the GPIO tree.

Yours,
Linus Walleij
