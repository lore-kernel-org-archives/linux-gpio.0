From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: max730x: Remove redundant dev_set_drvdata
Date: Thu, 2 Jan 2014 13:55:05 +0100
Message-ID: <CACRpkdYPhxSY1aZ9AuSPkibUCeeDgoro_8Zcb4aE_qNmpN+QnQ@mail.gmail.com>
References: <1387610738-14881-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:58245 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750797AbaABMzF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jan 2014 07:55:05 -0500
Received: by mail-ob0-f182.google.com with SMTP id wp4so14322381obc.41
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2014 04:55:05 -0800 (PST)
In-Reply-To: <1387610738-14881-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Dec 21, 2013 at 8:25 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> Driver core sets it to NULL upon probe failure or release.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Patch applied.

Yours,
Linus Walleij
