From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: [PROBLEM] gpio: hog: requesting hog failed
Date: Thu, 8 Oct 2015 14:29:47 +0200
Message-ID: <561661BB.70207@aksignal.cz>
Reply-To: jiri.prchal@aksignal.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from router.aksignal.cz ([188.175.113.102]:56933 "EHLO
	router.aksignal.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751014AbbJHMhE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2015 08:37:04 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: "plagnioj@jcrosoft.com >> Jean-Christophe Plagniol-Villard" <plagnioj@jcrosoft.com>

Hi everybody,
I've just tried new gpio hog functionality, but maybe I misunderstand something
or I'm doing something wrong?
Can someone help me with it, please?
Thanks, Jiri.

Here is dmesg:
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.3.0-rc4-next-20151006_cpm9g25+ (prchal@prchalpc) (gcc version 4.7.3 (Ubuntu/Linaro 
4.7.3-12ubuntu1) ) #7 PREEMPT Thu Oct 8 09:08:21 CEST 2015
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=0005317f
...
[    0.243333] requesting hog GPIO in18 (chip fffff400.gpio, offset 28) failed
[    0.243333] requesting hog GPIO in19 (chip fffff400.gpio, offset 21) failed
[    0.246666] gpio-at91 fffff400.gpio: at address c8856400
...

and here my part of dts:
...
	ahb {
		apb {
			pinctrl@fffff400 {
				pioA: gpio@fffff400 {
					in18 {
						gpio-hog;
						gpios = <28 0>;
						input;
						line-name = "in18";
					};
					in19 {
						gpio-hog;
						gpios = <21 GPIO_ACTIVE_LOW>;
						input;
					};
				};
...
