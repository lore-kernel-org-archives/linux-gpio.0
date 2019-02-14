From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 0/2] pinctrl STM32 updates
Date: Thu, 14 Feb 2019 17:54:23 +0100
Message-ID: <1550163266-19975-1-git-send-email-alexandre.torgue@st.com>
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
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-gpio@vger.kernel.org, alexandre.torgue@st.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: linux-gpio@vger.kernel.org

Please find 2 updates for STM32 pinctrl driver:

 -Fix a memory leak issue present since the beginning of the driver.
 -Handle error case when a hwspinlock can't get locked.

regards
Alex

Alexandre Torgue (2):
  pinctrl: stm32: fix memory leak issue
  pinctrl: stm32: return error upon hwspinlock failure

 drivers/pinctrl/stm32/pinctrl-stm32.c | 70 ++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 30 deletions(-)

-- 
2.7.4
