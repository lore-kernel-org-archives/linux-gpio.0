From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mvebu: Delete an error message for a failed
 memory allocation in mvebu_pinctrl_probe()
Date: Wed, 20 Dec 2017 13:20:52 +0100
Message-ID: <CACRpkdZ7bN-1nGLSkRTr_ehZJ1YykGN7EYEZErVkf1r3eXtdQQ@mail.gmail.com>
References: <ba1158ce-87be-6033-72b6-b08d7babc443@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <ba1158ce-87be-6033-72b6-b08d7babc443@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 19, 2017 at 10:37 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 19 Dec 2017 22:30:36 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
