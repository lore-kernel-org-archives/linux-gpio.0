From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: davinci: Move fetching IRQ to beginning of probe
Date: Tue, 12 Jun 2018 15:09:11 +0200
Message-ID: <CACRpkdbsww1m5GMJ9A8dhn5vXfjaozzb2QaZOkWATdOGg83qMQ@mail.gmail.com>
References: <1528276734-1483-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528276734-1483-1-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 6, 2018 at 11:18 AM, Keerthy <j-keerthy@ti.com> wrote:

> Currently IRQ resource fetching is done at the very end of probe.
> In case the of IRQ resource not being ready, we defer probe
> and need to revert prior changes. Hence move it to the beginning of
> the probe so as to avoid reverting.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Patch applied for v4.19.

Yours,
Linus Walleij
