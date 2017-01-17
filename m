From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] pinctrl: mvebu: Delete an error message for a failed
 memory allocation in three functions
Date: Tue, 17 Jan 2017 15:54:55 +0100
Message-ID: <CACRpkdZjrOvPn64fi=+c5Nd1WvUztNXV6xR4yNha+FQ_f=EdTg@mail.gmail.com>
References: <12880bc6-1695-074a-788b-dd936f6f795a@users.sourceforge.net> <556cc243-6bd0-8da1-8c17-c1d6d6206735@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <556cc243-6bd0-8da1-8c17-c1d6d6206735@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Wolfram Sang <wsa@the-dreams.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 12, 2017 at 5:33 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 12 Jan 2017 16:15:34 +0100
>
> The script "checkpatch.pl" pointed information out like the following.
>
> WARNING: Possible unnecessary 'out of memory' message
>
> Thus fix the affected source code places.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
