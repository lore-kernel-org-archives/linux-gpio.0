From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 06/10] pinctrl: berlin: use proper compatibles
Date: Wed, 10 Jun 2015 09:13:55 +0200
Message-ID: <CACRpkda-4SahLjwe09D-Hb8p0nQFdG1Zc_xvLPwLGYQMkJQaXA@mail.gmail.com>
References: <1425654328-26298-1-git-send-email-antoine.tenart@free-electrons.com>
	<1425654328-26298-7-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35870 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751074AbbFJHN4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 03:13:56 -0400
Received: by oihb142 with SMTP id b142so26553096oih.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2015 00:13:56 -0700 (PDT)
In-Reply-To: <1425654328-26298-7-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jisheng Zhang <jszhang@marvell.com>, zhiming Xu <zmxu@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Mar 6, 2015 at 4:05 PM, Antoine Tenart
<antoine.tenart@free-electrons.com> wrote:

> The Berlin pin-controller driver was sharing the chip and system
> controller nodes with the clock and the reset drivers. They all shared
> the same compatible. With the introduction of the Marvell Berlin MFD
> controller, the Berlin pin-controller driver has now its own node.
> Update its compatibles to not share anymore the ones of the chip and
> system controllers.
>
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Antoine, how is this series going?

If I can merge some of it to pinctrl let me know.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
