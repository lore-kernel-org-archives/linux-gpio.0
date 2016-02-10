From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add Renesas R8A7794 audio PFC support
Date: Thu, 11 Feb 2016 01:37:42 +0300
Message-ID: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org, geert+renesas@glider.be
List-Id: linux-gpio@vger.kernel.org

Hello.

   Here's the set of 2 patches against the 'devel' branch of Linus Walleij's
'linux-pinctrl.git' repo. Here we add the PFC support for the Renesas R8A7794
SSI devices and audio clocks.

[1/2] pinctrl: sh-pfc: r8a7794: add SSI pin groups
[2/2] pinctrl: sh-pfc: r8a7794: add audio clock pin groups

WBR, Sergei
