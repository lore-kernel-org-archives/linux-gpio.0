From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio:ts4800: Add IMX51 dependency
Date: Tue, 8 Mar 2016 15:28:35 +0700
Message-ID: <CACRpkdafH-P=e=LLQ+m5T4V_UH0jfpv63af-c2FfY=aEPiFXOg@mail.gmail.com>
References: <1456528019-25872-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33233 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753545AbcCHI2g (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 03:28:36 -0500
Received: by mail-oi0-f53.google.com with SMTP id d205so5687478oia.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 00:28:36 -0800 (PST)
In-Reply-To: <1456528019-25872-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Feb 27, 2016 at 6:06 AM, Julien Grossholtz
<julien.grossholtz@savoirfairelinux.com> wrote:

> The TS-4800 is an i.MX515 board. Its GPIO driver should only be compiled
> for this CPU or for test builds.
>
> Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>

Patch applied.

Yours,
Linus Walleij
