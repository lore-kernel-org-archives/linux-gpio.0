From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] gpio: davinci: Fix the compiler warning with ARM64
 config enabled
Date: Sat, 8 Jun 2019 00:34:48 +0200
Message-ID: <CACRpkdYe4L3MAG3sFAnpdELp7FNB6kqMDCv8xt4E5h77N=rLxQ@mail.gmail.com>
References: <20190605080259.2462-1-j-keerthy@ti.com> <20190605080259.2462-2-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605080259.2462-2-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 5, 2019 at 10:02 AM Keerthy <j-keerthy@ti.com> wrote:

> Fix the compiler warning with ARM64 config enabled
> as the current mask assumes 32 bit by default.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Patch applied, I think this and patch 2/3 work fine
together as-is.

Yours,
Linus Walleij
