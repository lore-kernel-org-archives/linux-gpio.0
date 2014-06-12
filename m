From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: lpc32xx: Make of_device_id array const
Date: Thu, 12 Jun 2014 09:37:41 +0200
Message-ID: <CACRpkdaxPKQU8ZmNhnKMvRheu+YW9215rt-1ipmdrwXwF=iGpw@mail.gmail.com>
References: <002301cf7f24$9beec360$d3cc4a20$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:61710 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932557AbaFLHhm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Jun 2014 03:37:42 -0400
Received: by mail-oa0-f50.google.com with SMTP id n16so964627oag.9
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2014 00:37:41 -0700 (PDT)
In-Reply-To: <002301cf7f24$9beec360$d3cc4a20$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Roland Stigge <stigge@antcom.de>

On Tue, Jun 3, 2014 at 2:09 PM, Jingoo Han <jg1.han@samsung.com> wrote:

> Make of_device_id array const, because all OF functions handle
> it as const.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Patch applied with Roland's ACK.

Yours,
Linus Walleij
