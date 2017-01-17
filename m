From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] pinctrl: mvebu: Use seq_putc() in mvebu_pinconf_group_dbg_show()
Date: Tue, 17 Jan 2017 15:57:46 +0100
Message-ID: <CACRpkdbS4jqy-stVPAPnzKGdH=fRW=6k6FbemadnLpkZNb726Q@mail.gmail.com>
References: <12880bc6-1695-074a-788b-dd936f6f795a@users.sourceforge.net> <c35b1329-a197-c20c-dc3a-2fa8af2e2f35@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <c35b1329-a197-c20c-dc3a-2fa8af2e2f35@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 12, 2017 at 5:37 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 12 Jan 2017 17:12:30 +0100
>
> Single characters should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
