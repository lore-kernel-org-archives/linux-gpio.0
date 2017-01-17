From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] pinctrl: mvebu: Use seq_puts() in mvebu_pinconf_group_dbg_show()
Date: Tue, 17 Jan 2017 15:56:25 +0100
Message-ID: <CACRpkdbHpVmCsYi33MvfwWG8NTKeKQREOrcVLqznE2F=kLqxhQ@mail.gmail.com>
References: <12880bc6-1695-074a-788b-dd936f6f795a@users.sourceforge.net> <43337b05-dc83-da07-f4a0-030bf2cae63a@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <43337b05-dc83-da07-f4a0-030bf2cae63a@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 12, 2017 at 5:36 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 12 Jan 2017 16:51:00 +0100
>
> Strings which did not contain data format specifications should be put
> into a sequence. Thus use the corresponding function "seq_puts".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
