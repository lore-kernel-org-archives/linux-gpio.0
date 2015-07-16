From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: em: Remove obsolete platform data support
Date: Thu, 16 Jul 2015 10:31:58 +0200
Message-ID: <CACRpkda1M-AmT=YJUEpK2BbpHjjXu5=EgSOWy1yjOgVcJAS6VA@mail.gmail.com>
References: <1435067282-17314-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:36466 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754521AbbGPIb7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 04:31:59 -0400
Received: by obnw1 with SMTP id w1so42632618obn.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 01:31:59 -0700 (PDT)
In-Reply-To: <1435067282-17314-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Tue, Jun 23, 2015 at 3:48 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Since commit 59032702ead90562 ("ARM: shmobile: Remove legacy platform
> devices from EMEV2 SoC code"), EMMA Mobile SoCs are only supported in
> generic DT-only ARM multi-platform builds.  The driver doesn't need to
> use platform data anymore, hence remove platform data configuration.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only due to lack of hardware.

Patch applied.

Yours,
Linus Walleij
