From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] MIPS: Cleanup Loongson-2F's gpio driver
Date: Tue, 7 Apr 2015 11:14:51 +0200
Message-ID: <CACRpkdbDuT9SUZeM6wdCE1jMidkae0oc9t0g=uKWKUk5eBmiiQ@mail.gmail.com>
References: <1427854809-28472-1-git-send-email-chenhc@lemote.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:36669 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753089AbbDGJOv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 05:14:51 -0400
Received: by iebrs15 with SMTP id rs15so41265670ieb.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 02:14:51 -0700 (PDT)
In-Reply-To: <1427854809-28472-1-git-send-email-chenhc@lemote.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Huacai Chen <chenhc@lemote.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>

On Wed, Apr 1, 2015 at 4:20 AM, Huacai Chen <chenhc@lemote.com> wrote:

> This cleanup is prepare to move the driver to drivers/gpio. Custom
> definitions of gpio_get_value()/gpio_set_value() are dropped.
>
> Acked-by: Ralf Baechle <ralf@linux-mips.org>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

OK applied this v2 version instead. Dunno if it is any
different but better be on the safe side.

Yours,
Linus Walleij
