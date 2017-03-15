From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: qdf2xxx: add names to the gpios
Date: Wed, 15 Mar 2017 10:40:17 +0100
Message-ID: <CACRpkdZE2kawSKaukwbdDHPKfzeAvMCMe8ZTGWB8FvPqObruDQ@mail.gmail.com>
References: <1488843122-7960-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:36248 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751509AbdCOJkT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 05:40:19 -0400
Received: by mail-it0-f46.google.com with SMTP id w124so46066017itb.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 02:40:18 -0700 (PDT)
In-Reply-To: <1488843122-7960-1-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Mar 7, 2017 at 12:32 AM, Timur Tabi <timur@codeaurora.org> wrote:

> The sysfs and debugfs entries for pin control drivers work better when
> the individual pins are given real names, even if they are all just
> "gpio0", "gpio1", etc.
>
> Signed-off-by: Timur Tabi <timur@codeaurora.org>

Patch tentatively applied (looks right to me), unless Bj=C3=B6rn has concer=
ns.

Is this a problem in other qcom pinctrl drivers?

Yours,
Linus Walleij
