From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH gpio v2 2/3] gpio: gpio-stp-xway: remove duplicate check
 on resource
Date: Fri, 31 Oct 2014 09:05:01 +0100
Message-ID: <CACRpkdamVKd5vfDzbnQtB0O=NLU5ZCNV3BQGATip+f=HJcMFaA@mail.gmail.com>
References: <1414478227-24674-1-git-send-email-varkab@cdac.in>
	<1414478227-24674-3-git-send-email-varkab@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:53175 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750935AbaJaIFC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Oct 2014 04:05:02 -0400
Received: by mail-ie0-f170.google.com with SMTP id tp5so801687ieb.1
        for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2014 01:05:01 -0700 (PDT)
In-Reply-To: <1414478227-24674-3-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Varka Bhadram <varkab@cdac.in>

On Tue, Oct 28, 2014 at 7:37 AM, Varka Bhadram <varkabhadram@gmail.com> wrote:

> Sanity check on resource happening with devm_ioremap_resource().
>
> Signed-off-by: Varka Bhadram <varkab@cdac.in>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

I've already applied a version of this patch.

Yours,
Linus Walleij
