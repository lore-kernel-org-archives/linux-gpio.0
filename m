From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] pinctrl: Support for IMG Pistachio
Date: Fri, 6 Mar 2015 12:29:55 +0100
Message-ID: <CACRpkdbCOHNPs5Y58h--X6pOVvYyxTrgcFhFyk5dWE+JLo=rhg@mail.gmail.com>
References: <1424744104-14151-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:44206 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753627AbbCFL34 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2015 06:29:56 -0500
Received: by obcuy5 with SMTP id uy5so12857921obc.11
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2015 03:29:55 -0800 (PST)
In-Reply-To: <1424744104-14151-1-git-send-email-abrestic@chromium.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>

On Tue, Feb 24, 2015 at 3:15 AM, Andrew Bresticker
<abrestic@chromium.org> wrote:

>  I'd like this to go through the MIPS tree with
> Linus'/Alex's ACKs if possible.

Why? It will only help creating merge conflicts.
There seem to be no compile-related dependencies, just Kconfig
symbols, so patches using this can go in orthogonally.

Yours,
Linus Walleij
