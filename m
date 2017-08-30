From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Re-add DRIF support
Date: Wed, 30 Aug 2017 16:27:14 +0200
Message-ID: <CAMuHMdXbKTOXLWP-fka6Ro2WQtx7B-zWFcEvhQDp5gM-2ehqXw@mail.gmail.com>
References: <20170830080548.17383-1-dirk.behme@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35843 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751318AbdH3O1P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2017 10:27:15 -0400
In-Reply-To: <20170830080548.17383-1-dirk.behme@de.bosch.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

On Wed, Aug 30, 2017 at 10:05 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> DRIF support for r8a7795 was initially added with commit 2d775831988
> ("pinctrl: sh-pfc: r8a7795: Add DRIF support") and later dropped from
> the new pfc-r8a7795.c while re-naming the initial pfc-r8a7795.c to
> pfc-r8a7795-es1.c in commit b205914c8f8 ("pinctrl: sh-pfc: r8a7795:
> Add support for R-Car H3 ES2.0"). As the DRIF doesn't differ, re-add
> it here.
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I.e. will queue in sh-pfc-for-v4.15.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
