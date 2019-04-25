From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [RFC PATCH 0/3] synquacer: implement ACPI gpio/interrupt support
Date: Thu, 25 Apr 2019 12:20:17 +0200
Message-ID: <20190425102020.21533-1-ard.biesheuvel@linaro.org>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Graeme Gregory <graeme.gregory@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Masahisa Kojima <masahisa.kojima@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Wire up the existing GPIO and interrupt controller drivers to the ACPI
subsystem so they can be used on ACPI systems for ACPI event (power
button, hardware error notification etc)

Cc: Masahisa Kojima <masahisa.kojima@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Graeme Gregory <graeme.gregory@linaro.org>

Ard Biesheuvel (3):
  irqchip/exiu: preparatory refactor for ACPI support
  irqchip/exiu: implement ACPI gpiolib/irqchip support
  gpio: mb86s70: enable ACPI and irqchip support

 drivers/gpio/Kconfig           |   4 +
 drivers/gpio/gpio-mb86s7x.c    |  58 ++++++--
 drivers/irqchip/irq-sni-exiu.c | 157 +++++++++++++++-----
 3 files changed, 173 insertions(+), 46 deletions(-)

-- 
2.20.1
