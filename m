From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH gpio 3/4] gpio-arizona: drop owner assignment from platform_drivers
Date: Tue, 7 Apr 2015 16:21:23 +0200
Message-ID: <CACRpkdZfSXfrgiQ-xGX4nELdesH5UhDqB8qCFKLsjWkX-MzM=Q@mail.gmail.com>
References: <1427775551-6908-1-git-send-email-varkab@cdac.in>
	<1427775551-6908-4-git-send-email-varkab@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:35934 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754710AbbDGOVY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 10:21:24 -0400
Received: by igblo3 with SMTP id lo3so13128563igb.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 07:21:23 -0700 (PDT)
In-Reply-To: <1427775551-6908-4-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Varka Bhadram <varkab@cdac.in>

On Tue, Mar 31, 2015 at 6:19 AM, Varka Bhadram <varkabhadram@gmail.com> wrote:

> This driver no need to set the owner field, it will be populated
> by driver core.
>
> Signed-off-by: Varka Bhadram <varkab@cdac.in>

Patch applied.

Yours,
Linus Walleij
