From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 2/2] pinctrl: rockchip: only enable gpio clock when it setting
Date: Tue, 11 Aug 2015 15:56:48 -0700
Message-ID: <CAD=FV=VpmoiqoNi2pEQpgbC1R6E7_+Noh0vWGE_9UyK8NZHorw@mail.gmail.com>
References: <1439287924-6988-1-git-send-email-hl@rock-chips.com>
	<1439287924-6988-2-git-send-email-hl@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:35300 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753301AbbHKW4t (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Aug 2015 18:56:49 -0400
Received: by ykdz80 with SMTP id z80so129200ykd.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2015 15:56:49 -0700 (PDT)
In-Reply-To: <1439287924-6988-2-git-send-email-hl@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lin Huang <hl@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On Tue, Aug 11, 2015 at 3:12 AM, Lin Huang <hl@rock-chips.com> wrote:
> gpio can keep state even the clock disable, for save power
> consumption, only enable gpio clock when it setting
>
> Signed-off-by: Lin Huang <hl@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
> Changes in v5:
> -rebase patch
>
>  drivers/pinctrl/pinctrl-rockchip.c | 55 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 51 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Also in the ChromeOS 3.14 tree (where this patch has been backported):

Tested-by: Douglas Anderson <dianders@chromium.org>
