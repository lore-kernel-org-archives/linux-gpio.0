From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH][pinctrl-next] pinctrl: sprd: make three local functions static
Date: Tue, 12 Sep 2017 09:38:38 +0200
Message-ID: <CACRpkdbodwJqXrFTKFBzGUw9sGRCbnbuPTMfvtDC1y9HBsKs=Q@mail.gmail.com>
References: <20170904105322.23228-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170904105322.23228-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 4, 2017 at 12:53 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The functions sprd_pmx_get_function_count, sprd_pmx_get_function_name
> and sprd_pmx_get_function_groups are local to the source and do not
> need to be in global scope, so make them static.
>
> Cleans up sparse warnings:
> "symbol 'sprd_pmx_get_function_count' was not declared. Should it be
> static?"
> "symbol 'sprd_pmx_get_function_name' was not declared. Should it be
> static?"
> "symbol 'sprd_pmx_get_function_groups' was not declared. Should it be
> static?"
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied for fixes.

Yours,
Linus Walleij
