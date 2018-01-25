From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
Subject: Re: [RFC PATCH v1] pinctrl: meson: meson8b: fix requesting GPIOs
 greater than GPIOZ_3
Date: Thu, 25 Jan 2018 05:03:31 +0100
Message-ID: <20180125040331.GE1756@otheros>
References: <20180124002738.32338-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.aperture-lab.de ([138.201.29.205]:43556 "EHLO
        mail.aperture-lab.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933279AbeAYELx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jan 2018 23:11:53 -0500
Content-Disposition: inline
In-Reply-To: <20180124002738.32338-1-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, carlo@caione.org, jbrunet@baylibre.com, linus.walleij@linaro.org

On Wed, Jan 24, 2018 at 01:27:38AM +0100, Martin Blumenstingl wrote:
> Meson8b's AO GPIO controller is not affected by this issue since it does
> not have any holes in it - only the CBUS GPIO controller is affected.
> 
> This was initially seen by Linus Lüssing who was preparing SD card
> support on Odroid-C1 which uses CARD_6 as "card detect" GPIO.
> 
> Fixes: db80f0e158e621 ("pinctrl: meson: get rid of unneeded domain structures")
> Reported-by: Linus Lüssing <linus.luessing@c0d3.blue>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Hi Martin,

Just wanted to confirm that this indeed fixes the splats and
crashes I was experiencing. And I was able to successfully
read/write from/to a microSD card. Also card detect worked fine, I
could successfully unplug, replug and then read from it again.
Here some dmesg from a successful card detection:

[  512.584687] mmcblk0: error -84 sending status command, retrying
[  512.586985] mmcblk0: timed out sending r/w cmd command, card status 0xd00
[  512.591756] mmcblk0: status not valid, retrying timeout
[  638.652986] mmc0: card 1234 removed
[  656.722455] mmc0: new high speed SDHC card at address 1234
[  656.724667] mmcblk0: mmc0:1234 SA16G 14.4 GiB 
[  656.730312]  mmcblk0: p1 p2

There error happened when typing "$ sync" after the write. However
the written file seemed fine in the end.

The address 1234 also seemed like a weird coincidence. But maybe
that's just a bug in my DT changes.

I'll post the DT changes I had been experimenting with as an RFC
to linux-amlogic shortly.

Regards, Linus
