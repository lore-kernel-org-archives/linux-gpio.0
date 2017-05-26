From: "David.Wu" <david.wu@rock-chips.com>
Subject: Re: [PATCH 2/4] pinctrl: rockchip: Add iomux-route switching support
 for rk3228
Date: Fri, 26 May 2017 11:38:57 +0800
Message-ID: <a36f756f-9454-adf7-18aa-3e46c3d79cde@rock-chips.com>
References: <1495717952-9762-1-git-send-email-david.wu@rock-chips.com>
 <1495717952-9762-3-git-send-email-david.wu@rock-chips.com>
 <3063930.sJt1b8WyHP@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:34082 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032816AbdEZDi0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2017 23:38:26 -0400
In-Reply-To: <3063930.sJt1b8WyHP@phil>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linus.walleij@linaro.org, huangtao@rock-chips.com, dianders@chromium.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Heiko,

在 2017/5/26 5:12, Heiko Stuebner 写道:
> Requiring developers to calculate this pin-bit-value for each bank
> is cumbersome and error-prone. With the routes-struct known in
> the driver (see above and below), you can keep the the value element
> in rockchip_pin_bank, but calculate the per-bank value dynamically
> when the bank gets created.
> 
> For example in rockchip_pinctrl_get_soc_data just parse the route-struct
> and calculate that value when the driver probes.
> 
> This reduces possible errors and also spares us the clutter of all the
> additional PIN_BANK_* defines.

It is good to calculate the per-bank value dynamically, Thanks.☺

