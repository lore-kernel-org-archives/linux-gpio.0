From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drivers: gpio: octeon: use devm_platform_ioremap_resource()
Date: Wed, 3 Apr 2019 10:30:07 +0700
Message-ID: <CACRpkdZJO6mBvgz_i+ioiiMtmRpDVR1wPg3uX3EbhGHTPACE0w@mail.gmail.com>
References: <1552330521-4276-23-git-send-email-info@metux.net> <1552333701-22712-1-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552333701-22712-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 12, 2019 at 2:48 AM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Patch applied.

Yours,
Linus Walleij
