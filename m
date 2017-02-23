From: Marc Pignat <marc@pignat.org>
Subject: Re: [PATCH] gpio: add NCT5104D gpio driver
Date: Thu, 23 Feb 2017 13:40:43 +0100
Message-ID: <b9c62064-9fa3-0666-53ef-b6e1d505feff@pignat.org>
References: <77f71974-541e-7e06-d37d-c52b9623ed25@pignat.org>
 <CACRpkdbfOFCWQsytnf0f2ZvBsvHqQ85nk-aKK-zXpr8F=uJ3UQ@mail.gmail.com>
 <20170222210420.GA15290@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:42531 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751126AbdBWMks (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Feb 2017 07:40:48 -0500
In-Reply-To: <20170222210420.GA15290@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Dear all,

Thank you for your feedback!

On 02/22/2017 10:04 PM, William Breathitt Gray wrote:
> On Wed, Feb 22, 2017 at 03:52:05PM +0100, Linus Walleij wrote:
>> On Thu, Feb 9, 2017 at 11:54 AM, Marc Pignat <marc@pignat.org> wrote:
...
>> Please look a bit at drivers/gpio/gpio-it87.c, and gpio-f7188x.c it seems to me
>> that this is a simlar or identical chip to one of these. In that case,

Looking at gpio-f7188x.c is probably the best feedback.

In fact the patch I proposed is just a copy+modifications of an old version of 
this file.

So someone (who has put his name in the author field) has copied the gpio-f7188x.c,
changed something like 20 lines (excluding identifiers renaming) and pushed it to
github. I took it from github, tested it and passed it through checkpatch.pl and
proposed it for inclusion into the mainline kernel.

>> you should
>> augment and extend an existing driver instead of writing a new one.

Sure!

>> But I haven't
...
> 
> This plan would obviously require more time to get right, so if you
> decide to merge this particular driver now, I suggest at least using the
> isa_driver idioms for now to ease the transition to a possible future
> super_io_driver.

super_io_driver seems a good idea, in the meantime, I will try to merge the nct5104
code into gpio-f7188x.c, without the isa_driver idiom.

Best regards



Marc

