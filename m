From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] pinctrl: meson-gxl: add tsin_a pins
Date: Thu, 08 Jun 2017 16:05:16 +0200
Message-ID: <1496930716.3552.47.camel@baylibre.com>
References: <20170608130948.16426-1-jbrunet@baylibre.com>
         <ed2befab-728b-6165-a86b-deb92f220996@suse.de>
         <1496930016.3552.45.camel@baylibre.com>
         <07b2ff66-6ac1-5e20-b70f-4dec2e050337@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:33401 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751768AbdFHOFS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2017 10:05:18 -0400
Received: by mail-wm0-f41.google.com with SMTP id m7so37985873wmg.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jun 2017 07:05:18 -0700 (PDT)
In-Reply-To: <07b2ff66-6ac1-5e20-b70f-4dec2e050337@suse.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org

On Thu, 2017-06-08 at 15:58 +0200, Andreas Färber wrote:
> Am 08.06.2017 um 15:53 schrieb Jerome Brunet:
> > On Thu, 2017-06-08 at 15:49 +0200, Andreas Färber wrote:
> > > Am 08.06.2017 um 15:09 schrieb Jerome Brunet:
> > > > Add Tsin A pins to bank DV and X.
> > > > We don't have a driver for the tsin yet but since the tsin A pinmux is
> > > > enabled by default at boot time, declaring this pinmux is required to
> > > > properly operate on GPIOX.
> > > > 
> > > > Without this change, GPIOX 8, 9, 10 and 11 can't be driven as GPIO
> > > > output
> > > > as the tsin A seems to have priority.
> > > 
> > > Should this get a Fixes header then for stable backports?
> > 
> > Nothing is wrong with what is already in. This is merely an addition.
> 
> Your above description of not being able to use GPIOs on e.g. the GXL
> based Khadas Vim devboard sounded like a bug to me.

As far as I know, the affected pins (GPIOX 8 to 11) are used for BTPCM, not
GPIOs, on all supported designs, including the Vim. 

> 
> > If we go that way, all commit to this file should have a Fixes to the
> > initial commit. This seems a bit extreme to me ...
> 
> Thought it might have been just an oversight.
> 
> Cheers,
> Andreas
> 

