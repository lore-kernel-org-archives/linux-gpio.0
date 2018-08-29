From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: madera: Fix possible NULL pointer with pdata config
Date: Wed, 29 Aug 2018 14:03:16 +0200
Message-ID: <CACRpkdYhtBR2cBAFzgicEOHky=4aoaHegM7J6mLyGP_-gB305g@mail.gmail.com>
References: <20180828084537.22960-1-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828084537.22960-1-rf@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 28, 2018 at 10:45 AM Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:

> If we are being configured via pdata we don't necessarily have
> any gpio mappings being configured that way so pdata->gpio_config
> could be NULL.
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Patch applied for fixes.

Yours,
Linus Walleij
