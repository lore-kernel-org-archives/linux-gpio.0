From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: gpio-mc33880: Remove redundant spi_set_drvdata
Date: Mon, 23 Sep 2013 12:53:35 +0200
Message-ID: <CACRpkdbgVPWc5VF5EB4Vj2uwka+pCKgdbX=Sk_XjvQO7Fh7UHA@mail.gmail.com>
References: <1379592053-9860-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:50771 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753743Ab3IWKxg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2013 06:53:36 -0400
Received: by mail-oa0-f46.google.com with SMTP id k14so386087oag.19
        for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2013 03:53:35 -0700 (PDT)
In-Reply-To: <1379592053-9860-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Sep 19, 2013 at 2:00 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> Driver core sets driver data to NULL upon failure or remove.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Patch applied.

Yours,
Linus Walleij
