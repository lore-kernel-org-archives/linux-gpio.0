From: Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
Date: Mon, 6 Feb 2017 10:28:13 -0800
Message-ID: <20170206182813.GI3897@atomide.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
 <2041391.79UjQ7DgUt@avalon>
 <83c749f8-4eee-96e7-9c91-8a350d2a7498@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <83c749f8-4eee-96e7-9c91-8a350d2a7498@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linus.walleij@linaro.org, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

* jacopo mondi <jacopo@jmondi.org> [170206 10:16]:
> Currently there is no generic pinctrl and pinmux function to retrieve a
> group or function by name, but only by their id (selector).
> It would take 10minutes to add them, but I wonder if that's desirable or
> there are other ways to do so I haven't found out yet.
> 
> Linus, Tony and gpio people: do you have opinions on this? I can add those
> functions to core/pinmux in my next patch series if I get your ack here.

I would just get rid of the names and allow optionally configuring them
from the consumer. Just like we do for interrupts and GPIOs.

Regards,

Tony
