From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: Hook pm_power_down for shutdown support
Date: Fri, 17 Jul 2015 10:00:21 +0200
Message-ID: <CACRpkdbci5=1mUEsfs79TJ7W5tS=pDAg_u=He0_5bP7ooyrVNA@mail.gmail.com>
References: <1436231370-18301-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:35516 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757175AbbGQIAW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 04:00:22 -0400
Received: by obbop1 with SMTP id op1so61599298obb.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2015 01:00:21 -0700 (PDT)
In-Reply-To: <1436231370-18301-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Pramod Gurav <pramod.gurav@smartplayin.com>

On Tue, Jul 7, 2015 at 3:09 AM, Stephen Boyd <sboyd@codeaurora.org> wro=
te:

> Assign pm_power_off() if we have the PS_HOLD functionality so
> that we can properly shutdown the SoC. Otherwise, shutdown won't
> do anything besides put the CPU into a tight loop. Unfortunately,
> we have to use a singleton here because pm_power_off() doesn't
> take any arguments. Fortunately there's only one instance of the
> pinctrl device on a running system so this isn't a problem.
>
> Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Cc: Pramod Gurav <pramod.gurav@smartplayin.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Patch applied with Bj=C3=B6rn's ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
