From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] tools/gpio: add the gpio-hammer tool
Date: Wed, 1 Jun 2016 19:35:28 +0200
Message-ID: <CACRpkdZrdwPwnLDnHfBxEi67cUsfUAo+ugHnZWxywg5Vjdzghw@mail.gmail.com>
References: <1461660866-18683-1-git-send-email-linus.walleij@linaro.org>
	<1461660866-18683-2-git-send-email-linus.walleij@linaro.org>
	<20160427160034.GA20392@deathstar>
	<CACRpkdYr8GSmQ-=G4XcTtfrBcKsXUsJOvE7W35Fk-ovDiyaPJA@mail.gmail.com>
	<20160601034343.GA3749@deathstar>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:35306 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932640AbcFARf3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2016 13:35:29 -0400
Received: by mail-oi0-f52.google.com with SMTP id w184so38785187oiw.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2016 10:35:29 -0700 (PDT)
In-Reply-To: <20160601034343.GA3749@deathstar>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Johan Hovold <johan@kernel.org>

On Wed, Jun 1, 2016 at 5:43 AM, Michael Welling <mwelling@ieee.org> wrote:

> Did you ever find a solution for the exhausted char dev problem?

Not really. It seems it turned up that all systems that bugged were randomly
generated QEMU models, not real systems.

They were also really doing far out stuff already, overwriting existing chardevs
all over the place, which can be seen in logs after commit
49db08c35887 "chrdev: emit a warning when we go below dynamic major range"
which I got merged.

I'm now working on an event ABI so we get feature complete and also surpass
the old sysfs.

Yours,
Linus Walleij
