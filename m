From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/2] Add pinctrl input schmitt support
Date: Wed, 22 Feb 2017 16:04:58 +0100
Message-ID: <CACRpkdYZg42hVuP_s1aacecsHg1XHEMO2W-yAjUBdoWbcZc5hw@mail.gmail.com>
References: <1487068541-14120-1-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:32784 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932754AbdBVPFB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 10:05:01 -0500
Received: by mail-io0-f173.google.com with SMTP id g18so3653352ioe.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2017 07:05:00 -0800 (PST)
In-Reply-To: <1487068541-14120-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tao Huang <huangtao@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Feb 14, 2017 at 11:35 AM, David Wu <david.wu@rock-chips.com> wrote:

> From: "david.wu" <david.wu@rock-chips.com>
>
> Some pins need to enable Schmitt triggers which are used
> in open loop configurations for noise immunity and closed
> loop configurations to implement function generators.

Just waiting for Heiko's review on this series before I queue it.

Yours,
Linus Walleij
