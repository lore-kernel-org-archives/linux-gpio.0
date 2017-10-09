From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sx150x: make struct sx150x_regmap_config static
Date: Mon, 9 Oct 2017 23:02:59 +0200
Message-ID: <CACRpkda0h0=qHa=NvrwnOzK6YcqGdc1kEtgv588R=9ssoXjyjg@mail.gmail.com>
References: <20171005102356.29944-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20171005102356.29944-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 5, 2017 at 12:23 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The structure sx150x_regmap_config is local to the source and does not
> need to be in global scope, so make it static.
>
> Cleans up sparse warning:
> symbol 'sx150x_regmap_config' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
