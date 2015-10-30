From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Make PORT_GP_x() macros consistent
Date: Fri, 30 Oct 2015 15:07:44 +0100
Message-ID: <CACRpkdZ=xher-CLsNWaTCbrVyp61rQ1vXjB60B5Pi0_77-6idQ@mail.gmail.com>
References: <1446147587-20216-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34416 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966086AbbJ3OHp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 10:07:45 -0400
Received: by oies66 with SMTP id s66so59261018oie.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2015 07:07:45 -0700 (PDT)
In-Reply-To: <1446147587-20216-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Oct 29, 2015 at 8:39 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> On r8a7795, PORT_GP_x() is a macro for defining GPIOs 0..x.
> In all other sh-pfc code, PORT_GP_x() is a macro for defining GPIOs
> 0..(x-1).
>
> Make the r8a7795 macro definitions consistent with the rest of the
> sh-pfc codebase.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Counting on you to stack this up again, but let's save the next pull
request until after the merge window.

Yours,
Linus Walleij
