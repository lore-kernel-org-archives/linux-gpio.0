From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Query about Open drain flag with active LOW
Date: Mon, 27 Mar 2017 20:51:04 +0530
Message-ID: <58D92DE0.3000907@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:10903 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752751AbdC0PjG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2017 11:39:06 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,
I need help to understand the open drain flag passing from the DT.
The DT binding header says: In the file include/dt-bindings/gpio/gpio.h

/*
* Open Drain/Collector is the combination of single-ended active low,
* Open Source/Emitter is the combination of single-ended active high.
*/
#define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED | GPIO_ACTIVE_LOW)
#define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED | GPIO_ACTIVE_HIGH)


I have the schematics, where I need to set it as
Pin state HIGH (by setting gpio-input mode) to enable the circuit.
Pin state LOW (by setting gpio-output mode with value to 0) to disable 
the circuit.


With this, I think the GPIO is active HIGH and open drain type.
If I set the active LOW from DT then I can not set pin to logical 1 
using the API gpiod_set_value() with 1.
As this invert before calling _gpiod_set_raw_value() and so the value = 
0 and it set the pin in the gpio mode output-Low.

Shouldn't open drain pin are active HIGH?

Thanks,
Laxman

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
