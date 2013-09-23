From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: gpio-74x164: Remove redundant of_match_ptr
Date: Mon, 23 Sep 2013 12:52:47 +0200
Message-ID: <CACRpkdaQ4Yj=Pj6Wv-pCyWrth7qtXrOTKDQQAVm5eq-psNOpjg@mail.gmail.com>
References: <1379591888-8834-1-git-send-email-sachin.kamat@linaro.org>
	<1379591888-8834-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:55678 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752630Ab3IWKws (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2013 06:52:48 -0400
Received: by mail-oa0-f53.google.com with SMTP id i7so380381oag.26
        for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2013 03:52:48 -0700 (PDT)
In-Reply-To: <1379591888-8834-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Sep 19, 2013 at 1:58 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> 'gen_74x164_dt_ids' is always compiled in. Hence the macro is not
> necessary.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Patch applied.

Yours,
Linus Walleij
