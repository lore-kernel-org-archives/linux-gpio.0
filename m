From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: clamp returned values to the boolean range
Date: Fri, 14 Mar 2014 10:17:52 +0100
Message-ID: <CACRpkdYD78v1k3=1J87EdbefirsywFhgQP=hgjiffhLzgJ+N2Q@mail.gmail.com>
References: <1394520729-1587-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:54683 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755541AbaCNJRx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Mar 2014 05:17:53 -0400
Received: by mail-oa0-f54.google.com with SMTP id n16so2331292oag.13
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2014 02:17:52 -0700 (PDT)
In-Reply-To: <1394520729-1587-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Mar 11, 2014 at 7:52 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> This patch makes the internal _gpiod_get_raw_value() function return a
> bool, effectively clamping the GPIO value to the boolean range no
> matter what the driver does.

This looks good, patch applied!

Yours,
Linus Walleij
