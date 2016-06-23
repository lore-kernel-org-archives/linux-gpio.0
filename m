From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7795: Add DRIF support
Date: Thu, 23 Jun 2016 10:41:32 +0200
Message-ID: <CAMuHMdWkMkmnf4KzhXcNdpPxFxogczUHgSZuc5Fn6hAWwkq==Q@mail.gmail.com>
References: <1466165981-65284-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <1466669510-26576-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:32865 "EHLO
	mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751527AbcFWIld (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 04:41:33 -0400
In-Reply-To: <1466669510-26576-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chris Paterson <chris.paterson2@renesas.com>

On Thu, Jun 23, 2016 at 10:11 AM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram@bp.renesas.com> wrote:
> This patch adds DRIF[0-3] pinmux support for r8a7795 SoC.
>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> ---
> Thanks Geert for the review.
>
> This patch is based on renesas-drivers repo (tag:renesas-drivers-2016-06-21-v4.7-rc4)
>
> Changes since v1:
>  - Split DRIF data pins as separate groups so that unused data pins can be
>    configured as GPIO (Geert)
>  - Fixed DRIF3(A) D1 pin definition typo (Geert)
>  - Rebased to latest tag renesas-drivers-2016-06-21-v4.7-rc4

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Queued in sh-pfc-for-v4.8.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
