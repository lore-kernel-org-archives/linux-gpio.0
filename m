From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH][gpio-next] gpio: mockup: remove unused variable gc
Date: Thu, 31 Aug 2017 15:21:35 +0200
Message-ID: <CACRpkdYEK=Fb3F62PyLmtoh6gzgrGQxcs1fWoWE=CbuGkRpt9A@mail.gmail.com>
References: <20170824113422.22214-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170824113422.22214-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2017 at 1:34 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The variable gc is assigned but never read and is redundant. Remove it.
> Cleans up clang warning:
>
> drivers/gpio/gpio-mockup.c:169:2: warning: Value stored to 'gc' is never read
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
