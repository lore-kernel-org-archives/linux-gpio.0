From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: [PATH] Fix ies/smt and register irq fail bug.
Date: Wed, 27 May 2015 02:43:53 -0700
Message-ID: <1432719835-18939-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Axel Lin <axel.lin@ingics.com>, Maoguang Meng <maoguang.meng@mediatek.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, eddie.huang@mediatek.com, dandan.he@mediatek.com
List-Id: linux-gpio@vger.kernel.org

Hi Linus,
After integration test, we found some bugs in the code you just merged.
The first is that I missed ies/smt configuration for MSDC3.
The seconed is the if judgement for "interrupt-controller" I added last
time should on the contrary. So adding these two patches to fix them.
Sorry about this. And please help to merge them, many thanks.

These patches include below changes:
- Adding MSDC3 ies/smt support for mt8173.
- Since mt6397 is no need to support interrupt controller,
I judged "interrupt-controller" property to skip it last time,
but the if judgement should on the contrary, this is a bug.
so adding this patch to fix it. 
 
Hongzhou Yang (2):
  pinctrl: mediatek: Fix bug of ies/smt setting for mt8173.
  pinctrl: mediatek: Fix pinctrl register irq fail bug.

 drivers/pinctrl/mediatek/pinctrl-mt8173.c     |   10 +++++++++-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    4 ++--
 2 files changed, 11 insertions(+), 3 deletions(-)

--
1.7.9.5
