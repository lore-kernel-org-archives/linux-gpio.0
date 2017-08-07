From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: wrap Intel pin control drivers in an
 architecture check
Date: Mon, 7 Aug 2017 10:47:14 +0200
Message-ID: <CACRpkdarn7kOdne=S-gPqeELLwJ_Z4R+7BjXyobgqxmM-zBw7w@mail.gmail.com>
References: <20170704064947.10792-1-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:36686 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752472AbdHGIrQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 04:47:16 -0400
Received: by mail-it0-f41.google.com with SMTP id 77so701727itj.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 01:47:15 -0700 (PDT)
In-Reply-To: <20170704064947.10792-1-pbrobinson@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Tue, Jul 4, 2017 at 8:49 AM, Peter Robinson <pbrobinson@gmail.com> wrote:

> The Intel pin control drivers are architecture specific so add an if arch
> to check for X86 or compile test to ensure continued test coverage.
>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
