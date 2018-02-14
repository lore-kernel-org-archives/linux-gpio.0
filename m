From: "Jonas Mark (ST-FIR/ENG1)" <Mark.Jonas@de.bosch.com>
Subject: AW: How do I set user space GPIO polarity (active state) via device
 tree?
Date: Wed, 14 Feb 2018 14:59:24 +0000
Message-ID: <3ecd4342cf524178b596a505870059e3@de.bosch.com>
References: <ab3895fe9b814c909bfe97ae8df635ba@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from de-deferred1.bosch-org.com ([139.15.180.216]:60144 "EHLO
        de-deferred1.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1030699AbeBNO73 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Feb 2018 09:59:29 -0500
Received: from de-out1.bosch-org.com (snat-lb41g3-dmz-psi-sl1-maildeferred.fe.ssn.bosch.com [139.15.180.215])
        by si0vms0224.rbdmz01.com (Postfix) with ESMTPS id 3zhMxq3QfRz2Cl
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2018 15:59:27 +0100 (CET)
In-Reply-To: <ab3895fe9b814c909bfe97ae8df635ba@de.bosch.com>
Content-Language: de-DE
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: "Heiko Schocher (hs@denx.de)" <hs@denx.de>, "GUAN Ben (ST-FIR/ENG1-Zhu)" <Ben.Guan@cn.bosch.com>, "ZHU Yi (ST-FIR/ENG1-Zhu)" <Yi.Zhu5@cn.bosch.com>

Hello,

> tl;dr: How do I set the polarity (active state) of a GPIO in the device
> tree and use it from user space?

I am still not able to declare the polarity of a GPIO via device tree
so it can be used from user space using libgpio.

I read the kernel documentation and did not find hint how to do this.
What I found is how to set the polarity of a GPIO for a gpio-hog or a
kernel driver. But that prevents the GPIO being used from user space.

Thank you in advance for your help,
Mark Jonas

Mit freundlichen Gr=FC=DFen / Best regards

 Mark Jonas

Security Systems, Panel Software Fire (ST-FIR/ENG1)=20
Bosch Sicherheitssysteme GmbH | Postfach 11 11 | 85626 Grasbrunn | GERMANY =
| www.bosch-sicherheitsprodukte.de

Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118=20
Aufsichtsratsvorsitzender: Stefan Hartung; Gesch=E4ftsf=FChrung: Gert van I=
peren, Andreas Bartz, Thomas Quante, Bernhard Schuster=20

