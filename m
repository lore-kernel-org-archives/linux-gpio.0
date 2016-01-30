From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH v4 0/2] add pinctrl support for rk3399
Date: Sat, 30 Jan 2016 20:20:11 +0800
Message-ID: <1454156413-56148-1-git-send-email-david.wu@rock-chips.com>
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
To: heiko@sntech.de
Cc: huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, cf@rock-chips.com, xjq@rock-chips.com, linux-gpio@vger.kernel.org, David Wu <david.wu@rock-chips.com>, zyw@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Test on rk3399 fpga-board

David Wu (2):
  pinctrl: rockchip: add support for the rk3399
  dt-bindings: rockchip-pinctrl: Support the RK3399 SoCs compatible

 .../bindings/pinctrl/rockchip,pinctrl.txt          |   1 +
 drivers/pinctrl/pinctrl-rockchip.c                 | 372 ++++++++++++++++++++-
 2 files changed, 359 insertions(+), 14 deletions(-)

-- 
1.9.1
