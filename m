From: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Subject: Re: Right amount of info in the DT
Date: Mon, 24 Apr 2017 15:03:48 +0200
Message-ID: <815d2f8e-2e85-31d7-4f69-b89b7be79d9e@sigmadesigns.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
 <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.bemta12.messagelabs.com ([216.82.251.10]:19928 "EHLO
        mail1.bemta12.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1170597AbdDXNEL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Apr 2017 09:04:11 -0400
In-Reply-To: <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>

Hello Linus, thanks for reply.

OK I see now that I have to do this kind of stuff in a pinctrl/pinmux driver.

I've read the documentation you pointed to and browsed a few existing drivers,
but I'm still a bit confused by how my device tree should look like. Indeed in
my SoC there is no central hw pin controller, and pin control registers are
scattered all over the address space because they're in different IPs. How am I
supposed to deal with so many different addresses? I have considered hardcoding
them in the driver but that seems counter-productive, so I thought I could do
something like this, with the address of the function-select register as a
resource (it's the only pin property I can change besides direction and data):


pincontroller {
        compatible = "foo-pinctrl";
        #address-cells = <1>;
        #size-cells = <0>;

        uart1 {
                reg = <0x10001>;

                state_0 {
                        groups = "uart1";
                        function = "uart1";
                };
                state_1 {
                        groups = "uart1";
                        function = "gpio";
                };

        ... other IPs (SPI, ethernet, etc.) ...

};


Furthermore, I was wondering how it's possible for pinctrl drivers to map registers
possibly used by other drivers. For example, the "GPIO pad mode" register of my
ethernet pins is right in the middle of the address space requested by the ethernet
driver. Meaning that if I try to "devm_ioremap_resource" when probing the GPIO or
pinctrl drivers, I will get an error saying that the memory region is already taken.
Do you have any insight on that?

Regards,
Yves.


On 04/24/2017 10:23 AM, Linus Walleij wrote:
> On Thu, Apr 20, 2017 at 11:54 AM, Yves Lefloch
> <YvesMarie_Lefloch@sigmadesigns.com> wrote:
> 
>> I have a bunch of GPIO groups all over the place (dedicated pins, UART pins,
>> ethernet pins, etc.), and even though they mainly behave similarly (same way of
>> handling direction and value), there are some differences between them:
>> - IRQs, because some groups can generate interrupts and others can't;
>> - Alternate functions (for instance GPIO mode vs UART mode), because obviously
>>   dedicated pins don't have an alternate function, and for the others which have
>>   it, the mode-changing register is sometimes before, sometimes after the other
>>   regs.
> 
> The basic problem is that you conceptualize of these things as GPIO
> and not the more abstract concept of pins under pin control.
> For example, there are not GPIO groups, there are pin control pin
> multiplexing groups.
> 
> Please read Documentation/pinctrl.txt
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/pinctrl.txt
> 
> Also read the generic pin control device tree bindings:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> 
> Further in the GPIO subsystem you will find references back to how it
> interacts with pin control.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/gpio/gpio.txt
> 
> Yours,
> Linus Walleij
> 
