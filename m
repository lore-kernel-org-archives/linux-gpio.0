From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: unexpected side effect of "gpiolib: override irq_enable/disable"
Date: Wed, 12 Sep 2018 17:30:35 +0200
Message-ID: <f64fcb6a-172f-45e8-af8f-f1e7bae3b4d8@xs4all.nl>
References: <20180912145829.hzklqndjasac2ap4@M43218.corp.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180912145829.hzklqndjasac2ap4@M43218.corp.atmel.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hans.verkuil@cisco.com, linus.walleij@linaro.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
List-Id: linux-gpio@vger.kernel.org

Hi Ludovic,

On 09/12/2018 04:58 PM, Ludovic Desroches wrote:
> Hi,
> 
> Using next-20180912, my kernel hangs during the boot. Git bisect tell me
> that the cause of my issue is the commit "gpiolib: override
> irq_enable/disable"
> 
> I dug further and this patch can have some side effects. When booting, I
> have an infinite loop when trying to enable a gpio irq. I don't know if
> the pinctrl-at91 driver is the only one concerned or not.
> 
> The pattern leading to this issue is quite simple: we have several gpio
> controllers sharing the same irq_chip structure. Installing the
> irq_enable/irq_disable hook works well the first time. The second time,
> since the irq_enable has been altered to use gpiochip_irq_enable,
> this latest function will call itself again and again by calling
> irq_enable.
> 
> I think it should be better to have one irq_chip structure per gpio
> controller. I am going to do a patch for pinctrl-at91. Excepting if you
> think it has to be solved in a different way.
> 
> 
> Ludovic
> 

Can you try this patch first?

Thanks!

	Hans

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index efce534a269b..e09e4e439928 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1859,6 +1859,8 @@ static void gpiochip_set_irq_hooks(struct gpio_chip *gpiochip)
 	}
 	if (WARN_ON(gpiochip->irq.irq_enable))
 		return;
+	if (irqchip->irq_enable == gpiochip_irq_enable)
+		return;
 	gpiochip->irq.irq_enable = irqchip->irq_enable;
 	gpiochip->irq.irq_disable = irqchip->irq_disable;
 	irqchip->irq_enable = gpiochip_irq_enable;
