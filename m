From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/8] pinctrl: qcom: spmi-mpp: Implement support for sink mode
Date: Tue, 14 Jul 2015 13:01:31 +0200
Message-ID: <CACRpkdZKWhf6=iDNN3-9=LY6H2EC52NgQJgj2yLJYDPEPpdsRg@mail.gmail.com>
References: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1434610052-602-5-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:35703 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751277AbbGNLBb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 07:01:31 -0400
Received: by obbop1 with SMTP id op1so3640228obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2015 04:01:31 -0700 (PDT)
In-Reply-To: <1434610052-602-5-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>

On Thu, Jun 18, 2015 at 8:47 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> The MPP supports three modes; digital, analog and sink mode. This patch
> implements support for the latter.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
(...)
> +- qcom,sink-mode:
> +       Usage: optional
> +       Value type: <u32> or <none>
> +       Definition: Selects sink mode of operation

Do we have some idea of what this actually means?

Just thinking whether it should be something generic "sink-mode" or
not.

Do we know?

Patch tentatively applied, anyways.

Yours,
Linus Walleij
