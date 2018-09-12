From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: unexpected side effect of "gpiolib: override irq_enable/disable"
Date: Wed, 12 Sep 2018 16:58:29 +0200
Message-ID: <20180912145829.hzklqndjasac2ap4@M43218.corp.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linus.walleij@linaro.org, hans.verkuil@cisco.com, alexandre.belloni@bootlin.com
List-Id: linux-gpio@vger.kernel.org

Hi,

Using next-20180912, my kernel hangs during the boot. Git bisect tell me
that the cause of my issue is the commit "gpiolib: override
irq_enable/disable"

I dug further and this patch can have some side effects. When booting, I
have an infinite loop when trying to enable a gpio irq. I don't know if
the pinctrl-at91 driver is the only one concerned or not.

The pattern leading to this issue is quite simple: we have several gpio
controllers sharing the same irq_chip structure. Installing the
irq_enable/irq_disable hook works well the first time. The second time,
since the irq_enable has been altered to use gpiochip_irq_enable,
this latest function will call itself again and again by calling
irq_enable.

I think it should be better to have one irq_chip structure per gpio
controller. I am going to do a patch for pinctrl-at91. Excepting if you
think it has to be solved in a different way.


Ludovic
