From: Yegor Yefremov <yegorslists@googlemail.com>
Subject: tca-6416: interrupt device tree configuration
Date: Tue, 18 Mar 2014 16:02:09 +0100
Message-ID: <CAGm1_ksGDCfgTNpue_zEUTho88G3juSJ6qLttHb7ACFawdgKzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:64949 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932218AbaCRPCb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Mar 2014 11:02:31 -0400
Received: by mail-pb0-f44.google.com with SMTP id rp16so7395438pbb.17
        for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2014 08:02:31 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

I've an am335x-based board with tca6416. The interrupt output of the
tca is connected to GPIO0_20 on my SoC. How should I configure this
wiring in device tree file?

I've already managed to hook it on I2C and it is working so far:

 tca6416: gpio@20 {
                compatible = "ti,tca6416";
                reg = <0x20>;
                gpio-controller;
                #gpio-cells = <2>;
  };

Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt describes
following properties:

  - interrupt-controller: Identifies the node as an interrupt controller.
  - #interrupt-cells: Number of cells to encode an interrupt source, shall be 2.
  - interrupt-parent: phandle of the parent interrupt controller.
  - interrupts: Interrupt specifier for the controllers interrupt.

and following example:

        pcf8575: gpio@20 {
                compatible = "nxp,pcf8575";
                reg = <0x20>;
                interrupt-parent = <&irqpin2>;
                interrupts = <3 0>;
                gpio-controller;
                #gpio-cells = <2>;
                interrupt-controller;
                #interrupt-cells = <2>;
        };

Where does irqpin2 come from? How to specify GPIO0_20 in "interrupts" context?

Regards,
Yegor
