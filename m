From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] pinctrl: pxa: add pxa27x pin control support
Date: Mon, 30 Nov 2015 14:05:35 +0100
Message-ID: <CACRpkdaJO6noUd_a5d122G3EiO6-u9bu_gZMg1Tky=PS9O5yUA@mail.gmail.com>
References: <1448129093-20722-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35089 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753943AbbK3NFg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 08:05:36 -0500
Received: by oige206 with SMTP id e206so94124453oig.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2015 05:05:35 -0800 (PST)
In-Reply-To: <1448129093-20722-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Daniel Mack <daniel@zonque.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sat, Nov 21, 2015 at 7:04 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> I've been working on this for some time now, it's time pxa archtecture gets a
> proper pin control support.
>
> This serie provides support for pxa27x architecture, and paves the way to pxa2xx
> one. I've tested this on my pxa27x board, in both device-tree and non
> device-tree builds.

So in 2013 Haojian removed PXA3xx, MMP2, PXA168 and PXA910 in favor
of using pinctrl-single.c shared with OMAP.

See
commit 62194200e5e383af2085faf35b6f009364446069
"pinctrl: remove pxa pinctrl driver"

What makes the PXA27x so different from its siblings that it still
warrants its own driver? Why can this one not use pinctrl-single
as well?

Yours,
Linus Walleij
