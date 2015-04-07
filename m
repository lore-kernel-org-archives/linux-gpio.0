From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH gpio 1/4] drivers: gpio: use devm_kzalloc
Date: Tue, 7 Apr 2015 16:19:17 +0200
Message-ID: <CACRpkdbhxgx5ED7oy-Uzxd34_KO=5EuuMjkBDp+G9wW7X=5mVA@mail.gmail.com>
References: <1427775551-6908-1-git-send-email-varkab@cdac.in>
	<1427775551-6908-2-git-send-email-varkab@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:38660 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754069AbbDGOTS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 10:19:18 -0400
Received: by igbqf9 with SMTP id qf9so12580127igb.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 07:19:17 -0700 (PDT)
In-Reply-To: <1427775551-6908-2-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Varka Bhadram <varkab@cdac.in>

On Tue, Mar 31, 2015 at 6:19 AM, Varka Bhadram <varkabhadram@gmail.com> wrote:

> We can use devres API for allocating memory. No need of using kfree.
>
> Signed-off-by: Varka Bhadram <varkab@cdac.in>

Straight forward clean-up. Patch applied.

Yours,
Linus Walleij
