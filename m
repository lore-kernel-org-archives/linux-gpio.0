From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 22/23] xtensa: remove ARCH_WANT_OPTIONAL_GPIOLIB
Date: Tue, 26 Apr 2016 14:00:20 +0200
Message-ID: <CACRpkdbzoYbAj9=3ia52MFXKkirMG9LDkwYqd3geMmLEDmbfdg@mail.gmail.com>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
	<1461142701-21096-23-git-send-email-linus.walleij@linaro.org>
	<CAMo8BfLq8iCDYh_ecwuKyEsNZZdg1NqWZMSn7oLHhSAv=X6maw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:36642 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752724AbcDZMAV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2016 08:00:21 -0400
Received: by mail-ob0-f181.google.com with SMTP id j9so5558258obd.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2016 05:00:21 -0700 (PDT)
In-Reply-To: <CAMo8BfLq8iCDYh_ecwuKyEsNZZdg1NqWZMSn7oLHhSAv=X6maw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Michael_B=C3=BCsch?= <m@bues.ch>, Chris Zankel <chris@zankel.net>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>

On Wed, Apr 20, 2016 at 9:00 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Wed, Apr 20, 2016 at 11:58 AM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>> This symbols is not needed to get access to selecting the
>> GPIOLIB anymore: any arch can select GPIOLIB.
>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>

Thanks, patch applied to the GPIO tree with your ACK.

Yours,
Linus Walleij
