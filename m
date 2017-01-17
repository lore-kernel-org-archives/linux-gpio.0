From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] pinctrl: mvebu: Delete an unnecessary return
 statement in mvebu_pinconf_group_dbg_show()
Date: Tue, 17 Jan 2017 15:55:38 +0100
Message-ID: <CACRpkdZuiYrboTg+aF=y=+t2-jZ=D4sc9Fbe3Pwqfw8Mx9U2TQ@mail.gmail.com>
References: <12880bc6-1695-074a-788b-dd936f6f795a@users.sourceforge.net> <18e9e48c-6200-22bb-16dc-90ec5b7e459b@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <18e9e48c-6200-22bb-16dc-90ec5b7e459b@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 12, 2017 at 5:34 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 12 Jan 2017 16:30:24 +0100
>
> The script "checkpatch.pl" pointed information out like the following.
>
> WARNING: void function return statements are not generally useful
>
> Thus remove such a statement in the affected function.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
