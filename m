From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V1] pinctrl: qcom: spmi-gpio: Update GPIO EN_CTL when
 setting pin config
Date: Tue, 19 Sep 2017 10:20:39 +0200
Message-ID: <CACRpkdYXF6LFhSBTJDmTpD9zkNYMJmcaQRvaW-9JZU60R48FYg@mail.gmail.com>
References: <20170912003331.3092-1-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:54906 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751556AbdISIUl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2017 04:20:41 -0400
Received: by mail-it0-f48.google.com with SMTP id e134so1253311ite.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2017 01:20:40 -0700 (PDT)
In-Reply-To: <20170912003331.3092-1-fenglinw@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: fenglinw@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, aghayal@codeaurora.org, wruan@codeaurora.org, subbaram@codeaurora.org, kgunda@codeaurora.org, Ivan Ivanov <iivanov.xz@gmail.com>

On Tue, Sep 12, 2017 at 2:32 AM,  <fenglinw@codeaurora.org> wrote:

> From: Fenglin Wu <fenglinw@codeaurora.org>
>
> GPIO is expected to be disabled iff PIN_CONFIG_BIAS_HIGH_IMPEDANCE is
> configured. Update is_enabled flag in config_set() so that it can
> reflect GPIO status correctly. Also modify EN_CTL register based on
> is_enabled flag in config_set() to configure the GPIO properly.
>
> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>

Pending on Bj=C3=B6rn's review here.

Yours,
Linus Walleij
