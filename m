From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/3] MIPS: Cleanup Loongson-2F's gpio driver
Date: Wed, 1 Apr 2015 11:41:30 +0900
Message-ID: <CAAVeFuLFuvSBzK1xviX6oB6f=3dmhaR1_rEOEXdEwgFg-kUndQ@mail.gmail.com>
References: <1427854809-28472-1-git-send-email-chenhc@lemote.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:36107 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753358AbbDAClu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2015 22:41:50 -0400
Received: by igbud6 with SMTP id ud6so36528127igb.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2015 19:41:50 -0700 (PDT)
In-Reply-To: <1427854809-28472-1-git-send-email-chenhc@lemote.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Huacai Chen <chenhc@lemote.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>

On Wed, Apr 1, 2015 at 11:20 AM, Huacai Chen <chenhc@lemote.com> wrote:
> This cleanup is prepare to move the driver to drivers/gpio. Custom
> definitions of gpio_get_value()/gpio_set_value() are dropped.
>
> Acked-by: Ralf Baechle <ralf@linux-mips.org>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

The series,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
