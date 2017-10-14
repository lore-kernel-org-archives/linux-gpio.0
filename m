From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 5/5] gpio: Add driver for Maxim MAX3191x industrial
 serializer
Date: Sat, 14 Oct 2017 13:24:46 +0200
Message-ID: <20171014112446.GA23429@wunner.de>
References: <cover.1507797496.git.lukas@wunner.de>
 <165c5061f7f309ecb7f1a3d32c8f7df5026f4a47.1507797496.git.lukas@wunner.de>
 <20171013111124.GA12351@wunner.de>
 <797c3efc-c466-1371-bb3e-176915f81895@caviumnetworks.com>
 <20171013212907.GA25710@wunner.de>
 <86333441-4c2b-3e3d-853f-eddadf446956@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout1.hostsharing.net ([83.223.95.204]:36549 "EHLO
        mailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751818AbdJNLXX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Oct 2017 07:23:23 -0400
Content-Disposition: inline
In-Reply-To: <86333441-4c2b-3e3d-853f-eddadf446956@caviumnetworks.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Phil Reid <preid@electromag.com.au>, David Daney <david.daney@cavium.com>, Iban Rodriguez <irodriguez@cemitec.com>, Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org

On Fri, Oct 13, 2017 at 03:12:41PM -0700, David Daney wrote:
> There are a maximum of two banks.
> 
> For some thunderx SoCs there is only a single bank, so my code has exactly
> one iteration.  For the SoCs with two banks, my code has exactly two
> iterations.  There are no function calls in the loop.

Fair enough.  So as you've pointed out, if the number of GPIOs per bank
is identical to the number of bits in an unsigned long, the iteration
count is the same with both algorithms and just iterating over the
banks results in simpler and less code.  Doubly so if there's just
one or two banks.  Those are good points.

The situation is different with e.g. gpio-max3191x.c and gpio-74x164.c
where each bank has only 8 GPIOs.


> I can't believe I have spent so much time on this issue, for which no matter
> what you do, will not impact system performance in any measurable way.

The use case that I'm referring to in the cover letter of this series
are PLCs which poll all inputs and write all outputs in cycles of e.g.
every 500 us to 10 ms, so optimizations pay off.

Thanks,

Lukas
