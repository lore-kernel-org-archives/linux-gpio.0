From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: ingenic: make function ingenic_pinctrl_probe static
Date: Mon, 9 Oct 2017 23:02:22 +0200
Message-ID: <CACRpkdb4ZyXpRGJNoNB-yHKA=jEeS5a2AEURJJiCisyDAm+aYQ@mail.gmail.com>
References: <20171005101137.29664-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005101137.29664-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 5, 2017 at 12:11 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The function ingenic_pinctrl_probe is local to the source and does
> not need to be in global scope, so make it static.
>
> Cleans up sparse warnings
> symbol 'ingenic_pinctrl_probe' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
