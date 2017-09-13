From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH][pinctrl-next] pinctrl/amd: make functions
 amd_gpio_suspend and amd_gpio_resume static
Date: Thu, 14 Sep 2017 07:33:31 +0800
Message-ID: <CAD8Lp45RpFwFALmbsr8jRqtUFx8MxTveV-ruBsLon8VbnEBApg@mail.gmail.com>
References: <20170913161501.7356-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170913161501.7356-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 14, 2017 at 12:15 AM, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The functions amd_gpio_suspend and amd_gpio_resume are local to the
> source and do not need to be in global scope, so make them static.
>
> Cleans up sparse warnings:
> symbol 'amd_gpio_suspend' was not declared. Should it be static?
> symbol 'amd_gpio_resume' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Daniel Drake <drake@endlessm.com>
