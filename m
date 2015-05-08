From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFI] pinmux: pin group ownership
Date: Fri, 8 May 2015 16:01:37 +0100
Message-ID: <554CCFD1.5050907@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19773 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751332AbbEHPBp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 8 May 2015 11:01:45 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, antoine.tenart@free-electrons.com

Hello,

I have been reviewing the pinmux driver code and I stumbled upon the
following change.

e5b3b2d9ed202697a937c282f9c4d93b1e3e0848 (pinctrl: allows not to define
the get_group_pins operation)

Looking at this change, if pinmux_enable_setting() is called but
.get_group_pins() is not defined, then num_pins will be 0. If this is
the case then pin_request() is not called to allocate the pins in the
group (because no pins are defined for the group). So that makes sense.

However, I am trying to understand then, if the pinmux driver will
protect against another device attempting to use the same group for a
different function when already in-use?

For example, if you have the two functions i2c0 and uart0 mapped to pin
group A, but no pins are defined for group A, will pinmux prevent
someone attempting to configure both functions on the same group at the
same time?

I did not see anywhere that sets a usecount for a group (ie. allocates
the group) but only for a pin.

Cheers
Jon
