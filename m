From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: at91-pio4: handle suspend to ram
Date: Fri, 7 Apr 2017 12:16:22 +0200
Message-ID: <CACRpkdYFPhewV4NLNxxVkXCwuyoo3rgeLt0auErS47R=055FHQ@mail.gmail.com>
References: <20170406133623.19160-1-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:38801 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752023AbdDGKQX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2017 06:16:23 -0400
Received: by mail-it0-f44.google.com with SMTP id y18so40414527itc.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2017 03:16:23 -0700 (PDT)
In-Reply-To: <20170406133623.19160-1-alexandre.belloni@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Apr 6, 2017 at 3:36 PM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:

> When suspending to RAM, the power to the core is cut and the register
> values are lost. Save and restore more registers than just IMR.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Should this be tagged for stable?

Waiting for input from the AT91 maintainers here.

Yours,
Linus Walleij
