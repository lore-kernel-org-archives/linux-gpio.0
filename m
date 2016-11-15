From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: intel-mid: use builtin_pci_driver
Date: Tue, 15 Nov 2016 10:35:09 +0100
Message-ID: <CACRpkdaKrkqnNkNNkR98kGp0jNHu3EOUAz0C9ZVenL9dcY0jdg@mail.gmail.com>
References: <1f356ef29486a21e77e00997bcc82b300d0512d6.1479127743.git.geliangtang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f175.google.com ([209.85.216.175]:35999 "EHLO
        mail-qt0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753820AbcKOJfL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2016 04:35:11 -0500
Received: by mail-qt0-f175.google.com with SMTP id w33so64764611qtc.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2016 01:35:10 -0800 (PST)
In-Reply-To: <1f356ef29486a21e77e00997bcc82b300d0512d6.1479127743.git.geliangtang@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geliang Tang <geliangtang@gmail.com>
Cc: David Cohen <david.a.cohen@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Nov 14, 2016 at 1:52 PM, Geliang Tang <geliangtang@gmail.com> wrote:

> Use builtin_pci_driver() helper to simplify the code.
>
> Signed-off-by: Geliang Tang <geliangtang@gmail.com>

Patch applied.

Yours,
Linus Walleij
