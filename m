From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: lpc18xx: ensure ngroups is initialized at
 correct place
Date: Mon, 7 Mar 2016 10:28:56 +0700
Message-ID: <CACRpkdYxFm06aCUwf-stH4fmJdqS25Ek=9i0CVwR4JcSYPtLEQ@mail.gmail.com>
References: <1456335170-20718-1-git-send-email-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33289 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751641AbcCGD25 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Mar 2016 22:28:57 -0500
Received: by mail-oi0-f52.google.com with SMTP id d205so71671643oia.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Mar 2016 19:28:57 -0800 (PST)
In-Reply-To: <1456335170-20718-1-git-send-email-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Joachim Eastwood <manabian@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Feb 25, 2016 at 12:32 AM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The initialization of ngroups is occurring at the end of the
> first iteration of the outer loop, which means that the
> assignment  pins[ngroups++] = i is potentially indexing into
> a region outside of array pins because ngroups is not initialized.
> Instead, initialize ngroups in the inner loop before the first
> inner loop iteration.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied with Joachim's review tag.

Yours,
Linus Walleij
