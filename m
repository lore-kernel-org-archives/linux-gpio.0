From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Remove old unused defines
Date: Tue, 30 Jun 2015 08:20:25 +0200
Message-ID: <CACRpkdYTw6kbgiwtSHCcOgcQJ6HKE9uHn6jpUXXP4Td1y4rt7Q@mail.gmail.com>
References: <1434344069-19133-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:36201 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752147AbbF3GU0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2015 02:20:26 -0400
Received: by obdbs4 with SMTP id bs4so137523obd.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2015 23:20:26 -0700 (PDT)
In-Reply-To: <1434344069-19133-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jun 15, 2015 at 6:54 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:

> Since 9a2c1c3b91aa ("pinctrl: samsung: Allow grouping multiple
> pinmux/pinconf nodes") the defines for GPIO group and function names are
> not used anywhere in the driver.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Inspired-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
