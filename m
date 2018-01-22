From: Raphael Lisicki <rlisicki@radiodata.biz>
Subject: sharing IRQ when IRQ is always enabled
Date: Mon, 22 Jan 2018 16:14:14 +0100
Message-ID: <519fc4da-3baa-195a-b046-2799b2609a53@radiodata.biz>
References: <7594fad0-00c3-5dc6-c095-908e8a03c31a@radiodata.biz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.radiodata.biz ([78.47.114.250]:52160 "EHLO
        smtp.radiodata.biz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751054AbeAVPXV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jan 2018 10:23:21 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp.radiodata.biz (Postfix) with ESMTP id 2853860340
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2018 16:14:21 +0100 (CET)
Received: from smtp.radiodata.biz ([127.0.0.1])
        by localhost (smtp.radiodata.biz [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id URuIixt8qWHC for <linux-gpio@vger.kernel.org>;
        Mon, 22 Jan 2018 16:14:14 +0100 (CET)
Received: from mail (mail.radiodata.biz [87.128.68.248])
        by smtp.radiodata.biz (Postfix) with ESMTPSA id AD97B60309
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2018 16:14:14 +0100 (CET)
Received: from [192.168.3.180] (unknown [192.168.3.180])
        by mail (Postfix) with ESMTPSA id 3DE4D3FF00
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2018 16:14:14 +0100 (CET)
In-Reply-To: <7594fad0-00c3-5dc6-c095-908e8a03c31a@radiodata.biz>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hello everybody,

I am having trouble to use the I2C port expander NXP PCA9539 as an IRQ 
source on a board where two of them share the same Interrupt line.

When the PCA9539 starts, interrupts are already enabled. There is no way 
to disable interrupts on this chip. This means that both chips pull down 
the interrupt line. When the driver gets instantiated for the first 
chip, the interrupt line is enabled and an interrupt caused. This causes 
the interrupt handler for the first chip to be called, but this does not 
reset the interrupt coming from the second chip. Its handler is not 
being called as it is still not installed. This means that the interrupt 
line will be considered stuck and disabled subsequently.

My device-tree part is as follows:


         pca9539: pca9539@74 {
             compatible = "nxp,pca9539";
             reg = <0x74>;
             gpio-controller;
             #gpio-cells = <2>;
             interrupt-controller;
             interrupt-parent = <&pioE>;
             interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
         };

         pca9539_1: pca9539@75 {
             compatible = "nxp,pca9539";
             reg = <0x75>;
             gpio-controller;
             #gpio-cells = <2>;
             interrupt-controller;
             interrupt-parent = <&pioE>;
             interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
         };

I think I need to delay the activation of the interrupt source until 
both interrupt handlers have been installed. I have read the code that 
installs the interrupt handler and it seems that there is no way yet to 
do so, right?

Is there any other way I might be able to use the IRQ functionality with 
this port expander and a shared IRQ line? Any pointers?



Best regards

Raphael Lisicki

