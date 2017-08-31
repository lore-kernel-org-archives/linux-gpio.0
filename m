From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2] pinctrl: qcom: spmi-gpio: Correct power_source range check
Date: Thu, 31 Aug 2017 15:49:26 +0200
Message-ID: <CACRpkdbaume=R0S=wstNSp9PnnGv4VwyfaztWKHXF4afT8bZaQ@mail.gmail.com>
References: <20170828030227.16796-1-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:36218 "EHLO
        mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751022AbdHaNt1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 09:49:27 -0400
Received: by mail-oi0-f42.google.com with SMTP id t75so5850164oie.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2017 06:49:27 -0700 (PDT)
In-Reply-To: <20170828030227.16796-1-fenglinw@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: fenglinw@codeaurora.org
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, aghayal@codeaurora.org, wruan@codeaurora.org, kgunda@codeaurora.org

On Mon, Aug 28, 2017 at 5:00 AM,  <fenglinw@codeaurora.org> wrote:

> From: Fenglin Wu <fenglinw@codeaurora.org>
>
> Power source selection in DIG_VIN_CTL is indexed from 0, in the range
> check it shouldn't be equal to the total number of power sources.
>
> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I already applied a version of this.

Yours,
Linus Walleij
