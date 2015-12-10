From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [git pull] pinctrl: sh-pfc: Updates for v4.5
Date: Thu, 10 Dec 2015 15:42:20 +0100
Message-ID: <CACRpkdab461Gp904xH4fJ2JFgf_7dj+wpEw6OTOfmDHGU+FtAg@mail.gmail.com>
References: <1449752691-30438-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:33235 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752775AbbLJOmV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 09:42:21 -0500
Received: by obbsd4 with SMTP id sd4so10583999obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 06:42:20 -0800 (PST)
In-Reply-To: <1449752691-30438-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Thu, Dec 10, 2015 at 2:04 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

>         Hi Linus,
>
> The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:
>
>   Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc-for-v4.5
>
> for you to fetch changes up to f27200f9dce59ce5063bf722ef6ccedd34e4357b:
>
>   pinctrl: sh-pfc: r8a7795: Add SCIF_CLK support (2015-12-08 14:18:45 +0100)
>
> Summary:
>   - r8a7791: Add support for SCIF_CLK,
>   - r8a7795: Add support for HSCIF, MSIOF, and SCIF_CLK,
>   - sh73a0: Add support for MSIOF,
>   - Assorted fixes, cleanups and consolidatons.
>
> Thanks for pulling!

Pulled this to my devel branch in the pin control tree, thanks!

And I see there are already more patches brewing...

Yours,
Linus Walleij
