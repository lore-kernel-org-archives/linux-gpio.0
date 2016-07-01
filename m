From: Nathan Williams <ngwilliams@gmail.com>
Subject: gpio-mcp23s08 DT usage with shared chip select
Date: Fri, 01 Jul 2016 12:11:40 +1000
Message-ID: <1467339100.28816.25.camel@linux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33605 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752018AbcGACME (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2016 22:12:04 -0400
Received: by mail-pf0-f196.google.com with SMTP id c74so8788102pfb.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2016 19:11:59 -0700 (PDT)
Received: from [192.168.0.130] ([203.217.56.15])
        by smtp.googlemail.com with ESMTPSA id i3sm852403pfk.30.2016.06.30.19.11.56
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jun 2016 19:11:58 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi,

I'm using gpio-mcp23s08 for two MCP23S17 chips that use the same SPI
chip select (and different addresses).

My device tree contains:

&spi0 {
        status = "okay";
        bus-num = <0>;
        num-cs = <2>;
        cs-gpios =
                <&portc 2 0>,
                <&portc 3 0>;

        gpio@1 {
                compatible = "microchip,mcp23s17";
                gpio-controller;
                #gpio-cells = <2>;
                microchip,spi-present-mask = <0x03>;
                reg = <1>;
                spi-max-frequency = <1000000>;
        };
};

The driver registers both gpiochips but both are labelled "mcp23s17" and
I can't differentiate between the chips without probing the hardware.

I'd also like to be able to give each GPIO a name with gpio-line-names.
What's the best way to achieve this? Add support to the driver for child
DT nodes for each gpiochip?

Regards,
Nathan

