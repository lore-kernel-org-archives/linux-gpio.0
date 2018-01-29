From: Phil Reid <preid@electromag.com.au>
Subject: Re: sharing IRQ when IRQ is always enabled
Date: Mon, 29 Jan 2018 09:21:53 +0800
Message-ID: <3c11e860-39f1-6a8b-4235-9580d3812cd2@electromag.com.au>
References: <7594fad0-00c3-5dc6-c095-908e8a03c31a@radiodata.biz>
 <519fc4da-3baa-195a-b046-2799b2609a53@radiodata.biz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:56776 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753233AbeA2BVy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jan 2018 20:21:54 -0500
In-Reply-To: <519fc4da-3baa-195a-b046-2799b2609a53@radiodata.biz>
Content-Language: en-AU
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Raphael Lisicki <rlisicki@radiodata.biz>, linux-gpio@vger.kernel.org

G'day Raphael,

On 22/01/2018 23:14, Raphael Lisicki wrote:
> Hello everybody,
> 
> I am having trouble to use the I2C port expander NXP PCA9539 as an IRQ source on a board where two of them share the same Interrupt line.
> 
> When the PCA9539 starts, interrupts are already enabled. There is no way to disable interrupts on this chip. This means that both chips pull down the interrupt 
> line. When the driver gets instantiated for the first chip, the interrupt line is enabled and an interrupt caused. This causes the interrupt handler for the 
> first chip to be called, but this does not reset the interrupt coming from the second chip. Its handler is not being called as it is still not installed. This 
> means that the interrupt line will be considered stuck and disabled subsequently.
> 
> My device-tree part is as follows:
> 
> 
>          pca9539: pca9539@74 {
>              compatible = "nxp,pca9539";
>              reg = <0x74>;
>              gpio-controller;
>              #gpio-cells = <2>;
>              interrupt-controller;
>              interrupt-parent = <&pioE>;
>              interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
>          };
> 
>          pca9539_1: pca9539@75 {
>              compatible = "nxp,pca9539";
>              reg = <0x75>;
>              gpio-controller;
>              #gpio-cells = <2>;
>              interrupt-controller;
>              interrupt-parent = <&pioE>;
>              interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
>          };
> 
> I think I need to delay the activation of the interrupt source until both interrupt handlers have been installed. I have read the code that installs the 
> interrupt handler and it seems that there is no way yet to do so, right?
> 
> Is there any other way I might be able to use the IRQ functionality with this port expander and a shared IRQ line? Any pointers?
> 
>I've ran into this problem before myself. As far as I could determine there was no way to delay the enabling of the irq.
There's probably enough information in the dt to determine this by searching for all the devices using that irq.

An approach would be to create an intermediary irq chip device. (Something that models an AND /OR gate for example)
The driver for which could be setup to delay registering the irq until all irq sources have registered.

This would keep the code separate for the core irq library I think...

-- 
Regards
Phil Reid
