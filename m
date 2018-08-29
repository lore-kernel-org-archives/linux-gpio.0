From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: madera: Return ENOTSUPP for unsupported pin attributes
Date: Wed, 29 Aug 2018 10:42:30 +0200
Message-ID: <CACRpkdbxR0OgYfNz39_+koRfJF_hV-m=t1xYERG9wDAhRbr5rw@mail.gmail.com>
References: <20180807093226.5624-1-rf@opensource.cirrus.com> <20180807093226.5624-2-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807093226.5624-2-rf@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, patches@opensource.cirrus.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 7, 2018 at 11:32 AM Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:

> The pin_config_[get|set] functions should return ENOTSUPP if
> the requested attribute isn't supported.
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Patch applied.

Yours,
Linus Walleij
