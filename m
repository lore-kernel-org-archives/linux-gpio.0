From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: simplify adding threaded interrupts
Date: Wed, 30 Nov 2016 22:22:24 +0100
Message-ID: <CACRpkda0HRDOHB0NJZu1UirOBxj7EW2uPTg2KehxqY9jG0Y8sQ@mail.gmail.com>
References: <1479991133-24153-1-git-send-email-linus.walleij@linaro.org> <1777087.OkzDx8qNW5@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:35516 "EHLO
        mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757806AbcK3V35 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2016 16:29:57 -0500
Received: by mail-qk0-f181.google.com with SMTP id n204so224451678qke.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2016 13:29:57 -0800 (PST)
In-Reply-To: <1777087.OkzDx8qNW5@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Lars Poeschel <poeschel@lemonage.de>, Octavian Purdila <octavian.purdila@intel.com>, Daniel Baluta <daniel.baluta@intel.com>, Bin Gao <bin.gao@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Semen Protsenko <semen.protsenko@globallogic.com>, Phil Reid <preid@electromag.com.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Patrice Chotard <patrice.chotard@st.com>

On Wed, Nov 30, 2016 at 3:20 PM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> I've tested this on a board using both gpio-mcp23s08.c and gpio-pca953x.c and
> coulnd't detect any change/regression in dmesg. Is this to be expected?
> If so
> Tested-by: Alexander Stein <alexander.stein@systec-electronic.com>

Yes ideally it just works, thanks :)

The fix is for threaded IRQs the corner case when an interrupt has
to be resent. Unless parent is set up, this cannot be done.

Yours,
Linus Walleij
