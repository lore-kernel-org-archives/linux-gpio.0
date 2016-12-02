From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] pinctrl: sx150x fixes for the 4-pin chips
Date: Fri, 2 Dec 2016 14:04:34 +0100
Message-ID: <CACRpkdZ0uqw9x6q6x2AJsJ6iVh+QOa-0TYuou6xWk-nUYi8pPA@mail.gmail.com>
References: <1480675876-19540-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:35789 "EHLO
        mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758941AbcLBNE6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Dec 2016 08:04:58 -0500
Received: by mail-qk0-f170.google.com with SMTP id n204so277807582qke.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Dec 2016 05:04:35 -0800 (PST)
In-Reply-To: <1480675876-19540-1-git-send-email-peda@axentia.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Dec 2, 2016 at 11:51 AM, Peter Rosin <peda@axentia.se> wrote:

> I found some more issues when reading the sx150x code.

Thanks, I applied all for v4.10.

> Only the first patch actually fixes a problem. I didn't want to add a
> Fixes tag, since I don't know if commits on the pinctrl devel branch
> are considered stable? Or if you perhaps want to squash this patch with
> the patch it fixes?

Nah I just applied them.

This kernel cycle moves the driver and rewrites it and everything
and a bit of fuzz should be expected so last minute changes
should be regarded as business as usual.

I'm just happy about all the people that paid so much attention
to this driver in the v4.10 cycle :D

Yours,
Linus Walleij
