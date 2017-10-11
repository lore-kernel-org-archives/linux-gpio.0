From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V1] pinctrl: qcom: spmi-gpio: Update GPIO EN_CTL when
 setting pin config
Date: Wed, 11 Oct 2017 10:24:50 +0200
Message-ID: <CACRpkdYXAYPhGQ89rMg0zNmMFxApdmXPca9wkMnqsp17ik188w@mail.gmail.com>
References: <20170912003331.3092-1-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:52977 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756661AbdJKIYv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2017 04:24:51 -0400
Received: by mail-it0-f44.google.com with SMTP id j140so1890313itj.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2017 01:24:51 -0700 (PDT)
In-Reply-To: <20170912003331.3092-1-fenglinw@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: fenglinw@codeaurora.org
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, aghayal@codeaurora.org, wruan@codeaurora.org, subbaram@codeaurora.org, kgunda@codeaurora.org

On Tue, Sep 12, 2017 at 2:32 AM,  <fenglinw@codeaurora.org> wrote:

> From: Fenglin Wu <fenglinw@codeaurora.org>
>
> GPIO is expected to be disabled iff PIN_CONFIG_BIAS_HIGH_IMPEDANCE is
> configured. Update is_enabled flag in config_set() so that it can
> reflect GPIO status correctly. Also modify EN_CTL register based on
> is_enabled flag in config_set() to configure the GPIO properly.
>
> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>

Patch applied with Bj=C3=B6rn's ACK.

Expecting follow-up fixes as discussed in this thread.

Yours,
Linus Walleij
