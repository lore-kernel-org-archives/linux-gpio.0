From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: Get rid of CONFIG_ARCH_SHMOBILE_LEGACY
Date: Fri, 25 Sep 2015 09:14:57 -0700
Message-ID: <CACRpkdZ5a3tSrvEN=a4=Sjki0_rMAo_AYiQgVCfB1pO9UAhXZQ@mail.gmail.com>
References: <1440706043-3406-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:35107 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756818AbbIYQO6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2015 12:14:58 -0400
Received: by oiww128 with SMTP id w128so60766137oiw.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2015 09:14:58 -0700 (PDT)
In-Reply-To: <1440706043-3406-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms@verge.net.au>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Aug 27, 2015 at 1:07 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Shmobile is all multiplatform these days, so get rid of the reference to
> CONFIG_ARCH_SHMOBILE_LEGACY.
>
> Move the legacy code to do the non-DT mapping between GPIOs and pins
> inside the existing #ifdef CONFIG_SUPERH section.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
