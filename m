From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: configuration for nc pins without pull
Date: Sun, 22 Mar 2015 14:40:05 +0000
Message-ID: <20150322144004.GN8656@n2100.arm.linux.org.uk>
References: <20150322100059.GH5664@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:34989 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751373AbbCVOkV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Mar 2015 10:40:21 -0400
Content-Disposition: inline
In-Reply-To: <20150322100059.GH5664@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sun, Mar 22, 2015 at 11:00:59AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> for a machine I want to configure a pin that is actually not connecte=
d
> to minimize floating. (I think this is sensible, isn't it?)

Definitely.  It's a design error to leave a pin floating, especially
if they're MOS inputs (which most are).  The reason is that many
MOS inputs are a pair of MOS transistors - one from +V to their output
(into the device) the other between their output and ground.

If the input floats, then both transistors are partially turned on,
which gives a wasteful flow of current between +V and ground - hence
this increases the current draw and dissipation of the device - and
is a total waste of energy.

Generally, when designing MOS circuitry using standard gates, it is
very much a design error to leave any unused gate inputs unconnected
for this very reason - not only that, but the input is also sensitive
to static electricity.  A floating input has a very high input
resistance, and a static discharge into it can destroy those input
transistors I've mentioned above - turning *both* hard on, which
gives you a dead short between +V and ground.

That can result in the device effectively being fried, even if the
fried input is not being used (because it drags the supply down.)

=46loating inputs are *always* bad.

(Just make sure that the designer hasn't already thought of this and
tied the inputs high or low, possibly through a resistor.  Even so,
I'd say that it's good practice if the chip has biasing to bias them
accordingly, so that should there be a bad joint on the board, it
doesn't allow the pin to start floating.  Bad joints happen, and
sometimes show after a few months of otherwise good operation...)

--=20
=46TTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps u=
p
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
