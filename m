From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/4] pinctrl: sh-pfc: r8a7794: Add tpu groups and function
Date: Mon, 18 Dec 2017 12:12:34 +0100
Message-ID: <CAMuHMdUF0TEqhY5-DHpru-9pMvfChCOVjFkNapspdsr=dD4xdg@mail.gmail.com>
References: <1513249026-26759-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513249026-26759-4-git-send-email-fabrizio.castro@bp.renesas.com> <CAMuHMdVhB7KRD_mR0gmVHnPr+AdqgLN10XmszAs-f4=wnAWKAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:36364 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756500AbdLRLMf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Dec 2017 06:12:35 -0500
In-Reply-To: <CAMuHMdVhB7KRD_mR0gmVHnPr+AdqgLN10XmszAs-f4=wnAWKAQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-gpio@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>

On Mon, Dec 18, 2017 at 12:09 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Dec 14, 2017 at 11:57 AM, Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
>> This patch adds tpu groups and function to r8a7745/r8a7794.
>>
>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in sh-pfc-for-v4.16.

Oops, missed one thing: please use alphabetical sort order when adding
new entries.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
