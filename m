From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 05/10] dt-bindings: add documentation for rk1108 pinctrl
Date: Tue, 15 Nov 2016 00:13:00 +0100
Message-ID: <10364072.1rQosJBocW@phil>
References: <1479124550-24037-1-git-send-email-andy.yan@rock-chips.com> <1479125393-24355-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:47733 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965415AbcKNXNX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Nov 2016 18:13:23 -0500
In-Reply-To: <1479125393-24355-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org

Am Montag, 14. November 2016, 20:09:53 CET schrieb Andy Yan:
> This adds the dt-binding documentation for rk1108 pinctrl
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

pretty straight forward
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

I guess at some later point we should move the compatible list to one 
compatible per line, similar to what the mshc mmc does, because as we're 
seeing right now, soc numbering is not incremental :-) .


Heiko
