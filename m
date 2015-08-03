From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH] pinctrl: at91: fix null pointer dereference
Date: Mon, 3 Aug 2015 10:19:12 +0200
Message-ID: <CACRpkdZnL7g6O1CgBG0gZ525QZs43tvzTx-1NXZ2HR6cQXbyDA@mail.gmail.com>
References: <20150715133048.GD14886@odux.rfo.atmel.com>
	<1438069696-25303-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:33503 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751995AbbHCITM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2015 04:19:12 -0400
Received: by obdeg2 with SMTP id eg2so93687670obd.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2015 01:19:12 -0700 (PDT)
In-Reply-To: <1438069696-25303-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, davidcdueck@googlemail.com, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 28, 2015 at 9:48 AM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:

> From: David Dueck <davidcdueck@googlemail.com>
>
> Not all gpio banks are necessarily enabled, in the current code this can
> lead to null pointer dereferences.
(...)
>
> Signed-off-by: David Dueck <davidcdueck@googlemail.com>
> Acked-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> CC: Nicolas Ferre <nicolas.ferre@atmel.com>
> CC: Boris Brezillon <boris.brezillon@free-electrons.com>
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>
> This patch fixes a oops in the kernel because of a NULL pointer in a table.
> Having a NULL pointer in this table is the normal behavior if a PIO controller
> is not enabled. So this fix is not a quick and dirty hack, it's usual to skip
> an entry from a table if it is not filled.

This v2 version applied for fixes with v3.18+ stable tag.

Yours,
Linus Walleij
