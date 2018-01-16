From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio-stmpe: Improve a size determination in stmpe_gpio_probe()
Date: Tue, 16 Jan 2018 11:00:53 +0100
Message-ID: <CACRpkdYn0OASSMe3msNy7zJdur5tJ15yWB9AJno2PXBC0Sk4EA@mail.gmail.com>
References: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net> <fdd3ba06-afb7-e36e-6e58-ac4e974d7720@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fdd3ba06-afb7-e36e-6e58-ac4e974d7720@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 12, 2018 at 9:02 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 12 Jan 2018 19:36:29 +0100
>
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
