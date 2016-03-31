From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 02/17] pinctrl: qcom: ipq4019: fix the function enum for
 gpio mode
Date: Thu, 31 Mar 2016 11:55:22 +0200
Message-ID: <CACRpkdaEKQDOP0QtwdQZowSjdCwX8rD9dSxHLdd=FPVV0aKkiA@mail.gmail.com>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
	<1458770712-10880-3-git-send-email-mmcclint@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:33390 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753633AbcCaJzX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 05:55:23 -0400
Received: by mail-oi0-f54.google.com with SMTP id d205so53353954oia.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 02:55:22 -0700 (PDT)
In-Reply-To: <1458770712-10880-3-git-send-email-mmcclint@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Matthew McClintock <mmcclint@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, qca-upstream.external@qca.qualcomm.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh@kernel.org>, Varadarajan Narayanan <varada@codeaurora.org>, Mathieu Olivari <mathieu@codeaurora.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Wed, Mar 23, 2016 at 11:04 PM, Matthew McClintock
<mmcclint@codeaurora.org> wrote:

> Without this, we would fail to set the mode to gpio if trying to
> configure for that mode
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
