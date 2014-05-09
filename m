From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH] RFT: pinctrl: msm: switch to using generic GPIO irqchip
 helpers
Date: Fri, 9 May 2014 14:04:25 -0700
Message-ID: <20140509210424.GA25733@sonymobile.com>
References: <1398794794-28920-1-git-send-email-linus.walleij@linaro.org>
 <CACRpkdb7ctDocntcPG_E4b_an2G8VNd+ei0N+Uk_7XtsFssiEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([212.209.106.2]:2350 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757131AbaEIVFL convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 9 May 2014 17:05:11 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdb7ctDocntcPG_E4b_an2G8VNd+ei0N+Uk_7XtsFssiEA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Andy Gross <agross@codeaurora.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>

On Fri 09 May 01:33 PDT 2014, Linus Walleij wrote:

> On Tue, Apr 29, 2014 at 8:06 PM, Linus Walleij <linus.walleij@linaro.=
org> wrote:
>=20
> > This switches the Qualcomm MSM pin control driver over to using
> > the generic GPIO irqchip helpers.
> >
> > Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Cc: Josh Cartwright <joshc@codeaurora.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Anyone up for testing this patch?
>=20
> Bj=F6rn? Andy?

Sorry for the delay.

This looks good and seems to work fine on my 8974 board.

Acked-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
