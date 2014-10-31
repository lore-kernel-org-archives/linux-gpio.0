From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 1/7] pinctrl: rockchip: add suspend/resume functions
Date: Fri, 31 Oct 2014 21:54:54 +0100
Message-ID: <CACRpkdbm6q9Y0zqyQpCbVZzprEHcca75r1aC1OEq1HBmEXBj=g@mail.gmail.com>
References: <1414583525-17395-1-git-send-email-zyw@rock-chips.com>
	<1414583525-17395-2-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:35061 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753046AbaJaUyz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Oct 2014 16:54:55 -0400
Received: by mail-ie0-f169.google.com with SMTP id tr6so2138876ieb.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2014 13:54:55 -0700 (PDT)
In-Reply-To: <1414583525-17395-2-git-send-email-zyw@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Doug Anderson <dianders@chromium.org>, Mike Turquette <mturquette@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, khilman@kernel.org, linux-rockchip@lists.infradead.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Oct 29, 2014 at 12:51 PM, Chris Zhong <zyw@rock-chips.com> wrote:

> support suspend/resume of pinctrl, it allows handling sleep mode
> for hogged pins in pinctrl
>
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> Tested-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

As mentioned I expect Heiko to queue this patch with the
other stuff and send the result to me.

Yours,
Linus Walleij
