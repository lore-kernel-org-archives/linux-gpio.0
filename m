From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Revert "pinctrl: amd: make it explicitly non-modular"
Date: Fri, 22 Jul 2016 17:27:09 +0200
Message-ID: <CACRpkdYNZ_R3ak99f4c+z-p22hPWWR1w_UxKCy2-LebodGKv9Q@mail.gmail.com>
References: <20160719003030.26420-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160719003030.26420-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jean Delvare <jdelvare@suse.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 19, 2016 at 2:30 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> This reverts commit b8c2b10a9bc0272a20e096852f8fbbf361749dda.
>
> This patch was in my queue at the same time that a conversion of
> the same driver from bool --> tristate was pending and merged.
>
> That is commit 337ea0fb1535 ("pinctrl: Turn AMD support to tristate")
>
> Normally the conflict would show up in the build coverage I do,
> however in this case an avoidable instance of linux/module.h in
> linux/gpio/driver.h (!) causes the build failure to be masked and
> instead the tristate gets built-in even for selected "=m".
>
> In working on removing module.h from driver.h this issue was then
> revealed (along with other implicit module.h assumptions in gpio,
> and mfd -- which will be fixed separately.)
>
> Cc: Jean Delvare <jdelvare@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied with Jean's ACK.

Yours,
Linus Walleij
