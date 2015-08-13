From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mxc: fix section mismatch warning
Date: Thu, 13 Aug 2015 15:37:32 +0200
Message-ID: <CACRpkdaEMSheoPSOVyWXdrBG3DzssvyoCVwOJP9aRewBLjWvxw@mail.gmail.com>
References: <1439297519-6099-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:33420 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752622AbbHMNhd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2015 09:37:33 -0400
Received: by obbhe7 with SMTP id he7so36949254obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2015 06:37:33 -0700 (PDT)
In-Reply-To: <1439297519-6099-1-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>

On Tue, Aug 11, 2015 at 2:51 PM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> From: Dirk Behme <dirk.behme@de.bosch.com>
>
> Fix the section mismatch warning
>
> WARNING: vmlinux.o(.text+0x2b2788): Section mismatch in reference from the function mxc_gpio_probe() to the function .init.text:mxc_gpio_init_gc()
> The function mxc_gpio_probe() references
> the function __init mxc_gpio_init_gc().
> This is often because mxc_gpio_probe lacks a __init
> annotation or the annotation of mxc_gpio_init_gc is wrong.
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Patch applied.

Yours,
Linus Walleij
