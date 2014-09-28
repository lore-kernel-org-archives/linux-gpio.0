From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [periperi] How to set default GPIO pin ?
Date: Mon, 29 Sep 2014 00:25:26 +0300
Message-ID: <2033766.6tR9OHe7ZC@avalon>
References: <8738cc0vx9.wl%kuninori.morimoto.gx@gmail.com> <2862746.g5u9pdpKDi@avalon> <CACRpkdb1jF-ro3XcFHFC+Lhgi+0dEHzQYVSSLV6AWnAxiwNLdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:48683 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754125AbaI1VZV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Sep 2014 17:25:21 -0400
In-Reply-To: <CACRpkdb1jF-ro3XcFHFC+Lhgi+0dEHzQYVSSLV6AWnAxiwNLdw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, "goda (Renesas)" <yusuke.goda.sx@renesas.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Linus and Morimoto-san,

On Tuesday 23 September 2014 17:06:28 Linus Walleij wrote:
> On Wed, Sep 10, 2014 at 10:55 AM, Laurent Pinchart wrote:
> > On Sunday 31 August 2014 22:08:52 Kuninori Morimoto wrote:
> >> I know we can use "defalt" PFC settings on DT.
> >> But, how to use "defalt" GPIO pin settings on DT ?
> >> 
> >> We would like to use GPIO 7-17 as Low output,
> >> and do nothing after boot.
> > 
> > From a DT point of view I believe this is supposed to be done by
> > specifying the output-low or output-high properties in the pinctrl
> > configuration node. However, these properties are not supported by the PFC
> > driver, and there's no easy way for the PFC driver to configure GPIOs
> > handled by a different driver such as the gpio-rcar driver for instance.
> > 
> > Linus, do you have any hindsight on how this should be implemented ?
> 
> I have suggested adding GPIO hogs, so that a GPIO node can specify
> that some GPIO's specified on the local ship be hogged high or
> low at probe. Generic DT bindings and generic code in gpiolib.c.
> 
> gpios-hog-high = <....>;
> gpios-hog-low = <....>;

How about just a gpios-hog property, with a list of gpio specifiers + flags ? 
That's bikeshedding I suppose.

Morimoto-san, would you like to implement that ? :-)

-- 
Regards,

Laurent Pinchart

