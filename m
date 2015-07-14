From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/8] pinctrl: qcom: spmi-mpp: Fixes related to enable handling
Date: Tue, 14 Jul 2015 12:57:41 +0200
Message-ID: <CACRpkdau_T96nq+XdKirHWzOn4bx3DYbLLxDqvsW_sJ+jVf14g@mail.gmail.com>
References: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1434610052-602-3-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34459 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752375AbbGNK5l (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 06:57:41 -0400
Received: by oiab3 with SMTP id b3so3818067oia.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2015 03:57:41 -0700 (PDT)
In-Reply-To: <1434610052-602-3-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>

On Thu, Jun 18, 2015 at 8:47 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> There's currently no way to re-enable a mpp block once you've entered a state
> that disables the state, this patch makes it possible to leave the
> bias-high-impedance state.
>
> Also read the enable state from the hardware on probe.
>
> With this in place the is_enabled variable is accurately tracking the state of
> the hardware and we can use that for the debug output as well.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Patch applied.

Yours,
Linus Walleij
