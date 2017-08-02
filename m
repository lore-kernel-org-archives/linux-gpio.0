From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Remove unneeded local variable initialization
Date: Wed, 2 Aug 2017 10:45:07 +0200
Message-ID: <CACRpkdbMBgOad3Vidccu46GhF9ccYwGqPjE19N_AvnRn0S_qMg@mail.gmail.com>
References: <1500399808-6580-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:36642 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751929AbdHBIpJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 04:45:09 -0400
Received: by mail-it0-f44.google.com with SMTP id 77so20355454itj.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 01:45:09 -0700 (PDT)
In-Reply-To: <1500399808-6580-1-git-send-email-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 18, 2017 at 7:43 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Two local variables (shift and reg_con) were initialized to unused
> values - they were overwritten just few lines after.  Getting rid of
> this unused initialization allows dropping other variables and
> compacting slightly the code.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Looks good to me, I expect to get this from you in a pull request.

Yours,
Linus Walleij
