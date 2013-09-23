From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: bt8xx: Remove redundant pci_set_drvdata
Date: Mon, 23 Sep 2013 12:55:55 +0200
Message-ID: <CACRpkdYuYU9jWPOG68UWf+tQS85m20y_QM0fyWSyF1kU60EvcQ@mail.gmail.com>
References: <1379668949-2986-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:45439 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752642Ab3IWKz4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2013 06:55:56 -0400
Received: by mail-ob0-f179.google.com with SMTP id wn1so3212637obc.24
        for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2013 03:55:56 -0700 (PDT)
In-Reply-To: <1379668949-2986-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, Jingoo Han <jg1.han@samsung.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michael Buesch <m@bues.ch>

On Fri, Sep 20, 2013 at 11:22 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> Driver core sets driver data to NULL upon failure or remove.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

I already have a similar patch from Jingoo Han, but thanks
anyway!

Yours,
Linus Walleij
