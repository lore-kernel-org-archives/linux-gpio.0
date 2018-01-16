From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH][next] gpiolib: remove redundant initialization of pointer desc
Date: Wed, 17 Jan 2018 00:19:31 +0100
Message-ID: <CACRpkdboW19udLX3++e0OCw=tfTKEuasb8Jv3a4AZueJxjhUhg@mail.gmail.com>
References: <20180116115611.24962-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20180116115611.24962-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 16, 2018 at 12:56 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The initialized value stored in pointer desc is never read as it
> is updated in the first executable statement in the function.
> This is therefore redundant and can be removed.
>
> Cleans up clang warning:
> drivers/gpio/gpiolib.c:3710:20: warning: Value stored to 'desc'
> during its initialization is never read
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
