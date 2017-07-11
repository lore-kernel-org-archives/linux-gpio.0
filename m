From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/2] gpio: select IRQ_DOMAIN_HIERARCHY fixing curcular Kconfig
 dependency
Date: Wed, 12 Jul 2017 08:11:48 +0900
Message-ID: <1499814710-16686-1-git-send-email-yamada.masahiro@socionext.com>
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
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

1/2 touches pinctrl driver, but
I want both patches in GPIO tree
because 1/2 is a prerequisite for 2/2.

Otherwise, Kconfig reports recursive dependency.

I noticed this problem when I added "select IRQ_DOMAIN_HIERARCHY"
to my GPIO driver, which I will submit later.

Please apply 1/2 to GPIO tree, not pinctrl tree.



Masahiro Yamada (2):
  pinctrl: stm32: select IRQ_DOMAIN_HIERARCHY instead of depends on
  gpio: xgene-sb: select IRQ_DOMAIN_HIERARCHY

 drivers/gpio/Kconfig          | 1 +
 drivers/pinctrl/stm32/Kconfig | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.7.4
