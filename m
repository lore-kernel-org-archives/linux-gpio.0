From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: mxc: Do not hard code return value
Date: Thu, 2 Jan 2014 13:56:22 +0100
Message-ID: <CACRpkdZtMz2ZMGiyrQ6kSVX+toKfrb1uiNEn-H3==KovuS3NzQ@mail.gmail.com>
References: <1387611358-28946-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:58534 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbaABM4W (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jan 2014 07:56:22 -0500
Received: by mail-ob0-f175.google.com with SMTP id uz6so14318361obc.34
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2014 04:56:22 -0800 (PST)
In-Reply-To: <1387611358-28946-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Dec 21, 2013 at 8:35 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> Silences the following warning:
> why not propagate 'port->irq' from platform_get_irq() instead of (-22)?
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Patch applied.

Yours,
Linus Walleij
