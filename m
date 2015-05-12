From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a73a4: Remove obsolete
 multi-platform check
Date: Tue, 12 May 2015 12:29:37 +0200
Message-ID: <CACRpkdYQ2rg7J17tG+Y82n-NEypdgnhw-KWwR1HbwWxJsRcTog@mail.gmail.com>
References: <1430216107-31501-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:36068 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbbELK3h (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 06:29:37 -0400
Received: by obbkp3 with SMTP id kp3so1826361obb.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 03:29:37 -0700 (PDT)
In-Reply-To: <1430216107-31501-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Apr 28, 2015 at 12:15 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> As of commit 9d07d414d4c33d86 ("ARM: shmobile: r8a73a4: ape6evm: Remove
> legacy platform"), r8a73a4 is only supported in generic ARM
> multi-platform builds.  Hence CONFIG_ARCH_MULTIPLATFORM is always set,
> and the check can be removed.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
