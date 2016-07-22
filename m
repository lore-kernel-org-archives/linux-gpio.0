From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: fix pincontrol definition for marvell
Date: Fri, 22 Jul 2016 17:12:40 +0200
Message-ID: <CACRpkdaXAF9-vq3tDSKXiNy7yLOO8+PydnYZuEPDNS_kcQCvJA@mail.gmail.com>
References: <20160716150704.GA5883@andreas>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33414 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082AbcGVPMl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2016 11:12:41 -0400
Received: by mail-oi0-f51.google.com with SMTP id j185so166776326oih.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2016 08:12:41 -0700 (PDT)
In-Reply-To: <20160716150704.GA5883@andreas>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Jul 16, 2016 at 5:07 PM, Andreas Klinger <ak@it-klinger.de> wrote:

> On Marvell mv88f6180 with pin control driver one can not use multi
> purpose pins 35 through 44.
> I'm using this controller on an embedded board and i found that the
> pin multiplexing is not the same as in the hardware spezification.
> This patch alters the pin description so that mpp pins 0 to 19 as well
> as 35 to 44 are usable.
>
> Pin settings i used can be found here:
> http://www.marvell.com/embedded-processors/kirkwood/assets/HW_88F6180_OpenSource.pdf
>
>
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>

Thomas/Sebastian: does this patch look OK to you?

Yours,
Linus Walleij
