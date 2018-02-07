From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: msm: Use dynamic GPIO numbering
Date: Wed, 7 Feb 2018 14:52:05 +0100
Message-ID: <CACRpkdb0OWQzeJZ7K1bXrdNPwu0GhygW1p04Xoyf9WjTg7+=BQ@mail.gmail.com>
References: <20180129005948.7714-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:42011 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754011AbeBGNwH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Feb 2018 08:52:07 -0500
Received: by mail-io0-f194.google.com with SMTP id 25so2062123ioj.9
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2018 05:52:06 -0800 (PST)
In-Reply-To: <20180129005948.7714-1-bjorn.andersson@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Timur Tabi <timur@codeaurora.org>

On Mon, Jan 29, 2018 at 1:59 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> The base of the TLMM gpiochip should not be statically defined as 0, fix
> this to not artificially restrict the existence of multiple pinctrl-msm
> devices.
>
> Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
> Reported-by: Timur Tabi <timur@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

OK I put this in devel for v4.17, let's see if something explodes
in linux-next else we can go with this.

Otherwise we need something that conserves base 0 for singular
TLMM drivers and make it -1 for newer platforms with several
instances.

Yours,
Linus Walleij
