From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: ns2: rename pinctrl_utils_dt_free_map
Date: Mon, 9 May 2016 11:57:42 +0200
Message-ID: <CACRpkdaY2Xig17ZfRwMZa1Fz-Kj1KE3qz5aMQHLxNBrXZ1v-fg@mail.gmail.com>
References: <1462289221-861102-1-git-send-email-arnd@arndb.de>
	<1462289221-861102-2-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:35566 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751377AbcEIJ5n (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 May 2016 05:57:43 -0400
Received: by mail-ob0-f175.google.com with SMTP id n10so80620635obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 May 2016 02:57:42 -0700 (PDT)
In-Reply-To: <1462289221-861102-2-git-send-email-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Ray Jui <ray.jui@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 3, 2016 at 5:26 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> A conflict of two patches caused a build error when a function got renamed
> but a new user appeared in the other patch:
>
> drivers/pinctrl/bcm/pinctrl-ns2-mux.c:540:17: error: 'pinctrl_utils_dt_free_map' undeclared here (not in a function)
>   .dt_free_map = pinctrl_utils_dt_free_map,
>                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> This renames the new user of pinctrl_utils_dt_free_map accordingly.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: d32f7fd3bbc3 ("pinctrl: Rename pinctrl_utils_dt_free_map to pinctrl_utils_free_map")
> Fixes: b5aa1006e4a9 ("pinctrl: ns2: add pinmux driver support for Broadcom NS2 SoC")

Patch applied.

Sorry for taking so long. Mail Swamp.

Yours,
Linus Walleij
