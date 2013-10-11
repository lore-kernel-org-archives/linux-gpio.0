From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: bcm281xx: Fix nested interrupt handler issue
Date: Fri, 11 Oct 2013 16:41:24 +0200
Message-ID: <CACRpkdZRO-6eJCHzUQ1=E32PLsC77__H50j-Za5xZZFryjcA9A@mail.gmail.com>
References: <1381182660-32426-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:51880 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752208Ab3JKOlZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 10:41:25 -0400
Received: by mail-ie0-f171.google.com with SMTP id at1so8619320iec.30
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 07:41:25 -0700 (PDT)
In-Reply-To: <1381182660-32426-1-git-send-email-markus.mayer@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Linaro Patches <patches@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Linux GPIO List <linux-gpio@vger.kernel.org>

On Mon, Oct 7, 2013 at 11:51 PM, Markus Mayer <markus.mayer@linaro.org> wrote:

> The GPIO interrupt handler does not need to be marked as nested.
>
> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>

Patch applied.

Yours,
Linus Walleij
