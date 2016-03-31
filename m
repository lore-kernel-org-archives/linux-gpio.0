From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/17] pinctrl: qcom: ipq4019: set ngpios to correct value
Date: Thu, 31 Mar 2016 11:53:50 +0200
Message-ID: <CACRpkdY4PQj+c1u6xYAfZWyNrHrTsmWfzFj4Y3XtyvQezdU5jg@mail.gmail.com>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
	<1458770712-10880-2-git-send-email-mmcclint@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:32838 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753905AbcCaJxv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 05:53:51 -0400
Received: by mail-oi0-f51.google.com with SMTP id d205so53313273oia.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 02:53:51 -0700 (PDT)
In-Reply-To: <1458770712-10880-2-git-send-email-mmcclint@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Matthew McClintock <mmcclint@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, qca-upstream.external@qca.qualcomm.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Sricharan R <sricharan@codeaurora.org>, Mathieu Olivari <mathieu@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Wed, Mar 23, 2016 at 11:04 PM, Matthew McClintock
<mmcclint@codeaurora.org> wrote:

> This should have been bumped to 100 when the extra pins
> were added in the original pinctrl patch
>
> CC: linus.walleij@linaro.org
> CC: bjorn.andersson@linaro.org
> Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>

Patch applied for fixes with Bj=C3=B6rn's ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
