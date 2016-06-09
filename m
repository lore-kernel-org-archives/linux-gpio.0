From: Dan O'Donovan <dan@emutex.com>
Subject: Re: [PATCH 5/5] pinctrl: cherryview: restore padctrl1 reg when gpio
 is disabled
Date: Thu, 9 Jun 2016 17:41:04 +0100
Message-ID: <57599C20.2030908@emutex.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
 <1464904543-4094-6-git-send-email-dan@emutex.com>
 <20160606104052.GX1743@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bert.emutex.com ([91.103.1.109]:32809 "EHLO bert.emutex.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932283AbcFIQlH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 9 Jun 2016 12:41:07 -0400
In-Reply-To: <20160606104052.GX1743@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linus.walleij@linaro.org, heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org

On 06/06/2016 11:40 AM, Mika Westerberg wrote:
> On Thu, Jun 02, 2016 at 10:55:43PM +0100, Dan O'Donovan wrote:
>> chv_gpio_request_enable() clears some bits in the padctrl1 register
>> when GPIO mode is selected, but these bits are not restored by
>> chv_gpio_disable_free() when GPIO mode is unselected and this can
>> prevent other pin modes (e.g. I2C) from functioning correctly
>> thereafter on that pin.  This patch adds saving/restoring of those
>> bits.
> Not sure how useful this is. If you want to mux I2C out of pins (even if
> they were previosly configured as GPIO), you should call pinctrl to do
> that (or let the core to do that automatically). Expecting that certain
> (possibly unknown state) is restored does seem fragile to me.
Perhaps my description of the change was misleading.  Consider this scenario:
 * chv_pinmux_set_mux() is invoked at start-up (triggered by registering a pin map), and this sets a pin to an alternate mode (e.g. I2C, PWM, whatever).
   - For some pins/modes, this may set the INVRXTX bits in the PADCTRL1 register.  These bits may have also been set early by the BIOS.
 * some time later, the user exports the pin via sysfs for use as a GPIO, which triggers chv_gpio_request_enable()
   - chv_gpio_request_enable() clears some bits in the PADCTRL1 register (including INVRXTX)
 * later again, the user unexports the GPIO pin, which triggers chv_gpio_disable_free().
   - this returns the pin to its previously-selected alternate mode (GPIO is disabled).  However, the INVRXTX bits are not restored here, so the alternate mode no longer works.

>From the way the driver is written (possibly influenced by the hardware design), it appears that this can be a valid usage scenario - i.e. the pin can optionally be set to an alternate mode initially, but the user can bring it in/out of GPIO mode thereafter.  But, because the entry and exit from GPIO mode is not "symmetrical", it loses some configuration that was previously set for the alternate mode.

Admittedly, I've only encountered this scenario in validation testing - I'm not sure if there is a real use-case that would require this - so I can certainly drop this patch if you feel that a fix isn't warranted here.
>
> Also what happens if the pin was originally muxed as GPIO?
This shouldn't make any difference, I think.  The change here is just attempting to make chv_gpio_disable_free() reverse the action of chv_gpio_request_enable() - by restoring PADCTRL register fields to their previous state (whatever that was) before chv_gpio_request_enable() was called.
