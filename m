From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/4] pinctrl: sh-pfc: r8a7740: Remove obsolete
 multi-platform check
Date: Thu, 16 Jul 2015 11:39:46 +0200
Message-ID: <CACRpkdYVG05xPub3fgphf-J_Q1V-LO9MVuT2v0Bzh1oVmvi7uw@mail.gmail.com>
References: <1436875015-13706-1-git-send-email-geert+renesas@glider.be>
	<1436875015-13706-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34413 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754815AbbGPJjr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 05:39:47 -0400
Received: by obre1 with SMTP id e1so43591766obr.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 02:39:46 -0700 (PDT)
In-Reply-To: <1436875015-13706-4-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Tue, Jul 14, 2015 at 1:56 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Since the removal of the r8a7740 legacy SoC code in commit
> 44d88c754e57a6d9 ("ARM: shmobile: Remove legacy SoC code for R-Mobile
> A1"), r8a7740 is only supported in generic ARM multi-platform builds.
> Hence CONFIG_ARCH_MULTIPLATFORM is always set, and the check can be
> removed.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> The commit mentioned above is in -next, destined for v4.3. Please apply.

Patch applied.

Yours,
Linus Walleij
