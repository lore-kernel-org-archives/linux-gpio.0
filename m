From: =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez_Rojas?= <noltari@gmail.com>
Subject: basic-mmio-gpio: add DT support
Date: Tue, 16 Dec 2014 23:41:44 +0100
Message-ID: <5490B528.2020305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:33821 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103AbaLPWlz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Dec 2014 17:41:55 -0500
Received: by mail-wi0-f177.google.com with SMTP id l15so14148331wiw.10
        for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2014 14:41:53 -0800 (PST)
Received: from [192.168.1.10] (148.Red-83-46-232.dynamicIP.rima-tde.net. [83.46.232.148])
        by mx.google.com with ESMTPSA id iz19sm18598758wic.8.2014.12.16.14.41.52
        for <linux-gpio@vger.kernel.org>
        (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Tue, 16 Dec 2014 14:41:52 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Add DT support while keeping legacy support.

Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
---
diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index 16f6115..9792783 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -61,6 +61,9 @@ o        `                     ~~~~\___/~~~~    ` con=
troller in FPGA is ,.`
 #include <linux/platform_device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/basic_mmio_gpio.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
=20
 static void bgpio_write8(void __iomem *reg, unsigned long data)
 {
@@ -488,8 +491,58 @@ static void __iomem *bgpio_map(struct platform_dev=
ice *pdev,
 	return ret;
 }
=20
+#ifdef CONFIG_OF
+static const struct of_device_id bgpio_dt_ids[] =3D {
+	{ .compatible =3D "basic-mmio-gpio" },
+};
+MODULE_DEVICE_TABLE(of, bgpio_dt_ids);
+
+static int bgpio_probe_dt(struct platform_device *pdev)
+{
+	u32 tmp;
+	struct bgpio_pdata *pdata;
+	struct device_node *np;
+
+	np =3D pdev->dev.of_node;
+	if (!np)
+		return 0;
+
+	pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	pdata->label =3D dev_name(&pdev->dev);
+	pdata->base =3D -1;
+	if (of_find_property(np, "byte-be", NULL)) {
+		pdata->flags |=3D BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+	}
+	if (of_find_property(np, "bit-be", NULL)) {
+		pdata->flags |=3D BGPIOF_BIG_ENDIAN;
+	}
+	if (of_find_property(np, "regset-nr", NULL)) {
+		pdata->flags |=3D BGPIOF_UNREADABLE_REG_SET;
+	}
+	if (of_find_property(np, "regdir-nr", NULL)) {
+		pdata->flags |=3D BGPIOF_UNREADABLE_REG_DIR;
+	}
+	if (!of_property_read_u32(np, "num-gpios", &tmp)) {
+		pdata->ngpio =3D tmp;
+	}
+
+	pdev->dev.platform_data =3D pdata;
+
+	return 1;
+}
+#else
+static inline int bgpio_probe_dt(struct platform_device *pdev)
+{
+	return 0;
+}
+#endif
+
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
+	int status;
 	struct device *dev =3D &pdev->dev;
 	struct resource *r;
 	void __iomem *dat;
@@ -498,10 +551,24 @@ static int bgpio_pdev_probe(struct platform_devic=
e *pdev)
 	void __iomem *dirout;
 	void __iomem *dirin;
 	unsigned long sz;
-	unsigned long flags =3D pdev->id_entry->driver_data;
+	unsigned long flags;
 	int err;
 	struct bgpio_chip *bgc;
-	struct bgpio_pdata *pdata =3D dev_get_platdata(dev);
+	struct bgpio_pdata *pdata;
+	bool use_of =3D 0;
+
+	status =3D bgpio_probe_dt(pdev);
+	if (status < 0)
+		return status;
+	if (status > 0)
+		use_of =3D 1;
+
+	pdata =3D dev_get_platdata(dev);
+
+	if (!use_of)
+		flags =3D pdev->id_entry->driver_data;
+	else if (pdata)
+		flags =3D pdata->flags;
=20
 	r =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
 	if (!r)
@@ -547,6 +614,9 @@ static int bgpio_pdev_probe(struct platform_device =
*pdev)
=20
 	platform_set_drvdata(pdev, bgc);
=20
+	if (use_of)
+		of_gpiochip_add(&bgc->gc);
+
 	return gpiochip_add(&bgc->gc);
 }
=20
@@ -572,6 +642,7 @@ MODULE_DEVICE_TABLE(platform, bgpio_id_table);
 static struct platform_driver bgpio_driver =3D {
 	.driver =3D {
 		.name =3D "basic-mmio-gpio",
+		.of_match_table =3D bgpio_dt_ids,
 	},
 	.id_table =3D bgpio_id_table,
 	.probe =3D bgpio_pdev_probe,
diff --git a/include/linux/basic_mmio_gpio.h b/include/linux/basic_mmio=
_gpio.h
index 0e97856..a35dffd 100644
--- a/include/linux/basic_mmio_gpio.h
+++ b/include/linux/basic_mmio_gpio.h
@@ -22,6 +22,7 @@ struct bgpio_pdata {
 	const char *label;
 	int base;
 	int ngpio;
+	unsigned long flags;
 };
=20
 struct device;
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
