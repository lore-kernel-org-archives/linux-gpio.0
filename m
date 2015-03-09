From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: at91: simplify probe error handling
Date: Mon, 9 Mar 2015 17:05:33 +0100
Message-ID: <CACRpkdZsoujmj7+raYc2QA2NZygMy1vmUjU9RVjgryC5h6aeAA@mail.gmail.com>
References: <2adab2d9a86d0e44051541052ace08527bdcc045.1425317325.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:34654 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138AbbCIQFd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 12:05:33 -0400
Received: by obcwp18 with SMTP id wp18so23223994obc.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2015 09:05:33 -0700 (PDT)
In-Reply-To: <2adab2d9a86d0e44051541052ace08527bdcc045.1425317325.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 2, 2015 at 6:28 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> There is no code ender the 'err' label. Just return the error code directly.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Patch applied with the ACKs.

Yours,
Linus Walleij
