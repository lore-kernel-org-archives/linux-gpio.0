From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7795: Remove bits SEL_VSP_1 and SEL_VSP_0
Date: Wed, 27 Jan 2016 10:53:23 +0100
Message-ID: <CACRpkdaqiYmTOVV3f5PEGyihuH+CRieNhCGfBWi7Lg3MBhC05g@mail.gmail.com>
References: <1452856024-10793-1-git-send-email-geert+renesas@glider.be>
	<1452856024-10793-3-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:36312 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753458AbcA0JxX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 04:53:23 -0500
Received: by mail-ob0-f173.google.com with SMTP id ba1so2759044obb.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2016 01:53:23 -0800 (PST)
In-Reply-To: <1452856024-10793-3-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jan 15, 2016 at 12:07 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Cfr. Manual Errata for Rev 0.50 of the R-Car Gen3 datasheet.
>
> This has no user-visible impact, as the definitions were not really
> used.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess there will still be a huge influx of SH-PFC patches so we should
keep running pull request from you to me for the v4.6 kernel cycle.

Yours,
Linus Walleij
