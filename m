From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 03/11] drivers/gpio: include <module.h> for modular
 crystalcove code
Date: Tue, 12 May 2015 09:38:07 +0200
Message-ID: <CACRpkdZ3sfVeSj=b=L5izwiV8yhFw-+AN4OJriuiU4Ft5J-tMQ@mail.gmail.com>
References: <1430444867-22342-1-git-send-email-paul.gortmaker@windriver.com>
	<1430444867-22342-4-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430444867-22342-4-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 1, 2015 at 3:47 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> This file is built off of a tristate Kconfig option and also contains
> modular function calls so it should explicitly include module.h to
> avoid compile breakage during header shuffles done in the future.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
