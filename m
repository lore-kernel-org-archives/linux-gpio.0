From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: twl4030: Remove redundant of_match_ptr
Date: Wed, 2 Oct 2013 12:44:57 +0200
Message-ID: <CACRpkdYdZmqpur37mMF_X4TRGrjoPH_HqKc8zwYf-X3U0mOvOw@mail.gmail.com>
References: <1380369849-1894-1-git-send-email-sachin.kamat@linaro.org>
	<1380369849-1894-3-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:57258 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753283Ab3JBKo6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2013 06:44:58 -0400
Received: by mail-ie0-f182.google.com with SMTP id aq17so1320672iec.41
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2013 03:44:58 -0700 (PDT)
In-Reply-To: <1380369849-1894-3-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Sep 28, 2013 at 2:04 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> The data structure of_match_ptr() protects is always compiled in.
> Hence of_match_ptr() is not needed.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Applied.

Yours,
Linus Walleij
