From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: mcp23s08: fix interrupt handling regression
Date: Thu, 19 Oct 2017 10:20:48 +0200
Message-ID: <CACRpkdbEepSqNsP_5J1yVWqSXRybOj0Qfr-ZcZpOxMNaMgtfDQ@mail.gmail.com>
References: <1508336462-9378-1-git-send-email-mastichi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508336462-9378-1-git-send-email-mastichi@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Mastykin <mastichi@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Phil Reid <preid@electromag.com.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 18, 2017 at 4:21 PM, Dmitry Mastykin <mastichi@gmail.com> wrote:

> interrupt handling was broken with conversion to using regmap caching.
> cached_gpio value was updated by boolean status instead of gpio reading.
>
> Fixes: 8f38910ba4f6 ("pinctrl: mcp23s08: switch to regmap caching")
> Tested-by: Phil Reid <preid@electromag.com.au>
> Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>

Patch applied for fixes, adding Sebastians review tag.

Yours,
Linus Walleij
