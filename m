From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: davinci: Assign first bank regs for unbanked case
Date: Thu, 30 Nov 2017 15:42:07 +0100
Message-ID: <CACRpkdYVzvbJR+Y-7GpA2BwqJjS6=J6zp6Pf5UVxOt0mp4nJ0A@mail.gmail.com>
References: <1510312397-29040-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:41348 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752179AbdK3OmI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 09:42:08 -0500
Received: by mail-it0-f67.google.com with SMTP id x28so8583042ita.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 06:42:08 -0800 (PST)
In-Reply-To: <1510312397-29040-1-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>

On Fri, Nov 10, 2017 at 12:13 PM, Keerthy <j-keerthy@ti.com> wrote:

> As per the re-design assign the first bank regs for unbanked
> irq case. This was missed out in the original patch.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> Fixes: b5cf3fd827d2e1 ("gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip")
> ---
>
> Changes in v2:
>
>   * Fixed $Author

Patch applied for fixes, sorry for eternal delay.

Keerthy, if you work on DaVinci, would you mind looking quickly at this
patch:
https://marc.info/?l=linux-input&m=151151651401442&w=2

Yours,
Linus Walleij
