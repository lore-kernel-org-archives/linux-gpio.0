From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7794: Add DU pin groups
Date: Fri, 15 Apr 2016 10:30:26 +0200
Message-ID: <CACRpkdbJtBVCbvYxC5bty7oLxC=20H2Y9F0L-hsqh8H7bp=gwQ@mail.gmail.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
	<3647462.hH7yCUNCYQ@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35232 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753085AbcDOIa1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Apr 2016 04:30:27 -0400
Received: by mail-oi0-f45.google.com with SMTP id p188so117620418oih.2
        for <linux-gpio@vger.kernel.org>; Fri, 15 Apr 2016 01:30:27 -0700 (PDT)
In-Reply-To: <3647462.hH7yCUNCYQ@wasted.cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>

On Wed, Apr 13, 2016 at 8:01 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> r8a7794 PFC DU support from the R-Car Gen2 v1.9.4 BSP
>
> [Magnus: added the description, added missing dot clock output signals,
> separated CDE and DISP signals, broke out the ODDF signal from the sync
> group.]
>
> [Sergei: resolved rejects, folded in Magnus' patches, killed empty lines,
> reordered pin/mux arrays and pin groups, fixed up some comments to the pin
> arrays, removed the "du" function splitting its groups between the "du0"
> and "du1" functions.]
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Looks fine to me, Geert do you want to stack more stuff or should
I apply it directly?

> ---
> The patch is against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'.

I just pulled a first set of new stuff from Geert. Will it apply on top?

Yours,
Linus Walleij
