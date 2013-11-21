From: Hector Palacios <hector.palacios@digi.com>
Subject: mxs gpios as wakeup interrupts and irq_set_wake() hook
Date: Thu, 21 Nov 2013 11:19:28 +0100
Message-ID: <528DDE30.4090509@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.bemta7.messagelabs.com ([216.82.254.101]:42757 "EHLO
	mail1.bemta7.messagelabs.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751250Ab3KUK0b (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 21 Nov 2013 05:26:31 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>, zonque@gmail.com, "shawn.guo@linaro.org" <shawn.guo@linaro.org>

Hello,

I was trying to have GPIOs be able to wake up my ARM i.MX28 system from suspend but 
noticed that the existing hook irq_set_wake() in the driver

	ct->chip.irq_set_wake = mxs_gpio_set_wake_irq;

was never called when I enabled a gpio as wakeup via the sysfs:

	echo enabled > /sys/class/gpio/gpio107/device/power/wakeup

The implementation of the hook itself is:

static int mxs_gpio_set_wake_irq(struct irq_data *d, unsigned int enable)
{
	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
	struct mxs_gpio_port *port = gc->private;

	if (enable)
		enable_irq_wake(port->irq);
	else
		disable_irq_wake(port->irq);

	return 0;
}

which looks to me like a cyclic call because the irq_set_wake() hook is called from 
set_irq_wake_real() which is called from irq_set_irq_wake() which is called from 
enable_irq_wake(). And this last function is what the driver's hook implementation is 
doing.
I was expecting that enable_irq_wake() was fired somehow from the kernel when I enable 
the wakeup descriptor in the sysfs, but I guess it works in a different way.

Instead, I implemented suspend/resume calls in the gpio driver that fire the 
enable_irq_wake/disable_irq_wake if the device can_wakeup flag is set (this is what 
the sysfs does). I took this model from the serial driver.
This works but, could anyone tell me if this approach correct for gpio?

@@ -174,6 +174,7 @@ static void mxs_gpio_irq_handler(u32 irq, struct irq_desc *desc)
  	}
  }

+#ifdef CONFIG_PM_SLEEP
  /*
   * Set interrupt number "irq" in the GPIO as a wake-up source.
   * While system is running, all registered GPIO interrupts need to have
@@ -196,6 +197,33 @@ static int mxs_gpio_set_wake_irq(struct irq_data *d, unsigned int 
enable)
  	return 0;
  }

+static int mxs_gpio_suspend(struct device *dev)
+{
+	struct platform_device *pdev =
+			container_of(dev, struct platform_device, dev);
+	int irq = platform_get_irq(pdev, 0);
+
+	/* Enable wakeup irq before suspending, if device can wakeup */
+	if (device_may_wakeup(dev))
+		return enable_irq_wake(irq);
+
+	return 0;
+}
+
+static int mxs_gpio_resume(struct device *dev)
+{
+	struct platform_device *pdev =
+			container_of(dev, struct platform_device, dev);
+	int irq = platform_get_irq(pdev, 0);
+
+	/* Disable wakeup irq on resume, if device can wakeup */
+	if (device_may_wakeup(dev))
+		return disable_irq_wake(irq);
+
+	return 0;
+}
+#endif
+
  static void __init mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
  {
  	struct irq_chip_generic *gc;
@@ -210,7 +238,9 @@ static void __init mxs_gpio_init_gc(struct mxs_gpio_port *port, 
int irq_base)
  	ct->chip.irq_mask = irq_gc_mask_clr_bit;
  	ct->chip.irq_unmask = irq_gc_mask_set_bit;
  	ct->chip.irq_set_type = mxs_gpio_set_irq_type;
+#ifdef CONFIG_PM_SLEEP
  	ct->chip.irq_set_wake = mxs_gpio_set_wake_irq;
+#endif
  	ct->regs.ack = PINCTRL_IRQSTAT(port) + MXS_CLR;
  	ct->regs.mask = PINCTRL_IRQEN(port);

@@ -320,6 +350,10 @@ static int mxs_gpio_probe(struct platform_device *pdev)
  	/* gpio-mxs can be a generic irq chip */
  	mxs_gpio_init_gc(port, irq_base);

+#ifdef CONFIG_PM_SLEEP
+	device_set_wakeup_capable(&pdev->dev, 1);
+#endif
+
  	/* setup one handler for each entry */
  	irq_set_chained_handler(port->irq, mxs_gpio_irq_handler);
  	irq_set_handler_data(port->irq, port);
@@ -348,11 +382,16 @@ out_irqdesc_free:
  	return err;
  }

+static const struct dev_pm_ops mxs_gpio_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mxs_gpio_suspend, mxs_gpio_resume)
+};
+
  static struct platform_driver mxs_gpio_driver = {
  	.driver		= {
  		.name	= "gpio-mxs",
  		.owner	= THIS_MODULE,
  		.of_match_table = mxs_gpio_dt_ids,
+		.pm	= &mxs_gpio_pm_ops,
  	},
  	.probe		= mxs_gpio_probe,
  	.id_table	= mxs_gpio_ids,


Best regards,
--
Hector Palacios
