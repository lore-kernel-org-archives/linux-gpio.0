From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/1] Add missing signal data to R8A7791 PFC driver
Date: Wed, 29 Mar 2017 21:35:44 +0300
Message-ID: <20170329183544.724690205@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello!

   Here's a set of 2 patches against the 'fixes' branch of Linus Walleij's
'linux-pinctrl.git'.  The patches add support for (1) the HSCIF1 configured to
use signal group E (which is currently broken) and for (2) the DVC_MUTE signal.

[1/2] pinctrl: sh-pfc: r8a7791: add missing HSCIF1 pinmux data
[2/2] pinctrl: sh-pfc: r8a7791: add missing DVC_MUTE signal

MBR, Sergei
