From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Remove reserved bits from R8A7794 PFC driver
Date: Fri, 28 Apr 2017 20:50:27 +0300
Message-ID: <20170428175027.394862575@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: linux-gpio@vger.kernel.org

Hello!

   Here's a set of 2 patches against the 'devel' branch of Linus Walleij's
'linux-pinctrl.git' plus the R8A7794 PFC driver patch renaming IIC0/1 signals.
The patches remove now reserved bits and pieces from the R8A7794 PFC driver.

[1/2] pinctrl: sh-pfc: r8a7794: remove AVB_AVTP_* groups
[2/2] pinctrl: sh-pfc: r8a7794: remove reserved bits

MBR, Sergei
