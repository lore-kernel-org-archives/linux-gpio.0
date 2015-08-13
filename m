From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 2/2] pinctrl: rockchip: only enable gpio clock when it setting
Date: Thu, 13 Aug 2015 14:24:28 +0200
Message-ID: <CACRpkda0FXz1dpdS-wLRNmkt1KBESMyCWKMMa0ArH9Z-L=i_sw@mail.gmail.com>
References: <1439287924-6988-1-git-send-email-hl@rock-chips.com>
	<1439287924-6988-2-git-send-email-hl@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:36032 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752286AbbHMMY3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2015 08:24:29 -0400
Received: by obnw1 with SMTP id w1so35307598obn.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2015 05:24:28 -0700 (PDT)
In-Reply-To: <1439287924-6988-2-git-send-email-hl@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lin Huang <hl@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Doug Anderson <dianders@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 11, 2015 at 12:12 PM, Lin Huang <hl@rock-chips.com> wrote:

> gpio can keep state even the clock disable, for save power
> consumption, only enable gpio clock when it setting
>
> Signed-off-by: Lin Huang <hl@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
> Changes in v5:
> -rebase patch

Patch applied with Doug's test tags etc.

Yours,
Linus Walleij
