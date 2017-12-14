From: Christophe LEROY <christophe.leroy@c-s.fr>
Subject: "gpio-line-names" property - issue with commit 9427ecbed46cc
Date: Thu, 14 Dec 2017 12:54:01 +0100
Message-ID: <f0bcfd45-a5ac-fce8-2666-ece34c0268ea@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pegase1.c-s.fr ([93.17.236.30]:49787 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751729AbdLNLzT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 Dec 2017 06:55:19 -0500
Content-Language: fr
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Hello Mika,

In your commit 9427ecbed46cc, you have modified the way the 
"gpio-line-names" DT property is handled.

It seems that after that commit, many drivers fail to retrieve that 
property. After investigation it seems to be because the driver does not 
assign a parent to the gpio_chip.

Why is it necessary now to set a parent to the GPIO chip whereas it was 
not necessary before ? In gpio_chip_add_data(), we have:


	if (chip->parent) {
		gdev->dev.parent = chip->parent;
		gdev->dev.of_node = chip->parent->of_node;
	}

#ifdef CONFIG_OF_GPIO
	/* If the gpiochip has an assigned OF node this takes precedence */
	if (chip->of_node)
		gdev->dev.of_node = chip->of_node;
#endif



Therefore, as far as a chip->of_node is defined, shouldn't it be 
possible to retrieve "gpio-line-names" property as before without parent ?

Is there an easy modification that can be done to your new function 
devprop_gpiochip_set_names() in order to have the GPIO drivers work as 
before ?

Regards
Christophe
