From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 8/9] pinctrl: Use seq_putc() in pinctrl_maps_show()
Date: Wed, 3 May 2017 20:45:41 +0300
Message-ID: <CAHp75Ve413LrnwYBD2y0gSYEzVypni-Swz_3C73VJA440q+_HA@mail.gmail.com>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net> <80f6dabc-6547-4d2b-2efa-15a90de41c0c@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f178.google.com ([209.85.216.178]:34916 "EHLO
        mail-qt0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754181AbdECRpm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 May 2017 13:45:42 -0400
In-Reply-To: <80f6dabc-6547-4d2b-2efa-15a90de41c0c@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, May 2, 2017 at 12:28 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 May 2017 10:47:35 +0200
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".

This could be folded to another one with similar changes.

-- 
With Best Regards,
Andy Shevchenko
