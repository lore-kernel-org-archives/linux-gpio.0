From: John Keeping <john@metanate.com>
Subject: [PATCH v3 0/4] pinctrl: rockchip: PREEMPT_RT_FULL fixes
Date: Fri, 17 Mar 2017 18:24:26 +0000
Message-ID: <20170317182430.27400-1-john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Julia Cartwright <julia@ni.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, John Keeping <john@metanate.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

The aim of the series is to make the Rockchip pinctrl irq_chip
implementation safe for use with RT_FULL which requires that raw
spinlocks are used to avoid sleeping in hardirq context.

This is the same as version 2 [1] with the 2.1 version of patch 1
included, but I'm rolling it up as a new version so it's simpler to
apply.

[1] https://www.spinics.net/lists/arm-kernel/msg568974.html

John Keeping (4):
  pinctrl: rockchip: remove unnecessary locking
  pinctrl: rockchip: convert to raw spinlock
  pinctrl: rockchip: split out verification of mux settings
  pinctrl: rockchip: avoid hardirq-unsafe functions in irq_chip

 drivers/pinctrl/pinctrl-rockchip.c | 149 +++++++++++++++++++++----------------
 1 file changed, 85 insertions(+), 64 deletions(-)

-- 
2.12.0.377.gf910686b23.dirty
