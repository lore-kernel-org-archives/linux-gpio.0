From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [RTF] [PATCH 00/26] gpio: use platform based module init
Date: Fri, 19 Sep 2014 17:36:18 +0900
Message-ID: <CAAVeFuKH_hz4Doi=omVxtdE291r0No_yB=mSAvC0oScg=b=VMQ@mail.gmail.com>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:32824 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754595AbaISIgj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Sep 2014 04:36:39 -0400
Received: by mail-ig0-f169.google.com with SMTP id l13so632709iga.4
        for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2014 01:36:38 -0700 (PDT)
In-Reply-To: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: kamlakant.patel@linaro.org
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Sep 9, 2014 at 7:29 PM,  <kamlakant.patel@linaro.org> wrote:
> From: Kamlakant Patel <kamlakant.patel@linaro.org>
>
> This patch removes *_initcall based driver initialization
> and adds regular module_platform_driver to instantiate
> GPIO drivers which makes the code smaller and simpler.
>
> NOTE: This patch needs to be tested on different platforms.

I'd say this looks good - have you at least tested this on one or more
of the modified drivers?
