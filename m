From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/8] pinctrl: rockchip: add support for the rk3228
Date: Fri, 11 Dec 2015 19:10:24 +0100
Message-ID: <CACRpkdYVSAQqvgY4U5fNBrFbf8xr4kDWEUirpKy2Z5-fajU2Bw@mail.gmail.com>
References: <1449651853-1667-1-git-send-email-jeffy.chen@rock-chips.com>
	<1449651853-1667-2-git-send-email-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:35496 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751526AbbLKSKY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 13:10:24 -0500
Received: by obc18 with SMTP id 18so88252975obc.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2015 10:10:24 -0800 (PST)
In-Reply-To: <1449651853-1667-2-git-send-email-jeffy.chen@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jeffy Chen <jeffy.chen@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>

On Wed, Dec 9, 2015 at 10:04 AM, Jeffy Chen <jeffy.chen@rock-chips.com> wrote:

> The pinctrl of rk3228 is much the same as rk3288's, but
> without pmu.
>
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>

Patch applied with Heiko's and Rob's Review/ACKs.

Yours,
Linus Walleij
