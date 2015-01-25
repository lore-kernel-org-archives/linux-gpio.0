From: =?windows-1252?Q?=C1lvaro_Fern=E1ndez_Rojas?= <noltari@gmail.com>
Subject: [PATCH v2 2/2] basic-mmio-gpio: document DT bindings
Date: Sun, 25 Jan 2015 17:32:54 +0100
Message-ID: <54C51AB6.2030206@gmail.com>
References: <5490B528.2020305@gmail.com> <54C51A85.4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:59430 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752510AbbAYQdB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Jan 2015 11:33:01 -0500
Received: by mail-wg0-f54.google.com with SMTP id b13so5282471wgh.13
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2015 08:33:00 -0800 (PST)
Received: from [192.168.1.10] (240.Red-83-49-122.dynamicIP.rima-tde.net. [83.49.122.240])
        by mx.google.com with ESMTPSA id n6sm10757100wjy.8.2015.01.25.08.32.59
        for <linux-gpio@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Jan 2015 08:32:59 -0800 (PST)
In-Reply-To: <54C51A85.4@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Add DT support while keeping legacy support.

Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
---
diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Document=
ation/devicetree/bindings/gpio/gpio.txt
index b9bd1d6..c5d39c6 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -209,3 +209,75 @@ Example 2:
 Here, three GPIO ranges are defined wrt. two pin controllers. pinctrl1=
 GPIO
 ranges are defined using pin numbers whereas the GPIO ranges wrt. pinc=
trl2
 are named "foo" and "bar".
+
+3) Generic driver for memory-mapped GPIO controllers
+----------------------------------------------------
+The GPIO generic library provides support for basic platform_device
+memory-mapped GPIO controllers, which can be accessed by selecting Kco=
nfig
+symbol GPIO_GENERIC and using library functions provided by GPIO gener=
ic
+driver (see drivers/gpio/gpio-generic.c).
+The simplest form of a GPIO controller that the driver support is just=
 a
+single "data" register, where GPIO state can be read and/or written.
+
+The driver supports:
+- 8/16/32/64 bits registers. The number of GPIOs is determined by the =
width of
+  the registers.
+- GPIO controllers with clear/set registers.
+- GPIO controllers with a single "data" register.
+- Big endian bits/GPIOs ordering.
+
+For setting GPIO's there are three supported configurations:
+- single input/output register resource (named "dat").
+- set/clear pair (named "set" and "clr").
+- single output register resource and single input resource ("set" and=
 dat").
+
+For setting the GPIO direction, there are three supported configuratio=
ns:
+- simple bidirection GPIO that requires no configuration.
+- an output direction register (named "dirout") where a 1 bit indicate=
s the
+  GPIO is an output.
+- an input direction register (named "dirin") where a 1 bit indicates =
the GPIO
+  is an input.
+
+Required properties:
+- compatible : Should be "basic-mmio-gpio".
+- reg : Address and length of the registers needed for the device.
+- reg-names : Names of the needed registers.
+- #gpio-cells : Should be two.  The first cell is the pin number and
+  the second cell is used to specify optional parameters (currently
+  unused).
+- gpio-controller : Marks the device node as a gpio controller.
+
+Optional properties:
+- num-gpios : Specify the number of configurable gpios.
+- bit-be : Use big endian bit order for pins.
+- byte-be : Use big endian byte order for registers.
+- regset-wo : set register is unreadable.
+- regdir-wo : dir register is unreadable.
+
+Examples:
+
+gpio0: gpio-controller@10000084 {
+	compatible =3D "brcm,brcm6368", "basic-mmio-gpio";
+	reg =3D <0x10000084 0x4>, <0x1000008c 0x4>;
+	reg-names =3D "dirout", "dat";
+
+	gpio-controller;
+	#gpio-cells =3D <2>;
+
+	num-gpios =3D <32>;
+	byte-be;
+};
+
+gpio1: gpio-controller@10000180 {
+	compatible =3D "foo,bar", "basic-mmio-gpio";
+	reg =3D <0x10000180 0x4>, <0x10000184 0x4>, <0x10000188 0x4>;
+	reg-names =3D "dirin", "dirout", "dat";
+
+	gpio-controller;
+	#gpio-cells =3D <2>;
+
+	num-gpios =3D <20>;
+	bit-be;
+	byte-be;
+	regdir-wo;
+};
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
