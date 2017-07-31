From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: wrap Intel pin control drivers in an
 architecture check
Date: Mon, 31 Jul 2017 15:41:16 +0200
Message-ID: <CACRpkdZL2iRF4Qo8rcFOg+9F1dTBj9RZ_49w=7h6P+8=d9BoYw@mail.gmail.com>
References: <20170704064947.10792-1-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:33872 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbdGaNlS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 09:41:18 -0400
Received: by mail-io0-f174.google.com with SMTP id o9so3423607iod.1
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 06:41:18 -0700 (PDT)
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

I'm waiting for Mika to say what he thinks about this. He's the overall
Intel pin control maintainer.

Yours,
Linus Walleij
