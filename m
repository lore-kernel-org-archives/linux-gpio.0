From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] fixup! pinctrl: pxa: pxa2xx: add pin control skeleton
Date: Tue, 15 Dec 2015 14:08:13 +0100
Message-ID: <CACRpkdZgHWwGXhSv4D9-oyS1wW_ZGDpyUfM47-EbU9ujNRD3Mg@mail.gmail.com>
References: <1449956585-17118-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36859 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752496AbbLONIO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2015 08:08:14 -0500
Received: by mail-oi0-f47.google.com with SMTP id n133so4264837oia.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2015 05:08:13 -0800 (PST)
In-Reply-To: <1449956585-17118-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Dec 12, 2015 at 10:43 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> The wrong free functions were used to release temporary buffers.
>
> This didn't show up in the normal driver's life. Yet in suspend to RAM,
> the managed resource list is walked, and as memory was released, the
> list is corrupted and make the kernel Oops.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
> Linus, if it's time, then this can fixup the commit. If not, I'll
> provide a better commit message.

I just applied it on top of my branch, removing the "fixup!"
comment. It's enough of a commit message I think.

Yours,
Linus Walleij
