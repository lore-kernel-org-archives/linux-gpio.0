From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: don't compare an unsigned for >= 0
Date: Fri, 2 Oct 2015 01:57:30 -0700
Message-ID: <CACRpkda3szqYGDRPb+rc1j+XbM5UGXYUaYsnLVixXMXU8MLPtA@mail.gmail.com>
References: <1439913752-26634-1-git-send-email-dirk.behme@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:36093 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925AbbJBI5b (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2015 04:57:31 -0400
Received: by obcgx8 with SMTP id gx8so77245899obc.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2015 01:57:31 -0700 (PDT)
In-Reply-To: <1439913752-26634-1-git-send-email-dirk.behme@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dirk Behme <dirk.behme@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Aug 18, 2015 at 9:02 AM, Dirk Behme <dirk.behme@gmail.com> wrote:

> The parameter offset is an unsigned, so it makes no sense to compare
> it for >= 0. Fix the compiler warning regarding this by removing this
> comparison.
>
> As the macro GPIO_OFFSET_VALID is only used at this single place, simplify
> the code by dropping the macro completely and dropping the invert, too.
>
> No functional change.
>
> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>

Patch applied with Alexandre's ACK.

Yours,
Linus Walleij
