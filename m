From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm2835: Fix memory leak in error path
Date: Tue, 22 Dec 2015 13:51:17 +0100
Message-ID: <CACRpkdYNEgUuF6VAa6pTs6tijYstzVghzOLQVhfCmxL_=pVqVQ@mail.gmail.com>
References: <1450658644-20858-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:36860 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751732AbbLVMvS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 07:51:18 -0500
Received: by mail-ob0-f178.google.com with SMTP id ba1so52037325obb.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 04:51:17 -0800 (PST)
In-Reply-To: <1450658644-20858-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Dec 21, 2015 at 1:44 AM, Stefan Wahren <stefan.wahren@i2se.com> wrote:

> In case of an invalid pin value bcm2835_pctl_dt_node_to_map()
> would leak the pull configs of already assigned pins.
> So avoid this by calling the free map function in error case.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Fixes: e1b2dc70cd5b ("pinctrl: add bcm2835 driver")

Patch applied with Eric's Review tag.

Yours,
Linus Walleij
