From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Only restore pins that are used by the
 driver
Date: Tue, 11 Oct 2016 12:27:28 +0300
Message-ID: <20161011092728.GE2774@lahna.fi.intel.com>
References: <CAFv23Q=_wSqhBE9ni9YmtxyEKFSENLYZ512Ent9iyWd7hv3gYg@mail.gmail.com>
 <20161010133931.88055-1-mika.westerberg@linux.intel.com>
 <0e3bf0b8c82d4c3ca6d753abfd1063bf@ausx13mpc124.AMER.DELL.COM>
 <20161010145346.GI30800@lahna.fi.intel.com>
 <CAFv23Qn+dDRyGutHBh0FfXRBZCmfTf_B0bQy-E-bb+4Nx+Xx2Q@mail.gmail.com>
 <CAFv23QkWFkzGsUFEN5GW+47qQgNAtqSnXZeU_phos=J7czrKgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:30619 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752446AbcJKJ1l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Oct 2016 05:27:41 -0400
Content-Disposition: inline
In-Reply-To: <CAFv23QkWFkzGsUFEN5GW+47qQgNAtqSnXZeU_phos=J7czrKgQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Mario.Limonciello@dell.com, Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Calvin Johnson <linux.cj@gmail.com>, Jared.Dominguez@dell.com, linux-gpio@vger.kernel.org

On Tue, Oct 11, 2016 at 10:38:27AM +0800, AceLan Kao wrote:
> Hi Mika,
> 
> BTW, I failed to compile the kernel 4.4 with the patch.
> 
> The patch uses gpiochip_line_is_irq() function which has been
> introduced since 4.6-rc1, so we need to cherry pick this commit, too.
>    6cee382 gpio/pinctrl: sunxi: stop poking around in private vars
> 
> But the above commit uses gpiodev data member in struct gpio_chip
> which is introduced from this commit, and it's a big commit that can't
> be cherry-picked clearly.
>    ff2b135 gpio: make the gpiochip a real device
> 
> Will you provide other patch that can apply on top of old stable kernels?

Hmm,

So 6cee382 ("gpio/pinctrl: sunxi: stop poking around in private vars")
needs the following patch.

I can backport 6cee382 with the below patch and send both patches to
stable@ after this gets merged to mainline but not sure if that's the
correct process to follow.

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index db007a3e2af7..6240dd40e8be 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1524,7 +1524,7 @@ bool gpiochip_line_is_irq(struct gpio_chip *chip, unsigned int offset)
 	if (offset >= chip->ngpio)
 		return false;
 
-	return test_bit(FLAG_USED_AS_IRQ, &chip->gpiodev->descs[offset].flags);
+	return test_bit(FLAG_USED_AS_IRQ, &chip->desc[offset].flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_irq);
 
