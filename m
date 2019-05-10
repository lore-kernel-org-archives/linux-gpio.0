From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 0/2] pinctrl: stm32: add suspend/resume management
Date: Fri, 10 May 2019 09:42:28 +0200
Message-ID: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
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

During power sequence, GPIO hardware registers could be lost if the power
supply is switched off. Each device using pinctrl API is in charge of
managing pins during suspend/resume sequences. But for pins used as gpio or
irq stm32 pinctrl driver has to save the hardware configuration.
Each register will be saved at runtime and restored during resume sequence.

Regards
Alex


Alexandre Torgue (2):
  pinctrl: stm32: add suspend/resume management
  pinctrl: stm32: Enable suspend/resume for stm32mp157c SoC

 drivers/pinctrl/stm32/pinctrl-stm32.c      | 132 +++++++++++++++++++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h      |   2 +
 drivers/pinctrl/stm32/pinctrl-stm32mp157.c |   5 ++
 3 files changed, 139 insertions(+)

-- 
2.7.4
