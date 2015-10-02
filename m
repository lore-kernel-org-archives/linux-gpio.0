From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] sh-pfc: r8a7795: add EtherAVB support
Date: Fri, 2 Oct 2015 03:27:22 -0700
Message-ID: <CACRpkdYiPRGVCSUho+QJ38F0w87cJ0opu3-rjLO8mNYCErtSPQ@mail.gmail.com>
References: <1442471136-31894-1-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34032 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751767AbbJBK1W (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2015 06:27:22 -0400
Received: by obbda8 with SMTP id da8so78738766obb.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2015 03:27:22 -0700 (PDT)
In-Reply-To: <1442471136-31894-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Wed, Sep 16, 2015 at 11:25 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:

> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds EthernetAVB
>
> Based on a much lager patch by Takeshi Kihara which was
> originally posted by Kuninori Morimoto.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> [horms: extracted from a larger patch;
>         corrected swapped {MATCH,CAPTURE_A} pins]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Geert will handle this patch.

Yours,
Linus Walleij
