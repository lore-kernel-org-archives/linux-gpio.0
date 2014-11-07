From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 0/5] convert to use basic mmio gpio library
Date: Fri, 7 Nov 2014 18:10:03 +0900
Message-ID: <CAAVeFuK+y-WpDPzU-vyy+FE2Ccbkr_JVK22jJyOW4JuDFdjV6g@mail.gmail.com>
References: <1414591005-30961-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:64282 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750962AbaKGJKY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Nov 2014 04:10:24 -0500
Received: by mail-ig0-f181.google.com with SMTP id l13so5461655iga.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Nov 2014 01:10:23 -0800 (PST)
In-Reply-To: <1414591005-30961-1-git-send-email-kamlakant.patel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kamlakant Patel <kamlakant.patel@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Oct 29, 2014 at 10:56 PM,  <kamlakant.patel@linaro.org> wrote:
> From: Kamlakant Patel <kamlakant.patel@linaro.org>
>
> This patch converts GPIO drivers to use BASIC MMIO GPIO library
> (i.e GPIO GENERIC library) which makes drivers smaller and simpler.
>
> This patch needs to be tested on different platforms.

This sounds like a good idea, but we will need to get a couple of
Tested-by for each patch.
