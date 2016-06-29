From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add Renesas R8A7792 PFC support
Date: Thu, 30 Jun 2016 00:19:07 +0300
Message-ID: <1748403.xeiuK39ynx@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org, geert+renesas@glider.be
List-Id: linux-gpio@vger.kernel.org

Hello.

   Here's the set of 2 patches against the 'devel' branch of Linus Walleij's
'linux-pinctrl.git' repo. Here we add the PFC support for the Renesas R8A7792
SoC (with a prior header cleanup).

[1/2] pinctrl: sh-pfc: fix overly long lines
[2/2] pinctrl: sh-pfc: add R8A7792 PFC support

WBR, Sergei
