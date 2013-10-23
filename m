From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpiolib: devres: fix devm_gpiod_get_index()
Date: Wed, 23 Oct 2013 10:09:55 +0200
Message-ID: <CACRpkdbsvoYrXmApmCrEfjS8zN989PQqKJMppJUz8VbFdb_LnA@mail.gmail.com>
References: <1382307299-22587-1-git-send-email-acourbot@nvidia.com>
	<1382307299-22587-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:35538 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751478Ab3JWIJ4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2013 04:09:56 -0400
Received: by mail-ob0-f175.google.com with SMTP id wm4so436779obc.34
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2013 01:09:55 -0700 (PDT)
In-Reply-To: <1382307299-22587-2-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Mon, Oct 21, 2013 at 12:14 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> Fix the return value if devm_gpiod_get_index(). It was returning 0 while
> it should return the obtained GPIO descriptor.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
