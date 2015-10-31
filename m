From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: ath79: Make the driver removable
Date: Sat, 31 Oct 2015 22:03:40 +0100
Message-ID: <CACRpkdacqVB3vFie0eOCefd1hhDLzFA_YBmMBGQWdbbmH3duQg@mail.gmail.com>
References: <1446201391-22553-1-git-send-email-albeu@free.fr>
	<1446201391-22553-3-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:35650 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750996AbbJaVDk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Oct 2015 17:03:40 -0400
Received: by obctp1 with SMTP id tp1so68685865obc.2
        for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2015 14:03:40 -0700 (PDT)
In-Reply-To: <1446201391-22553-3-git-send-email-albeu@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Oct 30, 2015 at 11:36 AM, Alban Bedel <albeu@free.fr> wrote:

> As we now allow the driver to be built as a module it should be
> removable.
>
> Signed-off-by: Alban Bedel <albeu@free.fr>

Looks good but needs rebasing on top of the rebased 2/3.

Yours,
Linus Walleij
