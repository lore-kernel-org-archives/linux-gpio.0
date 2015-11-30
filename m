From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Gpio: use dev_get_platdata()
Date: Mon, 30 Nov 2015 16:42:05 +0100
Message-ID: <CACRpkdaYVsg6wjANST1Ok3M8bTeO=kY22eFRrY4pC_hV=CCX0Q@mail.gmail.com>
References: <1448292198-6798-1-git-send-email-nizamhaider786@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:33369 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752593AbbK3PmG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 10:42:06 -0500
Received: by obbww6 with SMTP id ww6so129906204obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2015 07:42:05 -0800 (PST)
In-Reply-To: <1448292198-6798-1-git-send-email-nizamhaider786@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nizam Haider <nizamhaider786@gmail.com>
Cc: Alban Bedel <albeu@free.fr>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nizam Haider <nijamh@cdac.in>

On Mon, Nov 23, 2015 at 4:23 PM, Nizam Haider <nizamhaider786@gmail.com> wrote:

> Use the wrapper function for retrieving the platform data instead of
> accessing dev->platform_data directly.
>
> Signed-off-by: Nizam Haider <nijamh@cdac.in>

Patch applied. Thanks!

Yours,
Linus Walleij
