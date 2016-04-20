From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH 22/23] xtensa: remove ARCH_WANT_OPTIONAL_GPIOLIB
Date: Wed, 20 Apr 2016 22:00:32 +0300
Message-ID: <CAMo8BfLq8iCDYh_ecwuKyEsNZZdg1NqWZMSn7oLHhSAv=X6maw@mail.gmail.com>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
	<1461142701-21096-23-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:36808 "EHLO
	mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751747AbcDTTAd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 15:00:33 -0400
Received: by mail-io0-f173.google.com with SMTP id u185so62396964iod.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 12:00:33 -0700 (PDT)
In-Reply-To: <1461142701-21096-23-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Michael_B=C3=BCsch?= <m@bues.ch>, Chris Zankel <chris@zankel.net>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>

On Wed, Apr 20, 2016 at 11:58 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> This symbols is not needed to get access to selecting the
> GPIOLIB anymore: any arch can select GPIOLIB.

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
