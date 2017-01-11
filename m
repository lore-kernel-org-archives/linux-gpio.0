From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Drop error prints on kzalloc() failure
Date: Wed, 11 Jan 2017 14:30:50 +0100
Message-ID: <CACRpkdbL4OdQX4odEME2=L3ZDc+13mQ-aCkEim6gzSpk_Gm8+A@mail.gmail.com>
References: <20170105160755.29254-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:36115 "EHLO
        mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966578AbdAKNav (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 08:30:51 -0500
Received: by mail-qk0-f182.google.com with SMTP id 11so109659250qkl.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 05:30:50 -0800 (PST)
In-Reply-To: <20170105160755.29254-1-bjorn.andersson@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 5, 2017 at 5:07 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> Upon failing kzalloc() will print an error message in the log, so
> there's no need for additional printouts. Also standardizes the "!ptr"
> vs "ptr == NULL" while I'm touching those lines.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

OK good cleanup. Patch applied.

> Hope you don't find this too OCD-ish.

We have the same condition ...

Yours,
Linus Walleij
