From: Bernd Edlinger <bernd.edlinger@hotmail.de>
Subject: Re: [PATCH] Add a GPIO driver for Altera FPGA Manager Fabric I/O
Date: Sat, 30 Sep 2017 13:15:38 +0000
Message-ID: <8da7f1f2-7934-0b88-6eb1-8cdce8d5a7ea@hotmail.de>
References: <AM5PR0701MB2657A33A85F675C4A0175CE0E4670@AM5PR0701MB2657.eurprd07.prod.outlook.com>
 <CACRpkda39LU8hynYtnMyKxm+A8Behkam8CWBTSkt+0U_Fw_VtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oln040092066100.outbound.protection.outlook.com ([40.92.66.100]:20522
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750810AbdI3NPl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 30 Sep 2017 09:15:41 -0400
In-Reply-To: <CACRpkda39LU8hynYtnMyKxm+A8Behkam8CWBTSkt+0U_Fw_VtQ@mail.gmail.com>
Content-Language: de-DE
Content-ID: <16A0973A487A0547AE5EC80DF821FFE9@sct-15-1-1199-6-msonline-outlook-20107.templateTenant>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 09/27/17 02:20, Linus Walleij wrote:
> On Fri, Sep 22, 2017 at 8:41 PM, Bernd Edlinger
> <bernd.edlinger@hotmail.de> wrote:
> 
>> This is an internal 32-bit input and 32-bit output port to the FPGA logic.
> 
> What does "internal" mean in this context? On the chip?
> 

Yes, these are simple interconnects between the two major parts on the
chip.  One is called HPS and it consists of two ARM cores.
And the other is a large programmable logic area called FPGA Fabric.

> I hope it still qualifies to be called "general purpose input/output".
> 
> Otherwise it's not GPIO...
> 

Absolutely it looks and feels like a general-purpose I/O facility.
It can be used to control arbitrary logic functions.

>> Instantiate this in the device tree as:
>>
>>     gpio3: gpio@ff706010 {
>>      #address-cells = <1>;
>>      #size-cells = <0>;
>>      compatible = "altr,fpgamgr-gpio";
>>      reg = <0xff706010 0x8>;
>>      status = "okay";
>>
>>      portd: gpio-controller@0 {
>>       compatible = "altr,fpgamgr-gpio-output";
>>       gpio-controller;
>>       #gpio-cells = <2>;
>>       reg = <0>;
>>      };
>>
>>      porte: gpio-controller@1 {
>>       compatible = "altr,fpgamgr-gpio-input";
>>       gpio-controller;
>>       #gpio-cells = <2>;
>>       reg = <1>;
>>      };
> 
> So one port is output-only and one is input-only?
> 
> Fair enough.
> 
>> +config GPIO_FPGAMGR
> 
> Call it GPIO_ALTERA_FPGAMGR or something.
> 

Done.

> "FPGAMGR" is too generic. There must be a plethora
> of FPGA managers in the world.
> 
>> +obj-$(CONFIG_GPIO_FPGAMGR)     += gpio-fpgamgr.o
> 
> So call that file gpio-altera-fpgamgr.o as well.
> 

Done.

>> +/*
> 
> Add a blurb here at the top describing the driver and what it is for.
> 

Done.

>> + * Copyright (c) 2015 Softing Industrial Automation GmbH
> 
>> +static int fpgamgr_gpio_add_port(struct fpgamgr_gpio *gpio,
>> +                                struct fpgamgr_port_property *pp,
>> +                                unsigned int offs)
>> +{
>> +       struct fpgamgr_gpio_port *port;
>> +       void __iomem *dat;
>> +       int err;
>> +
>> +       port = &gpio->ports[offs];
>> +       port->gpio = gpio;
>> +       port->idx = pp->idx;
>> +
>> +       dat = gpio->regs + (pp->idx * 4);
>> +
>> +       err = bgpio_init(&port->bgc, gpio->dev, 4, dat, NULL, NULL,
>> +                        NULL, NULL, 0);
> 
> Nice reuse of MMIO GPIO.
> 

Thanks.
Though I must admit, that I have copied most of this code verbatim
from gpio-dwapb.c ;)

>> +#ifdef CONFIG_OF_GPIO
>> +       port->bgc.of_node = pp->node;
>> +#endif
> 
> Drop the #ifdef.
> 

Done.

> The Kconfig already depends on OF_GPIO so this is always true.
> 
> The concept of "port" is the same as "bank".
> 
> Please read Thierry's proposed changes that I will merge as soon as
> he respins them, he creates a "bank" abstraction for gpiolib:
> https://marc.info/?l=linux-gpio&m=150429237121695&w=2
> 
> I strongly feel you should use this infrastructure, even if Thierry's work
> is much centered around being able to have per-bank IRQs.
> 

I hope that does not mean both ports have to share the same
interrupt spin lock.  While it is necessary to synchronize write
accesses to the same port, this driver has no need to synchronize
with the other port.

Interesting point is that this patch does not touch gpio-dwapb.c
at all.  Although gpio-dwapb.c has even irq support.

>> +static void fpgamgr_gpio_unregister(struct fpgamgr_gpio *gpio)
>> +{
>> +       unsigned int m;
>> +
>> +       for (m = 0; m < gpio->nr_ports; ++m)
>> +               if (gpio->ports[m].is_registered)
>> +                       gpiochip_remove(&gpio->ports[m].bgc);
>> +}
> 
> Why can't you simply use devm_gpiochip_add_data() and get rid
> of the unregister business? (data can be NULL)
> 

Done.  Note, that funny unregister code is originally from gpio-dwapb.c,
I have probably never tested the unregister code path at all.

>> +static struct fpgamgr_platform_data *
>> +fpgamgr_gpio_get_pdata_of(struct device *dev)
>> +{
>> +       struct device_node *node, *port_np;
> 
> Rename "node" to just "np" (node pointer) this is the convention
> we usually employ.
> 
> Just declare it like this:
> 
> struct device_node *np = dev->of_node;
> 
> So you don't need to assign it later.
> 

Done.

>> +       struct fpgamgr_platform_data *pdata;
>> +       struct fpgamgr_port_property *pp;
>> +       int nports;
>> +       int i;
>> +
>> +       node = dev->of_node;
>> +       if (!IS_ENABLED(CONFIG_OF_GPIO) || !node)
>> +               return ERR_PTR(-ENODEV);
> 
> Drop this, as stated above it is always enabled when compiling
> and probing this code.
> 

Done.

>> +       nports = of_get_child_count(node);
>> +       if (nports == 0)
>> +               return ERR_PTR(-ENODEV);
>> +
>> +       pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
>> +       if (!pdata)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       pdata->properties = kcalloc(nports, sizeof(*pp), GFP_KERNEL);
>> +       if (!pdata->properties) {
>> +               kfree(pdata);
>> +               return ERR_PTR(-ENOMEM);
>> +       }
>> +
>> +       pdata->nports = nports;
> 
> Again important to use Thierry's infrastructure for ports/banks.
> 

I do not yet fully understood what that means for this driver.
However I would like to do that as a separate patch, in order to allow
back-ports of this driver.

>> +static inline void fpgamgr_free_pdata_of(struct fpgamgr_platform_data
>> *pdata)
>> +{
>> +       if (!IS_ENABLED(CONFIG_OF_GPIO) || !pdata)
>> +               return;
> 
> Drop that.
> 

Done.

>> +static int fpgamgr_gpio_probe(struct platform_device *pdev)
>> +{
> 
> Since you use the struct device * pointer a lot here, introduce a local
> variable like this:
> 
> 
> struct device *dev = &pdev->dev;
> 
> Then substitute &pdev->dev for just dev below. Make it so much
> easier to read.
> 

Done.

>> +       unsigned int i;
>> +       struct resource *res;
>> +       struct fpgamgr_gpio *gpio;
> 
> gpio is a bit ambigous here don't you think?
> 
> At least call it "fgpio" or something.
> 

Done.

>> +static const struct of_device_id fpgamgr_of_match[] = {
>> +       { .compatible = "altr,fpgamgr-gpio" },
>> +       { /* Sentinel */ }
>> +};
> 
> Are these device tree bindings already merged? Else they need
> a separate patch with Cc to devicetree@vger.kernel.org.
> 

You mean a text file under Documentation/devicetree/bindings/gpio
with a few words how the device tree has to look like?

I have not yet done that, but I will prepare a separate patch.

>> +#ifdef CONFIG_PM_SLEEP
>> +static int fpgamgr_gpio_suspend(struct device *dev)
>> +{
>> +       return 0;
>> +}
>> +
>> +static int fpgamgr_gpio_resume(struct device *dev)
>> +{
>> +       return 0;
>> +}
>> +#endif
>> +
>> +static SIMPLE_DEV_PM_OPS(fpgamgr_gpio_pm_ops, fpgamgr_gpio_suspend,
>> +                        fpgamgr_gpio_resume);
> 
> Either implement the suspend resume for real or drop this entire thing.
> Just skeleton functions are not going to help anyone.
> 

Dropped.

>> +static struct platform_driver fpgamgr_gpio_driver = {
>> +       .driver         = {
>> +               .name   = "gpio-fpgamgr",
> 
> gpio-altera-fpgamgr
> 

Done.

>> +               .owner  = THIS_MODULE,
>> +               .pm     = &fpgamgr_gpio_pm_ops,
> 
> Drop that too unless you implement it.
> 

Done.

Thanks
Bernd.

>From 223be945bf0a7d7d4bc979eccd77075b0a447ece Mon Sep 17 00:00:00 2001
From: Bernd Edlinger <bernd.edlinger@hotmail.de>
Date: Thu, 21 Sep 2017 15:50:36 +0200
Subject: [PATCH] Add a GPIO driver for Altera FPGA Manager Fabric I/O.
 This is an internal 32-bit input and 32-bit output port to the FPGA logic.

Instantiate this in the device tree as:

  gpio3: gpio@ff706010 {
   #address-cells = <1>;
   #size-cells = <0>;
   compatible = "altr,fpgamgr-gpio";
   reg = <0xff706010 0x8>;
   status = "okay";

   portd: gpio-controller@0 {
    compatible = "altr,fpgamgr-gpio-output";
    gpio-controller;
    #gpio-cells = <2>;
    reg = <0>;
   };

   porte: gpio-controller@1 {
    compatible = "altr,fpgamgr-gpio-input";
    gpio-controller;
    #gpio-cells = <2>;
    reg = <1>;
   };
  };

Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
---
 drivers/gpio/Kconfig               |   6 +
 drivers/gpio/Makefile              |   1 +
 drivers/gpio/gpio-altera-fpgamgr.c | 219 +++++++++++++++++++++++++++++++++++++
 3 files changed, 226 insertions(+)
 create mode 100644 drivers/gpio/gpio-altera-fpgamgr.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3388d54..0bec903 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -97,6 +97,12 @@ config GPIO_ALTERA
 
 	  If driver is built as a module it will be called gpio-altera.
 
+config GPIO_ALTERA_FPGAMGR
+	tristate "Altera FPGAMGR GPIO"
+	depends on OF_GPIO
+	help
+	  Say yes here to support the Altera FPGAMGR GPIO device.
+
 config GPIO_AMDPT
 	tristate "AMD Promontory GPIO support"
 	depends on ACPI
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index aeb70e9d..3eb73d4 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_GPIO_ADP5520)	+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5588)	+= gpio-adp5588.o
 obj-$(CONFIG_GPIO_ALTERA)  	+= gpio-altera.o
 obj-$(CONFIG_GPIO_ALTERA_A10SR)	+= gpio-altera-a10sr.o
+obj-$(CONFIG_GPIO_ALTERA_FPGAMGR)	+= gpio-altera-fpgamgr.o
 obj-$(CONFIG_GPIO_AMD8111)	+= gpio-amd8111.o
 obj-$(CONFIG_GPIO_AMDPT)	+= gpio-amdpt.o
 obj-$(CONFIG_GPIO_ARIZONA)	+= gpio-arizona.o
diff --git a/drivers/gpio/gpio-altera-fpgamgr.c b/drivers/gpio/gpio-altera-fpgamgr.c
new file mode 100644
index 0000000..76eff81
--- /dev/null
+++ b/drivers/gpio/gpio-altera-fpgamgr.c
@@ -0,0 +1,219 @@
+/*
+ * This is a GPIO driver for the internal FPGA Manager I/O ports
+ * connecting the HPS to the FPGA logic on certain Altera parts.
+ *
+ * Copyright (c) 2015 Softing Industrial Automation GmbH
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+#include <linux/gpio/driver.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+
+struct fpgamgr_port_property {
+	struct device_node		*node;
+	const char			*name;
+	unsigned int			idx;
+};
+
+struct fpgamgr_platform_data {
+	struct fpgamgr_port_property	*properties;
+	unsigned int			nports;
+};
+
+struct fpgamgr_gpio_port {
+	struct gpio_chip		bgc;
+	struct fpgamgr_gpio		*gpio;
+	unsigned int			idx;
+};
+
+struct fpgamgr_gpio {
+	struct	device			*dev;
+	void __iomem			*regs;
+	struct fpgamgr_gpio_port	*ports;
+	unsigned int			nr_ports;
+};
+
+static int fpgamgr_gpio_add_port(struct fpgamgr_gpio *gpio,
+				 struct fpgamgr_port_property *pp,
+				 unsigned int offs)
+{
+	struct fpgamgr_gpio_port *port;
+	void __iomem *dat;
+	int err;
+
+	port = &gpio->ports[offs];
+	port->gpio = gpio;
+	port->idx = pp->idx;
+
+	dat = gpio->regs + (pp->idx * 4);
+
+	err = bgpio_init(&port->bgc, gpio->dev, 4, dat, NULL, NULL,
+			 NULL, NULL, 0);
+	if (err) {
+		dev_err(gpio->dev, "failed to init gpio chip for %s\n",
+			pp->name);
+		return err;
+	}
+
+	port->bgc.of_node = pp->node;
+
+	err = devm_gpiochip_add_data(gpio->dev, &port->bgc, NULL);
+	if (err)
+		dev_err(gpio->dev, "failed to register gpiochip for %s\n",
+			pp->name);
+
+	return err;
+}
+
+static struct fpgamgr_platform_data *
+fpgamgr_gpio_get_pdata_of(struct device *dev)
+{
+	struct device_node *np = dev->of_node, *port_np;
+	struct fpgamgr_platform_data *pdata;
+	struct fpgamgr_port_property *pp;
+	int nports;
+	int i;
+
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	nports = of_get_child_count(np);
+	if (nports == 0)
+		return ERR_PTR(-ENODEV);
+
+	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->properties = kcalloc(nports, sizeof(*pp), GFP_KERNEL);
+	if (!pdata->properties) {
+		kfree(pdata);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	pdata->nports = nports;
+
+	i = 0;
+	for_each_child_of_node(np, port_np) {
+		pp = &pdata->properties[i++];
+		pp->node = port_np;
+
+		if (of_property_read_u32(port_np, "reg", &pp->idx) ||
+		    pp->idx > 1) {
+			dev_err(dev, "missing/invalid port index for %s\n",
+				port_np->full_name);
+			kfree(pdata->properties);
+			kfree(pdata);
+			return ERR_PTR(-EINVAL);
+		}
+
+		pp->name = port_np->full_name;
+	}
+
+	return pdata;
+}
+
+static inline void fpgamgr_free_pdata_of(struct fpgamgr_platform_data *pdata)
+{
+	if (!pdata)
+		return;
+
+	kfree(pdata->properties);
+	kfree(pdata);
+}
+
+static int fpgamgr_gpio_probe(struct platform_device *pdev)
+{
+	unsigned int i;
+	struct resource *res;
+	struct fpgamgr_gpio *fgpio;
+	int err;
+	struct device *dev = &pdev->dev;
+	struct fpgamgr_platform_data *pdata = dev_get_platdata(dev);
+	bool is_pdata_alloc = !pdata;
+
+	if (is_pdata_alloc) {
+		pdata = fpgamgr_gpio_get_pdata_of(dev);
+		if (IS_ERR(pdata))
+			return PTR_ERR(pdata);
+	}
+
+	if (!pdata->nports) {
+		err = -ENODEV;
+		goto out_err;
+	}
+
+	fgpio = devm_kzalloc(dev, sizeof(*fgpio), GFP_KERNEL);
+	if (!fgpio) {
+		err = -ENOMEM;
+		goto out_err;
+	}
+	fgpio->dev = dev;
+	fgpio->nr_ports = pdata->nports;
+
+	fgpio->ports = devm_kcalloc(dev, fgpio->nr_ports,
+				   sizeof(*fgpio->ports), GFP_KERNEL);
+	if (!fgpio->ports) {
+		err = -ENOMEM;
+		goto out_err;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	fgpio->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(fgpio->regs)) {
+		err = PTR_ERR(fgpio->regs);
+		goto out_err;
+	}
+
+	for (i = 0; i < fgpio->nr_ports; i++) {
+		err = fpgamgr_gpio_add_port(fgpio, &pdata->properties[i], i);
+		if (err)
+			goto out_unregister;
+	}
+	platform_set_drvdata(pdev, fgpio);
+
+	goto out_err;
+
+out_unregister:
+	while (i > 0)
+		devm_gpiochip_remove(dev, &fgpio->ports[--i].bgc);
+
+out_err:
+	if (is_pdata_alloc)
+		fpgamgr_free_pdata_of(pdata);
+
+	return err;
+}
+
+static const struct of_device_id fpgamgr_of_match[] = {
+	{ .compatible = "altr,fpgamgr-gpio" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, fpgamgr_of_match);
+
+static struct platform_driver fpgamgr_gpio_driver = {
+	.driver		= {
+		.name	= "gpio-altera-fpgamgr",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(fpgamgr_of_match),
+	},
+	.probe		= fpgamgr_gpio_probe,
+};
+
+module_platform_driver(fpgamgr_gpio_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Bernd Edlinger");
+MODULE_DESCRIPTION("Altera fpgamgr GPIO driver");
-- 
2.7.4
