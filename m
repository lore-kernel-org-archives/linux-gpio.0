From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: One GPIO lane for resetting several peripheral chips -- is gpio-hog =?iso-8859-1?Q?the_answer=3F?=
Date: Tue, 30 Jan 2018 15:31:49 +0100
Message-ID: <22b90f52-a190-4afd-a5ff-7b5622704701@cesnet.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from office2.cesnet.cz ([195.113.144.244]:48776 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752267AbeA3Obv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jan 2018 09:31:51 -0500
Received: from localhost (unknown [IPv6:2001:718:1:2c:5962:c77c:e19a:b6c2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id CE4F0400063
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2018 15:31:49 +0100 (CET)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hi,
I would like to control the RESET input of a few different peripheral chips=20=

(think I2C or SPI peripherals). Because my platform is pretty much=20
pin-starved, I would prefer to only use one HW signal to reset all chips=20
together exactly once during boot. I don't have access to the=20
power-on-reset circuitry of my SoC, unfortunately, so I need a SW way of=20
emulating something which changes the state at least once during boot, and=20=

never after that until powerdown.

I cannot just add something like a "reset-gpios" DT property to each=20
foo_probe() function. If I did that, then those devices which are probed=20
later during boot would cause a reset of an already-configured chip.

Right now, I simply make use of my SoC internal pull-down resistor on a=20
particular GPIO pin. I rely on the fact that the SoC boots with a level-0=20
on that pin, and I use a DT gpio-hog to ensure that the line eventually=20
goes high. I'm perfectly OK with that, but I'm unsure on whether this is=20
prone to races or not. Can I somehow specify "hey, let's probe for these=20
SPI or I2C slaves only after the gpio-hog at gpio0 is in effect"? Is there=20=

perhaps an unspoken rule saying the the SoC's pinctrl/gpio blocks,=20
including gpio-hogs, are initialized prior to probing for child devices on=20=

SPI and I2C buses?

Or should I use e.g. a regulator-gpio for my devices and simulate the reset=20=

line by that?

With kind regards,
Jan
