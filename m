From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC/RFT/PATCH V3] gpio: omap: refresh patch "be more aggressive
 with pm_runtime" against v3.12-rc5
Date: Mon, 9 Dec 2013 11:15:36 +0100
Message-ID: <CACRpkdbpME+TErz=ZE0Sk9=R5comaU7A7Xo3YxVjqergp=n9MA@mail.gmail.com>
References: <1385506004-14943-1-git-send-email-caesarxuchao@gmail.com>
	<1386477638-6331-1-git-send-email-caesarxuchao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:36066 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751876Ab3LIKPg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Dec 2013 05:15:36 -0500
Received: by mail-ob0-f175.google.com with SMTP id uz6so3460162obc.6
        for <linux-gpio@vger.kernel.org>; Mon, 09 Dec 2013 02:15:36 -0800 (PST)
In-Reply-To: <1386477638-6331-1-git-send-email-caesarxuchao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chao Xu <caesarxuchao@gmail.com>, Kevin Hilman <khilman@linaro.org>, "santosh.shilimkar@ti.com" <santosh.shilimkar@ti.com>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, ext Kevin Hilman <khilman@deeprootsystems.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ext Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>, Nishanth Menon <nm@ti.com>

On Sun, Dec 8, 2013 at 5:40 AM, Chao Xu <caesarxuchao@gmail.com> wrote:

> From: Felipe Balbi <balbi@ti.com>
>
> try to keep gpio block suspended as much as possible.
>
> Tested with pandaboard and a sysfs exported gpio.
>
> Signed-off-by: Felipe Balbi <balbi at ti.com>
>
> [caesarxuchao@gmail.com : Refreshed against v3.12-rc5, and added
> revision check to enable aggressive pm_runtime on OMAP4-only. Because
> am33xx_gpio_sysc.idlemodes seems to be wrongly marked as
> SIDLE_SMART_WKUP, which might cause missed interrupts with this patch.
> Tested on Pandaboard rev A2.]
> Signed-off-by: Chao Xu <caesarxuchao@gmail.com>

Kevin/Santosh: you're maintainers for this driver, can you ACK/NACK
this patch?

Yours,
Linus Walleij
