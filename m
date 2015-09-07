From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 0/3] gpiolib: Initializing GPIOs using DT property
 gpio-initval
Date: Mon, 7 Sep 2015 10:47:39 +0100
Message-ID: <20150907094739.GR21084@n2100.arm.linux.org.uk>
References: <1439979512-3894-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:56151 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753093AbbIGJrx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2015 05:47:53 -0400
Content-Disposition: inline
In-Reply-To: <1439979512-3894-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, kernel@pengutronix.de, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org

On Wed, Aug 19, 2015 at 12:18:29PM +0200, Markus Pargmann wrote:
> This series adds a gpio-initval property to the devicetree. It provides a way
> to initialize GPIOs to a defined value.

This is actually a good thing to have.  I know at least one SoC contains
a paragraph in its hardware spec:

General Purpose Pins (GPP)
Each individual pin can be defined as an input, output, or level interrupt
input. These pins can be used for indications retrieving or for peripherals
control. When not in use, program interface to GPIOs and set GPIOs as output.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
