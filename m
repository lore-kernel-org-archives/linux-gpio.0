From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: Strange message from Kirkwood pinctrl driver
Date: Wed, 25 Nov 2015 15:46:45 +0100
Message-ID: <20151125144645.GE11384@lunn.ch>
References: <CACRpkdah4w-=qHS+q_=Ab-RiJyvbCKY-Rp5Ya0x+F=3DL2iuBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:41409 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750924AbbKYOqr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 25 Nov 2015 09:46:47 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdah4w-=qHS+q_=Ab-RiJyvbCKY-Rp5Ya0x+F=3DL2iuBA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Simon Guinot <simon.guinot@sequanux.org>, Jason Cooper <jason@lakedaemon.net>

On Wed, Nov 25, 2015 at 11:27:46AM +0100, Linus Walleij wrote:
> Hi Sebastian,
> 
> trying to use the Kirkwood pinctrl driver with compatible =
> "marvell,88f6192-pinctrl";
> on a Pogoplug series 4 yields the following message when instantiating
> the driver:
> 
> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 36
> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 37
> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 38
> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 39
> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 40

Hi Linus

Humm, interesting. I don't remember it doing that before. I will look
into this in the next couple of days.

     Andrew
