From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] gpio: pinctrl: Initialize Armada-XP GPIO/Pinctrl
 drivers at arch_initcall
Date: Tue, 12 May 2015 09:18:15 +0200
Message-ID: <20150512091815.62249e70@free-electrons.com>
References: <1431398382-1894-1-git-send-email-joshua.scott@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:42492 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752541AbbELHST (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 03:18:19 -0400
In-Reply-To: <1431398382-1894-1-git-send-email-joshua.scott@alliedtelesis.co.nz>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Fabian Frederick <fabf@skynet.be>, Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>

Dear Joshua Scott,

On Tue, 12 May 2015 14:39:42 +1200, Joshua Scott wrote:
> The Armada-XP contains a set of GPIO pins. These pins may be used to take
> other hardware out of reset. However, the drivers used are currently not
> initialized until quite late in the boot process (module_platform_driver).
> 
> This patch replaces the use of module_platform_driver with arch_initcall
> in the two drivers that are used to control the GPIO pins. This allows for
> drivers using subsys_initcall or later to access to the pins.
> 
> 
> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>

Thanks for the patch. However, this goes exactly in the opposite
direction of commit dd640039e8de4135fd59d4d963487d1239d6fabe ("gpio:
mvebu: Remove initcall-based driver initialization"), which switched
from postcore_initcall() to module_platform_driver().

Can you describe which drivers registered at subsys_initcall() need
those GPIOs? We should be able to get around by using deferred probing.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
