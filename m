From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: ipq4019: add missing pingroups for pins > 70
Date: Thu, 23 Mar 2017 10:14:06 +0100
Message-ID: <CACRpkdYCu44YtVjAQUoOtDZPe-=dKj1xzbStp9gnZJKkp2AnSw@mail.gmail.com>
References: <20170316203607.12714-1-chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:38152 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752034AbdCWJOI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 05:14:08 -0400
Received: by mail-it0-f47.google.com with SMTP id y18so36804968itc.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 02:14:08 -0700 (PDT)
In-Reply-To: <20170316203607.12714-1-chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>

On Thu, Mar 16, 2017 at 9:36 PM, Christian Lamparter
<chunkeey@googlemail.com> wrote:

> This patch adds the missing PINGROUP for GPIO70-99.
> This fixes a crash that happens in pinctrl-msm, if any
> of the GPIO70-99 are accessed.
>
> Fixes: 5303f7827fcd41d ("pinctrl: qcom: ipq4019: set ngpios to correct va=
lue")
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>

Patch applied for fixes with Bj=C3=B6rn's ACK.

Yours,
Linus Walleij
