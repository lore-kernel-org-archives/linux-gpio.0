From: Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 0/2] pinctrl: mediatek: mt8183: Add support for wake sources
Date: Wed,  8 May 2019 15:33:29 +0800
Message-ID: <20190508073331.27475-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org, swboyd@chromium.org
List-Id: linux-gpio@vger.kernel.org

This adds support for wake sources in pinctrl-mtk-common-v2, and
pinctrl-mt8183. Without this patch, all interrupts that are left
enabled on suspend act as wake sources (and wake sources without
interrupt enabled do not).

Changes since v1:
 - Move changes from mtk-common-v2 to mtk-pinctrl-paris, as
   recommended by Sean, to keep better separation between eint
   and pinctrl-common features.

Nicolas Boichat (2):
  pinctrl: mediatek: Add pm_ops to pinctrl-paris
  pinctrl: mediatek: mt8183: Add mtk_pinctrl_paris_pm_ops

 drivers/pinctrl/mediatek/pinctrl-mt8183.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-paris.c  | 19 +++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.h  |  2 ++
 3 files changed, 22 insertions(+)

-- 
2.21.0.1020.gf2820cf01a-goog
