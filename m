From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [RFC PATCH 0/2] Add can_clk function
Date: Fri, 10 Nov 2017 17:16:27 +0000
Message-ID: <1510334189-8942-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <CAMuHMdV=8rAE5z2VmCjL-M_MXY6TsKM_+0c-bsqDsjDZYWU1FA@mail.gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:13677 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750782AbdKJRQh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Nov 2017 12:16:37 -0500
In-Reply-To: <CAMuHMdV=8rAE5z2VmCjL-M_MXY6TsKM_+0c-bsqDsjDZYWU1FA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

Hello Geert, All

thank you for your comments on patch:
"pinctrl: sh-pfc: r8a7745: Add CAN[01] support"

Looking at file drivers/pinctrl/sh-pfc/pfc-r8a7791.c, it looks like
it could use the same enhancement.
This series applies Geert's recommendation to both pfc-r8a7791.c and
pfc-r8a7794.c.
Unfortunately I wasn't able to actually test this patch set as I
don't have access to HW providing can_clk.

Best regards,

Fabrizio Castro (2):
  pinctrl: sh-pfc: r8a7745: Add can_clk function
  pinctrl: sh-pfc: r8a7743: Add can_clk function

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 10 +++++-----
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.7.4

