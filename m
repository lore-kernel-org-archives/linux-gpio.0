From: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
Subject: [PATCH 0/2] Optimizes, cleans up and enhances stm32-exti irq hierarchy
Date: Wed, 21 Feb 2018 14:50:25 +0100
Message-ID: <1519221027-4028-1-git-send-email-radoslaw.pietrzyk@gmail.com>
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
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Linus Walleij <linus.walleij@linaro.org>, Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

- optimizes and cleans up stm32-exti irq domain
- optimizes and enhances stm32gpio irq chip

Radoslaw Pietrzyk (2):
  ARM: irqchip: stm32: Optimizes and cleans up stm32-exti irq_domain
  ARM: pinctrl: stm32: Optimizes and enhances stm32gpio irqchip

 drivers/irqchip/irq-stm32-exti.c      | 10 +---------
 drivers/pinctrl/stm32/pinctrl-stm32.c |  2 +-
 2 files changed, 2 insertions(+), 10 deletions(-)

-- 
1.9.1
