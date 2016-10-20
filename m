From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 7/9] ARM: sunxi: Remove useless allwinner,drive property
Date: Thu, 20 Oct 2016 14:55:58 +0200
Message-ID: <CACRpkdaRVWggr2UhFmXHCtNcyu6ghVAT-oM0RdNbWvxraXOwXQ@mail.gmail.com>
References: <cover.7edc6c25be8a5e2efdda6a82e102dbf7ece6aa64.1476200742.git-series.maxime.ripard@free-electrons.com>
 <076406072c137a50df41c4acb0c582a688792976.1476200742.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:32979 "EHLO
        mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935180AbcJTMz7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2016 08:55:59 -0400
Received: by mail-qk0-f172.google.com with SMTP id n189so92556221qke.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2016 05:55:59 -0700 (PDT)
In-Reply-To: <076406072c137a50df41c4acb0c582a688792976.1476200742.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Oct 11, 2016 at 5:46 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> The allwinner,drive property set to 10mA was really considered as our
> default. Remove all those properties entirely to make that obvious.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please merge this through the ARM SoC tree.

Yours,
Linus Walleij
