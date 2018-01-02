From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: tz1090: Delete an error message for a failed
 memory allocation in two functions
Date: Tue, 2 Jan 2018 09:51:27 +0100
Message-ID: <CACRpkdZPesoHpLai0U_zZZsJAOSJBT6L8ouXbczbSTjdunPR1w@mail.gmail.com>
References: <91c76055-bba2-8a6e-4294-1dae0daf1363@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36310 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751869AbeABIv2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 03:51:28 -0500
Received: by mail-it0-f68.google.com with SMTP id d16so38728097itj.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 00:51:28 -0800 (PST)
In-Reply-To: <91c76055-bba2-8a6e-4294-1dae0daf1363@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>

On Mon, Dec 25, 2017 at 6:13 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 25 Dec 2017 17:55:48 +0100
>
> Omit an extra message for a memory allocation failure in these functions.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
