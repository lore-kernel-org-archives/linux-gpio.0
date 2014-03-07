From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: remove misleading documentation
Date: Fri, 7 Mar 2014 11:38:29 +0900
Message-ID: <CAAVeFuKxkmi7OhYgSOoNrjCg8MpnfXE4vGdF4eTaPU7ky6Yi_Q@mail.gmail.com>
References: <1394158555-22114-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175]:33072 "EHLO
	mail-vc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752096AbaCGCiu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Mar 2014 21:38:50 -0500
Received: by mail-vc0-f175.google.com with SMTP id lh14so1553318vcb.6
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2014 18:38:50 -0800 (PST)
In-Reply-To: <1394158555-22114-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>

On Fri, Mar 7, 2014 at 11:15 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> It is currently debated where the functions to lock a certain
> GPIO line as used for IRQs should be called. Delete all
> misleading documentation.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
