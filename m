From: John Keeping <john@metanate.com>
Subject: [PATCH v2 0/4] pinctrl: rockchip: PREEMPT_RT_FULL fixes
Date: Wed, 15 Mar 2017 17:46:50 +0000
Message-ID: <20170315174654.15128-1-john@metanate.com>
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

This is an updated version of [1] rebased on top of pinctrl/for-next.
The only change is in patch 1 to remove locking in the new
rockchip_set_schmitt() function.

The aim of the series is to make the Rockchip pinctrl irq_chip
implementation safe for use with RT_FULL which requires that raw
spinlocks are used to avoid sleeping in hardirq context.

[1] https://www.spinics.net/lists/arm-kernel/msg568279.html

John Keeping (4):
  pinctrl: rockchip: remove unnecessary locking
  pinctrl: rockchip: convert to raw spinlock
  pinctrl: rockchip: split out verification of mux settings
  pinctrl: rockchip: avoid hardirq-unsafe functions in irq_chip

 drivers/pinctrl/pinctrl-rockchip.c | 148 ++++++++++++++++++++++---------------
 1 file changed, 87 insertions(+), 61 deletions(-)

-- 
2.12.0.377.gf910686b23.dirty
