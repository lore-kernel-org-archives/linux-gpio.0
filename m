From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: ti-iodelay: remove redundant unused variable dev
Date: Tue, 31 Oct 2017 14:28:51 +0100
Message-ID: <CACRpkda=VXb7R=8F-TKKOQDv4jwRsvoCXn9JQ=4foRUsszOvvQ@mail.gmail.com>
References: <20171031112051.21451-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20171031112051.21451-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 31, 2017 at 12:20 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer dev is being assigned but is never used, hence it is
> redundant and can be removed. Cleans up clang warnings:
>
> drivers/pinctrl/ti/pinctrl-ti-iodelay.c:582:2: warning: Value stored
> to 'dev' is never read
> drivers/pinctrl/ti/pinctrl-ti-iodelay.c:701:2: warning: Value stored
> to 'dev' is never read
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
