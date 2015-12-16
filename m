From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7791: add EtherAVB pin groups
Date: Wed, 16 Dec 2015 11:27:36 +0100
Message-ID: <CAMuHMdX_XDdhV1GXhUkppvHKFeJDno02B=2mvH_6gkJK_hyZMw@mail.gmail.com>
References: <13219129.kD4pZSmcAP@wasted.cogentembedded.com>
	<4277494.6KPmCjaGvB@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33110 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754735AbbLPK1h (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2015 05:27:37 -0500
In-Reply-To: <4277494.6KPmCjaGvB@wasted.cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux-sh list <linux-sh@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Dec 14, 2015 at 11:06 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the EtherAVB pin groups to the R8A7791 PFC driver.
>
> Also add the copyright for all the Cogent Embedded's past work on this file.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thank you, queued for v4.5.

> ---
> The patch is against the 'devel' branch of Linus W.'s 'linux-pinctrl.git' repo.
>
> Changes in version 2:
> - added AVB_TX_ER pin to the AVB MII group;
> - added Cogent Embedded's copyright;
> - refreshed the patch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
