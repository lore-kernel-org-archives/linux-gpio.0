From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 REBASED 13/13] pinctrl: samsung: Replace syscore ops
 with standard platform device pm_ops
Date: Thu, 26 Jan 2017 16:58:31 +0100
Message-ID: <CACRpkdZM_eu-1vKaT0ijqvXDp=QnLoA=r3fU0Rs7CT58hWnFNw@mail.gmail.com>
References: <CACRpkdY_SpqfyTTqSP5+a1k1LDf_5w77UXo=EognmOzWBz2c-Q@mail.gmail.com>
 <CGME20170126093003eucas1p1e63fcbad90361f6ccf90fe07da897823@eucas1p1.samsung.com>
 <1485422967-30643-1-git-send-email-m.szyprowski@samsung.com> <1485422967-30643-10-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:32976 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752377AbdAZP7R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 10:59:17 -0500
Received: by mail-it0-f43.google.com with SMTP id d9so3843792itc.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2017 07:58:32 -0800 (PST)
In-Reply-To: <1485422967-30643-10-git-send-email-m.szyprowski@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Thu, Jan 26, 2017 at 10:29 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:

> Once the dependency on PMU driver (for pad retention control) has been
> removed, there is no reason to use syscore_ops based suspend/resume.
> This patch replaces it with standard platform device pm_ops based solution.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Patch applied after pulling in Krzysztof's branch and
applying 11 & 12 again.

Yours,
Linus Walleij
