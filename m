From: Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 0/2] pinctrl: mediatek: Fix 2 issues related to resume from wake sources.
Date: Mon, 29 Apr 2019 11:55:13 +0800
Message-ID: <20190429035515.73611-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org, swboyd@chromium.org
List-Id: linux-gpio@vger.kernel.org

This fixes 2 issues when resuming from a wake source, especially if these
wake sources are level-sensitive.

Tested on mt8183 with the series in https://patchwork.kernel.org/cover/10921121/,
but this should affect all mediatek platforms.

Nicolas Boichat (2):
  pinctrl: mediatek: Ignore interrupts that are wake only during resume
  pinctrl: mediatek: Update cur_mask in mask/mask ops

 drivers/pinctrl/mediatek/mtk-eint.c | 34 ++++++++++++++++-------------
 1 file changed, 19 insertions(+), 15 deletions(-)

-- 
2.21.0.593.g511ec345e18-goog
