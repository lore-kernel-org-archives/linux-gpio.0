From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] gpio/mxc: implement reading output gpio value
Date: Wed, 5 Aug 2015 17:44:54 -0300
Message-ID: <CAOMZO5CPp4OmtpfXiMKFARs=k_Sf1y1MTbUX3LPGhy660_YnWQ@mail.gmail.com>
References: <1438795388-22743-1-git-send-email-edubezval@gmail.com>
	<1438795388-22743-3-git-send-email-edubezval@gmail.com>
	<CAOMZO5C3mh+vYV_ZHA8hAq2UwY_TcO5sZxqLQDyNvs0VuVvJAg@mail.gmail.com>
	<20150805180215.GA4161@localhost.localdomain>
	<CAOMZO5DPYL43QNwYRiGJ_rd2eqm64wg+zACK6viWbC_aFH=qsQ@mail.gmail.com>
	<20150805194602.GB1230@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:34065 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753139AbbHEUo4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2015 16:44:56 -0400
In-Reply-To: <20150805194602.GB1230@localhost.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ulises Brindis <ubrindis56@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>

On Wed, Aug 5, 2015 at 4:46 PM, Eduardo Valentin <edubezval@gmail.com> wrote:

> OK. Then, what is the recommendation? Do we set this by default in the
> driver code or this is left for DTS pinmux configuration?

You just need to set the SION bit in the pad you need to read the output.

SION is bit 30 according to
Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt

> To me seams like a bug in the gpio driver still, as the possibility to
> read the value of an output gpio is missing/inconsistent.

No, it is not a bug.

The Reference Manual explains the need of setting the SION bit:

>From the mx6q reference manual:

"28.4.3.2 GPIO Write Mode
The programming sequence for driving output signals should be as follows:
1. Configure IOMUX to select GPIO mode (Via IOMUXC), also enable SION if need
to read loopback pad value through PSR"
