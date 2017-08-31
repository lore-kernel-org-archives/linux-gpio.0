From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V1] pinctrl: qcom: spmi-gpio: Correct power_source range check
Date: Thu, 31 Aug 2017 14:00:06 +0200
Message-ID: <CACRpkdbYLCOpnG1j3tY69P5=XDTFCTVXJFb0tjW+JD6rVhjP4w@mail.gmail.com>
References: <20170719064121.13948-1-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:33060 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750863AbdHaMAH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 08:00:07 -0400
Received: by mail-oi0-f54.google.com with SMTP id r203so3647309oih.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2017 05:00:07 -0700 (PDT)
In-Reply-To: <20170719064121.13948-1-fenglinw@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: fenglinw@codeaurora.org
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, aghayal@codeaurora.org, wruan@codeaurora.org, kgunda@codeaurora.org

On Wed, Jul 19, 2017 at 8:39 AM,  <fenglinw@codeaurora.org> wrote:

> From: Fenglin Wu <fenglinw@codeaurora.org>
>
> Power source selection in DIG_VIN_CTL is indexed from 0, in the range
> check it shouldn't be equal to the total number of power sources.
>
> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>

Patch applied with Bj=C3=B6rn's ACK.

Yours,
Linus Walleij
