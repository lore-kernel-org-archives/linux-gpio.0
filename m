From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: qcom: Clear all function selection bits
Date: Wed, 29 Jun 2016 10:14:15 +0200
Message-ID: <CACRpkdaqcOJGutDtwo+AezZa=F5de+U9JnhzTb-Q2_jDaAq68A@mail.gmail.com>
References: <20160626052132.7178-1-stephen.boyd@linaro.org> <20160626052132.7178-2-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:34930 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057AbcF2IO1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2016 04:14:27 -0400
Received: by mail-ob0-f177.google.com with SMTP id o10so2400076obp.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2016 01:14:16 -0700 (PDT)
In-Reply-To: <20160626052132.7178-2-stephen.boyd@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

On Sun, Jun 26, 2016 at 7:21 AM, Stephen Boyd <stephen.boyd@linaro.org> wrote:

> The function selection bitfield is not always 3 bits wide.
> Sometimes it is 4 bits wide. Let's use the npins struct member to
> determine how many bits wide the function selection bitfield is
> so we clear the correct amount of bits in the register while
> remuxing the pins.
>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>

Patch applied.

Yours,
Linus Walleij
