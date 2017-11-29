From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: Improve unlocking of a mutex in mcp23s08_irq()
Date: Wed, 29 Nov 2017 13:51:35 +0100
Message-ID: <CACRpkdYBawKHhD833zzhJktv8Ub07=JUW9oCFpvptWzJCL+D-g@mail.gmail.com>
References: <ca1c3c19-7e8c-90f0-493c-b6fae04e6a03@users.sourceforge.net> <01bfaa76-f947-f148-077b-35949bf8e229@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <01bfaa76-f947-f148-077b-35949bf8e229@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 30, 2017 at 4:46 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 30 Oct 2017 16:03:12 +0100
>
> * Add a jump target so that a call of the function "mutex_unlock" is stored
>   only twice in this function implementation.
>
> * Replace five calls by goto statements.
>
> * Adjust five condition checks.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Nice, patch applied.

Yours,
Linus Walleij
