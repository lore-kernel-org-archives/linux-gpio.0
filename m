From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 0/3] pinctrl: sunxi: Support variants
Date: Sun,  8 Jan 2017 22:31:14 +0100
Message-ID: <cover.53580d3fc31eec98682d3d81f17be89610d397ee.1483911013.git-series.maxime.ripard@free-electrons.com>
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
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.xyz>
List-Id: linux-gpio@vger.kernel.org

Hi,

This serie aims at bringing in a mechanism that allow to support both
multiple SoCs based on the same pin and functions table, and to restrict
those pins and functions only to a subset of the SoCs supported.

As the diffstat shows, it allows to reduce greatly the number of lines of
code (and hence the size of the kernel image) by reducing the duplication
on family of the similar SoCs.

Let me know what you think,
Maxime

Maxime Ripard (3):
  pinctrl: sunxi: Add pinctrl variants
  pinctrl: sunxi: Add common sun5i pinctrl driver
  pinctrl: sunxi: Remove old sun5i pinctrl drivers

 drivers/pinctrl/sunxi/Kconfig              |  10 +-
 drivers/pinctrl/sunxi/Makefile             |   4 +-
 drivers/pinctrl/sunxi/pinctrl-gr8.c        | 536 +----------------
 drivers/pinctrl/sunxi/pinctrl-sun5i-a10s.c | 685 +--------------------
 drivers/pinctrl/sunxi/pinctrl-sun5i-a13.c  | 403 +------------
 drivers/pinctrl/sunxi/pinctrl-sun5i.c      | 756 ++++++++++++++++++++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c      |  77 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h      |  30 +-
 8 files changed, 843 insertions(+), 1658 deletions(-)
 delete mode 100644 drivers/pinctrl/sunxi/pinctrl-gr8.c
 delete mode 100644 drivers/pinctrl/sunxi/pinctrl-sun5i-a10s.c
 delete mode 100644 drivers/pinctrl/sunxi/pinctrl-sun5i-a13.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun5i.c

base-commit: 7ce7d89f48834cefece7804d38fc5d85382edf77
-- 
git-series 0.8.11
