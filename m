From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 0/7] This series adds pinctrl drivers for UniPhier SoC
 family.
Date: Tue, 14 Jul 2015 11:40:00 +0900
Message-ID: <1436841607-7556-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

1/7: core support code commonly used for all the pinctrl drivers.
2/7-7/7: driver for each SoC



Masahiro Yamada (7):
  pinctrl: UniPhier: add UniPhier pinctrl core support
  pinctrl: UniPhier: add UniPhier PH1-LD4 pinctrl driver
  pinctrl: UniPhier: add UniPhier PH1-Pro4 pinctrl driver
  pinctrl: UniPhier: add UniPhier PH1-sLD8 pinctrl driver
  pinctrl: UniPhier: add UniPhier PH1-Pro5 pinctrl driver
  pinctrl: UniPhier: add UniPhier ProXstream2 pinctrl driver
  pinctrl: UniPhier: add UniPhier PH1-LD6b pinctrl driver

 drivers/pinctrl/Kconfig                          |    1 +
 drivers/pinctrl/Makefile                         |    1 +
 drivers/pinctrl/uniphier/Kconfig                 |   32 +
 drivers/pinctrl/uniphier/Makefile                |    8 +
 drivers/pinctrl/uniphier/pinctrl-ph1-ld4.c       |  886 ++++++++++++
 drivers/pinctrl/uniphier/pinctrl-ph1-ld6b.c      | 1274 ++++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-ph1-pro4.c      | 1554 ++++++++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-ph1-pro5.c      | 1346 +++++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-ph1-sld8.c      |  794 +++++++++++
 drivers/pinctrl/uniphier/pinctrl-proxstream2.c   | 1269 ++++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c |  684 ++++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier.h      |  217 +++
 12 files changed, 8066 insertions(+)
 create mode 100644 drivers/pinctrl/uniphier/Kconfig
 create mode 100644 drivers/pinctrl/uniphier/Makefile
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-ld4.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-ld6b.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-pro4.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-pro5.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-sld8.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-proxstream2.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-uniphier.h

-- 
1.9.1
