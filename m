From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] [v5] pinctrl: qcom: add support for sparse GPIOs
Date: Fri, 8 Sep 2017 14:50:04 +0200
Message-ID: <CACRpkdb563nCp9iptfzZOUPX6B0-qU+iWzurn-JL4PQCPHqStw@mail.gmail.com>
References: <1504798409-32041-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33903 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755013AbdIHMuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Sep 2017 08:50:05 -0400
Received: by mail-oi0-f46.google.com with SMTP id l74so9870877oih.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Sep 2017 05:50:05 -0700 (PDT)
In-Reply-To: <1504798409-32041-1-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, anjiandi@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>

On Thu, Sep 7, 2017 at 5:33 PM, Timur Tabi <timur@codeaurora.org> wrote:

> First patch allows for for pinctrl-msm to understand GPIO groups with
> no pins.  Such pins are "hidden" and can't be exported or accessed.
>
> Second patch updates the QDF2xxx driver to take advantage of all that.
>
> v5:
>  Since gpiochip_add_data no longer requests GPIOs before scanning for
>  the direction (that patch was reverted), pinctrl-msm.c now specifically
>  checks for special case.

Waiting for Bjorn's review on these.

Yours,
Linus Walleij
