From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: qdf2xxx: add names to the gpios
Date: Wed, 15 Mar 2017 05:33:51 -0500
Message-ID: <5f2fa494-5dc2-1186-f516-c3a5dfb65b98@codeaurora.org>
References: <1488843122-7960-1-git-send-email-timur@codeaurora.org>
 <CACRpkdZE2kawSKaukwbdDHPKfzeAvMCMe8ZTGWB8FvPqObruDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:41700 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753086AbdCOKdy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 06:33:54 -0400
In-Reply-To: <CACRpkdZE2kawSKaukwbdDHPKfzeAvMCMe8ZTGWB8FvPqObruDQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Linus Walleij wrote:
> Patch tentatively applied (looks right to me), unless Björn has concerns.
>
> Is this a problem in other qcom pinctrl drivers?

Not any of the ones that use pinctrl-msm, because they all use the static 
arrays, whereas my driver (because it's for ACPI), creates a dynamic array.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
