From: Yegor Yefremov <yegorslists@googlemail.com>
Subject: tca6416: configure single GPIOs in device tree
Date: Wed, 16 Jul 2014 10:39:52 +0200
Message-ID: <CAGm1_ksxouz4x9qr-wGdu6hX3Ymakf-=ewSm7tVKx=E-EUtdhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:33400 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932204AbaGPIkN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Jul 2014 04:40:13 -0400
Received: by mail-pd0-f173.google.com with SMTP id w10so868135pde.32
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2014 01:40:12 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linux GPIO List <linux-gpio@vger.kernel.org>

I would like to configure some tca6416 GPIOs to output from device
tree. Otherwise they are inputs by default and due to hardware design
can generate interrupts until configured to output. Is there any
chance to configure some of them as outputs from within device tree
aside from making them to LEDs?

AFAIK tca6416 doesn't provide interrupt mask register, so as soon as
IRQ handler is registered it will get interrupts as all pins are
inputs by default.

Regards,
Yegor
