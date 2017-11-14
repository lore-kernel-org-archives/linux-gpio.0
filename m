From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 0/2] Add can_clk function
Date: Tue, 14 Nov 2017 15:41:15 +0000
Message-ID: <1510674077-31136-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
List-Id: linux-gpio@vger.kernel.org

Dear Geert, All,

this series adds can_clk function to r8a779[14] and r8a774[35] while keeping
can_clk* pins inside can0_groups and can1_groups for backwards compatibility.

Best regards,

Fabrizio Castro (2):
  pinctrl: sh-pfc: r8a7794: Add can_clk function
  pinctrl: sh-pfc: r8a7791: Add can_clk function

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 22 +++++++++++++++++++++-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 20 ++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)

-- 
2.7.4
