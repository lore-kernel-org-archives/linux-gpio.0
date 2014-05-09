From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] RFT: pinctrl: msm: switch to using generic GPIO irqchip helpers
Date: Fri, 9 May 2014 10:33:26 +0200
Message-ID: <CACRpkdb7ctDocntcPG_E4b_an2G8VNd+ei0N+Uk_7XtsFssiEA@mail.gmail.com>
References: <1398794794-28920-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:51252 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751517AbaEIId1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 May 2014 04:33:27 -0400
Received: by mail-ob0-f182.google.com with SMTP id wn1so4445159obc.13
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2014 01:33:26 -0700 (PDT)
In-Reply-To: <1398794794-28920-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Andy Gross <agross@codeaurora.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Boyd <sboyd@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>

On Tue, Apr 29, 2014 at 8:06 PM, Linus Walleij <linus.walleij@linaro.or=
g> wrote:

> This switches the Qualcomm MSM pin control driver over to using
> the generic GPIO irqchip helpers.
>
> Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Josh Cartwright <joshc@codeaurora.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Anyone up for testing this patch?

Bj=C3=B6rn? Andy?

Or shall I just push it to linux-next and see what happens?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
