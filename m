From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] gpio: vf610: handle level IRQ's properly
Date: Wed, 26 Aug 2015 10:11:25 -0700
Message-ID: <99db8c092e8b54d485e88887630d51c0@agner.ch>
References: <1440197802-29720-1-git-send-email-stefan@agner.ch>
 <CACRpkdYqU_yvZE4WS2jBDOhemPy7dcHeOoj_dG61hCL8ugTMYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:48808 "EHLO
	mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756765AbbHZRLn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 13:11:43 -0400
In-Reply-To: <CACRpkdYqU_yvZE4WS2jBDOhemPy7dcHeOoj_dG61hCL8ugTMYg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 2015-08-26 05:47, Linus Walleij wrote:
> On Sat, Aug 22, 2015 at 12:56 AM, Stefan Agner <stefan@agner.ch> wrote:
> 
>> The GPIO IRQ controller is able to generate level triggered
>> interrupts, however, these were handled by handle_simple_irq so far
>> which did not take care of IRQ masking. This lead to "nobody cared
>> (try booting with the "irqpoll" option)" stack traces.
>>
>> Use the generic interrupt handlers depending on the IRQ type.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> Patch applied.

Thx

 
> Hm, this looks like a problem that could exist in a few more
> GPIO drivers. Can you look around and see if there is something
> immediately suspicious in drivers/gpio?

Just looked a bit around. There are some which use handle_simple_irq but
also run their handler in threaded/one-shot handler. I guess in that
case it is fine to use the simple_irq handler.

However, those GPIO drivers look suspicious:

gpio-altera.c: Uses handle_simple_irq, supports edge and level
gpio-bcm-kona.c: Uses handle_simple_irq, supports only edge
gpio-grgpio.c: Uses handle_simple_irq, supports edge and level
gpio-intel-mid.c: Uses handle_simple_irq, supports only edge
gpio-lynxpoint.c: Uses handle_simple_irq, supports edge and level
gpio-ml-ioh.c: Uses handle_simple_irq, supports edge and level
gpio-pl061.c: Uses handle_simple_irq, supports edge and level
gpio-rcar.c: Uses handle_level_irq, supports edge and level
gpio-timberdale.c: Uses handle_simple_irq, supports edge and level

--
Stefan
