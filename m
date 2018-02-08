From: "Jonas Mark (ST-FIR/ENG1)" <Mark.Jonas@de.bosch.com>
Subject: How do I set user space GPIO polarity (active state) via device tree?
Date: Thu, 8 Feb 2018 17:55:00 +0000
Message-ID: <ab3895fe9b814c909bfe97ae8df635ba@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from de-deferred1.bosch-org.com ([139.15.180.216]:59346 "EHLO
        de-deferred1.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751544AbeBHSDO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Feb 2018 13:03:14 -0500
Received: from de-out1.bosch-org.com (snat-lb41g3-dmz-psi-sl1-maildeferred.fe.ssn.bosch.com [139.15.180.215])
        by si0vms0224.rbdmz01.com (Postfix) with ESMTPS id 3zcm7B5KRPzKHb
        for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2018 18:55:02 +0100 (CET)
Content-Language: de-DE
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: "Jonas Mark (ST-FIR/ENG1)" <Mark.Jonas@de.bosch.com>, "Heiko Schocher (hs@denx.de)" <hs@denx.de>, "GUAN Ben (ST-FIR/ENG1-Zhu)" <Ben.Guan@cn.bosch.com>, "ZHU Yi (ST-FIR/ENG1-Zhu)" <Yi.Zhu5@cn.bosch.com>

Hello,

tl;dr: How do I set the polarity (active state) of a GPIO in the device
tree and use it from user space?

I have an i.MX6 based board where some GPIO lines are controlled from
user space. The access to the GPIOs is done by name using libgpio from
kernel.org. So far this works fine. In the latest revision of the board
the polarity of a GPIO was changed from active-high to active-low.

At first I thought it would be easy to store this information in the
device tree. Sadly, I cannot find the right way how to do it. What
works is to create a gpio-hog and to set the polarity there. The
unwanted side effect there is that the GPIO is hogged and thus not
accessible by user space any more.

How is that done correctly?

Why do I want to do this via the device tree? Because I do not want to
hard code this into the user land. I would like to run the same kernel
and user land on boards with different GPIO polarity.

The following is the relevant except from the device tree; the gpio5
node is created by the mainline arch/arm/boot/dts/imx6qdl.dtsi.

&gpio5 {
	gpio-line-names =3D "", "", "", "",
                      "", "", "", "",
                      "", "", "", "",
                      "", "", "", "",
                      "", "", "RESET_COMPANION", "",
                      "", "", "", "",
                      "", "", "", "",
                      "", "", "", "";

	reset_companion {
	    gpio-hog;
	    gpios =3D <18 GPIO_ACTIVE_LOW>;
	    output-high;
    };
};

This is where the user space now sees that the GPIO is active-low -- but
it is hogged by the kernel and thus cannot be used.

# gpioinfo gpiochip4
gpiochip4 - 32 lines:
        line   0:      unnamed    "spi_imx"  output  active-high [kernel]
        line   1:      unnamed       unused   input  active-high
        line   2:      unnamed    "spi_imx"  output  active-high [kernel]
        line   3:      unnamed       unused   input  active-high
[..]
        line  17:      unnamed       unused   input  active-high
        line  18: "RESET_COMPANION" "reset_companion" output active-low [ke=
rnel]
        line  19:      unnamed       unused   input  active-high
        line  20:      unnamed   "watchdog"  output  active-high [kernel]
        line  21:      unnamed       unused   input  active-high
[..]
        line  31:      unnamed       unused   input  active-high

Thank you very much in advance for your help.

Regards,
Mark Jonas

Mit freundlichen Gr=FC=DFen / Best regards

 Mark Jonas

Security Systems, Panel Software Fire (ST-FIR/ENG1)=20
Bosch Sicherheitssysteme=A0GmbH | Postfach 11 11 | 85626 Grasbrunn | GERMAN=
Y | www.bosch-sicherheitsprodukte.de

Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118=20
Aufsichtsratsvorsitzender: Stefan Hartung; Gesch=E4ftsf=FChrung: Gert van I=
peren, Andreas Bartz, Thomas Quante, Bernhard Schuster=20




