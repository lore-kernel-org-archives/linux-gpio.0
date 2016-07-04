From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Revert "gpiolib: Split GPIO flags parsing and GPIO configuration"
Date: Mon, 4 Jul 2016 16:54:08 +0200
Message-ID: <CACRpkdbF-KTmBXwxspos5mLNNq1sq03EUcAa79R9MXf=mw76bA@mail.gmail.com>
References: <1467563525-30227-1-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36829 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751424AbcGDOyK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2016 10:54:10 -0400
Received: by mail-oi0-f47.google.com with SMTP id f189so197131263oig.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jul 2016 07:54:09 -0700 (PDT)
In-Reply-To: <1467563525-30227-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Jul 3, 2016 at 6:32 PM, Johan Hovold <johan@kernel.org> wrote:

> This reverts commit 923b93e451db876d1479d3e4458fce14fec31d1c.
>
> Make sure consumers do not overwrite gpio flags for pins that have
> already been claimed.

Patch applied for fixes and pushed for build server for
testing for now. It looks innocent to me.

Yours,
Linus Walleij
