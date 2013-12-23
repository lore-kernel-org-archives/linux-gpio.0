From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5] gpio: add GPIO support for SMSC SCH311x
Date: Mon, 23 Dec 2013 18:11:07 +0100
Message-ID: <CACRpkdZ0u5uZ+S0AYTkAnOEm2dxTdBO+SYCagEk6qgPZ3tSkdA@mail.gmail.com>
References: <1387792903-4286-1-git-send-email-br1@einfach.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:45335 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757688Ab3LWRLJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Dec 2013 12:11:09 -0500
Received: by mail-oa0-f47.google.com with SMTP id k1so5902182oag.20
        for <linux-gpio@vger.kernel.org>; Mon, 23 Dec 2013 09:11:08 -0800 (PST)
In-Reply-To: <1387792903-4286-1-git-send-email-br1@einfach.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bruno Randolf <br1@einfach.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>

On Mon, Dec 23, 2013 at 11:01 AM, Bruno Randolf <br1@einfach.org> wrote:

> This patch adds support for the GPIOs found on the SMSC "Super I/O" chips
> SCH3112, SCH3114 and SCH3116.
>
> The chip detection and I/O functions are copied from sch311x_wdt.
>
> Signed-off-by: Bruno Randolf <br1@einfach.org>
>
> ---
> Notes (v5):
> - #include <linux/io.h> to avoid error "implicit declaration of function 'outb'
>   [-Werror=implicit-function-declaration]"

Please send incremental patches after I have applied the patches
to my tree. Applying this would force me to revert or rebase the
tree, both bad alternatives.

I will go and fix this myself now.

Yours,
Linus Walleij
