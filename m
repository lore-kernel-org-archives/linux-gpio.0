From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: xway: Delete two error messages for a failed
 memory allocation in pinmux_xway_probe()
Date: Tue, 2 Jan 2018 09:54:16 +0100
Message-ID: <CACRpkdZqJYQBZORX2VPEhsYRmsOBYWq6YWftrOLmHKkFviRa5g@mail.gmail.com>
References: <0a27abb0-c222-765b-3a96-7e02163a0858@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0a27abb0-c222-765b-3a96-7e02163a0858@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, John Crispin <john@phrozen.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 25, 2017 at 10:02 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 25 Dec 2017 21:51:26 +0100
>
> Omit extra messages for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
