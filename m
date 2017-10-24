From: "David.Wu" <david.wu@rock-chips.com>
Subject: Re: pinctrl: rockchip: Add iomux-route switching support for rk3288
Date: Tue, 24 Oct 2017 09:23:41 +0800
Message-ID: <63f59d2b-01f2-3484-f3cc-fec63d546f11@rock-chips.com>
References: <20171021085310.16246-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:54268 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751215AbdJXBXs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Oct 2017 21:23:48 -0400
In-Reply-To: <20171021085310.16246-1-heiko@sntech.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, hans.verkuil@cisco.com, linux-rockchip@lists.infradead.org

Hi Heiko,

在 2017/10/21 16:53, Heiko Stuebner 写道:
> The rk3288 also has one function that can be routed to one of two pins,
> the hdmi cec functionality can use either gpio7c0 or gpio7c7.
> So add the route switching support for it.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Hans Verkuil <hans.verkuil@cisco.com>

Reviewed-by: David Wu <david.wu@rock-chips.com>
Thanks.

