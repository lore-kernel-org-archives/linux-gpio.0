From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: gpio-pxa driver and pincontrol
Date: Wed, 11 Nov 2015 23:25:17 +0100
Message-ID: <8761189nsi.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:34682 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752480AbbKKWcT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2015 17:32:19 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>

Hi,

I've written a pinconf + pinmux driver for the pxa2xx architectures. Before
posting it I wanted to see the integration of the gpio driver and the pincontrol
one.

My trouble is that the gpio-pxa.c gpio driver adds one gpiochip for each bank,
ie. for pxa27x we have the output in [1], ie 4 gpiochips of 32 gpios each.

But the trick is that a single devicetree node triggers the creation of the 4
gpio chips :
		gpio: gpio@40e00000 {
			compatible = "mrvl,pxa-gpio";
			#address-cells = <0x1>;
			#size-cells = <0x1>;
			reg = <0x40e00000 0x10000>;
			gpio-controller;
			#gpio-cells = <0x2>;
			interrupts = <10>;
			interrupt-names = "gpio_mux";
			interrupt-controller;
			#interrupt-cells = <0x2>;
			ranges;

			gcb0: gpio@40e00000 {
				reg = <0x40e00000 0x4>;
			};

			gcb1: gpio@40e00004 {
				reg = <0x40e00004 0x4>;
			};

			gcb2: gpio@40e00008 {
				reg = <0x40e00008 0x4>;
			};
			gcb3: gpio@40e0000c {
				reg = <0x40e0000c 0x4>;
			};
		};

Now if I put a line like this (knowing the pinctrl has 128 pins) :
			gpio-ranges = <&pinctrl 0 0 128>;

It will add :
 - map pins 0..127 to gpio 0..31 on gpiochip0
 - map pins 0..127 to gpio 32..63 on gpiochip1
 - etc ...

Now the question, is there a way to fix this without changing the gpio-pxa
driver to add only 1 gpiochip ?

Cheers.

-- 
Robert

[1] $ cat /sys/kernel/debug/gpio
GPIOs 0-31, gpio-0:
 gpio-0   (GPIO Key Power      ) in  lo    
 gpio-10  (?                   ) out hi    
 gpio-12  (HP jack detect      ) in  lo    
 gpio-22  (?                   ) out hi    
 gpio-23  (sysfs               ) out hi    
 gpio-24  (sysfs               ) out lo    
 gpio-26  (sysfs               ) out lo    
 gpio-27  (sysfs               ) out lo    

GPIOs 32-63, gpio-1:
 gpio-56  (mt9m111 #OE         ) in  hi    

GPIOs 64-95, gpio-2:
 gpio-77  (sysfs               ) out hi    
 gpio-82  (?                   ) out hi    
 gpio-83  (sysfs               ) out hi    
 gpio-86  (sysfs               ) out hi    
 gpio-88  (sysfs               ) out hi    
 gpio-90  (sysfs               ) out hi    
 gpio-93  (Volume Up Key       ) in  lo    
 gpio-94  (Volume Down Key     ) in  lo    

GPIOs 96-120, gpio-3:
 gpio-97  (?                   ) out lo    
 gpio-98  (?                   ) out hi    
 gpio-106 (sysfs               ) out lo    
 gpio-107 (sysfs               ) out lo    
 gpio-114 (sysfs               ) out hi    
 gpio-115 (?                   ) out hi    
