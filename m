From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] drivers/pinctrl: Add the concept of an "init" state
Date: Tue, 20 Oct 2015 22:06:41 -0700
Message-ID: <20151021050641.GA5198@kroah.com>
References: <1445400906-32284-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:49621 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751358AbbJUFGm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Oct 2015 01:06:42 -0400
Content-Disposition: inline
In-Reply-To: <1445400906-32284-1-git-send-email-dianders@chromium.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

On Tue, Oct 20, 2015 at 09:15:06PM -0700, Douglas Anderson wrote:
> For pinctrl the "default" state is applied to pins before the driver's
> probe function is called.  This is normally a sensible thing to do,
> but in some cases can cause problems.  That's because the pins will
> change state before the driver is given a chance to program how those
> pins should behave.
> 
> As an example you might have a regulator that is controlled by a PWM
> (output high = high voltage, output low = low voltage).  The firmware
> might leave this pin as driven high.  If we allow the driver core to
> reconfigure this pin as a PWM pin before the PWM's probe function runs
> then you might end up running at too low of a voltage while we probe.
> 
> Let's introudce a new "init" state.  If this is defined we'll set
> pinctrl to this state before probe and then "default" after probe
> (unless the driver explicitly changed states already).
> 
> An alternative idea that was thought of was to use the pre-existing
> "sleep" or "idle" states and add a boolean property that we should
> start in that mode.  This was not done because the "init" state is
> needed for correctness and those other states are only present (and
> only transitioned in to and out of) when (optional) power management
> is enabled.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Tested-by: Caesar Wang <wxt@rock-chips.com>
> ---
> Changes in v3:
> - Moved declarations to pinctrl/devinfo.h
> - Fixed author/SoB
> 
> Changes in v2:
> - Added comment to pinctrl_init_done() as per Linus W.
> 
> As mentioned in v2 repost, reposted after 1 year of no activity since
> Caesar Wang found a use for this.  See
> <https://patchwork.kernel.org/patch/7444161/>.  I hope it's OK that I
> left Greg KH's Ack...

The ack from me is fine.

thanks,

greg k-h
