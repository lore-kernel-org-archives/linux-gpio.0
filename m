From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 13/28] gpio: pch: allow use from device tree
Date: Thu, 10 Dec 2015 17:25:00 +0100
Message-ID: <CACRpkdboe5BPSNbDOHEzVtQ_kdeWMAR9x2QkDAE-8YO-2E2HHg@mail.gmail.com>
References: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
	<1448900513-20856-14-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:36260 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472AbbLJQZB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 11:25:01 -0500
Received: by obcse5 with SMTP id se5so63031733obc.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 08:25:00 -0800 (PST)
In-Reply-To: <1448900513-20856-14-git-send-email-paul.burton@imgtec.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>
Cc: Linux MIPS <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Nov 30, 2015 at 5:21 PM, Paul Burton <paul.burton@imgtec.com> wrote:

> Allow GPIOs from the gpio-pch driver to be referenced from device tree
> by simply setting the struct gpio_chip of_node pointer to that of the
> struct pci_dev.
>
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>

Patch applied.

Yours,
Linus Walleij
