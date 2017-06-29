From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 1/6] pinctrl: qcom: Add ipq8074 pinctrl driver
Date: Thu, 29 Jun 2017 15:14:28 +0200
Message-ID: <CACRpkdZ=+tD8sR9brTqftxmKbyCq4gv_j8J=e3XsRzHx9kveFQ@mail.gmail.com>
References: <1497000783-27916-1-git-send-email-varada@codeaurora.org> <1497000783-27916-2-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:36240 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751729AbdF2NOa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 09:14:30 -0400
Received: by mail-it0-f46.google.com with SMTP id m68so45342620ith.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2017 06:14:30 -0700 (PDT)
In-Reply-To: <1497000783-27916-2-git-send-email-varada@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Varadarajan Narayanan <varada@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infrad>

On Fri, Jun 9, 2017 at 11:32 AM, Varadarajan Narayanan
<varada@codeaurora.org> wrote:

> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for ipq8074.
>
> Signed-off-by: Manoharan Vijaya Raghavan <mraghava@codeaurora.org>
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>

Patch applied for v4.13 with Rob's and Bj=C3=B6rn's ACKs.

Yours,
Linus Walleij
